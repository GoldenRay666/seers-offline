// Find how item config is loaded
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Search for config-related exports
const keywords = ['LoadConfig','InitConfig','ReadConfig','OpenConfig',
    'loadConfig','initConfig','readConfig',
    'LoadPb','InitPb','ReadPb','OpenPb',
    'PbConf','pbconf','PbConfig','pbConfig',
    'LoadItem','InitItem','ReadItem',
    'LoadTable','InitTable','ReadTable',
    'LoadData','InitData','ReadData',
    'Deserialize','Parse','Unmarshal',
    'Asset','asset','File','file',
    'Conf','conf','Config','config'];

let found = [];
for (const exp of mod.enumerateExports()) {
    const n = exp.name;
    for (const kw of keywords) {
        if (n.includes(kw)) {
            found.push(n);
            break;
        }
    }
}

send(`Found ${found.length} config-related exports:`);
for (const n of found.slice(0, 100)) send(`  ${n}`);

// Specifically look for GameItemDataManager functions
send('--- GameItemDataManager ---');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('GameItemDataManager')) {
        send(`  ${exp.name}`);
    }
}

// Look for text proto parser
send('--- TextFormat / Parser ---');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('TextFormat') || exp.name.includes('TextProto') ||
        exp.name.includes('DebugString') || exp.name.includes('ParseFromString') ||
        exp.name.includes('ParseFromIstream') || exp.name.includes('ParseFromFileDescriptor')) {
        send(`  ${exp.name}`);
    }
}

send('[DONE]');
