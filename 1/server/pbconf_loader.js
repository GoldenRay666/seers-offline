/**
 * pbconf textproto parser — loads game config data for the mock server.
 * The pbconf files are text-format protobuf (textproto), not binary.
 */
"use strict";

const fs = require('fs');
const path = require('path');

// ── textproto parser ──────────────────────────────────────────────
// Handles the subset of textproto that these pbconf files use:
//   message: { field: value ... }
//   enum values as bare identifiers
//   repeated fields as multiple occurrences
//   nested messages
//   strings in double quotes, ints as bare numbers
//   hex ints: 0x...

function tokenize(text) {
    const tokens = [];
    let i = 0;
    while (i < text.length) {
        const c = text[i];
        if (c === ' ' || c === '\t' || c === '\r' || c === '\n') { i++; continue; }
        if (c === '#') { while (i < text.length && text[i] !== '\n') i++; continue; }
        if (c === '{') { tokens.push('{'); i++; continue; }
        if (c === '}') { tokens.push('}'); i++; continue; }
        if (c === ':') { tokens.push(':'); i++; continue; }
        if (c === '"') {
            let s = ''; i++;
            while (i < text.length && text[i] !== '"') {
                if (text[i] === '\\') { i++; s += text[i]; i++; }
                else { s += text[i]; i++; }
            }
            i++; // skip closing "
            tokens.push(JSON.parse('"' + s + '"')); // unescape via JSON
            continue;
        }
        // number or identifier
        let word = '';
        while (i < text.length && !/[\s\{\}:"]/.test(text[i])) {
            word += text[i]; i++;
        }
        if (word.length > 0) {
            if (/^-?\d+$/.test(word)) tokens.push(parseInt(word));
            else if (/^-?\d+\.\d+$/.test(word)) tokens.push(parseFloat(word));
            else if (/^0x[0-9a-fA-F]+$/.test(word)) tokens.push(parseInt(word, 16));
            else tokens.push(word); // identifier / enum value
        }
    }
    return tokens;
}

function parseMessage(tokens, start) {
    let i = start;
    const obj = {};

    function next() { return i < tokens.length ? tokens[i] : undefined; }
    function consume() { return tokens[i++]; }

    while (i < tokens.length) {
        const tok = next();
        if (tok === '}') break;
        if (typeof tok !== 'string') { i++; continue; } // skip stray values

        const field = consume(); // field name
        // Support both "field: value" and "field value" (and "field: {" and "field {")
        if (next() === ':') consume(); // skip optional ':'

        let val = next();
        if (val === '{') {
            consume(); // skip '{'
            const nested = parseMessage(tokens, i);
            i = nested._end + 1; // skip '}'
            delete nested._end;
            // repeated field
            if (obj[field] !== undefined) {
                if (!Array.isArray(obj[field])) obj[field] = [obj[field]];
                obj[field].push(nested);
            } else {
                obj[field] = nested;
            }
        } else if (typeof val === 'string' && tokens[i + 1] === '{') {
            // field: MessageType { ... } — treat as anonymous nested
            consume(); // skip type name
            consume(); // skip '{'
            const nested = parseMessage(tokens, i);
            i = nested._end + 1;
            delete nested._end;
            if (obj[field] !== undefined) {
                if (!Array.isArray(obj[field])) obj[field] = [obj[field]];
                obj[field].push(nested);
            } else {
                obj[field] = nested;
            }
        } else {
            consume(); // value
            // repeated scalar
            if (obj[field] !== undefined) {
                if (!Array.isArray(obj[field])) obj[field] = [obj[field]];
                obj[field].push(val);
            } else {
                obj[field] = val;
            }
        }
    }
    obj._end = i;
    return obj;
}

function parseTextproto(text) {
    const tokens = tokenize(text);
    const results = [];
    let i = 0;
    while (i < tokens.length) {
        const name = tokens[i]; // top-level message name
        if (typeof name !== 'string') { i++; continue; }
        i++;
        // Support both "msg: {" (with colon) and "msg {" (without colon)
        if (i < tokens.length && tokens[i] === ':') i++;
        if (i < tokens.length && tokens[i] === '{') {
            i++; // skip '{'
            const msg = parseMessage(tokens, i);
            i = msg._end + 1;
            delete msg._end;
            msg._type = name;
            results.push(msg);
        }
    }
    return results;
}

// ── pbconf loader ──────────────────────────────────────────────────

const CONFIG_DIR = path.join(__dirname, '..', 'assets', 'PbConfig');

function loadConfig(name) {
    const filePath = path.join(CONFIG_DIR, name + '.pbconf');
    if (!fs.existsSync(filePath)) {
        console.log(`[CONFIG] File not found: ${filePath}`);
        return [];
    }
    const text = fs.readFileSync(filePath, 'utf-8');
    const records = parseTextproto(text);
    console.log(`[CONFIG] Loaded ${records.length} records from ${name}.pbconf`);
    return records;
}

// Indexed lookups
const indexes = {};

function buildIndex(name, keyField) {
    const records = loadConfig(name);
    const idx = {};
    for (const rec of records) {
        const key = rec[keyField];
        if (key !== undefined) idx[key] = rec;
    }
    indexes[name] = idx;
    return idx;
}

// Load all config at startup
function loadAll() {
    console.log('── Loading game config ──');
    const data = {};

    // Load and index everything
    const files = [
        'map', 'item', 'npc', 'task', 'shop', 'prize', 'lottery',
        'activity', 'evolve', 'mon_identify', 'train', 'vip',
        'global', 'add_quality', 'exchange_code', 'finance_plan',
        'leiyi', 'propaganda', 'restrain_sprite'
    ];

    for (const name of files) {
        data[name] = loadConfig(name);
    }

    // Build useful indexes
    indexes.map = {};
    for (const m of data.map) indexes.map[m.id] = m;

    indexes.item = {};
    for (const it of data.item) indexes.item[it.id] = it;

    indexes.npc = {};
    for (const n of data.npc) indexes.npc[n.id] = n;

    indexes.task = {};
    for (const t of data.task) indexes.task[t.id] = t;

    indexes.prize = {};
    for (const p of data.prize) indexes.prize[p.prize_id] = p;

    indexes.shop = {};
    for (const s of data.shop) indexes.shop[s.id] = s;

    console.log(`[CONFIG] Indexed: ${Object.keys(indexes.map).length} maps, ` +
        `${Object.keys(indexes.item).length} items, ` +
        `${Object.keys(indexes.npc).length} npcs, ` +
        `${Object.keys(indexes.task).length} tasks, ` +
        `${Object.keys(indexes.prize).length} prizes, ` +
        `${Object.keys(indexes.shop).length} shop goods`);

    return { data, indexes };
}

module.exports = { loadAll, loadConfig, buildIndex, parseTextproto };
