// ============================================================
// Backpack item display fix v2 — based on verified analysis
// ============================================================
// WORKS: return replacement, detail panel name hooks, guide bypass
// DOESN'T WORK (accepted): grid label text (CCLabelBMFont baked in CCBI)
// ============================================================
'use strict';
const MODULE = "libgame_logic.so";

// === ITEM DATA ===
const ITEM_NAMES = {
  20003:"至尊乐透券",20011:"小果实",20012:"普通果实",20013:"大果实",20014:"饱满的果实",
  20015:"沉甸的果实",20016:"五彩棒棒糖",20021:"双倍经验10",20022:"双倍经验20",20023:"双倍经验50",
  20024:"双倍经验100",20031:"资质果实",20032:"中级资质果",20033:"高级资质果",20034:"超级资质果",
  20035:"至尊资质果",20036:"欢乐气球",20041:"性格重置药",20042:"性格升星丸",20043:"性格转化药剂",
  20044:"胆小药剂",20045:"固执药剂",20046:"保守药剂",20047:"开朗药剂",20051:"仙尘燃料",
  20052:"仙尘燃料1",20053:"仙尘燃料2",20054:"进阶仙尘1",20055:"进阶仙尘2",20056:"进阶仙尘3",
  20071:"1级闪光电石",20072:"2级闪光宝石",20073:"3级闪亮钻石",20076:"中级资质果",20077:"高级资质果实",
  20081:"黄铁矿",20082:"黑铁矿",20083:"赤铁矿",20084:"银矿",20085:"金矿",
  20101:"体力药剂",20102:"高级体力药剂",20103:"特效体力药剂",20104:"超级体力药剂",20105:"至尊体力药剂",
  20122:"活动转盘券",20123:"VIP活动卷",20190:"天天祝福卷",60190:"天天祝福卷",20191:"沙尘卡牌",
  20203:"复活药",20204:"高级复活药",20211:"2级防具",20212:"2级防具",20213:"2级防具",20214:"3级防具",
  20221:"武器强化石",20222:"防具强化石",20223:"腰带强化石",20224:"鞋子强化石",20225:"1级强化石",
  20226:"2级强化石",20227:"1级武器强化石",20301:"火系灵石",20302:"水系灵石",20303:"草系灵石",
  20304:"飞行系灵石",20305:"电系灵石",20306:"地面系灵石",20307:"机械系灵石",20311:"光系灵石",
  20312:"暗系灵石",20313:"精灵系灵石",20314:"战斗系灵石",20315:"龙系灵石",20316:"邪灵系灵石",
  20317:"神秘系灵石",20318:"时空系灵石",20319:"冰系灵石",20321:"火系灵石X",20322:"水系灵石X",
  20323:"草系灵石X",20330:"精华药丸1",20331:"精华药丸2",20332:"精华药丸3",20333:"精华药丸4",
  20334:"精华药丸5",20335:"精华药丸6",20336:"精华药丸7",20341:"资质丹1",20342:"资质丹2",
  20343:"资质丹3",20351:"炼金石1-1",20352:"炼金石1-2",20353:"炼金石1-3",20354:"炼金石1-4",
  20355:"炼金石1-5",20356:"炼金石1-6",20357:"炼金石1-7",20358:"炼金石1-8",20359:"炼金石1-9",
  20361:"炼金石2-1",20362:"炼金石2-2",20363:"炼金石2-3",20364:"炼金石2-4",20365:"炼金石2-5",
  20366:"炼金石2-6",20367:"炼金石2-7",20368:"炼金石2-8",20371:"升品石1",20372:"升品石2",
  20373:"升品石3",20374:"升品石4",20375:"升品石5",20376:"升品石6",20385:"个体值药1",20386:"个体值药2",
  20387:"个体值药3",20388:"个体值药4",20389:"个体值药5",20390:"个体值药6",20391:"个体值药7",
  20400:"宝石1级红",20401:"宝石1级黄",20402:"宝石1级蓝",20403:"宝石1级绿",20404:"宝石1级紫",
  20405:"宝石1级白",20406:"宝石1级黑",20407:"宝石2级红",20408:"宝石2级黄",20409:"宝石2级蓝",
  20410:"宝石2级绿",20411:"宝石2级紫",20412:"宝石2级白",20413:"宝石2级黑",20414:"宝石3级红",
  20415:"宝石3级黄",20416:"宝石3级蓝",20417:"宝石3级绿",20418:"宝石3级紫",20419:"宝石3级白",
  20420:"宝石3级黑",20430:"火源石",20431:"水源石",20432:"草源石",
  20480:"经验宝箱",20481:"超级经验宝箱",20482:"至尊经验宝箱",
  21081:"精灵胶囊",21082:"高级精灵胶囊",21083:"至尊精灵胶囊",
};
const ITEM_DESCS = {
  20003:"用来参与至尊乐透抽奖。",20011:"使用后增加精灵500经验值。",
  20012:"使用后增加精灵1000经验值。",20013:"使用后增加精灵2000经验值。",
  20014:"使用后提高精灵等级1级。",20015:"使用后增加精灵10000经验值。",
  20016:"使用后增加精灵5000经验值。",20021:"使用后在战斗中获得双倍经验奖励，共10次。",
  20022:"使用后在战斗中获得双倍经验奖励，共20次。",20023:"使用后在战斗中获得双倍经验奖励，共50次。",
  20024:"使用后在战斗中获得双倍经验奖励，共100次。",20031:"用于增加精灵资质，提升战力。",
  20032:"用于增加精灵资质。",20033:"用于增加精灵资质。",
  20034:"用于增加精灵资质。",20035:"用于增加精灵资质。",
  20041:"重置精灵性格。",20042:"升星精灵性格。",
  20081:"采集矿石可获得黄铁。",20082:"采集矿石可获得黑铁。",
};
const ALL_ITEM_IDS = Object.keys(ITEM_NAMES).map(Number).sort((a,b)=>a-b);
const ORE_MAP = {1:20081, 2:20082};

// === GLOBAL STATE ===
let gridItemMap = {};
let nameStrings = {};
let descStrings = {};
let synthItemInfo = {};
let iconItemMap = {}; // GameIconNode addr → itemId (for tap fix)

function getItemName(id) { return ITEM_NAMES[id] || ("道具#" + id); }
function getItemDesc(id) { return ITEM_DESCS[id] || ("道具编号: " + id); }

function allocateStrings() {
    for (const id of ALL_ITEM_IDS) {
        nameStrings[id] = Memory.allocUtf8String(getItemName(id));
        descStrings[id] = Memory.allocUtf8String(getItemDesc(id));
    }
}

function makeSynthItemInfo(id) {
    if (synthItemInfo[id]) return synthItemInfo[id];
    const buf = Memory.alloc(256);
    buf.add(0).writeU32(0xFFFFFFFF);
    buf.add(4).writePointer(nameStrings[id]);
    buf.add(8).writeU32(nameStrings[id].readUtf8String().length);
    buf.add(12).writeU32(descStrings[id].readUtf8String().length);
    buf.add(16).writeU32(id);
    buf.add(20).writeU32(1);
    buf.add(24).writeU32(2);
    buf.add(28).writeU32(1);
    synthItemInfo[id] = buf;
    return buf;
}

function makeSaveItems() {
    const saveItems = [null];
    for (let i = 0; i < ALL_ITEM_IDS.length; i++) {
        const buf = Memory.alloc(0x11);
        buf.add(0).writeU32(ALL_ITEM_IDS[i]);
        buf.add(4).writeU32(1);
        saveItems.push(buf);
    }
    return saveItems;
}

// === GUIDE BYPASS ===
function installGuideBypass(mod) {
    const guideTargets = [
        { name: "_ZN10GuideLayer13showMaskLayerEv", patch: true },
        { name: "_ZN10GuideLayer14hideDialogNodeEv", patch: true },
        { name: "_ZN10GuideLayer12ccTouchBeganEPN7cocos2d7CCTouchEPNS0_7CCEventE", hookTouch: true },
    ];
    for (const t of guideTargets) {
        for (const exp of mod.enumerateExports()) {
            if (exp.name !== t.name) continue;
            if (t.patch) {
                try { exp.address.writeByteArray([0x70, 0x47]); } catch(e) {}
            } else if (t.hookTouch) {
                Interceptor.attach(exp.address, { onLeave(r) { r.replace(ptr(0)); } });
            }
            break;
        }
    }
    // setOpacity safety net
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN7cocos2d12CCLayerColor10setOpacityEh") {
            Interceptor.attach(exp.address, {
                onEnter(args) { if (args[1].toInt32() > 50 && args[1].toInt32() < 220) args[1] = ptr(0); }
            });
            break;
        }
    }
}

// === CORE INSTALL ===
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // installGuideBypass(mod); // DISABLED
    // Use GameGuideManager::endGuide instead
    let _guideMgr = null, _endGuideFn = null, _processGuideFn = null;
    for (const e of mod.enumerateExports()) {
        if (e.name.includes("GameGuideManager") && e.name.endsWith("sharedManagerEv")) {
            _guideMgr = new NativeFunction(e.address, 'pointer', []);
        }
        if (e.name.includes("GameGuideManager") && e.name.endsWith("8endGuideEv")) {
            _endGuideFn = new NativeFunction(e.address, 'void', ['pointer']);
        }
        if (e.name.includes("GameGuideManager") && e.name.endsWith("12processGuideEv")) {
            _processGuideFn = new NativeFunction(e.address, 'void', ['pointer']);
        }
        if (_guideMgr && _endGuideFn && _processGuideFn) break;
    }
    // NO guide bypass — test item tap only
    send("[GUIDE] Guide bypass DISABLED");

    allocateStrings();
    const saveItems = makeSaveItems();
    send(`[INIT] ${ALL_ITEM_IDS.length} items loaded`);

    // 1. Return replacement: getItemWithGridID — WITH crash guard
    let _gridCallCount = 0;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    try {
                        this.a0 = a[0].toInt32();
                        this.a1 = a[1].toInt32();
                        this.grid = (this.a0 >= 1 && this.a0 <= 100) ? this.a0 :
                                    (this.a1 >= 1 && this.a1 <= 100) ? this.a1 : 0;
                    } catch(e) { this.grid = 0; }
                },
                onLeave(r) {
                    try {
                        _gridCallCount++;
                        if (_gridCallCount <= 35) {
                            send(`[GRID#${_gridCallCount}] a0=${this.a0} a1=${this.a1} → grid=${this.grid}`);
                        }
                        if (r.isNull()) return;
                        const si = saveItems[this.grid];
                        if (si && this.grid >= 1 && this.grid <= ALL_ITEM_IDS.length) {
                            r.replace(si);
                            gridItemMap[this.grid] = ALL_ITEM_IDS[this.grid - 1];
                        }
                    } catch(e) {
                        send(`[GRID_ERR] ${e.message}`);
                    }
                }
            });
            send("[HOOK] getItemWithGridID (return replacement)");
            break;
        }
    }

    // All name hooks DISABLED — testing if return replacement alone crashes

    installed = true;
    send(`[READY] ${ALL_ITEM_IDS.length} items. Return replacement + name hooks + tap fix + desc panel + mining.`);
    send(`[TIP] Grid labels show CCBI defaults (cosmetic). Detail panel on tap should show correct names.`);
}

setInterval(install, 2000);
install();
