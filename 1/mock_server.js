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

const STATE = {
    roles: {},          // serverId -> [{roleTm, nick, gender, uid, level}]
    playerData: {},     // uid -> {tasks, bagMon, items, level, exp, coin, etc}
    sessions: {},       // serverId -> [{uid, session}]
    nextUid: 1,
};

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
    const serverInfo = Buffer.concat([
        encodeUint32(1, 1),
        encodeString(2, "Offline Server"),
        encodeUint32(3, 1),
    ]);
    let serverRole = encodeMessage(1, serverInfo);
    if (withRole) {
        const role = getLastRole(1);
        if (role) {
            const roleInfo = Buffer.concat([
                encodeUint32(1, role.uid || 1),
                encodeUint32(2, role.roleTm),
                encodeString(3, role.nick),
                encodeUint32(6, role.gender || 1),
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
    ]);
}

function buildLoginResponse() {
    const now = Math.floor(Date.now() / 1000);
    const role = getLastRole(1);
    const nick = role ? role.nick : "Player";
    const roleTm = role ? role.roleTm : now;
    const gender = role ? role.gender : 1;

    const basicInfo = buildPlayerBasicInfo(nick, roleTm, gender, 1);
    const switchInfo = Buffer.alloc(0); // empty = all features default

    return Buffer.concat([
        encodeMessage(1, basicInfo),
        encodeMessage(2, switchInfo),
        encodeUint32(3, now),
        encodeUint32(4, 0),
    ]);
}

function buildRandomNickResponse() {
    const nicks = ["赛尔勇士", "星辰使者", "雷电先锋", "暗影猎手"];
    return Buffer.concat(nicks.map(n => encodeString(1, n)));
}

function buildPlayerEnterMapOut(mapId, nick, roleTm, gender) {
    // Player self entry
    const playerEntry = Buffer.concat([
        encodeUint32(1, 1), encodeUint32(2, roleTm),
        encodeString(3, nick), encodeUint32(4, 0),
        encodeUint32(5, 0), encodeUint32(6, gender || 1),
        encodeUint32(8, 0),
    ]);

    // NPCs on the map
    const npcs = Buffer.concat([
        // NPC 3: 多罗 (tutorial NPC)
        encodeMessage(3, Buffer.concat([encodeUint32(1, 3)])),
        // NPC 100011: Wild 法拉
        encodeMessage(3, Buffer.concat([encodeUint32(1, 100011)])),
    ]);

    // Mine info (ore spots)
    const mineInfo = Buffer.concat([
        encodeUint32(1, mapId),
        encodeUint32(2, 5),
        encodeUint32(3, Math.floor(Date.now() / 1000)),
    ]);

    return Buffer.concat([
        encodeUint32(1, mapId),
        encodeMessage(2, playerEntry),
        npcs,
        encodeMessage(4, mineInfo),
    ]);
}

function buildMonInfo(monId, level, nickname) {
    const now = Math.floor(Date.now() / 1000);
    const MON_NAMES = {1: '迪兰', 4: '休咻', 7: '小小葵'};
    const monName = nickname || MON_NAMES[monId] || ('Mon_' + monId);

    // mon_basic_info_t (23 fields, mask 0xF7F59)
    const basicInfo = Buffer.concat([
        encodeString(1, monName),       // 1: name (required)
        encodeUint32(2, monId),         // 2: mon_id (optional)
        encodeUint32(3, monId),         // 3: (optional)
        encodeInt32(4, 0),              // 4: signed int (required)
        encodeUint32(5, level || 5),    // 5: level (required)
        encodeUint32(6, 0),             // 6: exp (optional)
        // field 7: SkipField
        encodeUint32(8, 1),             // 8: quality? (required)
        encodeUint32(9, 0),             // 9: (required)
        encodeUint32(10, 0),            // 10: (required)
        encodeUint32(11, 0),            // 11: (required)
        encodeInt32(12, 0),             // 12: signed int (required)
        // field 13: SkipField
        encodeUint32(14, 0),            // 14: in fight party? (required, 0=no)
        encodeUint32(15, 0),            // 15: party slot (required, 0=none)
        encodeUint32(16, 0),            // 16: (optional)
        encodeUint32(17, monId),        // 17: template_id (required)
        encodeUint32(18, now),          // 18: born_time (required)
        encodeUint32(19, 1),            // 19: form (required)
        encodeUint32(20, 0),            // 20: (required)
        encodeUint32(21, 0),            // 21: (required)
        encodeUint32(22, 0),            // 22: (required, mask bit 19)
        encodeUint32(23, 0),            // 23: (optional)
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

    // mon_moves_info_t (complex, minimum)
    const movesInfo = Buffer.concat([
        encodeUint32(2, 0), encodeUint32(3, 0), encodeUint32(4, 0),
    ]);

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

// Task system
const TASK_DEFS = [
    {
        id: 1, name: '初到异蘑世界', info: '与多罗对话',
        task_type: 2, need_level: 0,
        obtain_map_id: 10001, commit_map_id: 10001,
        obtain_npc_id: 3, commit_npc_id: 3,
        obtain_dialog: 100, progress_dialog: 105, finish_dialog: 110,
        prize_id: 50001, area_id: 1,
        steps: [{seq: 1, step_type: 5, value: 3, target: '3', link: [10001]}],
    },
    {
        id: 10001, name: '初到异蘑世界', info: '与多罗对话',
        task_type: 2, need_level: 0,
        obtain_map_id: 10001, commit_map_id: 10001,
        obtain_npc_id: 3, commit_npc_id: 3,
        obtain_dialog: 100, progress_dialog: 105, finish_dialog: 110,
        prize_id: 50001, area_id: 1,
        steps: [{seq: 1, step_type: 5, value: 3, target: '3', link: [10001]}],
        // step_type 5 = talk to NPC
    },
    {
        id: 10002, name: '矿石采集', info: '采集矿石1次',
        task_type: 2, need_level: 0,
        obtain_map_id: 10001, commit_map_id: 10001,
        obtain_npc_id: 3, commit_npc_id: 3,
        obtain_dialog: 200, progress_dialog: 205, finish_dialog: 210,
        prize_id: 50002, area_id: 1,
        steps: [{seq: 1, step_type: 6, value: 1, target: '采矿', link: [10001]}],
        // step_type 6 = mine ore
    },
];

function buildPbTaskInfo(taskDef) {
    let stepList = Buffer.alloc(0);
    if (taskDef.steps) {
        for (const s of taskDef.steps) {
            let keys = Buffer.alloc(0);
            if (s.link) for (const k of s.link) keys = Buffer.concat([keys, encodeUint32(3, k)]);
            const step = Buffer.concat([
                encodeUint32(1, s.seq),
                encodeUint32(2, s.step_type),
                encodeUint32(4, s.value || 1),
                encodeString(5, s.target || ''),
                keys,
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
        encodeUint32(3, 0), // task_flag
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
    const headerLen = 4 + headerProto.length;
    const totalLen = 8 + headerProto.length + body.length;
    const packet = Buffer.alloc(totalLen);
    packet.writeUInt32BE(totalLen, 0);
    packet.writeUInt32BE(headerLen, 4);
    headerProto.copy(packet, 8);
    body.copy(packet, 8 + headerProto.length);
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
    'submit_map_event', 'submit_map_mine', 'submit_map_mine_info',
    'obtain_task', 'finish_task', 'cancel_task', 'set_task_step',
    'get_task_buff_list', 'get_task_flag_list',
    'get_sys_cur_time', 'text_msg', 'pb_cs_task', 'pass_do_action',
    'get_lottery_prize', 'get_reward', 'get_lottery',
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
            // create_role must return login_out (game expects full login data)
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
                const respHeaderLen = 4 + respHeader.length;
                const totalMsgLen = 8 + respHeader.length + respBody.length;
                const packet = Buffer.alloc(totalMsgLen);
                packet.writeUInt32BE(totalMsgLen, 0);
                packet.writeUInt32BE(respHeaderLen, 4);
                respHeader.copy(packet, 8);
                respBody.copy(packet, 8 + respHeader.length);
                socket.write(packet);

                // Dump full packet for mine-related and a sample walk message
                if (respCmd.includes('mine') || respCmd.includes('walk')) {
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
        // For recheck: include existing role so game knows character exists
        const withRole = cmd.includes('recheck') && STATE.roles[1] && STATE.roles[1].length > 0;
        return buildCheckSessionResponse(withRole);
    }

    // ---- Login & Create Role ----
    if (cmd.includes('create_role')) {
        const nick = fields[2] || "Player";
        const gender = fields[3] || 1;
        const serverId = fields[1] || 1;
        const roleTm = now;
        const uid = STATE.nextUid++;
        if (!STATE.roles[serverId]) STATE.roles[serverId] = [];
        STATE.roles[serverId].push({roleTm, nick, gender, uid, level: 20});
        // Give the player a starter monster to skip pet selection crash
        const ps = getPlayerState(uid);
        // NO pre-assigned monster — let game show pet selection normally (GuideLayer crash already patched)
        ps.bagMon = [];
        ps.level = 20;
        // Pre-assign tutorial tasks
        ps.tasks = [
            {id: 10001, name: '初到异蘑世界', info: '与多罗对话', task_type: 2, need_level: 0,
             obtain_map_id: 10001, commit_map_id: 10001,
             obtain_npc_id: 3, commit_npc_id: 3,
             obtain_dialog: 100, progress_dialog: 105, finish_dialog: 110,
             prize_id: 50001, area_id: 1,
             steps: [{seq: 1, step_type: 5, value: 3, target: '3', link: [10001]}]},
        ];
        // Track which uid this socket is connected to
        socket._uid = uid;
        console.log(`[ROLE] Created: ${nick} uid=${uid}`);
        // Return full login data (game expects this, not just result code)
        return buildLoginResponse();
    }

    if (cmd.includes('login_in')) {
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
        const monId = fields[1] || 1;
        console.log(`[MON] Selected starter: ${monId}`);
        const role = getLastRole(1);
        // Push player_enter_map_out BEFORE the select_main_mon response (matching old server behavior)
        if (role) {
            const mapBody = buildPlayerEnterMapOut(10001, role.nick, role.roleTm, role.gender);
            pushMessage(socket, 'ISeer20CSProto.player_enter_map_out', mapBody, socket._lastF3 || 1, 0, 0);
        }
        const monInfo = buildMonInfo(monId, 5, null);
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
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Get Items (Inventory) ----
    if (cmd.includes('get_item') && !cmd.includes('get_item_')) {
        const ps = getPlayerState(socket._uid || 1);
        let itemList = Buffer.alloc(0);
        for (const item of ps.items) {
            const itemMsg = Buffer.concat([
                encodeUint32(1, item.item_id),
                encodeUint32(2, item.item_count || 1),
            ]);
            itemList = Buffer.concat([itemList, encodeMessage(1, itemMsg)]);
        }
        if (itemList.length === 0) itemList = Buffer.from([0x0a, 0x00]); // empty repeated
        console.log(`[ITEM] get_item: ${ps.items.length} items`);
        return Buffer.concat([itemList, encodeUint32(2, 0)]);
    }

    // ---- Submit Map Mine (Ore) ----
    if (cmd.includes('submit_map_mine')) {
        const mineId = fields[1] || 0;
        console.log(`[MINE] mine_id=${mineId}`);

        // Give player an ore item
        const ps = getPlayerState(socket._uid || 1);
        const itemId = 20081;  // 黄铁矿 (real item ID from item.pbconf)
        const existingItem = ps.items.find(i => i.item_id === itemId);
        if (existingItem) {
            existingItem.item_count = (existingItem.item_count || 1) + 1;
        } else {
            ps.items.push({item_id: itemId, item_count: 1});
        }
        console.log(`[MINE] Awarded item ${itemId}, now have ${ps.items.length} items`);

        // Correct push format for cli_notify_gain_prize_out:
        // prize (field 1, repeated prize_t)
        //   └ item (field 6, repeated item_t)
        //        ├ item_id (field 1, int32)
        //        └ item_count (field 2, int32)
        const itemData = Buffer.concat([
            encodeUint32(1, itemId),
            encodeUint32(2, 1),
        ]);
        const prizeMsg = Buffer.concat([
            encodeMessage(1,  // prize (field 1, repeated)
                encodeMessage(6, itemData)  // item (field 6, repeated)
            ),
        ]);
        pushMessage(socket, 'ISeer20CSProto.cli_notify_gain_prize_out', prizeMsg, socket._lastF3 || 1, socket._lastF4, socket._lastF5);

        // Also push bag update notification
        const itemUpdate = Buffer.concat([
            encodeUint32(1, itemId),
            encodeUint32(2, 1),
        ]);
        const bagUpdate = Buffer.concat([
            encodeMessage(1, itemUpdate),
            encodeUint32(2, 0),
        ]);
        pushMessage(socket, 'ISeer20CSProto.cli_notify_item_bag_updates_out', bagUpdate, socket._lastF3 || 1, socket._lastF4, socket._lastF5);

        // Also push text message
        const msgBody = encodeString(1, '采集成功！获得矿石x1');
        pushMessage(socket, 'ISeer20CSProto.cli_notify_text_msg_out', msgBody, socket._lastF3 || 1, socket._lastF4, socket._lastF5);

        // Field 2 = ore index (1-5, single-byte varint → msg+12 in Frida)
        // Frida autofix reads index from msg+12, maps to real item ID
        const oreIndexMap = {10001: 1, 10023: 2}; // map_id → ore index
        const oreIndex = oreIndexMap[mineId] || 1;
        console.log(`[MINE] mine_id=${mineId} → ore_index=${oreIndex}`);

        return Buffer.concat([
            Buffer.from([0x0a, 0x00]),       // field 1: empty placeholder
            encodeUint32(2, oreIndex),       // field 2: ore index → msg+12
        ]);
    }

    // ---- Submit Map Event (NPC Interaction) ----
    if (cmd.includes('submit_map_event')) {
        const eventType = fields[1] || 0;
        const npcId = fields[2] || 0;
        console.log(`[EVENT] type=${eventType} npc=${npcId}`);
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }

    // ---- Tasks ----
    if (cmd.includes('get_task_list')) {
        return buildTaskListResponse(socket._uid || 1);
    }
    if (cmd.includes('obtain_task')) {
        const taskId = fields[1] || 0;
        const taskDef = TASK_DEFS.find(t => t.id === taskId);
        if (taskDef) {
            const ps = getPlayerState(socket._uid || 1);
            if (!ps.tasks.find(t => t.id === taskId)) ps.tasks.push({...taskDef});
        }
        console.log(`[TASK] obtain_task id=${taskId}`);
        const detail = taskDef ? buildPbTaskInfo(taskDef) : Buffer.alloc(0);
        // Push set_task_step to auto-advance guide (DISABLED for gray screen test)
        // pushMessage(socket, 'ISeer20CSProto.set_task_step_out', Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]), socket._lastF3 || 1, socket._lastF4, socket._lastF5);
        return Buffer.concat([encodeUint32(1, taskId), encodeMessage(2, detail)]);
    }
    if (cmd.includes('finish_task')) {
        const taskId = fields[1] || 0;
        const ps = getPlayerState(socket._uid || 1);
        ps.tasks = ps.tasks.filter(t => t.id !== taskId);
        return Buffer.concat([encodeUint32(1, taskId), encodeUint32(2, 0)]);
    }
    if (cmd.includes('set_task_step')) {
        return Buffer.concat([encodeUint32(1, 0), encodeUint32(2, 0)]);
    }
    if (cmd.includes('pb_cs_task')) {
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
        return encodeMessage(1, info);
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
                monList = Buffer.concat([monList, encodeMessage(1, monInfo)]);
            }
            return Buffer.concat([monList, encodeUint32(2, 0)]);
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
        'get_item', 'get_friend_list', 'get_mail_list',
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
