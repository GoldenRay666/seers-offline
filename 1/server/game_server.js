/**
 * Seer Alliance — Local Offline Game Server
 * Uses real game config data from APK's PbConfig files.
 */
"use strict";

const http = require('http');
const net = require('net');
const { loadAll } = require('./pbconf_loader');

// ── Protobuf helpers ───────────────────────────────────────────────

function encodeVarint(value) {
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

function encodeLengthDelimited(fieldNumber, data) {
    const tag = encodeTag(fieldNumber, 2);
    const len = encodeVarint(data.length);
    return Buffer.concat([tag, len, data]);
}

function encodeUint32(fieldNumber, value) {
    return Buffer.concat([encodeTag(fieldNumber, 0), encodeVarint(value >>> 0)]);
}

function encodeInt32(fieldNumber, value) {
    return Buffer.concat([encodeTag(fieldNumber, 0), encodeVarint(value | 0)]);
}

function encodeString(fieldNumber, s) {
    return encodeLengthDelimited(fieldNumber, Buffer.from(s, 'utf-8'));
}

function encodeBool(fieldNumber, v) {
    return Buffer.concat([encodeTag(fieldNumber, 0), encodeVarint(v ? 1 : 0)]);
}

function encodeFloat(fieldNumber, v) {
    const buf = Buffer.allocUnsafe(4);
    buf.writeFloatLE(v, 0);
    return Buffer.concat([encodeTag(fieldNumber, 5), buf]);
}

function encodeMessage(fieldNumber, msgData) {
    return encodeLengthDelimited(fieldNumber, msgData);
}

function encodePackedVarint(fieldNumber, values) {
    const parts = [];
    for (const v of values) parts.push(encodeVarint(v >>> 0));
    return encodeLengthDelimited(fieldNumber, Buffer.concat(parts));
}

function hexDump(data) {
    const lines = [];
    for (let i = 0; i < data.length; i += 16) {
        const hex = Array.from(data.slice(i, i + 16))
            .map(b => b.toString(16).padStart(2, '0')).join(' ');
        const ascii = Array.from(data.slice(i, i + 16))
            .map(b => (b >= 32 && b < 127) ? String.fromCharCode(b) : '.').join('');
        lines.push(`  ${i.toString(16).padStart(4, '0')}: ${hex.padEnd(48)} ${ascii}`);
    }
    return lines.join('\n');
}

// ── Config data ────────────────────────────────────────────────────

let cfg = null;
let idx = null;

// ── Response builders — using real config data ─────────────────────

function buildServerListResponse() {
    // cli_get_server_list_out: server_list(repeated), login_ip(uint32), login_port(uint32)
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

function buildCheckSessionResponse() {
    const serverInfo = Buffer.concat([
        encodeUint32(1, 1),
        encodeUint32(2, 0x7F000001),
        encodeUint32(3, 8002),
        encodeUint32(4, 0),
        encodeUint32(5, 100),
        encodeUint32(6, 10),
        encodeUint32(7, 1),
        encodeString(8, "Offline Server"),
    ]);
    return encodeMessage(1, encodeMessage(1, serverInfo));
}

let createdRoles = {};

function buildLoginResponse(fields) {
    const now = Math.floor(Date.now() / 1000);
    const roles = createdRoles[1] || [];
    const lastRole = roles.length > 0 ? roles[roles.length - 1] : null;

    if (fields) {
        const nick = fields[2] || "Player";
        const gender = fields[3] || 1;
        const serverId = fields[1] || 1;
        if (!createdRoles[serverId]) createdRoles[serverId] = [];
        createdRoles[serverId].push({ role_tm: now, nick, gender });
        console.log('[ROLE] Created:', nick, 'gender:', gender, 'role_tm:', now);
    }

    const basicInfo = Buffer.concat([
        encodeString(1, lastRole ? lastRole.nick : "Player"),
        encodeUint32(2, lastRole ? lastRole.role_tm : now),
        encodeUint32(4, now - 60),
        encodeUint32(5, 1),
        encodeUint32(6, 0),
        encodeUint32(7, lastRole ? lastRole.gender : 1),
        encodeUint32(8, 1000),
        encodeUint32(9, 10000),
        encodeUint32(10, 0),
        encodeUint32(11, 100),
        encodeUint32(12, 200),
        encodeUint32(13, 100),
        encodeUint32(14, 200),
    ]);

    const switchInfo = (() => {
        const parts = [];
        for (let i = 1; i <= 9; i++) parts.push(encodeUint32(i, 1));
        return Buffer.concat(parts);
    })();

    return Buffer.concat([
        encodeMessage(1, basicInfo),
        encodeMessage(2, switchInfo),
        encodeUint32(3, now),
        encodeUint32(4, 0),
    ]);
}

function buildRandomNickResponse() {
    const nicks = ["赛尔勇士", "星辰使者", "雷电先锋", "暗影猎手", "烈焰战将", "冰霜骑士"];
    let result = Buffer.alloc(0);
    for (const nick of nicks) result = Buffer.concat([result, encodeString(1, nick)]);
    return result;
}

// ── Config-based response builders ─────────────────────────────────

function buildMapListResponse() {
    // cli_get_map_out / get_unlocked_map_id_list_out
    // Returns packed list of map IDs
    const mapIds = Object.keys(idx.map).map(Number);
    return Buffer.concat([
        encodePackedVarint(1, mapIds),
        encodeUint32(2, 0), // ret code
    ]);
}

function buildPlayerInfoResponse() {
    const now = Math.floor(Date.now() / 1000);
    const roles = createdRoles[1] || [];
    const lastRole = roles.length > 0 ? roles[roles.length - 1] : null;
    const playerInfo = Buffer.concat([
        encodeString(1, lastRole ? lastRole.nick : "Player"),
        encodeUint32(2, lastRole ? lastRole.role_tm : now),
        encodeUint32(5, 1),
        encodeUint32(7, lastRole ? lastRole.gender : 1),
        encodeUint32(8, 1000),
        encodeUint32(9, 10000),
        encodeUint32(11, 100),
        encodeUint32(12, 200),
    ]);
    return encodeMessage(1, playerInfo);
}

function buildItemListResponse() {
    // Return empty item bag for new characters
    return Buffer.concat([
        Buffer.from([0x0a, 0x00]),
        encodeUint32(2, 0),
    ]);
}

function buildMonBagResponse() {
    return Buffer.concat([
        Buffer.from([0x0a, 0x00]),
        encodeUint32(2, 0),
    ]);
}

function buildEmptyListResponse() {
    return Buffer.concat([
        Buffer.from([0x0a, 0x00]),
        encodeUint32(2, 0),
    ]);
}

function buildServerTimeResponse() {
    return Buffer.concat([
        encodeUint32(1, Math.floor(Date.now() / 1000)),
        encodeUint32(2, 0),
    ]);
}

function buildPvpDataResponse() {
    const buf = Buffer.alloc(64, 0);
    let pos = 0;
    for (let fn = 1; fn <= 8; fn++) {
        buf[pos++] = (fn << 3) | 0;
        buf[pos++] = 0;
        buf[pos++] = (fn << 3) | 2;
        buf[pos++] = 2;
        buf[pos++] = 0x08;
        buf[pos++] = 0;
    }
    return buf.slice(0, pos);
}

// ── Message router ─────────────────────────────────────────────────

const CMD_RESPONSE_MAP = {
    'ISeer20CSProto.cli_check_session_in': 'ISeer20CSProto.cli_check_session_out',
    'ISeer20CSProto.login_in': 'ISeer20CSProto.login_out',
    'ISeer20CSProto.cli_create_role_in': 'ISeer20CSProto.login_out',
    'ISeer20CSProto.cli_get_server_list_in': 'ISeer20CSProto.cli_get_server_list_out',
    'ISeer20CSProto.cli_get_item_in': 'ISeer20CSProto.cli_get_item_out',
    'ISeer20CSProto.cli_get_player_info_in': 'ISeer20CSProto.cli_get_player_info_out',
    'ISeer20CSProto.cli_get_server_time_in': 'ISeer20CSProto.cli_get_server_time_out',
    'ISeer20CSProto.cli_get_friend_list_in': 'ISeer20CSProto.cli_get_friend_list_out',
    'ISeer20CSProto.cli_get_bag_mon_in': 'ISeer20CSProto.cli_get_bag_mon_out',
    'ISeer20CSProto.cli_get_mail_list_in': 'ISeer20CSProto.cli_get_mail_list_out',
    'ISeer20CSProto.cli_get_task_list_in': 'ISeer20CSProto.cli_get_task_list_out',
    'ISeer20CSProto.cli_get_activity_list_in': 'ISeer20CSProto.cli_get_activity_list_out',
    'ISeer20CSProto.cli_get_shop_info_in': 'ISeer20CSProto.cli_get_shop_info_out',
    'ISeer20CSProto.cli_lookup_random_nick_in': 'ISeer20CSProto.cli_lookup_random_nick_out',
    'ISeer20CSProto.cli_get_storemon_index_in': 'ISeer20CSProto.cli_get_storemon_index_out',
    'ISeer20CSProto.cli_get_map_in': 'ISeer20CSProto.cli_get_map_out',
};

function buildResponseBody(gameCmd, bodyFields) {
    if (gameCmd.includes('check_session')) return buildCheckSessionResponse();
    if (gameCmd.includes('create_role')) return buildLoginResponse(bodyFields);
    if (gameCmd.includes('login_in')) return buildLoginResponse(null);
    if (gameCmd.includes('lookup_random_nick')) return buildRandomNickResponse();
    if (gameCmd.includes('get_player_info')) return buildPlayerInfoResponse();
    if (gameCmd.includes('get_server_time')) return buildServerTimeResponse();
    if (gameCmd.includes('get_item')) return buildItemListResponse();
    if (gameCmd.includes('get_bag_mon')) return buildMonBagResponse();
    if (gameCmd.includes('get_friend_list')) return buildEmptyListResponse();
    if (gameCmd.includes('get_mail_list') || gameCmd.includes('get_mail_head')) return buildEmptyListResponse();
    if (gameCmd.includes('get_activity_list')) return buildEmptyListResponse();
    if (gameCmd.includes('get_task_list')) return buildEmptyListResponse();
    if (gameCmd.includes('get_shop_info')) return buildEmptyListResponse();
    if (gameCmd.includes('get_storemon') || gameCmd.includes('storemon_index')) return buildEmptyListResponse();
    if (gameCmd.includes('get_pvp_data')) return buildPvpDataResponse();
    if (gameCmd.includes('unlocked_map_id_list')) return buildMapListResponse();
    if (gameCmd.includes('get_map')) return buildMapListResponse();
    // Generic fallback
    return Buffer.concat([Buffer.from([0x0a, 0x00]), encodeUint32(2, 0)]);
}

// ── TCP Game Server ─────────────────────────────────────────────────

const TCP_PORT = 8002;

function handleGameClient(socket) {
    const addr = `${socket.remoteAddress}:${socket.remotePort}`;
    console.log(`\n[TCP] Client connected: ${addr}`);

    let buffer = Buffer.alloc(0);
    socket._msgCount = 0;

    socket.on('data', (data) => { console.log('[TCP] RAW DATA (' + data.length + ' bytes):'); console.log(hexDump(data.slice(0, Math.min(data.length, 128)))); if (data.length > 128) console.log('  ... (' + (data.length - 128) + ' more bytes)');
        console.log(`[TCP] Raw data received: ${data.length} bytes`);
        buffer = Buffer.concat([buffer, data]);

        while (buffer.length >= 4) {
            const totalLen = buffer.readUInt32BE(0);
            if (totalLen > buffer.length) return; // Wait for more data

            const dataLen = totalLen - 4;
            const msgData = buffer.slice(4, 4 + dataLen);
            buffer = buffer.slice(totalLen);

            // Parse header
            const headerDataLen = msgData.readUInt32BE(0);
            const headerProto = msgData.slice(4, 4 + headerDataLen - 4);

            // Extract CMD and fields from header
            let gameCmd = "unknown", inSeqId = 0, inField3 = 0, inField4 = 0, inField5 = 0;
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
                    if (fieldNum === 2) inSeqId = value;
                    else if (fieldNum === 3) inField3 = value;
                    else if (fieldNum === 4) inField4 = value;
                    else if (fieldNum === 5) inField5 = value;
                } else if (wireType === 2) {
                    let len = 0, shift = 0;
                    while (pos < headerProto.length) {
                        const b = headerProto[pos++];
                        len |= (b & 0x7f) << shift;
                        if (!(b & 0x80)) break;
                        shift += 7;
                    }
                    if (fieldNum === 1) gameCmd = headerProto.slice(pos, pos + len).toString('utf-8');
                    pos += len;
                } else break;
            }

            // Parse body fields for request data
            const bodyStart = headerDataLen;
            const bodyData = msgData.slice(bodyStart);
            let bodyFields = {};
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
                    bodyFields[fieldNum] = value;
                } else if (wireType === 2) {
                    let len = 0, shift = 0;
                    while (bp < bodyData.length) {
                        const b = bodyData[bp++];
                        len |= (b & 0x7f) << shift;
                        if (!(b & 0x80)) break;
                        shift += 7;
                    }
                    bodyFields[fieldNum] = bodyData.slice(bp, bp + len).toString('utf-8');
                    bp += len;
                } else break;
            }

            console.log(`[TCP] CMD: ${gameCmd} seq=${inSeqId} body:`, JSON.stringify(bodyFields));

            // Build response
            let respCmd = CMD_RESPONSE_MAP[gameCmd];
            if (!respCmd) {
                if (gameCmd.endsWith('_in')) respCmd = gameCmd.slice(0, -3) + '_out';
                else if (gameCmd.startsWith('ISeer20CSProto.')) respCmd = gameCmd + '_out';
                else respCmd = gameCmd;
            }

            const body = buildResponseBody(gameCmd, bodyFields);
            if (body === null) { console.log(`[TCP] Skipping ${gameCmd}`); continue; }

            socket._msgCount++;
            const respSeq = socket._msgCount;
            const respHeaderProto = Buffer.concat([
                encodeString(1, respCmd),
                encodeUint32(2, respSeq),
                encodeUint32(3, inField3 || 1),
                encodeUint32(4, inField4),
                encodeUint32(5, inField5),
            ]);

            const headerLen = 4 + respHeaderProto.length;
            const totalMsgLen = 8 + respHeaderProto.length + body.length;
            const packet = Buffer.alloc(totalMsgLen);
            packet.writeUInt32BE(totalMsgLen, 0);
            packet.writeUInt32BE(headerLen, 4);
            respHeaderProto.copy(packet, 8);
            body.copy(packet, 8 + respHeaderProto.length);

            socket.write(packet);
            console.log(`[TCP] Sent ${respCmd} (${packet.length} bytes)`);
            if (packet.length <= 128) console.log(hexDump(packet));

            // Push init messages after login
            if (gameCmd.includes('login_in') || gameCmd.includes('create_role')) {
                pushInitMessages(socket, inField3, inField4, inField5);
            }
        }
    });

    socket.on('close', () => console.log(`[TCP] Disconnected: ${addr}`));
    socket.on('error', (err) => console.log(`[TCP] Error: ${err.message}`));
}

function pushInitMessages(socket, f3, f4, f5) {
    const now = Math.floor(Date.now() / 1000);
    const msgs = [
        { cmd: 'ISeer20CSProto.cli_notify_item_bag_updates_out', body: Buffer.alloc(0) },
        { cmd: 'ISeer20CSProto.cli_get_item_out', body: buildItemListResponse() },
        { cmd: 'ISeer20CSProto.cli_get_bag_mon_out', body: buildMonBagResponse() },
        { cmd: 'ISeer20CSProto.cli_get_player_info_out', body: buildPlayerInfoResponse() },
        { cmd: 'ISeer20CSProto.cli_get_server_time_out', body: buildServerTimeResponse() },
        { cmd: 'ISeer20CSProto.cli_get_friend_list_out', body: buildEmptyListResponse() },
        { cmd: 'ISeer20CSProto.cli_get_mail_list_out', body: buildEmptyListResponse() },
        { cmd: 'ISeer20CSProto.cli_get_activity_list_out', body: buildEmptyListResponse() },
    ];
    for (const msg of msgs) {
        socket._msgCount++;
        const hdr = Buffer.concat([
            encodeString(1, msg.cmd),
            encodeUint32(2, socket._msgCount),
            encodeUint32(3, f3),
            encodeUint32(4, f4),
            encodeUint32(5, f5),
        ]);
        const hLen = 4 + hdr.length;
        const tLen = 8 + hdr.length + msg.body.length;
        const pkt = Buffer.alloc(tLen);
        pkt.writeUInt32BE(tLen, 0);
        pkt.writeUInt32BE(hLen, 4);
        hdr.copy(pkt, 8);
        msg.body.copy(pkt, 8 + hdr.length);
        socket.write(pkt);
    }
    console.log(`[TCP] Pushed ${msgs.length} init messages after login`);
}

// ── HTTP Server ─────────────────────────────────────────────────────

const HTTP_PORT = 8000;

const httpServer = http.createServer((req, res) => {
    const timestamp = new Date().toISOString().split('T')[1].slice(0, 12);
    console.log(`[HTTP ${timestamp}] ${req.method} ${req.url}`);

    let body = Buffer.alloc(0);
    req.on('data', chunk => { body = Buffer.concat([body, chunk]); });
    req.on('end', () => {
        if (req.url.includes('/iseer2.fcgi')) {
            // login_ip as string — JsonCpp needs string format for display and connect
            const data = {
                online_list: [{ online_id: 1, online_name: "Offline Server", online_status: 1 }],
                login_ip: "127.0.0.1",
                login_port: 8002
            };
            const text = JSON.stringify(data);
            const response = Buffer.from(text, 'utf-8');
            res.writeHead(200, {
                'Content-Type': 'text/plain; charset=utf-8',
                'Content-Length': response.length,
                'Access-Control-Allow-Origin': '*',
            });
            res.end(response);
            console.log(`[HTTP] Sent JSON: ${text}`);
        } else {
            res.writeHead(200, {
                'Content-Type': 'application/octet-stream',
                'Access-Control-Allow-Origin': '*',
            });
            res.end('');
        }
    });
});

// ── Main ────────────────────────────────────────────────────────────

function start() {
    const result = loadAll();
    cfg = result.data;
    idx = result.indexes;

    httpServer.listen(HTTP_PORT, '0.0.0.0', () => {
        console.log(`[HTTP] Listening on 0.0.0.0:${HTTP_PORT}`);
    });

    const tcpServer = net.createServer(handleGameClient);
    tcpServer.listen(TCP_PORT, '0.0.0.0', () => {
        console.log(`[TCP] Listening on 0.0.0.0:${TCP_PORT}`);
    });

    console.log('');
    console.log('='.repeat(60));
    console.log('  Seer Alliance Offline Server — Ready');
    console.log('  Config data loaded:');
    console.log(`    ${Object.keys(idx.map).length} maps, ${Object.keys(idx.item).length} items`);
    console.log(`    ${Object.keys(idx.npc).length} npcs, ${Object.keys(idx.task).length} tasks`);
    console.log(`    ${Object.keys(idx.prize).length} prizes, ${Object.keys(idx.shop).length} shop goods`);
    console.log('='.repeat(60));
    console.log('  Waiting for game client...');
    console.log('');
}

start();
