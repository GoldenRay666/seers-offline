// Comprehensive item name fix + return replacement + tap fix + mining
'use strict';
const MODULE = "libgame_logic.so";

// === ITEM DATA (from item.pbconf) ===
const ITEM_NAMES = {
  20003: "至尊乐透券", 20011: "小果实", 20012: "普通果实", 20013: "大果实", 20014: "饱满的果实",
  20015: "沉甸的果实", 20016: "五彩棒棒糖", 20021: "双倍经验10", 20022: "双倍经验20", 20023: "双倍经验50",
  20024: "双倍经验100", 20031: "资质果实", 20032: "中级资质果", 20033: "高级资质果", 20034: "超级资质果",
  20035: "至尊资质果", 20036: "欢乐气球", 20041: "性格重置药", 20042: "性格升星丸", 20043: "性格转化药剂",
  20044: "胆小药剂", 20045: "固执药剂", 20046: "保守药剂", 20047: "开朗药剂", 20051: "仙尘燃料",
  20052: "仙尘燃料1", 20053: "仙尘燃料2", 20054: "进阶仙尘1", 20055: "进阶仙尘2", 20056: "进阶仙尘3",
  20071: "1级闪光电石", 20072: "2级闪光宝石", 20073: "3级闪亮钻石", 20076: "中级资质果", 20077: "高级资质果实",
  20081: "黄铁矿", 20082: "黑铁矿", 20083: "赤铁矿", 20084: "银矿", 20085: "金矿",
  20101: "体力药剂", 20102: "高级体力药剂", 20103: "特效体力药剂", 20104: "超级体力药剂", 20105: "至尊体力药剂",
  20122: "活动转盘券", 20123: "VIP活动卷", 20190: "天天祝福卷", 60190: "天天祝福卷", 20191: "沙尘卡牌",
  20203: "复活药", 20204: "高级复活药", 20211: "2级防具", 20212: "2级防具", 20213: "2级防具", 20214: "3级防具",
  20221: "武器强化石", 20222: "防具强化石", 20223: "腰带强化石", 20224: "鞋子强化石", 20225: "1级强化石",
  20226: "2级强化石", 20227: "1级武器强化石", 20301: "火系灵石", 20302: "水系灵石", 20303: "草系灵石",
  20304: "飞行系灵石", 20305: "电系灵石", 20306: "地面系灵石", 20307: "机械系灵石", 20311: "光系灵石",
  20312: "暗系灵石", 20313: "精灵系灵石", 20314: "战斗系灵石", 20315: "龙系灵石", 20316: "邪灵系灵石",
  20317: "神秘系灵石", 20318: "时空系灵石", 20319: "冰系灵石", 20321: "火系灵石X", 20322: "水系灵石X",
  20323: "草系灵石X", 20330: "精华药丸1", 20331: "精华药丸2", 20332: "精华药丸3", 20333: "精华药丸4",
  20334: "精华药丸5", 20335: "精华药丸6", 20336: "精华药丸7", 20341: "资质丹1", 20342: "资质丹2",
  20343: "资质丹3", 20351: "炼金石1-1", 20352: "炼金石1-2", 20353: "炼金石1-3", 20354: "炼金石1-4",
  20355: "炼金石1-5", 20356: "炼金石1-6", 20357: "炼金石1-7", 20358: "炼金石1-8", 20359: "炼金石1-9",
  20361: "炼金石2-1", 20362: "炼金石2-2", 20363: "炼金石2-3", 20364: "炼金石2-4", 20365: "炼金石2-5",
  20366: "炼金石2-6", 20367: "炼金石2-7", 20368: "炼金石2-8", 20371: "升品石1", 20372: "升品石2",
  20373: "升品石3", 20374: "升品石4", 20375: "升品石5", 20376: "升品石6", 20385: "个体值药1", 20386: "个体值药2",
  20387: "个体值药3", 20388: "个体值药4", 20389: "个体值药5", 20390: "个体值药6", 20391: "个体值药7",
  20400: "宝石1级红", 20401: "宝石1级黄", 20402: "宝石1级蓝", 20403: "宝石1级绿", 20404: "宝石1级紫",
  20405: "宝石1级白", 20406: "宝石1级黑", 20407: "宝石2级红", 20408: "宝石2级黄", 20409: "宝石2级蓝",
  20410: "宝石2级绿", 20411: "宝石2级紫", 20412: "宝石2级白", 20413: "宝石2级黑", 20414: "宝石3级红",
  20415: "宝石3级黄", 20416: "宝石3级蓝", 20417: "宝石3级绿", 20418: "宝石3级紫", 20419: "宝石3级白",
  20420: "宝石3级黑", 20430: "火源石", 20431: "水源石", 20432: "草源石", 20433: "飞行源石", 20434: "电源石",
  20435: "地面源石", 20436: "机械源石", 20437: "光源石", 20438: "暗源石", 20439: "精灵源石", 20440: "战斗源石",
  20441: "龙源石", 20442: "邪灵源石", 20443: "神秘源石", 20444: "时空源石", 20445: "冰源石", 20446: "火源石X",
  20447: "水源石X", 20448: "草源石X", 20449: "飞行源石X", 20450: "电源石X", 20451: "地面源石X",
  20452: "机械源石X", 20453: "光源石X", 20454: "暗源石X", 20455: "精灵源石X", 20456: "战斗源石X",
  20457: "龙源石X", 20458: "邪灵源石X", 20459: "神秘源石X", 20460: "时空源石X", 20461: "冰源石X",
  20462: "火源石Y", 20463: "水源石Y", 20464: "草源石Y", 20465: "飞行源石Y", 20466: "电源石Y",
  20467: "地面源石Y", 20468: "机械源石Y", 20469: "光源石Y", 20470: "暗源石Y", 20480: "经验宝箱",
  20481: "超级经验宝箱", 20482: "至尊经验宝箱", 20483: "经验宝箱X", 20484: "超级经验宝箱X",
  20485: "至尊经验宝箱X", 20486: "至尊经验宝箱Y", 20500: "星魂石1", 20501: "星魂石2", 20502: "星魂石3",
  20503: "星魂石4", 20504: "星魂石5", 20505: "星魂石6", 20506: "星魂石7", 20507: "星魂石8", 20508: "星魂石9",
  20509: "星魂石10", 20510: "星魂石11", 20511: "星魂石12", 20512: "星魂石13", 20523: "孵化芯片", 20524: "孵化芯片",
  20541: "时装·初级礼包", 20542: "时装·中级礼包", 20543: "时装·高级礼包", 20544: "时装·顶级礼包",
  20545: "时装·随机礼包", 20546: "时装·初级礼包", 20547: "时装·中级礼包", 20548: "时装·高级礼包",
  20549: "时装·顶级礼包", 20550: "时装·随机礼包", 20551: "时装·初级礼包", 20552: "时装·中级礼包",
  20553: "时装·高级礼包", 20554: "时装·顶级礼包", 20555: "时装·随机礼包", 20556: "时装·随机礼包",
  20600: "神秘宝箱", 20601: "神秘宝箱1", 20602: "神秘宝箱2", 20603: "神秘宝箱3", 20604: "神秘宝箱4",
  20605: "神秘宝箱5", 20606: "神秘宝箱6", 20607: "神秘宝箱7", 20608: "神秘宝箱8", 20609: "神秘宝箱9",
  20610: "神秘宝箱10", 20611: "神秘宝箱11", 20612: "神秘宝箱12", 20613: "神秘宝箱13", 20614: "神秘宝箱14",
  20615: "神秘宝箱15", 20621: "超级神秘宝箱1", 20622: "超级神秘宝箱2", 20623: "超级神秘宝箱3",
  20624: "超级神秘宝箱4", 20625: "超级神秘宝箱5", 20626: "超级神秘宝箱6", 20630: "至尊神秘宝箱1",
  20631: "至尊神秘宝箱2", 20632: "至尊神秘宝箱3", 20641: "技能石·火1", 20642: "技能石·火2",
  20651: "金色宝箱1", 20652: "金色宝箱2", 20653: "金色宝箱3", 20654: "金色宝箱4", 20655: "金色宝箱5",
  20656: "金色宝箱6", 20657: "金色宝箱7", 20658: "金色宝箱8", 20659: "金色宝箱9", 20660: "金色宝箱10",
  20661: "金色宝箱11", 20662: "金色宝箱12", 20663: "金色宝箱13", 20664: "金色宝箱14", 20665: "金色宝箱15",
  20666: "金色宝箱16", 20667: "金色宝箱17", 20668: "金色宝箱18", 20669: "金色宝箱19", 20670: "金色宝箱20",
  20671: "金色宝箱21", 20672: "金色宝箱22", 20673: "金色宝箱23", 20674: "金色宝箱24", 20675: "金色宝箱25",
  20676: "金色宝箱26", 20677: "金色宝箱27", 20678: "金色宝箱28", 20679: "金色宝箱29", 20680: "金色宝箱30",
  20681: "金色宝箱31", 20682: "金色宝箱32", 20683: "金色宝箱33", 20684: "金色宝箱34", 20685: "金色宝箱35",
  20686: "金色宝箱36", 20687: "金色宝箱37", 20688: "金色宝箱38", 20689: "金色宝箱39", 20690: "金色宝箱40",
  20691: "金色宝箱41", 20692: "金色宝箱42", 20693: "金色宝箱43", 20694: "金色宝箱44", 20695: "金色宝箱45",
  20696: "金色宝箱46", 20697: "金色宝箱47", 20698: "金色宝箱48", 20699: "金色宝箱49", 20700: "金色宝箱50",
  20701: "金色宝箱51", 20702: "金色宝箱52", 20703: "金色宝箱53", 20704: "金色宝箱54", 20705: "金色宝箱55",
  20706: "金色宝箱56", 20707: "金色宝箱57", 20708: "金色宝箱58", 20709: "金色宝箱59", 20710: "金色宝箱60",
  20711: "金色宝箱61", 20712: "金色宝箱62", 20713: "金色宝箱63", 20714: "金色宝箱64", 20715: "金色宝箱65",
  21001: "精灵蛋1", 21002: "精灵蛋2", 21003: "精灵蛋3", 21004: "精灵蛋4", 21005: "精灵蛋5",
  21006: "精灵蛋6", 21007: "精灵蛋7", 21011: "精灵蛋A1", 21012: "精灵蛋A2", 21013: "精灵蛋A3",
  21014: "精灵蛋A4", 21015: "精灵蛋A5", 21016: "精灵蛋A6", 21017: "精灵蛋A7", 21018: "精灵蛋A8",
  21019: "精灵蛋A9", 21020: "精灵蛋A10", 21021: "精灵蛋A11", 21022: "精灵蛋A12", 21031: "神秘蛋1",
  21032: "神秘蛋2", 21033: "神秘蛋3", 21041: "火系精灵基因", 21042: "水系精灵基因", 21043: "草系精灵基因",
  21044: "飞行系精灵基因", 21045: "电系精灵基因", 21046: "地面系精灵基因", 21047: "机械系精灵基因",
  21048: "光系精灵基因", 21049: "暗系精灵基因", 21050: "精灵系精灵基因", 21051: "战斗系精灵基因",
  21081: "精灵胶囊", 21082: "高级精灵胶囊", 21083: "至尊精灵胶囊", 21084: "精灵胶囊X", 21085: "高级精灵胶囊X",
  21086: "至尊精灵胶囊X", 21087: "精灵胶囊Y", 21088: "高级精灵胶囊Y", 21089: "至尊精灵胶囊Y",
  21090: "至尊精灵胶囊Z", 25001: "VIP1天", 25002: "VIP3天", 25003: "VIP7天", 25004: "VIP15天",
  25005: "VIP30天", 25006: "VIP90天", 25007: "VIP180天", 25011: "VIP月卡", 26001: "金币包100",
  26002: "金币包500", 26003: "金币包1000", 26004: "金币包2000", 26005: "金币包5000", 26006: "金币包10000",
  26008: "银币包", 26009: "银币包大", 27001: "时之砂1", 27002: "时之砂2", 27003: "时之砂3",
  27004: "时之砂4", 27005: "时之砂5", 27006: "时之砂6", 27007: "时之砂7", 28001: "星尘1", 28002: "星尘2",
  28003: "星尘3", 28004: "星尘4", 35001: "能量晶石", 35002: "能量晶石", 35003: "能量晶石",
  35011: "技能石·地", 35012: "技能石·地", 35013: "技能石·地", 35014: "技能石·地", 35015: "技能石·地",
  35016: "技能石·地", 35017: "技能石·地", 35018: "技能石·地", 35019: "技能石·地", 35021: "技能石·地",
  35022: "技能石·地", 35023: "技能石·地", 35024: "技能石·地", 35025: "技能石·地", 35026: "技能石·地",
  35027: "技能石·地", 35028: "技能石·地", 35029: "技能石·地", 36001: "技能石·水", 36002: "技能石·水",
  36003: "技能石·水", 36004: "技能石·水", 36005: "技能石·水", 36006: "技能石·水", 36007: "技能石·水",
  36008: "技能石·水", 36009: "技能石·水", 36010: "技能石·水", 37001: "技能石·草", 37002: "技能石·草",
  37003: "技能石·草", 37004: "技能石·草", 37005: "技能石·草", 37006: "技能石·草", 37007: "技能石·草",
  37008: "技能石·草", 37009: "技能石·草", 37010: "技能石·草", 37011: "技能石·草", 37012: "技能石·草",
  37013: "技能石·草", 37014: "技能石·草", 37015: "技能石·草", 37016: "技能石·草", 37017: "技能石·草",
  37018: "技能石·草", 37019: "技能石·草", 37020: "技能石·草", 37021: "技能石·草", 37022: "技能石·草",
  37023: "技能石·草", 37024: "技能石·草", 37025: "技能石·草", 37026: "技能石·草", 37027: "技能石·草",
  37028: "技能石·草", 37029: "技能石·草", 37030: "技能石·草", 37031: "技能石·草", 37032: "技能石·草",
  37033: "技能石·草", 37034: "技能石·草", 37035: "技能石·草", 37036: "技能石·草", 37037: "技能石·草",
  37038: "技能石·草", 37039: "技能石·草", 38001: "技能石·飞", 38002: "技能石·飞", 38003: "技能石·飞",
  38004: "技能石·飞", 38005: "技能石·飞", 38006: "技能石·飞", 38007: "技能石·飞", 38008: "技能石·飞",
  38009: "技能石·飞", 38010: "技能石·飞", 38011: "技能石·飞", 38012: "技能石·飞", 38013: "技能石·飞",
  38014: "技能石·飞", 38015: "技能石·飞", 38016: "技能石·飞", 38017: "技能石·飞", 38018: "技能石·飞",
  38019: "技能石·飞", 38020: "技能石·飞", 38021: "技能石·飞", 38022: "技能石·飞", 38023: "技能石·飞",
  38024: "技能石·飞", 38025: "技能石·飞", 38026: "技能石·飞", 38027: "技能石·飞", 38028: "技能石·飞",
  38029: "技能石·飞"
};
const ITEM_DESCS = {
  20003: "用来参与至尊乐透抽奖，可通过充值活动获得。", 20011: "使用后增加精灵500经验值。",
  20012: "使用后增加精灵1000经验值。", 20013: "使用后增加精灵2000经验值。",
  20014: "使用后提高精灵等级1级。", 20015: "使用后增加精灵10000经验值。",
  20016: "使用后增加精灵5000经验值。", 20021: "使用后在战斗中获得双倍经验奖励，共10次。",
  20022: "使用后在战斗中获得双倍经验奖励，共20次。", 20023: "使用后在战斗中获得双倍经验奖励，共50次。",
  20024: "使用后在战斗中获得双倍经验奖励，共100次。", 20031: "用于增加精灵资质，提升战力。",
  20032: "用于增加精灵资质，效果更强。", 20033: "用于增加精灵资质，效果更强。",
  20034: "用于增加精灵资质，效果更强。", 20035: "用于增加精灵资质，效果更强。",
  20036: "欢乐气球。", 20041: "重置精灵性格。", 20042: "升星精灵性格。",
  20043: "转化精灵性格。", 20044: "改为胆小性格。", 20045: "改为固执性格。",
  20046: "改为保守性格。", 20047: "改为开朗性格。", 20051: "仙尘燃料。", 20052: "仙尘燃料。",
  20053: "仙尘燃料。", 20054: "进阶仙尘。", 20055: "进阶仙尘。", 20056: "进阶仙尘。",
  20071: "1级闪光电石。", 20072: "2级闪光宝石。", 20073: "3级闪亮钻石。", 20076: "中级资质果。",
  20077: "高级资质果实。", 20081: "采集矿石可获得黄铁。", 20082: "采集矿石可获得黑铁。",
  20083: "采集矿石可获得赤铁。", 20084: "采集矿石可获得银矿。", 20085: "采集矿石可获得金矿。",
  20101: "使用后恢复精灵50体力。", 20102: "使用后恢复精灵100体力。",
  20103: "使用后恢复精灵200体力。", 20104: "使用后恢复精灵500体力。",
  20105: "使用后恢复精灵1000体力。", 20122: "活动转盘券。", 20123: "VIP活动卷。",
  20190: "天天祝福卷。", 60190: "天天祝福卷。", 20191: "沙尘卡牌。",
  20203: "复活药。", 20204: "高级复活药。", 20211: "2级防具。", 20212: "2级防具。",
  20213: "2级防具。", 20214: "3级防具。", 20221: "武器强化石。", 20222: "防具强化石。",
  20223: "腰带强化石。", 20224: "鞋子强化石。", 20225: "1级强化石。", 20226: "2级强化石。",
  20227: "1级武器强化石。", 20301: "火系灵石，用于宝石合成。", 20302: "水系灵石，用于宝石合成。",
  20303: "草系灵石，用于宝石合成。", 20304: "飞行系灵石，用于宝石合成。", 20305: "电系灵石，用于宝石合成。",
  20306: "地面系灵石，用于宝石合成。", 20307: "机械系灵石，用于宝石合成。", 20311: "光系灵石，用于宝石合成。",
  20312: "暗系灵石，用于宝石合成。", 20313: "精灵系灵石，用于宝石合成。", 20314: "战斗系灵石，用于宝石合成。",
  20315: "龙系灵石，用于宝石合成。", 20316: "邪灵系灵石，用于宝石合成。", 20317: "神秘系灵石，用于宝石合成。",
  20318: "时空系灵石，用于宝石合成。", 20319: "冰系灵石，用于宝石合成。", 20321: "火系灵石X，用于宝石合成。",
  20322: "水系灵石X，用于宝石合成。", 20323: "草系灵石X，用于宝石合成。", 20330: "精华药丸1。",
  20331: "精华药丸2。", 20332: "精华药丸3。", 20333: "精华药丸4。", 20334: "精华药丸5。",
  20335: "精华药丸6。", 20336: "精华药丸7。", 20341: "资质丹1。", 20342: "资质丹2。", 20343: "资质丹3。",
  20351: "炼金石1-1。", 20352: "炼金石1-2。", 20353: "炼金石1-3。", 20354: "炼金石1-4。",
  20355: "炼金石1-5。", 20356: "炼金石1-6。", 20357: "炼金石1-7。", 20358: "炼金石1-8。",
  20359: "炼金石1-9。", 20361: "炼金石2-1。", 20362: "炼金石2-2。", 20363: "炼金石2-3。",
  20364: "炼金石2-4。", 20365: "炼金石2-5。", 20366: "炼金石2-6。", 20367: "炼金石2-7。",
  20368: "炼金石2-8。", 20371: "升品石1。", 20372: "升品石2。", 20373: "升品石3。", 20374: "升品石4。",
  20375: "升品石5。", 20376: "升品石6。", 20385: "个体值药1。", 20386: "个体值药2。", 20387: "个体值药3。",
  20388: "个体值药4。", 20389: "个体值药5。", 20390: "个体值药6。", 20391: "个体值药7。",
  20400: "1级红色宝石。", 20401: "1级黄色宝石。", 20402: "1级蓝色宝石。", 20403: "1级绿色宝石。",
  20404: "1级紫色宝石。", 20405: "1级白色宝石。", 20406: "1级黑色宝石。", 20407: "2级红色宝石。",
  20408: "2级黄色宝石。", 20409: "2级蓝色宝石。", 20410: "2级绿色宝石。", 20411: "2级紫色宝石。",
  20412: "2级白色宝石。", 20413: "2级黑色宝石。", 20414: "3级红色宝石。", 20415: "3级黄色宝石。",
  20416: "3级蓝色宝石。", 20417: "3级绿色宝石。", 20418: "3级紫色宝石。", 20419: "3级白色宝石。",
  20420: "3级黑色宝石。", 20430: "火源石。", 20480: "经验宝箱。", 20481: "超级经验宝箱。",
  20482: "至尊经验宝箱。", 20483: "经验宝箱X。", 20484: "超级经验宝箱X。", 20485: "至尊经验宝箱X。",
  20486: "至尊经验宝箱Y。", 20500: "星魂石1。", 20501: "星魂石2。", 20502: "星魂石3。",
  20503: "星魂石4。", 20504: "星魂石5。", 20505: "星魂石6。", 20506: "星魂石7。", 20507: "星魂石8。",
  20508: "星魂石9。", 20509: "星魂石10。", 20510: "星魂石11。", 20511: "星魂石12。", 20512: "星魂石13。",
  20523: "孵化芯片。", 20524: "孵化芯片。", 20541: "时装·初级礼包。", 20542: "时装·中级礼包。",
  20543: "时装·高级礼包。", 20544: "时装·顶级礼包。", 20545: "时装·随机礼包。", 20546: "时装·初级礼包。",
  20547: "时装·中级礼包。", 20548: "时装·高级礼包。", 20549: "时装·顶级礼包。", 20550: "时装·随机礼包。",
  20551: "时装·初级礼包。", 20552: "时装·中级礼包。", 20553: "时装·高级礼包。", 20554: "时装·顶级礼包。",
  20555: "时装·随机礼包。", 20556: "时装·随机礼包。", 20600: "神秘宝箱。", 20601: "神秘宝箱。",
  20602: "神秘宝箱。", 20603: "神秘宝箱。", 20604: "神秘宝箱。", 20605: "神秘宝箱。", 20606: "神秘宝箱。",
  20607: "神秘宝箱。", 20608: "神秘宝箱。", 20609: "神秘宝箱。", 20610: "神秘宝箱。", 20611: "神秘宝箱。",
  20612: "神秘宝箱。", 20613: "神秘宝箱。", 20614: "神秘宝箱。", 20615: "神秘宝箱。", 20621: "超级神秘宝箱。",
  20622: "超级神秘宝箱。", 20623: "超级神秘宝箱。", 20624: "超级神秘宝箱。", 20625: "超级神秘宝箱。",
  20626: "超级神秘宝箱。", 20630: "至尊神秘宝箱。", 20631: "至尊神秘宝箱。", 20632: "至尊神秘宝箱。",
  20641: "技能石·火。", 20642: "技能石·火。", 20651: "金色宝箱。", 20652: "金色宝箱。",
  20653: "金色宝箱。", 20654: "金色宝箱。", 20655: "金色宝箱。", 20656: "金色宝箱。", 20657: "金色宝箱。",
  20658: "金色宝箱。", 20659: "金色宝箱。", 20660: "金色宝箱。", 20661: "金色宝箱。", 20662: "金色宝箱。",
  20663: "金色宝箱。", 20664: "金色宝箱。", 20665: "金色宝箱。", 20666: "金色宝箱。", 20667: "金色宝箱。",
  20668: "金色宝箱。", 20669: "金色宝箱。", 20670: "金色宝箱。", 20671: "金色宝箱。", 20672: "金色宝箱。",
  20673: "金色宝箱。", 20674: "金色宝箱。", 20675: "金色宝箱。", 20676: "金色宝箱。", 20677: "金色宝箱。",
  20678: "金色宝箱。", 20679: "金色宝箱。", 20680: "金色宝箱。", 20681: "金色宝箱。", 20682: "金色宝箱。",
  20683: "金色宝箱。", 20684: "金色宝箱。", 20685: "金色宝箱。", 20686: "金色宝箱。", 20687: "金色宝箱。",
  20688: "金色宝箱。", 20689: "金色宝箱。", 20690: "金色宝箱。", 20691: "金色宝箱。", 20692: "金色宝箱。",
  20693: "金色宝箱。", 20694: "金色宝箱。", 20695: "金色宝箱。", 20696: "金色宝箱。", 20697: "金色宝箱。",
  20698: "金色宝箱。", 20699: "金色宝箱。", 20700: "金色宝箱。", 20701: "金色宝箱。", 20702: "金色宝箱。",
  20703: "金色宝箱。", 20704: "金色宝箱。", 20705: "金色宝箱。", 20706: "金色宝箱。", 20707: "金色宝箱。",
  20708: "金色宝箱。", 20709: "金色宝箱。", 20710: "金色宝箱。", 20711: "金色宝箱。", 20712: "金色宝箱。",
  20713: "金色宝箱。", 20714: "金色宝箱。", 20715: "金色宝箱。", 21001: "精灵蛋。", 21002: "精灵蛋。",
  21003: "精灵蛋。", 21004: "精灵蛋。", 21005: "精灵蛋。", 21006: "精灵蛋。", 21007: "精灵蛋。",
  21011: "精灵蛋A。", 21012: "精灵蛋A。", 21013: "精灵蛋A。", 21014: "精灵蛋A。", 21015: "精灵蛋A。",
  21016: "精灵蛋A。", 21017: "精灵蛋A。", 21018: "精灵蛋A。", 21019: "精灵蛋A。", 21020: "精灵蛋A。",
  21021: "精灵蛋A。", 21022: "精灵蛋A。", 21031: "神秘蛋。", 21032: "神秘蛋。", 21033: "神秘蛋。",
  21041: "火系精灵基因。", 21042: "水系精灵基因。", 21043: "草系精灵基因。", 21044: "飞行系精灵基因。",
  21045: "电系精灵基因。", 21046: "地面系精灵基因。", 21047: "机械系精灵基因。", 21048: "光系精灵基因。",
  21049: "暗系精灵基因。", 21050: "精灵系精灵基因。", 21051: "战斗系精灵基因。", 21081: "精灵胶囊。",
  21082: "高级精灵胶囊。", 21083: "至尊精灵胶囊。", 21084: "精灵胶囊X。", 21085: "高级精灵胶囊X。",
  21086: "至尊精灵胶囊X。", 21087: "精灵胶囊Y。", 21088: "高级精灵胶囊Y。", 21089: "至尊精灵胶囊Y。",
  21090: "至尊精灵胶囊Z。", 25001: "VIP1天。", 25002: "VIP3天。", 25003: "VIP7天。",
  25004: "VIP15天。", 25005: "VIP30天。", 25006: "VIP90天。", 25007: "VIP180天。",
  25011: "VIP月卡。", 26001: "金币包100。", 26002: "金币包500。", 26003: "金币包1000。",
  26004: "金币包2000。", 26005: "金币包5000。", 26006: "金币包10000。", 26008: "银币包。",
  26009: "银币包大。", 27001: "时之砂1。", 27002: "时之砂2。", 27003: "时之砂3。",
  27004: "时之砂4。", 27005: "时之砂5。", 27006: "时之砂6。", 27007: "时之砂7。",
  28001: "星尘1。", 28002: "星尘2。", 28003: "星尘3。", 28004: "星尘4。",
  35001: "能量晶石。", 35002: "能量晶石。", 35003: "能量晶石。", 35011: "技能石·地。",
  35012: "技能石·地。", 35013: "技能石·地。", 35014: "技能石·地。", 35015: "技能石·地。",
  35016: "技能石·地。", 35017: "技能石·地。", 35018: "技能石·地。", 35019: "技能石·地。",
  35021: "技能石·地。", 35022: "技能石·地。", 35023: "技能石·地。", 35024: "技能石·地。",
  35025: "技能石·地。", 35026: "技能石·地。", 35027: "技能石·地。", 35028: "技能石·地。",
  35029: "技能石·地。", 36001: "技能石·水。", 36002: "技能石·水。", 36003: "技能石·水。",
  36004: "技能石·水。", 36005: "技能石·水。", 36006: "技能石·水。", 36007: "技能石·水。",
  36008: "技能石·水。", 36009: "技能石·水。", 36010: "技能石·水。", 37001: "技能石·草。",
  37002: "技能石·草。", 37003: "技能石·草。", 37004: "技能石·草。", 37005: "技能石·草。",
  37006: "技能石·草。", 37007: "技能石·草。", 37008: "技能石·草。", 37009: "技能石·草。",
  37010: "技能石·草。", 37011: "技能石·草。", 37012: "技能石·草。", 37013: "技能石·草。",
  37014: "技能石·草。", 37015: "技能石·草。", 37016: "技能石·草。", 37017: "技能石·草。",
  37018: "技能石·草。", 37019: "技能石·草。", 37020: "技能石·草。", 37021: "技能石·草。",
  37022: "技能石·草。", 37023: "技能石·草。", 37024: "技能石·草。", 37025: "技能石·草。",
  37026: "技能石·草。", 37027: "技能石·草。", 37028: "技能石·草。", 37029: "技能石·草。",
  37030: "技能石·草。", 37031: "技能石·草。", 37032: "技能石·草。", 37033: "技能石·草。",
  37034: "技能石·草。", 37035: "技能石·草。", 37036: "技能石·草。", 37037: "技能石·草。",
  37038: "技能石·草。", 37039: "技能石·草。", 38001: "技能石·飞。", 38002: "技能石·飞。",
  38003: "技能石·飞。", 38004: "技能石·飞。", 38005: "技能石·飞。", 38006: "技能石·飞。",
  38007: "技能石·飞。", 38008: "技能石·飞。", 38009: "技能石·飞。", 38010: "技能石·飞。",
  38011: "技能石·飞。", 38012: "技能石·飞。", 38013: "技能石·飞。", 38014: "技能石·飞。",
  38015: "技能石·飞。", 38016: "技能石·飞。", 38017: "技能石·飞。", 38018: "技能石·飞。",
  38019: "技能石·飞。", 38020: "技能石·飞。", 38021: "技能石·飞。", 38022: "技能石·飞。",
  38023: "技能石·飞。", 38024: "技能石·飞。", 38025: "技能石·飞。", 38026: "技能石·飞。",
  38027: "技能石·飞。", 38028: "技能石·飞。", 38029: "技能石·飞。"
};

// All item IDs we support
const ALL_ITEM_IDS = [20003,20011,20012,20013,20014,20015,20016,20021,20022,20023,20024,20031,20032,20033,20034,20035,20036,20041,20042,20043,20044,20045,20046,20047,20051,20052,20053,20054,20055,20056,20071,20072,20073,20076,20077,20081,20082,20083,20084,20085,20101,20102,20103,20104,20105,20122,20123,20190,60190,20191,20203,20204,20211,20212,20213,20214,20221,20222,20223,20224,20225,20226,20227,20301,20302,20303,20304,20305,20306,20307,20311,20312,20313,20314,20315,20316,20317,20318,20319,20321,20322,20323,20330,20331,20332,20333,20334,20335,20336,20341,20342,20343,20351,20352,20353,20354,20355,20356,20357,20358,20359,20361,20362,20363,20364,20365,20366,20367,20368,20371,20372,20373,20374,20375,20376,20385,20386,20387,20388,20389,20390,20391,20400,20401,20402,20403,20404,20405,20406,20407,20408,20409,20410,20411,20412,20413,20414,20415,20416,20417,20418,20419,20420,20430,20431,20432,20433,20434,20435,20436,20437,20438,20439,20440,20441,20442,20443,20444,20445,20446,20447,20448,20449,20450,20451,20452,20453,20454,20455,20456,20457,20458,20459,20460,20461,20462,20463,20464,20465,20466,20467,20468,20469,20470,20480,20481,20482,20483,20484,20485,20486,20500,20501,20502,20503,20504,20505,20506,20507,20508,20509,20510,20511,20512,20523,20524,20541,20542,20543,20544,20545,20546,20547,20548,20549,20550,20551,20552,20553,20554,20555,20556,20600,20601,20602,20603,20604,20605,20606,20607,20608,20609,20610,20611,20612,20613,20614,20615,20621,20622,20623,20624,20625,20626,20630,20631,20632,20641,20642,20651,20652,20653,20654,20655,20656,20657,20658,20659,20660,20661,20662,20663,20664,20665,20666,20667,20668,20669,20670,20671,20672,20673,20674,20675,20676,20677,20678,20679,20680,20681,20682,20683,20684,20685,20686,20687,20688,20689,20690,20691,20692,20693,20694,20695,20696,20697,20698,20699,20700,20701,20702,20703,20704,20705,20706,20707,20708,20709,20710,20711,20712,20713,20714,20715,21001,21002,21003,21004,21005,21006,21007,21011,21012,21013,21014,21015,21016,21017,21018,21019,21020,21021,21022,21031,21032,21033,21041,21042,21043,21044,21045,21046,21047,21048,21049,21050,21051,21081,21082,21083,21084,21085,21086,21087,21088,21089,21090,25001,25002,25003,25004,25005,25006,25007,25011,26001,26002,26003,26004,26005,26006,26008,26009,27001,27002,27003,27004,27005,27006,27007,28001,28002,28003,28004,35001,35002,35003,35011,35012,35013,35014,35015,35016,35017,35018,35019,35021,35022,35023,35024,35025,35026,35027,35028,35029,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,37001,37002,37003,37004,37005,37006,37007,37008,37009,37010,37011,37012,37013,37014,37015,37016,37017,37018,37019,37020,37021,37022,37023,37024,37025,37026,37027,37028,37029,37030,37031,37032,37033,37034,37035,37036,37037,37038,37039,38001,38002,38003,38004,38005,38006,38007,38008,38009,38010,38011,38012,38013,38014,38015,38016,38017,38018,38019,38020,38021,38022,38023,38024,38025,38026,38027,38028,38029];
const ORE_MAP = {1:20081, 2:20082};

// === GLOBAL STATE ===
let gridItemMap = {};      // gridId → itemId
let nameStrings = {};       // itemId → NativePointer (Memory.allocUtf8String)
let descStrings = {};       // itemId → NativePointer
let synthItemInfo = {};     // itemId → NativePointer (256-byte synthetic item_t)
let lastBagDumpTime = 0;
let bagLayer = null;

function getItemName(id) { return ITEM_NAMES[id] || ("道具#" + id); }
function getItemDesc(id) { return ITEM_DESCS[id] || ("道具编号: " + id); }

// Allocate all string buffers upfront
function allocateStrings() {
    for (const id of ALL_ITEM_IDS) {
        nameStrings[id] = Memory.allocUtf8String(getItemName(id));
        descStrings[id] = Memory.allocUtf8String(getItemDesc(id));
    }
}

function makeSynthItemInfo(id) {
    if (synthItemInfo[id]) return synthItemInfo[id];
    const buf = Memory.alloc(256);
    for (let i = 0; i < 256; i += 4) buf.add(i).writeU32(0);
    // item_t struct layout (inferred):
    // +0x00: mask/flags (0xFFFFFFFF = all fields present)
    // +0x04: name* (char*)
    // +0x08: name_len (int)
    // +0x0c: desc_len (int)
    // +0x10: item_id (int)
    // +0x14: category (int)
    // +0x18: host_type (int)
    // +0x1c: overlap (int)
    buf.add(0).writeU32(0xFFFFFFFF);
    buf.add(4).writePointer(nameStrings[id]);
    buf.add(8).writeU32(nameStrings[id].readUtf8String().length);
    buf.add(12).writeU32(descStrings[id].readUtf8String().length);
    buf.add(16).writeU32(id);
    buf.add(20).writeU32(1); // category
    buf.add(24).writeU32(2); // host_type
    buf.add(28).writeU32(1); // overlap
    synthItemInfo[id] = buf;
    return buf;
}

// Pre-allocate SaveItem buffers (1-indexed)
function makeSaveItems() {
    const saveItems = [null];
    for (let i = 0; i < ALL_ITEM_IDS.length; i++) {
        const buf = Memory.alloc(0x11); // 17 bytes
        for (let j = 0; j < 0x11; j += 4) buf.add(j).writeU32(0);
        buf.add(0).writeU32(ALL_ITEM_IDS[i]);
        buf.add(4).writeU32(1); // count = 1
        saveItems.push(buf);
    }
    return saveItems;
}

// === GUIDE BYPASS ===
function installGuideBypass(mod) {
    // 1. showMaskLayer → BX LR
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN10GuideLayer13showMaskLayerEv") {
            try { exp.address.writeByteArray([0x70, 0x47]); send("[GUIDE] showMaskLayer → BX LR"); } catch(e) {}
            break;
        }
    }
    // 2. hideDialogNode → BX LR
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN10GuideLayer14hideDialogNodeEv") {
            try { exp.address.writeByteArray([0x70, 0x47]); send("[GUIDE] hideDialogNode → BX LR"); } catch(e) {}
            break;
        }
    }
    // 3. ccTouchBegan → return false
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN10GuideLayer12ccTouchBeganEPN7cocos2d7CCTouchEPNS0_7CCEventE") {
            Interceptor.attach(exp.address, {
                onLeave(retval) { retval.replace(ptr(0)); }
            });
            send("[GUIDE] ccTouchBegan → false");
            break;
        }
    }
    // 4. addGuideLayer → immediately remove
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN10SceneLayer13addGuideLayerEv") {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    for (const e2 of mod.enumerateExports()) {
                        if (e2.name === "_ZN10SceneLayer16removeGuideLayerEv") {
                            new NativeFunction(e2.address, 'void', ['pointer'])(this.context.r0);
                            break;
                        }
                    }
                }
            });
            send("[GUIDE] addGuideLayer → auto-remove");
            break;
        }
    }
    // 5. addFunctionGuideLayer → remove
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN10SceneLayer21addFunctionGuideLayerEv") {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    for (const e2 of mod.enumerateExports()) {
                        if (e2.name === "_ZN10SceneLayer24removeFunctionGuideLayerEv") {
                            new NativeFunction(e2.address, 'void', ['pointer'])(this.context.r0);
                            break;
                        }
                    }
                }
            });
            send("[GUIDE] addFunctionGuideLayer → auto-remove");
            break;
        }
    }
    // 6. CCLayerColor::setOpacity → force 0
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN7cocos2d12CCLayerColor10setOpacityEh") {
            Interceptor.attach(exp.address, {
                onEnter(args) { if (args[1].toInt32() > 50 && args[1].toInt32() < 220) args[1] = ptr(0); }
            });
            send("[GUIDE] setOpacity → force 0");
            break;
        }
    }
}

// === TREE WALK FIX ===
function walkAndFixAllLabels(rootNode, mod) {
    if (!rootNode || rootNode.isNull()) return;
    // Build helpers from module exports
    let getChildrenFn, getChildrenCountFn, getTagFn;
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN7cocos2d6CCNode11getChildrenEv") getChildrenFn = new NativeFunction(e.address, 'pointer', ['pointer']);
        if (e.name === "_ZN7cocos2d6CCNode16getChildrenCountEv") getChildrenCountFn = new NativeFunction(e.address, 'uint32', ['pointer']);
        if (e.name === "_ZN7cocos2d6CCNode6getTagEv") getTagFn = new NativeFunction(e.address, 'int32', ['pointer']);
        if (getChildrenFn && getChildrenCountFn && getTagFn) break;
    }
    if (!getChildrenFn) { send("[FIX] getChildren not found"); return; }

    // Get known label vtable addresses
    let vtCCLabelBMFont, vtCCLabelTTF, vtCCLabelAtlas;
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZTVN7cocos2d13CCLabelBMFontE") vtCCLabelBMFont = e.address;
        if (e.name === "_ZTVN7cocos2d10CCLabelTTFE") vtCCLabelTTF = e.address;
        if (e.name === "_ZTVN7cocos2d12CCLabelAtlasE") vtCCLabelAtlas = e.address;
        if (vtCCLabelBMFont && vtCCLabelTTF && vtCCLabelAtlas) break;
    }
    // Find setString functions
    let setStringAddrs = {};
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN7cocos2d13CCLabelBMFont9setStringEPKc") setStringAddrs.bmfont = e.address;
        if (e.name === "_ZN7cocos2d10CCLabelTTF9setStringEPKc") setStringAddrs.ttf = e.address;
        if (e.name === "_ZN7cocos2d12CCLabelAtlas9setStringEPKc") setStringAddrs.atlas = e.address;
        if (setStringAddrs.bmfont && setStringAddrs.ttf && setStringAddrs.atlas) break;
    }

    let fixed = 0;
    function walk(node, depth) {
        if (depth > 6 || !node || node.isNull()) return;
        try {
            const vt = node.readPointer();
            const tag = getTagFn ? getTagFn(node) : 0;

            // Check if this node is a label type
            let setStrFn = null;
            if (vt.equals(vtCCLabelBMFont)) setStrFn = setStringAddrs.bmfont;
            else if (vt.equals(vtCCLabelTTF)) setStrFn = setStringAddrs.ttf;
            else if (vt.equals(vtCCLabelAtlas)) setStrFn = setStringAddrs.atlas;

            if (setStrFn && tag >= 1 && tag <= 30) {
                const itemId = gridItemMap[tag];
                if (itemId) {
                    const correct = ITEM_NAMES[itemId];
                    if (correct && nameStrings[itemId]) {
                        const setFn = new NativeFunction(setStrFn, 'void', ['pointer', 'pointer']);
                        setFn(node, nameStrings[itemId]);
                        fixed++;
                        if (fixed <= 5) send(`[FIX] grid=${tag} id=${itemId} → "${correct}"`);
                    }
                }
            }

            // Walk children
            const children = getChildrenFn(node);
            if (!children || children.isNull()) return;
            const count = getChildrenCountFn(node);
            const dataPtr = children.add(0x0c).readPointer();
            if (dataPtr.isNull() || count > 50) return;
            for (let i = 0; i < count; i++) {
                const child = dataPtr.add(i * 4).readPointer();
                walk(child, depth + 1);
            }
        } catch(e) {}
    }
    walk(rootNode, 0);
    send(`[FIX] Tree walk done: ${fixed} labels fixed`);
}

// === CORE INSTALL ===
function install() {
    if (install._done) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    installGuideBypass(mod);

    allocateStrings();
    const saveItems = makeSaveItems();

    // 1. Return replacement: getItemWithGridID (only way to fill getItemBagDump)
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.gridId = a[0].toInt32(); },
                onLeave(r) {
                    if (r.isNull()) return;
                    const si = saveItems[this.gridId];
                    if (si) {
                        r.replace(si);
                        gridItemMap[this.gridId] = ALL_ITEM_IDS[this.gridId - 1];
                    }
                }
            });
            send("[HOOK] getItemWithGridID (return replacement)");
            break;
        }
    }

    // 2. Hook getItemInfoByItemID — replace only when NULL
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.id = a[1].toInt32(); },
                onLeave(r) {
                    if (r.isNull() && ITEM_NAMES[this.id]) {
                        r.replace(makeSynthItemInfo(this.id));
                    }
                }
            });
            send("[HOOK] getItemInfoByItemID (NULL→synthetic)");
            break;
        }
    }

    // 3. Hook getItemName — always replace
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN19GameItemDataManager11getItemNameEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.id = a[1].toInt32(); },
                onLeave(r) {
                    if (nameStrings[this.id]) {
                        r.replace(nameStrings[this.id]);
                    }
                }
            });
            send("[HOOK] getItemName (always forced)");
            break;
        }
    }

    // 4. Hook getItemNameById (Lua config lookup)
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN24GameConfigFromLuaManager15getItemNameByIdEi") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.id = a[1].toInt32(); },
                onLeave(r) {
                    if (nameStrings[this.id]) {
                        r.replace(ptr(nameStrings[this.id]));
                        send(`[LUANAME] id=${this.id} → "${getItemName(this.id)}"`);
                    }
                }
            });
            send("[HOOK] getItemNameById (Lua → forced)");
            break;
        }
    }

    // 5. Hook getItemDescription
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN19GameItemDataManager18getItemDescriptionEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.id = a[1].toInt32(); },
                onLeave(r) {
                    if (descStrings[this.id]) {
                        r.replace(ptr(descStrings[this.id]));
                    }
                }
            });
            send("[HOOK] getItemDescription (forced)");
            break;
        }
    }

    // 6. Hook getItemDescById (Lua)
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN24GameConfigFromLuaManager15getItemDescByIdEi") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.id = a[1].toInt32(); },
                onLeave(r) {
                    if (descStrings[this.id]) {
                        r.replace(ptr(descStrings[this.id]));
                    }
                }
            });
            send("[HOOK] getItemDescById (Lua → forced)");
            break;
        }
    }

    // 6b. Hook updateItemInBag to verify proto push delivery
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    const si = a[1];
                    send(`[UPDATE] updateItemInBag id=${si.add(0).readU32()} cnt=${si.add(4).readU32()}`);
                }
            });
            send("[HOOK] updateItemInBag (push trace)");
            break;
        }
    }

    // 6c. Hook bag update Merge + IsInitialized to debug push parsing
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("notify_item_bag_updates_out")) continue;
        if (exp.name.includes("one_t")) continue;
        if (exp.name.includes("MergePartialFromCodedStream")) {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.msg = a[0]; },
                onLeave(r) { send(`[BAG_MERGE] ret=${r.toInt32()}`); }
            });
            send(`[HOOK] bag_update Merge @ ${exp.address}`);
        }
        if (exp.name.includes("IsInitialized")) {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.msg = a[0]; },
                onLeave(r) { send(`[BAG_INIT] ret=${r.toInt32()}`); }
            });
            send(`[HOOK] bag_update IsInitialized @ ${exp.address}`);
        }
    }

    // 7. Map GameIconNode → itemId in setItemIcon, use in onItemSelected
    let _iconItemMap = {}; // node addr → itemId
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12GameIconNode11setItemIconEi") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    const id = a[1].toInt32();
                    if (id > 0) _iconItemMap[a[0].toInt32()] = id;
                }
            });
        }
    }
    // Fix onItemSelected — find GameIconNode parent and look up itemId
    let _getParentFn2 = null;
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN7cocos2d6CCNode9getParentEv") { _getParentFn2 = new NativeFunction(e.address, 'pointer', ['pointer']); break; }
    }
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14onItemSelectedEPN7cocos2d8CCObjectE") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    // Walk up from CCObject to find GameIconNode
                    let cur = a[1];
                    for (let d = 0; d < 5; d++) {
                        const id = _iconItemMap[cur.toInt32()];
                        if (id) {
                            tappedGrid = id; // use itemId as identifier
                            send(`[TAP_FIX] found GameIconNode → itemId=${id} "${getItemName(id)}"`);
                            break;
                        }
                        if (!_getParentFn2) break;
                        cur = _getParentFn2(cur);
                        if (!cur || cur.isNull()) break;
                    }
                }
            });
            send("[HOOK] onItemSelected → node→itemId lookup");
            break;
        }
    }

    // 8. Detail panel fix: createItemDescriptionNode — fix its labels
    let _descSetStr = null;
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN7cocos2d13CCLabelBMFont9setStringEPKc") { _descSetStr = e.address; break; }
    }
    const DESC_CHILD_OFFSETS = [0x28, 0x4c, 0x5c, 0x78, 0x94, 0xb0];
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer25createItemDescriptionNodeERK8SaveItemf") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    const si = a[1];
                    this.descId = si.add(0).readU32();
                },
                onLeave(retval) {
                    const node = retval;
                    const id = this.descId;
                    if (!node || node.isNull() || !ITEM_NAMES[id] || !_descSetStr) return;
                    // Fix all child labels
                    for (const off of DESC_CHILD_OFFSETS) {
                        try {
                            const child = node.add(off).readPointer();
                            if (!child.isNull() && nameStrings[id]) {
                                new NativeFunction(_descSetStr, 'void', ['pointer', 'pointer'])(child, nameStrings[id]);
                                send(`[DESC_FIX] id=${id} label@+0x${off.toString(16)} → "${getItemName(id)}"`);
                            }
                        } catch(e) {}
                    }
                }
            });
            send("[HOOK+FIX] createItemDescriptionNode → fix desc labels");
            break;
        }
    }
    // 8b. Dump ItemBagLayer structure after UI refresh
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer15updateItemCountEv") {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.bag = args[0]; },
                onLeave(retval) {
                    setTimeout(() => dumpBagStructure(this.bag, mod), 500);
                }
            });
            send("[HOOK] updateItemCount → dump structure");
            break;
        }
    }

    function dumpBagStructure(bag, mod) {
        if (!bag || bag.isNull()) return;
        send(`\n=== BAG DUMP ===`);
        // Scan for non-null pointers in the bag struct
        for (let off = 0; off < 0x400; off += 4) {
            try {
                const ptr = bag.add(off).readPointer();
                if (ptr.isNull()) continue;
                // Check if it looks like a valid pointer (reasonably aligned, in heap)
                const val = ptr.toInt32();
                if (val > 0x10000 && val < 0xF0000000) {
                    try {
                        const vt = ptr.readPointer();
                        const tag = ptr.add(0x34).readU32();
                        const z = ptr.add(0x30).readU32();
                        const vts = vt.isNull() ? "NULL" : "0x" + vt.toString(16);
                        send(`  bag+0x${off.toString(16)}=0x${ptr.toString(16)} vt=${vts} tag=${tag} z=${z}`);
                    } catch(e) {
                        send(`  bag+0x${off.toString(16)}=0x${ptr.toString(16)} (unreadable)`);
                    }
                }
            } catch(e) {}
        }
        send(`=== END ===`);
    }

    // 9. createByCCBFile — labels created when CCBI loads
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer15createByCCBFileEv") {
            Interceptor.attach(exp.address, {
                onEnter(a) { bagLayer = a[0]; },
                onLeave(r) {
                    send(`[CCBI] ItemBagLayer created from CCBI, scheduling label fix...`);
                    setTimeout(() => scanAndFixLabels(bagLayer), 1000);
                }
            });
            send("[HOOK] createByCCBFile → label fix trigger");
            break;
        }
    }

    // 10. Bag dump tracking
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14getItemBagDumpEv") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    if (!bagLayer) bagLayer = a[0];
                    gridItemMap = {};
                    lastBagDumpTime = Date.now();
                },
                onLeave(r) {
                    send(`[BAGDUMP] Complete, grid items: ${Object.keys(gridItemMap).length}`);
                }
            });
            send("[HOOK] getItemBagDump (tracking)");
            break;
        }
    }

    // 10. updateItemCount — try to fix grid labels after UI refresh
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer15updateItemCountEv") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.bag = a[0]; },
                onLeave(r) {
                    send(`[UPDATECOUNT] UI refreshed, scheduling label fix...`);
                    // Schedule label scan after UI settles
                    setTimeout(() => scanAndFixLabels(this.bag), 500);
                }
            });
            send("[HOOK] updateItemCount → label fix trigger");
            break;
        }
    }

    // 11. Tap fix: loadItemInfo uses itemId from _iconItemMap
    let tappedItemId = 0;
    let bagScanned = false;
    // (onItemSelected hook is already in section 7 above, updates tappedItemId)
    // Update the old onItemSelected to use _iconItemMap
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14onItemSelectedEPN7cocos2d8CCObjectE") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    const n = a[1];
                    // Use itemId from map
                    tappedItemId = _iconItemMap[n.toInt32()] || 0;
                    if (!tappedItemId) {
                        // Try parent
                        try {
                            const parent = _getParentFn2 ? _getParentFn2(n) : null;
                            if (parent && !parent.isNull()) tappedItemId = _iconItemMap[parent.toInt32()] || 0;
                        } catch(e) {}
                    }
                }
            });
            send("[HOOK] onItemSelected (itemId lookup)");
            break;
        }
    // 11b. loadItemInfo — fix using tappedItemId
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer12loadItemInfoEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    if (a[1].toInt32() === 0 && tappedItemId > 0) {
                        a[1] = ptr(tappedItemId);
                        send(`[LOADINFO] Fixed id=0 → ${tappedItemId}`);
                    }
                }
            });
            send("[HOOK] loadItemInfo (tap fix with itemId)");
            break;
        }
    }

    // 12. Mining fix
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;
        Interceptor.attach(exp.address, {
            onEnter(a) { this.msg = a[0]; },
            onLeave(r) {
                const idx = this.msg.add(12).readU32();
                this.msg.add(8).writeU32(ORE_MAP[idx] || 20081);
                this.msg.add(12).writeU32(1);
                r.replace(ptr(1));
            }
        });
        send("[HOOK] Mining fix");
        break;
    }

    // 13. All label setString variants — global label text fix
    const setStringTargets = [
        "_ZN7cocos2d10CCLabelTTF9setStringEPKc",
        "_ZN7cocos2d13CCLabelBMFont9setStringEPKc",
        "_ZN7cocos2d13CCLabelBMFont9setStringEPKcb",
        "_ZN7cocos2d12CCLabelAtlas9setStringEPKc",
        "_ZN31GameSingleLineHyperlinkLabelTTF9setStringEPKc",
        "_ZN7cocos2d13CCLabelBMFont10setCStringEPKc",
    ];
    let setStringFns = [];
    // Prepare tree-walking helpers
    let getParentFn = null, getTagFn = null;
    for (const e2 of mod.enumerateExports()) {
        if (e2.name === "_ZN7cocos2d6CCNode9getParentEv") getParentFn = new NativeFunction(e2.address, 'pointer', ['pointer']);
        if (e2.name === "_ZN7cocos2d6CCNode6getTagEv") getTagFn = new NativeFunction(e2.address, 'int32', ['pointer']);
        if (getParentFn && getTagFn) break;
    }
    for (const exp of mod.enumerateExports()) {
        if (setStringTargets.includes(exp.name)) {
            const setStringFn = new NativeFunction(exp.address, 'void', ['pointer', 'pointer']);
            const fixing = {};
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    const node = args[0];
                    const str = args[1];
                    try {
                        const s = str.readUtf8String();
                        if (!s || s.length === 0) return; // catch ALL setString calls in grid context
                        let cur = node;
                        for (let d = 0; d < 8; d++) {
                            const tag = getTagFn(cur);
                            if (tag >= 1 && tag <= 30) {
                                const itemId = gridItemMap[tag];
                                if (!itemId) break;
                                const correct = getItemName(itemId);
                                if (correct && correct !== s && !fixing[node.toInt32()]) {
                                    fixing[node.toInt32()] = true;
                                    setStringFn(node, nameStrings[itemId] || Memory.allocUtf8String(correct));
                                    delete fixing[node.toInt32()];
                                    send(`[SETSTRING] grid=${tag} id=${itemId} "${s}" → "${correct}"`);
                                }
                                break;
                            }
                            cur = getParentFn(cur);
                            if (!cur || cur.isNull()) break;
                        }
                    } catch(e) {}
                }
            });
            setStringFns.push(exp.name.split('::').pop());
        }
    }
    send(`[HOOK] setString variants: ${setStringFns.join(', ')}`);

    // 14. createItemScrollPage onLeave — walk tree and fix ALL labels
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("createItemScrollPage") && exp.name.includes("ItemBagLayer")) {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.bag = args[0]; },
                onLeave(retval) {
                    setTimeout(() => walkAndFixAllLabels(this.bag, mod), 300);
                }
            });
            send("[HOOK] createItemScrollPage → label tree walk");
            break;
        }
    }

    // 15. GameIconNode::setItemIcon — fix labels at known child offsets
    let _setStrAddr = null;
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN7cocos2d13CCLabelBMFont9setStringEPKc") { _setStrAddr = e.address; break; }
    }
    // Child pointer offsets found from structure dump: 0x28, 0x4c, 0x5c, 0x78, 0x94
    const CHILD_OFFSETS = [0x28, 0x4c, 0x5c, 0x78, 0x94];
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12GameIconNode11setItemIconEi") {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    const itemId = args[1].toInt32();
                    if (!ITEM_NAMES[itemId] || !_setStrAddr) return;
                    const node = args[0];
                    for (const off of CHILD_OFFSETS) {
                        try {
                            const child = node.add(off).readPointer();
                            if (child.isNull()) continue;
                            const setFn = new NativeFunction(_setStrAddr, 'void', ['pointer', 'pointer']);
                            setFn(child, nameStrings[itemId]);
                        } catch(e) {}
                    }
                }
            });
            send("[HOOK+FIX] setItemIcon → setString on child nodes");
            break;
        }
    }
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12GameIconNode11setIconNameEPKc") {
            Interceptor.attach(exp.address, {
                onEnter(args) { send(`[ICON_NAME] "${safeStr(args[1], 40)}"`); }
            });
            send("[HOOK] GameIconNode::setIconName");
            break;
        }
    }
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12GameIconNode15setIconNumLabelEPKc") {
            Interceptor.attach(exp.address, {
                onEnter(args) { send(`[ICON_NUMLABEL] "${safeStr(args[1], 40)}"`); }
            });
            send("[HOOK] GameIconNode::setIconNumLabel");
            break;
        }
    }

    install._done = true;
    send(`[READY] All hooks active. ${ALL_ITEM_IDS.length} items with REAL names.`);
    send(`[TIP] Open backpack. Tap items for detail panel (names should be correct).`);
    send(`[TIP] Grid labels may still show '小果实' — label scan will attempt to fix.`);
}

// === SCENE GRAPH LABEL FIX ===
// Walk Cocos2d-x children to find and fix "小果实" labels
function scanAndFixLabels(bagNode) {
    if (!bagNode || bagNode.isNull()) {
        send("[FIX] No bag node reference");
        return;
    }
    send(`[FIX] Scanning bag children at ${bagNode}...`);

    // If gridItemMap is empty, fill from ALL_ITEM_IDS
    if (Object.keys(gridItemMap).length === 0) {
        for (let g = 1; g <= 30; g++) gridItemMap[g] = ALL_ITEM_IDS[g - 1];
    }

    // Known correct offset on this build: +0x2f8 (found via diagnostic scan)
    const childOffsets = [0x2f8, 0x2fc, 0x318, 0x31c, 0x330, 0x334,
                          0x28, 0x2c, 0x34, 0x38, 0x3c, 0x40, 0x44, 0x48,
                          0x100, 0x180, 0x1c0, 0x200, 0x240, 0x280, 0x2c0, 0x300, 0x340];
    let childrenArr = null;

    for (const off of childOffsets) {
        try {
            const ptr = bagNode.add(off).readPointer();
            if (ptr.isNull()) continue;
            const dataPtr = ptr.add(0x0c).readPointer();
            const count = ptr.add(0x04).readU32();
            const cap = ptr.add(0x08).readU32();
            if (!dataPtr.isNull() && count > 0 && count <= 100 && cap >= count) {
                send(`[FIX] Found CCArray at +0x${off.toString(16)}: count=${count} cap=${cap} data=${dataPtr}`);
                childrenArr = ptr;
                break;
            }
        } catch(e) {}
    }

    if (!childrenArr) {
        send(`[FIX] No children array found — grid labels not fixed`);
        return;
    }

    const childCount = childrenArr.add(0x04).readU32();
    send(`[FIX] Walking ${childCount} children`);

    // Walk each child recursively to find labels
    for (let i = 0; i < childCount; i++) {
        try {
            const child = childrenArr.add(0x0c).readPointer().add(i * 4).readPointer();
            if (child.isNull()) continue;
            walkChildrenDeep(child, 0);
        } catch(e) {}
    }

    send(`[FIX] Label scan complete`);
}

function walkChildrenDeep(node, depth) {
    if (depth > 5) return; // Safety limit
    try {
        const tag = node.add(0x34).readU32();
        // If node has tag 1-30, it's likely a grid cell
        const gridId = (tag > 0 && tag <= 30) ? tag : null;
        const expectedName = gridId ? getItemName(gridItemMap[gridId] || ALL_ITEM_IDS[gridId - 1]) : null;

        // Try to fix labels in this node
        tryFixNodeLabelsSimple(node, expectedName);

        // Walk children recursively
        const childOffsets = [0x28, 0x2c, 0x34, 0x38, 0x3c, 0x40];
        for (const off of childOffsets) {
            try {
                const ptr = node.add(off).readPointer();
                if (ptr.isNull()) continue;
                const dataPtr = ptr.add(0x0c).readPointer();
                const count = ptr.add(0x04).readU32();
                if (dataPtr.isNull() || count === 0 || count > 50) continue;
                for (let j = 0; j < count; j++) {
                    try {
                        const sub = dataPtr.add(j * 4).readPointer();
                        if (!sub.isNull()) walkChildrenDeep(sub, depth + 1);
                    } catch(e) {}
                }
            } catch(e) {}
        }
    } catch(e) {}
}

function tryFixNodeLabelsSimple(node, expectedName) {
    // Try to find a CCLabelTTF-style object and fix its text
    // CCLabelTTF stores string in std::string — look for heap pointer patterns
    const strOffsets = [0x68, 0x6c, 0x70, 0x74, 0x78, 0x7c, 0x80, 0x84, 0x88, 0x8c, 0x90, 0x94, 0x98, 0x9c, 0xa0];
    let foundFixable = false;

    for (const off of strOffsets) {
        try {
            const strPtr = node.add(off).readPointer();
            if (strPtr.isNull()) continue;
            // Check if it points to readable heap memory with short string
            try {
                const s = strPtr.readUtf8String();
                if (!s || s.length > 100) continue;
                // If it contains "果实" or matches known name pattern
                if (s.includes("果实") || s === "" || s === "小果实") {
                    if (expectedName && s !== expectedName) {
                        // Write new string pointer and update length
                        const newStr = Memory.allocUtf8String(expectedName);
                        node.add(off).writePointer(newStr);
                        node.add(off + 4).writeU32(expectedName.length);
                        send(`[FIX] Replaced "${s}" → "${expectedName}"`);
                        foundFixable = true;
                    }
                }
            } catch(e) {}
        } catch(e) {}
    }
    return foundFixable;
}

// === RETRY LOOP ===
setInterval(install, 2000);
install();
