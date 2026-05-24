// All items via return replacement + container build
'use strict';
const ORE_MAP = {1: 20081, 2: 20082};
const MODULE = "libgame_logic.so";
let installed = false;

// All 397 item IDs from item.pbconf
const ALL_ITEMS = [20003,20011,20012,20013,20014,20015,20016,20021,20022,20023,20024,20031,20032,20033,20034,20035,20036,20041,20042,20043,20044,20045,20046,20047,20051,20052,20053,20054,20055,20056,20071,20072,20073,20076,20077,20081,20082,20083,20084,20085,20101,20102,20103,20104,20105,20122,20123,20190,60190,20191,20203,20204,20211,20212,20213,20214,20221,20222,20223,20224,20225,20226,20227,20301,20302,20303,20304,20305,20306,20307,20311,20312,20313,20314,20315,20316,20317,20318,20319,20321,20322,20323,20330,20331,20332,20333,20334,20335,20336,20341,20342,20343,20351,20352,20353,20354,20355,20356,20357,20358,20359,20361,20362,20363,20364,20365,20366,20367,20368,20371,20372,20373,20374,20375,20376,20385,20386,20387,20388,20389,20390,20391,20400,20401,20402,20403,20404,20405,20406,20407,20408,20409,20410,20411,20412,20413,20414,20415,20416,20417,20418,20419,20420,20430,20431,20432,20433,20434,20435,20436,20437,20438,20439,20440,20441,20442,20443,20444,20445,20446,20447,20448,20449,20450,20451,20452,20453,20454,20455,20456,20457,20458,20459,20460,20461,20462,20463,20464,20465,20466,20467,20468,20469,20470,20480,20481,20482,20483,20484,20485,20486,20500,20501,20502,20503,20504,20505,20506,20507,20508,20509,20510,20511,20512,20523,20524,20541,20542,20543,20544,20545,20546,20547,20548,20549,20550,20551,20552,20553,20554,20555,20556,20600,20601,20602,20603,20604,20605,20606,20607,20608,20609,20610,20611,20612,20613,20614,20615,20621,20622,20623,20624,20625,20626,20630,20631,20632,20641,20642,20651,20652,20653,20654,20655,20656,20657,20658,20659,20660,20661,20662,20663,20664,20665,20666,20667,20668,20669,20670,20671,20672,20673,20674,20675,20676,20677,20678,20679,20680,20681,20682,20683,20684,20685,20686,20687,20688,20689,20690,20691,20692,20693,20694,20695,20696,20697,20698,20699,20700,20701,20702,20703,20704,20705,20706,20707,20708,20709,20710,20711,20712,20713,20714,20715,21001,21002,21003,21004,21005,21006,21007,21011,21012,21013,21014,21015,21016,21017,21018,21019,21020,21021,21022,21031,21032,21033,21041,21042,21043,21044,21045,21046,21047,21048,21049,21050,21051,21081,21082,21083,21084,21085,21086,21087,21088,21089,21090,25001,25002,25003,25004,25005,25006,25007,25011,26001,26002,26003,26004,26005,26006,26008,26009,27001,27002,27003,27004,27005,27006,27007,28001,28002,28003,28004,35001,35002,35003,35011,35012,35013,35014,35015,35016,35017,35018,35019,35021,35022,35023,35024,35025,35026,35027,35028,35029,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,37001,37002,37003,37004,37005,37006,37007,37008,37009,37010,37011,37012,37013,37014,37015,37016,37017,37018,37019,37020,37021,37022,37023,37024,37025,37026,37027,37028,37029,37030,37031,37032,37033,37034,37035,37036,37037,37038,37039,38001,38002,38003,38004,38005,38006,38007,38008,38009,38010,38011,38012,38013,38014,38015,38016,38017,38018,38019,38020,38021,38022,38023,38024,38025,38026,38027,38028,38029];

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // Pre-allocate SaveItems for all grids
    const saveItems = [null]; // 1-indexed
    for (let i = 0; i < ALL_ITEMS.length; i++) {
        const buf = Memory.alloc(0x11);
        for (let j=0;j<0x11;j+=4) buf.add(j).writeU32(0);
        buf.add(0).writeU32(ALL_ITEMS[i]);
        buf.add(4).writeU32(1);
        saveItems.push(buf);
    }

    // === RETURN REPLACEMENT for all grids ===
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.gridId = a[0].toInt32(); },
                onLeave(r) {
                    if (r.isNull()) return;
                    const si = saveItems[this.gridId];
                    if (si) r.replace(si);
                }
            });
            break;
        }
    }

    // === ITEM CONFIG for all 397 items ===
    let m_getItemInfo = null;
    for (const exp of mod.enumerateExports())
        if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") m_getItemInfo = exp.address;
    if (m_getItemInfo) {
        const syn = {};
        for (const id of ALL_ITEMS) {
            const buf = Memory.alloc(256);
            for (let i=0;i<256;i+=4) buf.add(i).writeU32(0);
            buf.add(0).writeU32(0xFFFFFFFF);
            const np = Memory.allocUtf8String(`道具#${id}`);
            buf.add(4).writePointer(np); buf.add(8).writeU32(np.readUtf8String().length);
            buf.add(12).writeU32(np.readUtf8String().length);
            buf.add(16).writeU32(id); buf.add(20).writeU32(1); buf.add(24).writeU32(2); buf.add(28).writeU32(1);
            syn[id] = buf;
        }
        Interceptor.attach(m_getItemInfo, {
            onEnter(a) { this.id = a[1].toInt32(); },
            onLeave(r) { if (r.isNull() && syn[this.id]) r.replace(syn[this.id]); }
        });
    }

    // === ITEM NAME/DESC (hook multiple sources) ===
    const names = {};
    for (const id of ALL_ITEMS) names[id] = `道具#${id}`;
    for (const exp of mod.enumerateExports()) {
        if ((exp.name.includes('getItemName') || exp.name.includes('getItemDesc')) &&
            !exp.name.includes('ColorByQuality') && !exp.name.includes('Label')) {
            try {
                Interceptor.attach(exp.address, {
                    onEnter(a) { this.id = a[1].toInt32(); },
                    onLeave(r) {
                        if (r.isNull() && names[this.id]) {
                            if (exp.name.includes('Desc'))
                                r.replace(Memory.allocUtf8String(names[this.id]));
                            else if (exp.name.includes('Name'))
                                r.replace(Memory.allocUtf8String(names[this.id]));
                        }
                    }
                });
            } catch(e) {}
        }
    }

    // === TAP FIX ===
    let tappedGrid = 0;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14onItemSelectedEPN7cocos2d8CCObjectE") {
            Interceptor.attach(exp.address, {
                onEnter(a) { const n = a[1]; if (!n.isNull()) tappedGrid = n.add(0x0c).readU32(); }
            });
        }
        if (exp.name === "_ZN12ItemBagLayer12loadItemInfoEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { if (a[1].toInt32()===0 && tappedGrid>0) a[1] = ptr(tappedGrid); }
            });
        }
    }

    // === MINING ===
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId); this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));
            }
        });
        send("[seers-fix] Ready"); break;
    }

    installed = true;
}
setInterval(install, 1000);
install();
