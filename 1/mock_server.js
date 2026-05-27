/**
 * 赛尔号战神联盟 - Complete Offline Mock Server
 *
 * Protocol: Protobuf over TCP with 4-byte BE length prefix
 * Message header: cs_msg_head_t proto (cmd, seq, field3, field4, field5)
 * Message body: proto message specific to each command
 *
 * Proto types confirmed via IDA analysis:
 * - mon_basic_info_t: 23 fields, mask 0xF7F59 at offset 0x78
 * - mon_info_t: 7 fields, mask 0x79 at offset 0x28
 * - mon_btl_attr_t: 6 fields, mask 0x3F
 * - mon_ev_info_t: 7 fields, all VARINT (switch 7 cases)
 * - mon_character_info_t: 7 fields, all VARINT (switch 7 cases)
 * - mon_grow_info_t: 6 fields, all VARINT (switch 6 cases)
 * - mon_moves_info_t: complex, fields 2,3,4 VARINT, field 1 sub-message
 * - player_basic_info_t: field offset pattern verified from Serialize
 * - player_enter_map_out: map_id(1), players(2), npcs(3), mine_info(4), events(5)
 * - functional_switch_info_t: controls feature visibility
 */

"use strict";

const http = require('http');
const net = require('net');

// =============================================================================
// Protobuf helpers
// =============================================================================

// zigzag-encoded varint for SINT32 fields (IDA verified)
function zigzagVarint(n) {
    const z = ((n << 1) ^ (n >> 31)) >>> 0;
    const bytes = [];
    let v = z;
    while (v > 0x7f) { bytes.push((v & 0x7f) | 0x80); v >>>= 7; }
    bytes.push(v & 0x7f);
    return Buffer.from(bytes);
}

function encodeVarint(value) {
    if (value < 0) value = (value >>> 0); // convert to unsigned
    const result = [];
    while (value > 0x7f) {
        result.push((value & 0x7f) | 0x80);
        value >>>= 7;
    }
    result.push(value & 0x7f);
    return Buffer.from(result);
}

function encodeTag(fieldNumber, wireType) {
    return encodeVarint((fieldNumber << 3) | wireType);
}

function encodeUint32(fieldNumber, value) {
    return Buffer.concat([encodeTag(fieldNumber, 0), encodeVarint(value >>> 0)]);
}

function encodeInt32(fieldNumber, value) {
    return encodeUint32(fieldNumber, value);
}

function encodeString(fieldNumber, s) {
    const data = Buffer.from(String(s), 'utf-8');
    return Buffer.concat([encodeTag(fieldNumber, 2), encodeVarint(data.length), data]);
}

function encodeMessage(fieldNumber, msgData) {
    return Buffer.concat([encodeTag(fieldNumber, 2), encodeVarint(msgData.length), msgData]);
}

function encodeBool(fieldNumber, value) {
    return encodeUint32(fieldNumber, value ? 1 : 0);
}

function encodeFloat(fieldNumber, value) {
    const buf = Buffer.alloc(4);
    buf.writeFloatLE(value, 0);
    return Buffer.concat([encodeTag(fieldNumber, 5), buf]);
}

function emptyRepeated(fieldNumber) {
    return Buffer.concat([encodeTag(fieldNumber, 2), encodeVarint(0)]);
}

// =============================================================================
// Game State
// =============================================================================

const fs = require('fs');
const SAVE_FILE = './save.json';

const STATE = {
    roles: {},          // serverId -> [{roleTm, nick, gender, uid, level}]
    playerData: {},     // uid -> {tasks, bagMon, items, level, exp, coin, etc}
    sessions: {},       // serverId -> [{uid, session}]
    nextUid: 1,
};

// === Save/Load ===
function saveState() {
    try {
        fs.writeFileSync(SAVE_FILE, JSON.stringify(STATE, null, 2));
    } catch(e) { console.log("[SAVE] Error:", e.message); }
}
function loadState() {
    try {
        if (fs.existsSync(SAVE_FILE)) {
            const data = JSON.parse(fs.readFileSync(SAVE_FILE, 'utf8'));
            Object.assign(STATE, data);
            console.log(`[SAVE] Loaded: ${Object.keys(STATE.playerData).length} players, ${Object.keys(STATE.roles).reduce((a,k)=>a+STATE.roles[k].length,0)} roles`);
        }
    } catch(e) { console.log("[SAVE] Load error:", e.message); }
}
loadState();

function getPlayerState(uid) {
    if (!STATE.playerData[uid]) {
        STATE.playerData[uid] = {
            tasks: [],
            bagMon: [],
            items: [],
            level: 1,
            exp: 0,
            coin: 10000,
            gcoin: 1000,
            energy: 100,
            maxEnergy: 200,
            action: 100,
            maxAction: 200,
            mapId: 10001,
            x: 0,
            y: 0,
            mainMon: null,
        };
    }
    return STATE.playerData[uid];
}

function getLastRole(serverId) {
    const roles = STATE.roles[serverId] || [];
    return roles.length > 0 ? roles[roles.length - 1] : null;
}

// =============================================================================
// Message Builders
// =============================================================================

function buildServerListResponse() {
    const serverInfo = Buffer.concat([
        encodeUint32(1, 1),
        encodeString(2, "Offline Server"),
        encodeUint32(3, 1),
    ]);
    const ipAsUint32 = (127 << 24) | (0 << 16) | (0 << 8) | 1;
    return Buffer.concat([
        encodeMessage(1, serverInfo),
        encodeUint32(2, ipAsUint32),
        encodeUint32(3, 8002),
    ]);
}

function buildCheckSessionResponse(withRole) {
    const serverIp = (1 << 24) | 127;
    const serverInfo = Buffer.concat([
        encodeUint32(1, 1),
        encodeUint32(2, serverIp),
        encodeUint32(3, 8002),
    ]);
    let serverRole = encodeMessage(1, serverInfo);
    if (withRole) {
        const role = getLastRole(1);
        if (role) {
            // TEST: f1+f2 + sentinel 0x00 — Merge exits cleanly, IsInitialized mask&3==3
            const roleTmBytes = encodeVarint(role.roleTm);
            const roleInfo = Buffer.concat([
                Buffer.from([0x08, 0x01]),           // f1: uid=1
                Buffer.concat([Buffer.from([0x10]), roleTmBytes]),  // f2: roleTm
                Buffer.from([0x00]),                  // sentinel: end-of-stream
            ]);
            serverRole = Buffer.concat([serverRole, encodeMessage(2, roleInfo)]);
        }
    }
    return encodeMessage(1, serverRole);
}

function buildPlayerBasicInfo(nick, roleTm, gender, level) {
    const now = Math.floor(Date.now() / 1000);
    return Buffer.concat([
        encodeString(1, nick || "Player"),
        encodeUint32(2, roleTm),
        encodeUint32(3, roleTm),         // uid = roleTm
        encodeUint32(4, now - 60),
        encodeUint32(5, level || 1),
        encodeUint32(6, 999999),
        encodeUint32(7, gender || 1),
        encodeUint32(8, 999999),
        encodeUint32(9, 999999),
        encodeUint32(10, 10),
        encodeUint32(11, 999),
        encodeUint32(12, 999),
        encodeUint32(13, 999),
        encodeUint32(14, 999),
        encodeUint32(42, 6),              // mon bag size = 6 slots
        encodeUint32(43, 6),              // mon storage size? try
    ]);
}

function buildLoginResponse() {
    const now = Math.floor(Date.now() / 1000);
    const role = getLastRole(1);
    const nick = role ? role.nick : "Player";
    const roleTm = role ? role.roleTm : now;
    const gender = role ? role.gender : 1;

    // player_basic_info_t at field 1, switchInfo at field 2, time at field 3, field 4
    const basicInfo = buildPlayerBasicInfo(nick, roleTm, gender, 1);
    return Buffer.concat([
        encodeMessage(1, basicInfo),
        encodeMessage(2, Buffer.alloc(0)),  // switchInfo
        encodeUint32(3, now),
        encodeUint32(4, 0),
    ]);
}

function buildRandomNickResponse() {
    const nicks = ["赛尔勇士", "星辰使者", "雷电先锋", "暗影猎手"];
    return Buffer.concat(nicks.map(n => encodeString(1, n)));
}

function buildPlayerEnterMapOut(mapId, nick, roleTm, gender) {
    const mapDef = MAP_DEFS.find(m => m.id === mapId) || {};
    if (!mapDef._logged) { console.log(`[MAP] mapId=${mapId} npcs=${(mapDef.npc||[]).length} mine=${mapDef.mine_type}`); mapDef._logged = true; }
    const playerEntry = Buffer.concat([
        encodeUint32(1, 1), encodeUint32(2, roleTm),
        encodeString(3, nick), encodeUint32(4, 0),
        encodeUint32(5, 0), encodeUint32(6, gender || 1),
        encodeUint32(8, 0),
    ]);

    // Dynamic NPCs from map config
    let npcs = Buffer.alloc(0), events = Buffer.alloc(0);
    const mapNpcs = mapDef.npc || [];
    if (mapNpcs.length > 0) console.log(`[MAP] Processing ${mapNpcs.length} NPCs for map ${mapId}: ${JSON.stringify(mapNpcs.map(n=>n.id))}`);
    for (const mn of mapNpcs) {
        const npcDef = NPC_DEFS.find(n => n.id === mn.id) || {};
        if (npcDef.mon) console.log(`[MAP] NPC ${mn.id} (${npcDef.name}) has mon: ${JSON.stringify(npcDef.mon)}`);
        const isWild = mn.type2 === 'BTL_TYPE2_WILD' || mn.type2 === 1;
        let npcEntry = Buffer.concat([encodeUint32(1, mn.id)]);
        // NPC mon data
        if (npcDef.mon && npcDef.mon.length > 0) {
            const m = npcDef.mon[0];
            npcEntry = Buffer.concat([npcEntry, encodeMessage(2, Buffer.concat([
                encodeUint32(1, m.id || 4), encodeUint32(2, m.min_level || 3),
            ]))]);
        }
        npcs = Buffer.concat([npcs, encodeMessage(3, npcEntry)]);

        // Battle event for wild NPCs
        if (isWild && npcDef.mon && npcDef.mon[0]) {
            const wm = npcDef.mon[0];
            const battleMon = Buffer.concat([encodeUint32(1, wm.id || 4), encodeUint32(2, wm.min_level || 3)]);
            const pkCombat = encodeMessage(9, Buffer.concat([
                encodeUint32(1, 999), encodeUint32(2, 1),
                encodeString(3, npcDef.name || '野怪'), encodeUint32(4, 1),
                encodeMessage(6, battleMon),
                encodeUint32(7, 50 + (wm.min_level || 3) * 10),
                encodeUint32(8, 20 + (wm.min_level || 3) * 2),
                encodeUint32(9, 15), encodeUint32(10, 10),
            ]));
            events = Buffer.concat([events, encodeMessage(5, Buffer.concat([
                encodeUint32(1, 1), // event type = battle
                encodeMessage(8, Buffer.concat([encodeUint32(1, mn.id)])),
                pkCombat,
            ]))]);
        }
    }

    // Mine spots from map config
    const now = Math.floor(Date.now() / 1000);
    let mineList = Buffer.alloc(0);
    const mineType = mapDef.mine_type || 0;
    if (mineType > 0) {
        mineList = Buffer.concat([
            encodeMessage(4, Buffer.concat([encodeUint32(1, 10001), encodeUint32(2, 5), encodeUint32(3, now)])),
        ]);
        if (mineType >= 3) {
            mineList = Buffer.concat([mineList,
                encodeMessage(4, Buffer.concat([encodeUint32(1, 10023), encodeUint32(2, 5), encodeUint32(3, now)])),
            ]);
        }
    }

    return Buffer.concat([
        encodeUint32(1, mapId),
        encodeMessage(2, playerEntry),
        npcs,
        mineList,
        events,
    ]);
}

function buildMonInfo(monId, level, nickname) {
    const now = Math.floor(Date.now() / 1000);
    const MON_NAMES = {1: '迪兰', 4: '休咻', 5: '迪兰', 7: '小小葵'};
    const monName = nickname || MON_NAMES[monId] || ('Mon_' + monId);

    // mon_basic_info_t — try field3=1(family), all others=1
    // IDA merge confirms fields 1-6,8-12,14-23
    const basicInfo = Buffer.concat([
        encodeString(1, monName),       // 1: name
        encodeUint32(2, 1),             // 2: mon_id (instance)
        encodeUint32(3, 1),             // 3: family/species (1=迪兰)
        encodeInt32(4, 1),              // 4
        encodeUint32(5, monId),         // 5: family (species ID!)
        encodeUint32(6, level || 5),    // 6: level
        encodeUint32(8, 1),             // 8
        encodeUint32(9, 1),             // 9
        encodeUint32(10, 1),            // 10
        encodeUint32(11, 1),            // 11
        encodeInt32(12, 1),             // 12
        encodeUint32(14, 1),            // 14
        encodeUint32(15, 1),            // 15
        encodeUint32(16, 1),            // 16
        encodeUint32(17, 1),            // 17: template_id (1=迪兰)
        encodeUint32(18, now),          // 18
        encodeUint32(19, 1),            // 19
        encodeUint32(20, 1),            // 20
        encodeUint32(21, 1),            // 21
        encodeUint32(22, 1),            // 22
        encodeUint32(23, 1),            // 23
    ]);

    // mon_btl_attr_t (6 fields, mask 0x3F)
    const btlAttr = Buffer.concat([
        encodeUint32(1, 80 + (level || 5) * 10),
        encodeUint32(2, 20 + (level || 5) * 2),
        encodeUint32(3, 20 + (level || 5) * 2),
        encodeUint32(4, 20 + (level || 5) * 2),
        encodeUint32(5, 20 + (level || 5) * 2),
        encodeUint32(6, 20 + (level || 5) * 2),
    ]);

    // mon_ev_info_t (7 VARINT fields)
    const evInfo = Buffer.concat([
        encodeUint32(1, 0), encodeUint32(2, 0), encodeUint32(3, 0),
        encodeUint32(4, 0), encodeUint32(5, 0), encodeUint32(6, 0),
        encodeUint32(7, 0),
    ]);

    // mon_character_info_t (7 VARINT fields)
    const charInfo = Buffer.concat([
        encodeUint32(1, 0), encodeUint32(2, 0), encodeUint32(3, 0),
        encodeUint32(4, 0), encodeUint32(5, 0), encodeUint32(6, 0),
        encodeUint32(7, 0),
    ]);

    // mon_grow_info_t (6 VARINT fields)
    const growInfo = Buffer.concat([
        encodeUint32(1, 0), encodeUint32(2, 0), encodeUint32(3, 0),
        encodeUint32(4, 0), encodeUint32(5, 0), encodeUint32(6, 0),
    ]);

    // Level-based skills for 迪兰 (family=1)
    const lv = level || 1;
    let skillCount = lv >= 10 ? 4 : lv >= 5 ? 3 : 2;
    let movesParts = Buffer.alloc(0);
    for (let i = 0; i < skillCount; i++) {
        movesParts = Buffer.concat([movesParts, encodeUint32(1, 10001 + i)]);
        movesParts = Buffer.concat([movesParts, encodeUint32(2, 10)]);
        movesParts = Buffer.concat([movesParts, encodeUint32(3, 10)]);
    }
    const movesInfo = movesParts;

    // mon_info_t (7 fields, mask 0x79: 1,4,5,6,7 required)
    return Buffer.concat([
        encodeMessage(1, basicInfo),
        encodeMessage(2, btlAttr),
        encodeMessage(3, btlAttr),
        encodeMessage(4, evInfo),
        encodeMessage(5, charInfo),
        encodeMessage(6, growInfo),
        encodeMessage(7, movesInfo),
    ]);
}

// Task system — loaded from assets/PbConfig/task.pbconf (text proto)
// Generic text proto loader
function loadTextProto(filename, rootKey) {
    const result = [];
    try {
        const text = fs.readFileSync(`./assets/PbConfig/${filename}`, 'utf-8');
        let current = null, currentNested = null, nestLevel = 0;
        for (const line of text.split('\n')) {
            const s = line.trim();
            if (!s) continue;
            // Track nesting
            const openBraces = (s.match(/\{/g) || []).length;
            const closeBraces = (s.match(/\}/g) || []).length;

            if (s.startsWith(rootKey + ': {') || s.startsWith(rootKey + ' {') || s.startsWith(rootKey + '{')) {
                current = {};
            } else if (current && s.match(/^\w+:\s*\{/)) {
                // Nested block like "npc: {" or "step: {"
                const nestedKey = s.match(/^(\w+):/)[1];
                if (!current[nestedKey]) current[nestedKey] = [];
                current._nestedKey = nestedKey;
                current._nestedObj = {};
                nestLevel++;
            } else if (s === '}' || s === '};') {
                if (current && current._nestedObj) {
                    if (!current[current._nestedKey]) current[current._nestedKey] = [];
                    current[current._nestedKey].push(current._nestedObj);
                    current._nestedObj = null;
                    current._nestedKey = null;
                    nestLevel--;
                } else if (nestLevel === 0 && current) {
                    result.push(current); current = null;
                }
                if (nestLevel > 0) nestLevel--;
                if (nestLevel < 0) nestLevel = 0;
            } else if (current) {
                const target = current._nestedObj || current;
                const m = s.match(/^(\w+):\s*(.+)$/);
                if (m) {
                    const key = m[1];
                    let val = m[2].trim();
                    // Remove trailing comments
                    val = val.replace(/\s*\/\/.*$/, '');
                    // Remove quotes
                    if (val.startsWith('"') && val.endsWith('"')) val = val.slice(1, -1);
                    // Try parse as number
                    const num = Number(val);
                    if (!isNaN(num) && val !== '') {
                        // Check if it's an array (multiple same keys = array)
                        if (current[key] !== undefined && Array.isArray(current[key])) {
                            current[key].push(num);
                        } else if (current[key] !== undefined) {
                            current[key] = [current[key], num];
                        } else {
                            current[key] = num;
                        }
                    } else {
                        current[key] = val;
                    }
                }
            }
        }
        console.log(`[CONFIG] ${filename}: ${result.length} entries loaded`);
    } catch(e) {
        console.log(`[CONFIG] ${filename}: ${e.message}`);
    }
    return result;
}

const TASK_DEFS = [];
const TASK_TYPE_MAP = {TASK_TYPE_BRANCH: 2, TASK_TYPE_MAIN: 1, TASK_TYPE_DAILY: 3, TASK_TYPE_SUB: 4};
const STEP_TYPE_MAP = {TASK_STEP_TYPE_MINING: 6, TASK_STEP_TYPE_TALK: 5, TASK_STEP_TYPE_BATTLE: 1, TASK_STEP_TYPE_COLLECT: 7};

// Load all pbconf configs
const rawTasks = loadTextProto('task.pbconf', 'task');
// Parse task-specific nested structure (steps)
for (const t of rawTasks) {
    t.steps = t.steps || [];
    // Convert enum strings to numbers
    if (typeof t.task_type === 'string') t.task_type = TASK_TYPE_MAP[t.task_type] || 2;
    if (t.steps) for (const s of t.steps) {
        if (typeof s.step_type === 'string') s.step_type = STEP_TYPE_MAP[s.step_type] || 5;
        if (s.link !== undefined && !Array.isArray(s.link)) s.link = [s.link];
    }
    TASK_DEFS.push(t);
}
console.log(`[TASK] ${TASK_DEFS.length} tasks loaded`);

// NPC config with nested mon{} support — depth tracking
let NPC_DEFS = [];
(function parseNpcConfig() {
    try {
        const text = fs.readFileSync('./assets/PbConfig/npc.pbconf', 'utf-8');
        let current = null, nestStack = [];
        const getTarget = () => nestStack.length > 0 ? nestStack[nestStack.length-1].obj : current;
        for (const line of text.split('\n')) {
            const s = line.trim();
            if (!s || s.startsWith('//')) continue;
            const openBrace = s.includes('{');
            const closeBrace = s === '}' || s === '};';

            if (s === 'npc: {' || s.startsWith('npc: {')) { current = {}; nestStack = []; }
            else if (closeBrace) {
                if (nestStack.length > 0) {
                    const top = nestStack.pop();
                    current[top.key] = current[top.key] || [];
                    current[top.key].push(top.obj);
                } else if (current) { NPC_DEFS.push(current); current = null; }
            } else if (current && openBrace) {
                const m = s.match(/^(\w+):\s*\{/);
                if (m) nestStack.push({key: m[1], obj: {}});
            } else if (current) {
                const m = s.match(/^(\w+):\s*(.+)$/);
                if (m) {
                    const key = m[1], val = m[2].trim().replace(/^"(.*)"$/, '$1');
                    const num = Number(val);
                    const target = getTarget();
                    if (!isNaN(num) && val !== '') target[key] = num;
                    else target[key] = val;
                }
            }
        }
        console.log(`[NPC] Parsed: ${NPC_DEFS.length} NPCs`);
        const n3 = NPC_DEFS.find(n => n.id === 3);
        const nw = NPC_DEFS.find(n => n.id === 100011);
        if (n3) console.log(`[NPC] NPC 3 (${n3.name}) mon=${JSON.stringify(n3.mon)}`);
        if (nw) console.log(`[NPC] NPC 100011 (${nw.name}) mon=${JSON.stringify(nw.mon)}`);
    } catch(e) { console.log(`[NPC] Parse error: ${e.message}`); }
})();
const PRIZE_DEFS = loadTextProto('prize.pbconf', 'prize');
// Map config with nested npc{} support — depth tracking
let MAP_DEFS = [];
(function parseMapConfig() {
    try {
        const text = fs.readFileSync('./assets/PbConfig/map.pbconf', 'utf-8');
        let current = null, nestStack = [];
        const getTarget = () => nestStack.length > 0 ? nestStack[nestStack.length-1].obj : current;
        for (const line of text.split('\n')) {
            const s = line.trim();
            if (!s || s.startsWith('//')) continue;
            const openBrace = s.includes('{') && !s.includes('}');
            const closeBrace = s === '}' || s === '};';

            if (s === 'map: {' || s.startsWith('map: {')) { current = {}; nestStack = []; }
            else if (closeBrace) {
                if (nestStack.length > 0) {
                    const top = nestStack.pop();
                    if (current) { current[top.key] = current[top.key] || []; current[top.key].push(top.obj); }
                } else if (current) { MAP_DEFS.push(current); current = null; }
            } else if (current && openBrace) {
                const m = s.match(/^(\w+):\s*\{/);
                if (m) nestStack.push({key: m[1], obj: {}});
            } else if (current) {
                const m = s.match(/^(\w+):\s*(.+)$/);
                if (m) {
                    const key = m[1], val = m[2].trim().replace(/^"(.*)"$/, '$1');
                    const num = Number(val);
                    const target = getTarget();
                    if (!isNaN(num) && val !== '') target[key] = num;
                    else target[key] = val;
                }
            }
        }
        console.log(`[MAP] Parsed: ${MAP_DEFS.length} maps`);
        const m1 = MAP_DEFS.find(m => m.id === 10001);
        if (m1) console.log(`[MAP] Map 10001: npcs=${(m1.npc||[]).length} mine_type=${m1.mine_type}`);
    } catch(e) { console.log(`[MAP] Parse error: ${e.message}`); }
})();
const SHOP_DEFS = loadTextProto('shop.pbconf', 'good');
const ACTIVITY_DEFS = loadTextProto('activity.pbconf', 'activity');

function buildPbTaskInfo(taskDef) {
    let stepList = Buffer.alloc(0);
    if (taskDef.steps) {
        for (const s of taskDef.steps) {
            let keys = Buffer.alloc(0);
            if (s.link) for (const k of s.link) keys = Buffer.concat([keys, encodeUint32(3, k)]);
            const progress = s.progress !== undefined ? s.progress : 0;
            const step = Buffer.concat([
                encodeUint32(1, s.seq),          // kSeq
                encodeUint32(2, s.step_type),    // kStepType
                encodeUint32(4, s.value || 1),   // kValue
                encodeString(5, s.target || ''), // kTarget
                keys,                            // kKey (field 3)
                encodeString(6, s.info || ''),   // kInfo
                encodeUint32(7, 0),              // kLink
                encodeUint32(8, 0),              // kPreStep
                encodeUint32(9, 1),              // kIsAnd
            ]);
            stepList = Buffer.concat([stepList, encodeMessage(15, step)]);
        }
    }
    const detail = Buffer.concat([
        encodeUint32(1, taskDef.id),
        encodeString(2, taskDef.name || ''),
        encodeString(3, taskDef.info || ''),
        encodeUint32(4, taskDef.task_type || 2),
        encodeUint32(5, taskDef.need_level || 0),
        encodeUint32(6, taskDef.obtain_map_id || 10001),
        encodeUint32(7, taskDef.commit_map_id || 10001),
        encodeUint32(8, taskDef.obtain_npc_id || 3),
        encodeUint32(9, taskDef.commit_npc_id || 3),
        encodeUint32(10, taskDef.obtain_dialog || 0),
        encodeUint32(11, taskDef.progress_dialog || 0),
        encodeUint32(12, taskDef.finish_dialog || 0),
        stepList,
        encodeUint32(16, taskDef.prize_id || 0),
        encodeUint32(17, taskDef.area_id || 1),
    ]);
    return Buffer.concat([
        encodeUint32(1, taskDef.id),
        encodeUint32(2, taskDef.task_type || 2),
        encodeUint32(3, taskDef.flag || 0), // task_flag
        encodeMessage(4, detail),
    ]);
}

function buildTaskListResponse(uid) {
    const ps = getPlayerState(uid);
    let taskList = Buffer.alloc(0);
    for (const t of ps.tasks) {
        taskList = Buffer.concat([taskList, encodeMessage(1, buildPbTaskInfo(t))]);
    }
    return Buffer.concat([
        taskList.length > 0 ? taskList : Buffer.from([0x0a, 0x00]),
        encodeUint32(2, 0),
    ]);
}

// =============================================================================
// Server push helpers
// =============================================================================

function pushMessage(socket, cmd, body, f3, f4, f5) {
    if (!socket._pushSeq) socket._pushSeq = 1000;
    socket._pushSeq++;
    const headerProto = Buffer.concat([
        encodeString(1, cmd),
        encodeUint32(2, socket._pushSeq),
        encodeUint32(3, f3 || 1),
        encodeUint32(4, f4 || 0),
        encodeUint32(5, f5 || 0),
    ]);
    // headerLen = protoLen. Game reads body at msgData[headerLen:]
    // This includes 4 header tail bytes before the actual body.
    const headerLen = headerProto.length;
    // +4 compensates for dispatch's body offset calc
    const totalLen = 12 + headerLen + body.length;
    const packet = Buffer.alloc(totalLen);
    packet.writeUInt32BE(totalLen, 0);
    packet.writeUInt32BE(headerLen, 4);
    headerProto.copy(packet, 8);
    body.copy(packet, 8 + headerLen);
    socket.write(packet);
    console.log(`[PUSH] CMD: ${cmd} seq=${socket._pushSeq} body=${body.length} bytes total=${totalLen}`);
}

// =============================================================================
// HTTP Server
// =============================================================================

const HTTP_PORT = 8000;

const httpServer = http.createServer((req, res) => {
    const url = req.url || '';
    console.log(`[HTTP] ${req.method} ${url}`);

    let body = Buffer.alloc(0);
    req.on('data', chunk => { body = Buffer.concat([body, chunk]); });
    req.on('end', () => {
        let responseText;

        if (url.includes('/account_service.php')) {
            responseText = JSON.stringify({
                status_code: "0",
                user_id: "offline_001",
                session: "offline_sess_" + Date.now(),
                username: "offline_player",
            });
        } else if (url.includes('/iseer2.fcgi')) {
            responseText = JSON.stringify({
                online_list: [{
                    online_id: 1,
                    online_name: "Offline Server",
                    online_status: 1,
                }],
                login_ip: "127.0.0.1",
                login_port: 8002,
            });
        } else {
            responseText = '<html><body><h1>Offline Server</h1></body></html>';
        }

        const response = Buffer.from(responseText, 'utf-8');
        res.writeHead(200, {
            'Content-Type': 'text/plain; charset=utf-8',
            'Content-Length': response.length,
            'Access-Control-Allow-Origin': '*',
        });
        res.end(response);
    });
});

httpServer.listen(HTTP_PORT, '0.0.0.0', () => {
    console.log(`[HTTP] Running on 0.0.0.0:${HTTP_PORT}`);
});

// =============================================================================
// TCP Game Server
// =============================================================================

const TCP_PORT = 8002;

function parseHeader(headerProto) {
    let cmd = "unknown", seq = 0, f3 = 0, f4 = 0, f5 = 0;
    let pos = 0;
    while (pos < headerProto.length) {
        const tag = headerProto[pos];
        if (tag >= 0x80) break;
        const fieldNum = tag >> 3;
        const wireType = tag & 0x07;
        pos++;
        if (wireType === 0) {
            let value = 0, shift = 0;
            while (pos < headerProto.length) {
                const b = headerProto[pos++];
                value |= (b & 0x7f) << shift;
                if (!(b & 0x80)) break;
                shift += 7;
            }
            if (fieldNum === 2) seq = value;
            else if (fieldNum === 3) f3 = value;
            else if (fieldNum === 4) f4 = value;
            else if (fieldNum === 5) f5 = value;
        } else if (wireType === 2) {
            let len = 0, shift = 0;
            while (pos < headerProto.length) {
                const b = headerProto[pos++];
                len |= (b & 0x7f) << shift;
                if (!(b & 0x80)) break;
                shift += 7;
            }
            if (fieldNum === 1) {
                cmd = headerProto.slice(pos, pos + len).toString('utf-8');
            }
            pos += len;
        } else {
            break;
        }
    }
    return {cmd, seq, f3, f4, f5};
}

function parseBodyFields(bodyData) {
    let fields = {};
    let bp = 0;
    while (bp < bodyData.length) {
        const tag = bodyData[bp];
        if (tag >= 0x80) break;
        const fieldNum = tag >> 3;
        const wireType = tag & 0x07;
        bp++;
        if (wireType === 0) {
            let value = 0, shift = 0;
            while (bp < bodyData.length) {
                const b = bodyData[bp++];
                value |= (b & 0x7f) << shift;
                if (!(b & 0x80)) break;
                shift += 7;
            }
            fields[fieldNum] = value;
        } else if (wireType === 2) {
            let len = 0, shift = 0;
            while (bp < bodyData.length) {
                const b = bodyData[bp++];
                len |= (b & 0x7f) << shift;
                if (!(b & 0x80)) break;
                shift += 7;
            }
            try {
                fields[fieldNum] = bodyData.slice(bp, bp + len).toString('utf-8');
            } catch (e) {
                fields[fieldNum] = bodyData.slice(bp, bp + len);
            }
            bp += len;
        } else {
            break;
        }
    }
    return fields;
}

// Command handler map: _in -> _out
const CMD_MAP = {};
[
    'check_session', 'recheck_session', 'login', 'create_role',
    'get_item', 'get_player_info', 'get_server_time', 'get_friend_list',
    'get_bag_mon', 'get_mail_list', 'get_task_list', 'get_activity_list',
    'get_shop_info', 'lookup_random_nick', 'get_storemon_index',
    'get_unlocked_map_id_list', 'get_pvp_data', 'get_player_simple_info',
    'get_player_detail_info', 'get_config', 'select_main_mon',
    'player_enter_map', 'map_player_walk', 'player_ready',
    'submit_map_event', 'submit_map_mine', 'submit_map_mine_info', 'use_item',
    'obtain_task', 'finish_task', 'cancel_task', 'set_task_step',
    'get_task_buff_list', 'get_task_flag_list',
    'get_sys_cur_time', 'text_msg', 'pb_cs_task', 'pass_do_action',
    'get_lottery_prize', 'get_reward', 'get_lottery', 'start_battle_pve',
    'get_lbs_prize', 'get_mail_body', 'get_mail_enclosure',
    'get_finance_plan', 'get_lottery_info', 'get_shop',
    'get_ranking_list', 'get_self_ranking', 'get_lbs_notice',
    'get_exchange_code_info', 'get_talent_attr_data',
    'get_champion_data', 'get_challenge_leiyi_data',
    'get_captured_mon_list', 'get_black_list',
    'notify', 'notify_mon', 'notify_player',
].forEach(cmd => {
    CMD_MAP[`ISeer20CSProto.${cmd}_in`] = `ISeer20CSProto.${cmd}_out`;
    CMD_MAP[`ISeer20CSProto.cli_${cmd}_in`] = `ISeer20CSProto.cli_${cmd}_out`;
});

function handleGameClient(socket) {
    const addr = `${socket.remoteAddress}:${socket.remotePort}`;
    console.log(`[TCP] Connected: ${addr}`);

    let buffer = Buffer.alloc(0);
    socket._msgCount = 0;
    socket._pushSeq = 0;

    socket.on('data', (data) => {
        buffer = Buffer.concat([buffer, data]);

        while (buffer.length >= 4) {
            const totalLen = buffer.readUInt32BE(0);
            if (totalLen > buffer.length) return;

            const msgData = buffer.slice(4, 4 + (totalLen - 4));
            buffer = buffer.slice(totalLen);

            // Parse header
            const headerDataLen = msgData.readUInt32BE(0);
            const headerProto = msgData.slice(4, 4 + headerDataLen - 4);
            const bodyData = msgData.slice(headerDataLen);

            const header = parseHeader(headerProto);
            const bodyFields = parseBodyFields(bodyData);

            console.log(`[TCP] CMD: ${header.cmd} seq=${header.seq} fields=${JSON.stringify(bodyFields)}`);

            // Track header field for push messages
            socket._lastF3 = header.f3 || 1;
            socket._lastF4 = header.f4 || 0;
            socket._lastF5 = header.f5 || 0;

            // Build response
            let respCmd = CMD_MAP[header.cmd] || header.cmd.replace(/_in$/, '_out');
            // create_role returns login_out to trigger handleMsgLoginIn → sets m_userInfo[0..3]
            if (header.cmd.includes('create_role')) {
                respCmd = 'ISeer20CSProto.login_out';
            }
            let respBody = buildResponse(header.cmd, bodyFields, socket);

            if (respBody !== null) {
                socket._msgCount++;
                const respHeader = Buffer.concat([
                    encodeString(1, respCmd),
                    encodeUint32(2, socket._msgCount),
                    encodeUint32(3, header.f3 || 1),
                    encodeUint32(4, header.f4 || 0),
                    encodeUint32(5, header.f5 || 0),
                ]);
                const respHeaderLen = respHeader.length;
                const totalMsgLen = 8 + respHeader.length + respBody.length;
                const packet = Buffer.alloc(totalMsgLen);
                packet.writeUInt32BE(totalMsgLen, 0);
                packet.writeUInt32BE(respHeaderLen, 4);
                respHeader.copy(packet, 8);
                respBody.copy(packet, 8 + respHeader.length);
                socket.write(packet);

                // Dump full packet for mine-related and a sample walk message
                if (respCmd.includes('mine') || respCmd.includes('walk') || respCmd.includes('get_item')) {
                    const hex = packet.toString('hex');
                    const hdrHex = respHeader.toString('hex');
                    const bodyHex = respBody.toString('hex');
                    console.log(`[FRAME] ${respCmd}: total=${totalMsgLen} hdrLen=${respHeaderLen} hdr=${hdrHex} body=${bodyHex}`);
                    console.log(`[FRAME] full packet: ${hex}`);
                }
                console.log(`[TCP] Sent: ${respCmd} (${respBody.length} bytes)`);
            }
        }
    });

    socket.on('close', () => console.log(`[TCP] Disconnected: ${addr}`));
    socket.on('error', (err) => console.log(`[TCP] Error: ${err.message}`));
}

function buildResponse(cmd, fields, socket) {
    const now = Math.floor(Date.now() / 1000);
    const h = {cmd, fields, socket};

    // ---- Auth & Session ----
    if (cmd.includes('check_session') || cmd.includes('recheck_session')) {
        // TEST: withRole always on when roles exist
        const withRole = STATE.roles[1] && STATE.roles[1].length > 0;
        const resp = buildCheckSessionResponse(withRole);
        console.log(`[SESSION] ${cmd.includes('recheck')?'recheck':'check'} withRole=${withRole} body=${resp.length}B`);
        return resp;
    }

    // ---- Login & Create Role ----
    if (cmd.includes('create_role')) {
        const nick = fields[2] || "Player";
        const gender = fields[3] || 1;
        const serverId = fields[1] || 1;
        const roleTm = now;
        const uid = 1; // Always uid=1 for save consistency
        STATE.nextUid = Math.max(STATE.nextUid, 2);
        if (!STATE.roles[serverId]) STATE.roles[serverId] = [];
        // Only add role if not already present
        if (!STATE.roles[serverId].find(r => r.uid === uid)) {
            STATE.roles[serverId].push({roleTm, nick, gender, uid, level: 20});
        }
        const ps = getPlayerState(uid);
        // First login: set starter data. Subsequent logins: keep saved data.
        if (!ps.bagMon || ps.bagMon.length === 0) {
            ps.bagMon = [
                {monId: 1, level: 1},
                {monId: 4, level: 1},
                {monId: 7, level: 1},
            ];
            ps.mainMon = 1;
            ps.level = 20;
            ps.tasks = [
                {id: 1, name: '初到异蘑世界', info: '与多罗对话', task_type: 2, need_level: 0, flag: 1,
                 obtain_map_id: 10001, commit_map_id: 10001,
                 obtain_npc_id: 3, commit_npc_id: 3,
                 obtain_dialog: 100, progress_dialog: 105, finish_dialog: 110,
                 prize_id: 50001, area_id: 1,
                 steps: [{seq: 1, step_type: 5, value: 1, target: '3', link: [10001]}]},
                {id: 10002, name: '矿石采集', info: '采集矿石1次', task_type: 2, need_level: 0, flag: 1,
                 obtain_map_id: 10001, commit_map_id: 10001,
                 obtain_npc_id: 3, commit_npc_id: 3,
                 obtain_dialog: 200, progress_dialog: 205, finish_dialog: 210,
                 prize_id: 50002, area_id: 1,
                 steps: [{seq: 1, step_type: 6, value: 1, target: '采矿', link: [10001]}]},
            ];
            ps.items = [
                {item_id: 20081, item_count: 10, grid_id: 1},
            ];
            console.log(`[ROLE] New player: starter items+mooks+tasks created`);
        } else {
            console.log(`[ROLE] Existing player: restored items=${ps.items.length} mons=${ps.bagMon.length}`);
        }

        // Track which uid this socket is connected to
        socket._uid = uid;
        console.log(`[ROLE] Created: ${nick} uid=${uid}`);
        saveState();
        // Return login_out to trigger handleMsgLoginIn → sets m_userInfo[0..3] for battle UID match
        return buildLoginResponse();
    }

    if (cmd.includes('login_in')) {
        const role = getLastRole(1);
        if (role) {
            const ps = getPlayerState(role.uid || 1);
            const f3 = socket._lastF3 || 1, f4 = socket._lastF4, f5 = socket._lastF5;
            if (ps.bagMon) for (const m of ps.bagMon) {
                pushMessage(socket, 'ISeer20CSProto.notify_gain_new_mon_out',
                    encodeMessage(2, buildMonInfo(m.monId, m.level || 5, null)), f3, f4, f5);
            }
            pushMessage(socket, 'ISeer20CSProto.player_enter_map_out',
                buildPlayerEnterMapOut(10001, role.nick, role.roleTm, role.gender), f3, 0, 0);
        }
        return buildLoginResponse();
    }

    // ---- Random Nick ----
    if (cmd.includes('lookup_random_nick')) {
        return buildRandomNickResponse();
    }

    // ---- Player Info ----
    if (cmd.includes('get_player_info') && !cmd.includes('simple') && !cmd.includes('detail')) {
        const role = getLastRole(1);
        const info = buildPlayerBasicInfo(
            role ? role.nick : "Player",
            role ? role.roleTm : now,
            role ? role.gender : 1,
            1
        );
        return encodeMessage(1, info);
    }

    // ---- Server Time ----
    if (cmd.includes('get_server_time') || cmd.includes('get_sys_cur_time')) {
        return Buffer.concat([encodeUint32(1, now), encodeUint32(2, 0)]);
    }

    // ---- Select Main Mon ----
    if (cmd.includes('select_main_mon')) {
        const ps = getPlayerState(socket._uid || 1);
        const monId = (ps.bagMon && ps.bagMon[0]) ? ps.bagMon[0].monId : (fields[1] || 1);
        console.log(`[MON] Selected starter: using bagMon=${monId} (client sent ${fields[1]})`);
        saveState();
        const role = getLastRole(1);
        // Push player_enter_map_out BEFORE the select_main_mon response (matching old server behavior)
        if (role) {
            const mapBody = buildPlayerEnterMapOut(10001, role.nick, role.roleTm, role.gender);
            pushMessage(socket, 'ISeer20CSProto.player_enter_map_out', mapBody, socket._lastF3 || 1, 0, 0);

            // Push saved items from ps.items (or use starter items if empty)
            if (ps.items.length === 0) {
                ps.items = [
                    {item_id: 20081, item_count: 5,  grid_id: 1},
                    {item_id: 20082, item_count: 3,  grid_id: 2},
                    {item_id: 20083, item_count: 2,  grid_id: 3},
                    {item_id: 20011, item_count: 10, grid_id: 4},
                    {item_id: 20012, item_count: 8,  grid_id: 5},
                    {item_id: 20021, item_count: 1,  grid_id: 6},
                    {item_id: 20101, item_count: 5,  grid_id: 7},
                ];
            }
            console.log(`[MON] Pushing ${ps.items.length} saved items`);
            for (const it of ps.items) {
                const oneT = Buffer.concat([
                    encodeUint32(1, it.grid_id),
                    encodeUint32(2, it.item_id),
                    encodeUint32(3, it.item_count),
                ]);
                const bagUpdate = Buffer.concat([
                    encodeUint32(1, 30),
                    encodeMessage(3, oneT),
                ]);
                pushMessage(socket, 'ISeer20CSProto.cli_notify_item_bag_updates_out', bagUpdate, socket._lastF3 || 1, 0, 0);
            }
        }
        // Push notify_gain_new_mon_out for ALL bag monsters
        for (const m of ps.bagMon) {
            const mi = buildMonInfo(m.monId, m.level, null);
            const gm = Buffer.concat([encodeMessage(2, mi)]);
            pushMessage(socket, 'ISeer20CSProto.notify_gain_new_mon_out', gm, socket._lastF3 || 1, socket._lastF4, socket._lastF5);
        }
        const level = (ps.bagMon && ps.bagMon[0]) ? ps.bagMon[0].level : 1;
        const monInfo = buildMonInfo(monId, level, null);
        return encodeMessage(1, monInfo);
    }

    // ---- Enter Map ----
    if (cmd.includes('player_enter_map')) {
        const mapId = fields[1] || 10001;
        const role = getLastRole(1);
        const nick = role ? role.nick : 'Player';
        const roleTm = role ? role.roleTm : now;
        const gender = role ? role.gender : 1;
        return buildPlayerEnterMapOut(mapId, nick, roleTm, gender);
    }

    // ---- Map Walk ----
    if (cmd.includes('map_player_walk')) {
        console.log(`[WALK] fields=${JSON.stringify(fields)}`);
        const ps = getPlayerState(socket._uid || 1);
        if (fields[1]) ps.x = fields[1];
        if (fields[2]) ps.y = fields[2];
        saveState();
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Get Items (Inventory) ----
    if (cmd.includes('cli_get_item_in')) {
        // Only 1 item per get_item due to ReadMessageNoVirtual sub-stream limit bug
        // Additional items synced via bag_update pushes
        const ps = getPlayerState(socket._uid || 1);
        const parts = [];
        parts.push(encodeUint32(1, 30)); // capacity
        if (ps.items.length > 0) {
            const item = ps.items[0]; // only first item
            // one_t: f1=item_id, f2=grid_id (maps to compiled count@+12), f3=count
            // cli_get_item_out_one_t: f1=item_id, f2=grid_id, f3=count
            const oneT = Buffer.concat([
                encodeUint32(1, item.item_id),
                encodeUint32(2, item.grid_id || 1),
                encodeUint32(3, item.item_count || 1),
            ]);
            parts.push(encodeMessage(2, oneT));
        } else {
            parts.push(Buffer.from([0x12, 0x00]));
        }
        console.log(`[GETITEM] capacity=30, showing 1 of ${ps.items.length} items`);
        return Buffer.concat(parts);
    }

    // ---- Submit Map Mine (Ore) ----
    if (cmd.includes('submit_map_mine')) {
        const mineId = fields[1] || 0;
        console.log(`[MINE] mine_id=${mineId}`);

        // Dynamic ore based on mine_id
        const ps = getPlayerState(socket._uid || 1);
        const MINE_ORES = {10001: 20081, 10023: 20082, 10002: 20083, 10003: 20081};
        const itemId = MINE_ORES[mineId] || 20081;
        const existingItem = ps.items.find(i => i.item_id === itemId);
        if (existingItem) {
            existingItem.item_count = (existingItem.item_count || 1) + 1;
        } else {
            ps.items.push({item_id: itemId, item_count: 1});
        }
        console.log(`[MINE] Awarded item ${itemId}, now have ${ps.items.length} items`);

        const ORE_INDEX = {10001: 1, 10023: 2, 10002: 3, 10003: 1};

        // VERIFIED: f1→SaveItem+8, f2→+0, f3→+4
        // f1=ore_slot(grid), f2=item_id, f3=totalCount
        const exist = ps.items.find(i => i.item_id === itemId);
        const totalCount = exist ? exist.item_count : 1;
        const oreSlot = ORE_INDEX[mineId] || 1;
        const oneT = Buffer.concat([
            encodeUint32(1, oreSlot),           // f1 → SaveItem+8 = grid slot
            encodeUint32(2, itemId),            // f2 → SaveItem+0 = item_id
            encodeUint32(3, totalCount),        // f3 → SaveItem+4 = count
            encodeUint32(4, 0),
            encodeUint32(5, 0), encodeUint32(6, 0),
            encodeString(7, "1"),
            encodeUint32(8, 0),
        ]);
        // Try different field numbers for new_grid
        const bagUpdate = Buffer.concat([
            encodeUint32(1, 30),        // capacity (REQUIRED for IsInitialized)
            encodeMessage(3, oneT),     // new_grid
        ]);
        pushMessage(socket, 'ISeer20CSProto.cli_notify_item_bag_updates_out', bagUpdate, socket._lastF3 || 1, socket._lastF4, socket._lastF5);

        // Push obtain_task_out for quest 10002 to activate it as completable
        const task10002 = TASK_DEFS.find(t => t.id === 10002);
        if (task10002) {
            const taskOut = Buffer.concat([
                encodeUint32(1, 10002),
                encodeMessage(2, buildPbTaskInfo(task10002)),
            ]);
            pushMessage(socket, 'ISeer20CSProto.obtain_task_out', taskOut, socket._lastF3 || 1, socket._lastF4, socket._lastF5);
        }

        // Also push text message
        const msgBody = encodeString(1, '采集成功！获得矿石x1');
        pushMessage(socket, 'ISeer20CSProto.cli_notify_text_msg_out', msgBody, socket._lastF3 || 1, socket._lastF4, socket._lastF5);

        const oreIndex = ORE_INDEX[mineId] || 1;
        console.log(`[MINE] mine_id=${mineId} → ore_index=${oreIndex}`);

        // f1=item_id, f2=ore_index, f3=count
        const minedCount = (ps.items.find(i => i.item_id === itemId) || {}).item_count || 1;
        return Buffer.concat([
            encodeUint32(1, itemId),
            encodeUint32(2, oreIndex),
            encodeUint32(3, minedCount),
        ]);
    }

    // ---- Start Battle PVE ----
    if (cmd.includes('start_battle_pve')) {
        const npcId = fields[1] || 0;
        const taskId = fields[2] || 0;
        const npcLv = fields[3] || 1;
        console.log(`[BATTLE] start pve npc=${npcId} task=${taskId} lv=${npcLv}`);
        const ps = getPlayerState(socket._uid || 1);

        // Get player's real uid from stored role (m_userInfo = player_basic_info_t field 3 = roleTm)
        const role = getLastRole(1);
        const playerUid = role ? role.roleTm : (socket._uid || 1);
        const playerNick = role ? role.nick : '赛尔勇士';
        console.log(`[BATTLE] playerUid=${playerUid} nick=${playerNick}`);

        // btl_mon_simple_info_t fields (IDA verified, mask 0x1FF = 9 required fields):
        //   f1: uint32 mon_id (+0xC)
        //   f2: STRING mon_name (+0x8)  — CORRECTED from sub-msg to string
        //   f3: uint32 level (+0x10)
        //   f4: uint32 (+0x14)
        //   f5: INT32 (+0x18)
        //   f6: INT32 (+0x1C)
        //   f7: uint32 (+0x20)
        //   f8: uint32 (+0x48)
        //   f9: mon_btl_attr_level_t sub-message (+0x24)
        // mon_btl_attr_level_t: 6 INT32 fields, mask 0x3F (IDA verified)
        //   f1: hp, f2: atk, f3: def, f4: spd, f5: ?, f6: ?
        function buildBtlAttrLevel(hp, atk, def, spd) {
            return Buffer.concat([
                encodeInt32(1, hp),
                encodeInt32(2, atk),
                encodeInt32(3, def),
                encodeInt32(4, spd),
                encodeInt32(5, 0),
                encodeInt32(6, 0),
            ]);
        }

        // BTL proto: btl_notify_battle_start_out (IDA verified)
        //   f1: int32 at +0x2C
        // Award battle rewards (ps already declared above)
        const btlExp = 50 + (npcLv || 1) * 10;
        const btlCoin = 20 + (npcLv || 1) * 5;
        ps.exp = (ps.exp || 0) + btlExp;
        ps.coin = (ps.coin || 0) + btlCoin;
        if (ps.bagMon && ps.bagMon[0]) {
            ps.bagMon[0].exp = (ps.bagMon[0].exp || 0) + btlExp;
        }
        console.log(`[BATTLE] Rewards: +${btlExp}EXP +${btlCoin}Coins`);

        // Step 3: wrapped format + mon data for both sides
        const btlType = Buffer.concat([encodeUint32(1, 1)]);
        // btl_mon_simple_info_t: fields 1-9 required. We send minimal valid data.
        // field 2 = STRING (mon name, IDA verified!)
        function buildBtlMon(monId, name, level) {
            var btlAttr = Buffer.concat([
                encodeInt32(1, 80 + level * 10),  // hp
                encodeInt32(2, 20 + level * 2),   // atk
                encodeInt32(3, 20 + level * 2),   // def
                encodeInt32(4, 20 + level * 2),   // spd
                encodeInt32(5, 0),
                encodeInt32(6, 0),
            ]);
            return Buffer.concat([
                encodeUint32(1, monId),
                encodeString(2, name),
                encodeUint32(3, level),
                encodeUint32(4, 0),
                encodeInt32(5, 0),
                encodeInt32(6, 0),
                encodeUint32(7, 0),
                encodeUint32(8, 0),
                encodeMessage(9, btlAttr),
            ]);
        }
        const playerMon = buildBtlMon(1, '迪兰', 5);
        const enemyMon = buildBtlMon(4, '休咻', 3);

        // Player uid=0 matches m_userInfo=0 in battle comparison → addWaitingSprites path
        const playerInfo = Buffer.concat([
            encodeUint32(1, 0), encodeUint32(2, 1),
            encodeString(3, playerNick), encodeUint32(4, 1),
            encodeUint32(5, 0), encodeUint32(6, 0), encodeUint32(7, 0),
            encodeMessage(8, playerMon),
        ]);
        const enemyInfo = Buffer.concat([
            encodeUint32(1, 999999), encodeUint32(2, 1),
            encodeString(3, '休咻'), encodeUint32(4, 0),
            encodeUint32(5, 0), encodeUint32(6, 0), encodeUint32(7, 0),
            encodeMessage(8, enemyMon),
        ]);
        // Push battle start + end + prize for reverse engineering
        const btlProto = Buffer.concat([
            encodeUint32(1, 10001),
            encodeMessage(2, btlType),
            encodeMessage(3, playerInfo),
            encodeMessage(3, enemyInfo),
        ]);
        // Skip battle scene — prize only
        // TODO: fix check_session for direct login, then fix battle end transition
        var playerAttr = Buffer.concat([encodeUint32(1, btlExp), encodeUint32(10, btlCoin)]);
        var prizeT = Buffer.concat([encodeUint32(1, 80001), encodeMessage(4, playerAttr)]);
        pushMessage(socket, 'ISeer20CSProto.cli_notify_gain_prize_out', encodeMessage(1, prizeT), socket._lastF3 || 1, socket._lastF4, socket._lastF5);
        console.log("[BATTLE] Prize push");

        const btlAck = Buffer.concat([encodeUint32(1, 1)]);
        return Buffer.concat([encodeMessage(1, btlAck)]);
    }

    // ---- Use Item ----
    if (cmd.includes('use_item')) {
        const itemId = fields[1] || 0;
        const count = fields[2] || 1;
        const targetMon = fields[3] || 0;
        console.log(`[USE] item=${itemId} count=${count} mon=${targetMon}`);
        const ps = getPlayerState(socket._uid || 1);
        // Direct mon EXP items (果实)
        const MON_EXP = {20011:500, 20012:1000, 20013:2000, 20015:10000, 20016:5000};
        // Battle buffs (双倍经验等)
        const BUFFS = {20021: 'double_exp', 20022: 'double_exp2'};
        if (MON_EXP[itemId] && ps.bagMon[0]) {
            ps.bagMon[0].exp = (ps.bagMon[0].exp || 0) + MON_EXP[itemId] * count;
            console.log(`[USE] mon +${MON_EXP[itemId]*count} EXP, total=${ps.bagMon[0].exp}`);
        } else if (BUFFS[itemId]) {
            ps[BUFFS[itemId]] = (ps[BUFFS[itemId]] || 0) + count;
            console.log(`[USE] buff ${BUFFS[itemId]} x${count}`);
        }
        saveState();
        return Buffer.concat([encodeUint32(1, 0)]); // result=ok
    }

    // ---- Sell Item ----
    if (cmd.includes('sell_item')) {
        const itemId = fields[1] || 0;
        const count = fields[2] || 0;
        const gridId = fields[3] || 0;
        console.log(`[SELL] itemId=${itemId} count=${count} grid=${gridId}`);
        const ps = getPlayerState(socket._uid || 1);
        // Track item and add coins
        let remaining = 0;
        const item = ps.items.find(i => i.item_id === itemId);
        if (item) {
            item.item_count = Math.max(0, (item.item_count || 0) - count);
            remaining = item.item_count;
        }
        ps.coin = (ps.coin || 0) + 10 * count; // 10 coins per item
        console.log(`[SELL] remaining=${remaining} coins=${ps.coin}`);
        // Push bag update: f1=grid, f2=itemId, f3=count (verified by handler)
        const oneT = Buffer.concat([
            encodeUint32(1, gridId),      // grid_id
            encodeUint32(2, itemId),      // item_id
            encodeUint32(3, remaining),   // count
        ]);
        const fieldNum = remaining > 0 ? 4 : 2; // updateGrid or delGrid
        const bagUpdate = Buffer.concat([
            encodeUint32(1, 30),
            encodeMessage(fieldNum, oneT),
        ]);
        pushMessage(socket, 'ISeer20CSProto.cli_notify_item_bag_updates_out', bagUpdate, socket._lastF3 || 1, 0, 0);
        saveState();
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, ps.coin)]);
    }

    // ---- Submit Map Event (NPC Interaction) ----
    if (cmd.includes('submit_map_event')) {
        const eventType = fields[1] || 0;
        const npcId = fields[2] || 0;
        console.log(`[EVENT] type=${eventType} npc=${npcId}`);
        // Client handles dialog + task acceptance; mock just acknowledges
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Tasks ----
    if (cmd.includes('get_task_list')) {
        return buildTaskListResponse(socket._uid || 1);
    }
    if (cmd.includes('obtain_task')) {
        const taskId = fields[1] || 0;
        const ps = getPlayerState(socket._uid || 1);
        // Accept ANY task the client sends — game config defines them
        let taskDef = TASK_DEFS.find(t => t.id === taskId);
        if (!taskDef) {
            // Auto-create minimal task entry
            taskDef = {id: taskId, name: `任务${taskId}`, info: '', task_type: 2, need_level: 0,
                obtain_map_id: 10001, commit_map_id: 10001,
                obtain_npc_id: fields[2] || 3, commit_npc_id: fields[2] || 3,
                obtain_dialog: 0, progress_dialog: 0, finish_dialog: 0,
                prize_id: 0, area_id: 1, steps: []};
            console.log(`[TASK] obtain_task id=${taskId} — auto-created`);
        }
        if (!ps.tasks.find(t => t.id === taskId)) {
            ps.tasks.push({...taskDef});
            console.log(`[TASK] Added id=${taskId} to player`);
        }
        saveState();
        const detail = buildPbTaskInfo(taskDef);
        return Buffer.concat([encodeUint32(1, taskId), encodeMessage(2, detail)]);
    }
    if (cmd.includes('finish_task')) {
        const taskId = fields[1] || 0;
        const ps = getPlayerState(socket._uid || 1);
        const taskDef = TASK_DEFS.find(t => t.id === taskId);
        // Push prize if task has one
        if (taskDef && taskDef.prize_id) {
            const prize = PRIZE_DEFS.find(p => p.prize_id === taskDef.prize_id);
            if (prize && prize.info && prize.info.length > 0) {
                for (const info of prize.info) {
                    let playerAttr = Buffer.alloc(0);
                    if (info.player_attr) {
                        const pa = info.player_attr;
                        playerAttr = Buffer.concat([
                            encodeUint32(1, pa.exp || 0),
                            encodeUint32(10, pa.coin || pa.gcoin || 0),
                        ]);
                        // Apply rewards
                        ps.exp = (ps.exp || 0) + (pa.exp || 0);
                        ps.coin = (ps.coin || 0) + (pa.coin || 0) + (pa.gcoin || 0);
                    }
                    if (playerAttr.length > 0) {
                        const prizeT = Buffer.concat([encodeUint32(1, info.prize_idx || taskDef.prize_id), encodeMessage(4, playerAttr)]);
                        pushMessage(socket, 'ISeer20CSProto.cli_notify_gain_prize_out', encodeMessage(1, prizeT), socket._lastF3 || 1, socket._lastF4, socket._lastF5);
                    }
                }
                console.log(`[TASK] finish_task id=${taskId} prize_id=${taskDef.prize_id} — rewards pushed`);
            }
        }
        ps.tasks = ps.tasks.filter(t => t.id !== taskId);
        saveState();
        // Push finish_task_out as notification
        const finishPush = Buffer.concat([encodeUint32(1, taskId), encodeUint32(2, 1)]);
        pushMessage(socket, 'ISeer20CSProto.finish_task_out', finishPush, socket._lastF3 || 1, socket._lastF4, socket._lastF5);
        console.log(`[TASK] finish_task id=${taskId} — pushed + responded`);
        return finishPush;
    }
    if (cmd.includes('cancel_task')) {
        const taskId = fields[1] || 0;
        console.log(`[TASK] cancel_task id=${taskId} — IGNORED`);
        return Buffer.concat([encodeUint32(1, taskId), encodeUint32(2, 0)]);
    }
    if (cmd.includes('set_task_step')) {
        console.log(`[TASK] set_task_step fields=${JSON.stringify(fields)}`);
        const taskId = fields[1] || 0;
        const stepSeq = fields[2] || 0;
        const ps = getPlayerState(socket._uid || 1);
        const task = ps.tasks.find(t => t.id === taskId);
        if (task && task.steps) {
            const step = task.steps.find(s => s.seq === stepSeq);
            if (step) step.progress = (step.progress || 0) + 1;
        }
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }
    if (cmd.includes('pb_cs_task')) {
        console.log(`[TASK] pb_cs_task fields=${JSON.stringify(fields)}`);
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- PVP Data ----
    if (cmd.includes('get_pvp_data')) {
        return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
    }

    // ---- Player Ready ----
    if (cmd.includes('player_ready')) {
        console.log('[READY] Player ready signal');
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Player Simple/Detail Info ----
    if (cmd.includes('player_simple_info') || cmd.includes('player_detail_info')) {
        const role = getLastRole(1);
        const info = buildPlayerBasicInfo(
            role ? role.nick : "Player",
            role ? role.roleTm : now,
            role ? role.gender : 1,
            1
        );
        const ps = getPlayerState(socket._uid || 1);
        let monList = Buffer.alloc(0);
        if (ps.bagMon) {
            for (const m of ps.bagMon) {
                monList = Buffer.concat([monList, encodeMessage(1, buildMonInfo(m.monId, m.level || 5, m.nick))]);
            }
        }
        const fullInfo = Buffer.concat([
            encodeMessage(1, info),        // basic_info
            encodeMessage(3, monList),      // bag_mon_list (field 3)
        ]);
        return fullInfo;
    }

    // ---- Unlocked Maps ----
    if (cmd.includes('unlocked_map_id_list')) {
        return Buffer.concat([
            encodeUint32(1, 10001),
            encodeUint32(1, 10002),
            encodeUint32(1, 10003),
            Buffer.from([0x12, 0x00]),
        ]);
    }

    // ---- Bag Monsters ----
    if (cmd.includes('get_bag_mon')) {
        const ps = getPlayerState(socket._uid || 1);
        console.log(`[BAG] get_bag_mon: ${JSON.stringify(ps.bagMon)}`);
        if (ps.bagMon && ps.bagMon.length > 0) {
            let monList = Buffer.alloc(0);
            for (const m of ps.bagMon) {
                const monInfo = buildMonInfo(m.monId, m.level || 5, m.nick || null);
                monList = Buffer.concat([monList, encodeMessage(2, monInfo)]);  // f2 = mon, like notify_gain_new_mon_out
            }
            const mainIdx = ps.bagMon.findIndex(m => m.monId === ps.mainMon);
            return Buffer.concat([monList, encodeUint32(1, mainIdx >= 0 ? mainIdx : 0)]);
        }
        return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
    }

    // ---- Storemon Index ----
    if (cmd.includes('storemon_index') || cmd.includes('get_storemon')) {
        return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
    }

    // ---- Generic empty list + ret=0 ----
    // Use 4-byte body [0a 00 10 00]: empty repeated msg + ret=0.
    // 2-byte body breaks the client (it errors with "invalid message body length: -2").
    // The empty placeholder triggers a non-fatal "decode message buffer error" but the game continues.
    const genericEmptyList = [
        'get_friend_list', 'get_mail_list',
        'get_mail_head', 'get_activity_list', 'get_shop_info',
        'get_task_buff', 'get_task_flag', 'get_config',
        'get_finance_plan', 'get_lottery_info', 'get_lottery',
        'get_shop', 'get_ranking_list', 'get_self_ranking',
        'get_lbs_notice', 'get_exchange_code_info', 'get_talent_attr_data',
        'get_champion_data', 'get_challenge_leiyi_data',
        'get_captured_mon_list', 'get_black_list',
        'get_lottery_prize', 'get_reward', 'get_lbs_prize',
        'get_mail_body', 'get_mail_enclosure', 'cancel_task',
    ];
    for (const c of genericEmptyList) {
        if (cmd.includes(c)) {
            return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
        }
    }

    // ---- Text Message ----
    if (cmd.includes('text_msg')) {
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Pass Do Action ----
    if (cmd.includes('pass_do_action')) {
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Notification acks ----
    if (cmd.includes('notify_in') || cmd.includes('notify_mon_in') || cmd.includes('notify_player_in')) {
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Fallback ----
    console.log(`[TCP] Unknown CMD: ${cmd} — sending generic response`);
    return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
}

const tcpServer = net.createServer(handleGameClient);
tcpServer.listen(TCP_PORT, '0.0.0.0', () => {
    console.log(`[TCP] Running on 0.0.0.0:${TCP_PORT}`);
});

// =============================================================================
// Main
// =============================================================================

console.log('='.repeat(60));
console.log('  赛尔号战神联盟 - Complete Mock Server');
console.log('  HTTP Login:  http://127.0.0.1:8000/iseer2.fcgi');
console.log('  TCP Game:    127.0.0.1:8002');
console.log('='.repeat(60));
