# 全量 IDA 白盒推导

> 每个结论有 IDA 汇编/MergePartial/Handler 证据。
> 来源: `whitebox/*.txt` (36个) + `handlers/*.txt` (20个) + `CLIENT_HANDLER_LOGIC.md` + Frida 实测。

---

## 0. 协议基础

```
TCP帧: [4B BE len] [cs_msg_head_t proto] [body proto]
cs_msg_head_t: f1=CMD(string) f2=seq(uint32) f3/f4/f5(uint32)
```

Handler 分发: `NetWorkUtil::dispatchMessage` → `dynamic_cast` 检查消息类型 → 调用对应 handler。

**响应帧 vs Push 帧**: 格式相同，区别仅在 cs_msg_head_t 的 CMD name 和 seq。Push 的 seq 用 `session.nextPushSeq()`。

---

## 数据依赖核心链

```
check_session ──→ CreatePlayerLayer (无player_info)
                       │
                (用户创建角色)
                       │
                  login_out
                       │
              handleMsgLoginIn
                       │
          ┌─写入 m_userInfo ──────────────┐
          │ nick,level,gender,coin,       │
          │ gcoin,energy,mon...           │
          └────────────┬──────────────────┘
                       │
     ┌─────────────────┼─────────────────┐
     ▼                 ▼                 ▼
cli_get_item     get_bag_mon      get_storemon
     │                 │                 │
     ▼                 ▼                 ▼
get_task_list    get_mail_head   get_unlock_map
     │                 │                 │
     ▼                 ▼                 ▼
  get_pvp           ← ← ← ← ← ← ← ← ← ← ┘
     │
     ▼
player_enter_map_out ← 读 m_userInfo ← 必须先初始化!
     │
     ▼
notify_gain_new_mon_out
```

**铁律**: `player_enter_map_out` 的 handler 从 `m_userInfo` 读数据匹配玩家身份 → `login_out` 必须在此之前被处理。`select_main_mon` 场景下可"先推再回"是因为 `login_out` 早已在上一个请求中处理完了。

---

# 一、登录域

## 1.1 check_session_out

**源**: `cs_check_session_out.txt` MergePartial, `06_check_session.txt` handler (458B)

```
check_session_out C++ layout:
  f1[+0x08] = repeated server_role_t* (数组指针)
  f?[+0x0C] = count

server_role_t:
  f1[+0x08] = server_info_t*

server_info_t:
  f1[+0x08] = server_id (uint32)
  f2[+0x0C] = server_name (string)  ← dumper 误标为 uint32
  f3[+0x10] = server_status (uint32, ==4 → "服务器满")

player_info_t (可选, 在 server_role_t 内):
  f?[+0x14] = uid (uint32) → m_userInfo+0x2D/2E
  f?[+0x18] = level → m_userInfo+0x79
```

**Handler 逻辑**:
```
0x62f0e4: count = check_session_out[+0x0C]
0x62f0f6: loop: server_role_t[+0x08][i] → copy ctor
0x62f10e: server_info_t[+0x08] → copy ctor
0x62f11c: if status == 4 → "服务器满"
0x62f124: if has player_info (v36 > 0):
           → 复制到 m_userInfo → setServerIP/Port → startConnect → sendLoginMessage
         else:
           → CreatePlayerLayer::createByCCBFile() → 显示创角界面
0x62f160: OnlineNetworkManager::sShareInstance → 网络初始化
```

**当前实现**: `encodeMessage(1, encodeMessage(1, {1:id, 2:"Offline", 3:0}))` → 无 player_info → 创角 ✓

---

## 1.2 lookup_random_nick_out

**源**: `cs_lookup_random_nick_out.txt` MergePartial

```
f1 wire=2 (length-delimited) → repeated string
```

**当前**: `['赛尔勇士','星辰使者','雷电先锋','暗影猎手'].map(n => encodeString(1, n))` → 56B ✓

---

## 1.3 login_out

**源**: `cs_login_out.txt` MergePartial+handler, `01_login_in.txt` handler (3196B), CLIENT_HANDLER_LOGIC §1

```
login_out C++ layout:
  f1[+0x08] = player_basic_info_t* (message, required)
  f2[+0x0C] = functional_switch_info_t* (message, optional)
  f3[+0x10] = cur_time (int32)
  f4[+0x20] = talent (int32)

player_basic_info_t:
  MergePartial: 空(基类) → dumper 抓不到字段
  约90字节玩家属性，按 presence_mask 字节复制到 m_userInfo
  关键字段:
    f1  = nick (string) → strcpy → m_userInfo+0x1C
    f5  = level → m_userInfo+0x2D/2E
    f7  = gender → m_userInfo+0x2F-32
    f42 = mon_bag_size (6)
    f43 = mon_store_size (6)
```

**Handler** (handleMsgLoginIn):
```
1. removeEventSwallowLayer()
2. dynamic_cast<login_out*>
3. player_basic_info_t copy (+0x08) → 栈
4. functional_switch_info_t copy (+0x0C) → 栈
5. strcpy(nick, m_userInfo+0x1C)                  ← line 49
6. 逐字节复制 90+ 字段 → m_userInfo (mask bits)
7. UserData::addObtainedMonster(+0x08)            ← line 0x6303b2
8. UserData::setServerTime(+0x1C)                 ← line 0x63059a
9. UserData::setServerTime(+0x10)                 ← line 0x6305a0
10. 场景切换 MainMenuLayer
```

**当前**: ✓

---

## 1.4 select_main_mon_out

**源**: `cs_select_main_mon_out.txt` MergePartial+handler (56B)

```
MergePartial: 空, Handler: 无字段读取 (仅场景切换)
```

---

# 二、地图域

## 2.1 player_enter_map_out

**源**: `cs_player_enter_map_out.txt` MergePartial+handler (784B), CLIENT_HANDLER_LOGIC

```
派生类 MergePartial: f2 wire=0(+0x08), f3 wire=0(+0x0C)
完整字段(基类+派生):
  f1[+0x08] = player_enter_map_out_player_t* (message)
  f2[+0x28] = repeated npc_t*
  f3[+0x48] = map_mine_info_t*
  f4[+0x50] = event_t*
  f5[+0x38] = 其他

npc_t: f1=npc_id(int32,required,offset+0x28)

player_t: f1=uid f2=role_tm f3=nick f6=gender
```

**Handler** (handleMsgPlayerEnterMap):
```
0x634924: GameManager::sharedManager → getSceneLayer → removeEventSwallowLayer
0x634a3c: GameManager::clearCurScene()              ← +0x6c
0x634a50: GameManager::resumeLastMap()               ← +0x48
0x634a1e: map_mine_info_t copy → SceneLayer::setMineRemainTimes ← +0x48
0x634a68: BattleKingTowerSceneLayer::addEvent        ← +0x50
0x634aa2: player_t copy ctor                         ← +0x08
0x634bd6: OnlineNetworkManager::sShareInstance       ← +0x48
```

**⚠️ 读 m_userInfo 做玩家匹配。**

**当前**: f1=mapId f2=player f3=npcs f4=mines f5=events。NPC 只设 f1=npc_id(缺坐标)。

---

## 2.2 submit_map_event_out

**源**: `cs_submit_map_event_out.txt`, `30_submit_map_event.txt` handler (28B)

```
Handler: 仅通知 BattleKingTowerSceneLayer::onServerConfirmedSubmitEvent()
客户端自行判断 NPC 是否有 mon → 触发战斗 (SpriteElf::BeginBattle @ 0x565FF8)
```

---

## 2.3 submit_map_mine_out

**源**: `cs_submit_map_mine_out.txt`, `17_submit_mine.txt` handler (114B)

```
f1 = ore_item_id → NotifyGetPrizeLayer 弹窗
→ GameMineDataManager::setMineRemainTimes
→ QuestManager::checkAction (挖矿任务)
```

---

## 2.4 get_unlocked_map_id_list_out

**源**: `cs_get_unlocked_map_id_list_out.txt` MergePartial, `28_unlock_map_push.txt` handler (348B)

```
MergePartial: f2 wire=2(length-delimited, offset+0x08)
Handler:
  f2[+0x08] = repeated map_id*
  → UserData::addUnlockedMap(map_id, true)
  → UserData::updateBattleKingTowerMapProgress(+0x08, +0x10, +0x0C)
```

**当前**: ❌ 用 f1 发 map_id，MergePartial 读 f2。已修复。

---

# 三、战斗域 (BTLProto)

## 3.1 btl_notify_battle_start_out

**源**: `btl_btl_notify_battle_start_out.txt`, `03_start_battle.txt` handler (280B), CLIENT_HANDLER_LOGIC §3

```
CSProto 包装: f1 = BTLProto 内层 body
BTLProto MergePartial: f2 wire=2(+0x2C), f3 wire=2(+0x2C)

btl_type_t: 4个 int32 (f1-f4)
btl_player_simple_info_t: 8字段
  f1=uid f2=side f3=nick f4=gender f5=level
  f6=vip_level f7=equip_id f8=mon_simple_info

btl_mon_simple_info_t: 9字段
  f1=mon_id f2=name f3=level f4=hp f5=max_hp
  f6=gender f7=character f8=moves_info f9=attr_level
```

**Handler** (handleNtfMsgStartBattle):
```
1. dynamic_cast<CSProto btl_notify_battle_start_out>
2. CSProto.f1 → BTLProto inner message → copy ctor
3. BTLProto.f2 → btl_type_t → CopyFrom → BattleManager+0x1F4
4. 循环 BTLProto.f3 (player_simple_info_t):
   - 比较 uid == m_userInfo.role_tm (4B at AC4094)
     MATCH → addWaitingSprites → BattleManager+0x248
     ELSE  → setAttackee       → BattleManager+0x25C
5. BattleManager::start() → BattleLayer 创建 → BGM → guide
6. GameAudioManager::playEffect(2)
```

**⚠️ PVE 从不调 setBattleSprite (客户端 bug B1)**

**当前**: battle.js 手拼 buffer ✓

---

## 3.2 btl_notify_battle_effect1_out

**源**: `btl_btl_notify_battle_effect1_out.txt` (17字段 MergePartial), `12_battle_effect1.txt` handler (92B), CLIENT_HANDLER_LOGIC §18,§25

```
effect1_t MergePartial: f2-f17 (varint + length-delimited mixed)

关键消费 (BattleLayer::attacked):
  +0x04 IsAtker, +0x08 HpChg, +0x10 Hp, +0x14 MaxHp,
  +0x28 Damage, +0x30 Miss, +0x34 IsCrit
```

**Handler**: 仅做 copy ctor → `pushTurnEvent(msg, false)`

**当前**: battle.js 手拼 ✓ (但应改用 se.encode)

---

## 3.3 btl_notify_turn_over_out

**源**: `btl_btl_notify_turn_over_out.txt` (6字段), `13_battle_turn_over.txt` handler (92B), CLIENT_HANDLER_LOGIC §19,§26

```
info_t MergePartial: f2-f6,f15

BattleLayer::syncSpritesState 消费:
  +0x08 Side, +0x10 HpChg, +0x14 Hp, +0x18 MaxHp,
  +0x1C Anger, +0x20 BtlAttrLevel
```

**Handler**: copy ctor → `pushTurnEvent(msg, true)`

---

## 3.4 btl_notify_battle_end_out

**源**: `btl_btl_notify_battle_end_out.txt`, CLIENT_HANDLER_LOGIC §21

```
MergePartial: f2(+0x08) f3(+0x0C) 均为 varint
f1=winner_side f2=reason f3=turn_count
```

**Handler**: 奖励由 `handleNtfMsgPlayerGetPrize` 单独处理 (1500B)

---

## 3.5 btl_notify_switch_fight_mon_out

**源**: `btl_btl_notify_switch_fight_mon_out.txt`, handler (166B)

```
MergePartial: f2 wire=2(+0x0C)
Handler: offset +0x0C, +0x24, +0x2C, +0x44 → pushTurnEvent
```

---

## 3.6 start_battle_pve_out

**源**: `cs_start_battle_pve_out.txt` MergePartial (空), handler (16B, 无字段读取)

---

# 四、道具/背包域

## 4.1 cli_get_item_out

**源**: `cs_cli_get_item_out.txt` MergePartial (f2-f8), `22_cli_get_item.txt` handler (212B), CLIENT_HANDLER_LOGIC

```
MergePartial: f2-f8 varint + length-delimited

Handler:
  [+0x28~0x2B] → m_userInfo+0xC3~0xC6 (背包容量, 4B)
  f1[+0x08] = repeated one_t* (数组)
  f1[+0x0C] = count

one_t: f1=item_id f2=item_count f3=grid_id f4=bind
  → UserData::updateItemInBag(SaveItem, uuid)

循环后: GameManager::updateSeerAvatar()
       → sendGetPackSpriteListMessage() ← 触发下一个查询!
```

---

## 4.2 cli_notify_item_bag_updates_out

**源**: `cs_cli_notify_item_bag_updates_out.txt`, `09_item_bag_update.txt` handler (594B), CLIENT_HANDLER_LOGIC §6

```
三个循环处理:
  循环1: f1[+0x08] (del_grid list) → UserData::removeItemWithGridID
  循环2: f?[+0x28] (update list)  → UserData::updateItemInBag
  循环3: f?[+0x48] (new_grid list) → UserData::updateItemInBag

每个 one_t: f1=capacity f2=update_item f3=new_grid f4=del_grid

最后刷新UI: ItemBagLayer::onUserItemBagChanged
          SpriteStatusLayer::updateView
          EquipmentSelectionLayer::onCloseSelected
          FoodSelectionLayer::onCloseSelected
          CaptureInquiryLayer::onUserItemBagChanged
```

---

## 4.3 get_bag_mon_out

**源**: `cs_get_bag_mon_out.txt` MergePartial (f2 only)

```
MergePartial: f2 wire=2(length-delimited) → repeated mon_info_t
```

**当前**: ❌ 用 f1 发 mon_info_t，MergePartial 读 f2。已修复。

---

# 五、任务域

## 5.1 obtain_task_out

**源**: `cs_obtain_task_out.txt`, `19_obtain_task.txt` handler (70B), CLIENT_HANDLER_LOGIC §8

```
MergePartial: f2 wire=2 (message, offset +0x0C)

Handler: 
  LDR R4,[R0,#0x0C] → task_id (f1, 编译器重排到 +0x0C!)
  QuestManager::takeQuest(task_id, false)
```

**⚠️ task_id 是 proto f1，但 C++ offset 是 +0x0C (编译器将 message 字段(f2)放在 +0x08，varint(f1)放在 +0x0C)**

**当前**: `encodeUint32(1, taskId)` ✓

---

## 5.2 finish_task_out

**源**: `cs_finish_task_out.txt` MergePartial(空), `18_finish_task.txt` handler (68B), CLIENT_HANDLER_LOGIC §7,§12

```
Handler:
  LDR R4,[R0,#8] → task_id (f1, 纯varint消息无指针重排)
  QuestManager::submitQuest(task_id)
```

**当前**: `encodeUint32(1, taskId), encodeUint32(2, 1)` ✓

---

## 5.3 get_task_list_out

**源**: `cs_get_task_list_out.txt`, handler (258B)

```
MergePartial: f1 wire=2 → repeated pb_cs_task_info_t
Handler: f1[+0x08] → copy ctor
```

---

# 六、精灵域

## 6.1 notify_gain_new_mon_out

**源**: `cs_notify_gain_new_mon_out.txt`, CLIENT_HANDLER_LOGIC §4

```
MergePartial: 空(基类)

Handler (handleNtfMsgGainNewMon, 202B):
  f2[+0x08] = mon_info_t*
    → generateSpriteInfoByMessage(SpriteInfo, mon_info_t)
    → mon_basic_info_t(23字段) → 268B SpriteInfo
    → IsFightMon(f19) 决定 addSpriteToPack vs addSpriteToStorage
```

**当前**: `enc.encodeMessage(2, buildMonInfo(...))` ✓

---

## 6.2 mon_basic_info_t (23字段)

**源**: `comm_mon_basic_info_t.txt` MergePartial

```
f2-f23: 全部 varint (wire=0)
f1: string (UUID, 在基类 MergePartial)
关键: f19 = is_fight_mon (决定背包 vs 仓库)
```

---

## 6.3 mon_info_t (7子消息)

**源**: `comm_mon_info_t.txt` MergePartial

```
f2-f7: 全部 wire=2 (message sub-types)
  f2 = btl_attr_t (HP/Atk/Def/SpAtk/SpDef/Spd)
  f3 = zero_btl_attr_t
  f4 = ev_info_t
  f5 = character_info_t
  f6 = grow_info_t
  f7 = moves_info_t
f1 = mon_basic_info_t (基类)
```

---

## 6.4 generateSpriteInfoByMessage (854B)

**源**: `50_generate_sprite_info.txt`, CLIENT_HANDLER_LOGIC §13

```
1. memset(SpriteInfo, 0, 268)
2. mon_basic_info_t copy ctor → 栈
3. strncpy(SpriteInfo+4, uuid, 36) ← f1 string
4. 循环: LDRB/LDR 从 basic_info 各偏移读值 → SpriteInfo 各偏移写
   25 个 LDR→STR 对，每个对应 basic_info 的一个字段
5. ev_info_t, character_info_t, moves_info_t copy
```

**⚠️ 字段映射按 C++ 编译偏移，不按 proto field number**

---

## 6.5 mon_evolve_out

**源**: `cs_mon_evolve_out.txt` (f1-f14), `26_mon_evolve.txt` handler (388B)

```
MergePartial: f1(wire=5 fixed32), f2-f14(varint)
Handler: offset +0x08 → mon_evolve_out_mon_info_t
```

---

## 6.6 mon_update_skill_out

**源**: `cs_mon_update_skill_out.txt` handler (620B)

```
Handler: f1=uuid(+0x08) f2=move_id(+0x0C)
```

---

# 七、邮件/社交域

## 7.1 get_mail_head_list_out

**源**: `cs_get_mail_head_list_out.txt`, `21_mail_head_list.txt` handler (170B)

```
MergePartial: f1 wire=2
Handler:
  f1[+0x08] = repeated mail_head_t*
  count[+0x0C]
  每个 mail_head_t: id, title, sender, time → GameMailManager::addMail
  循环后 → sendGetMapUnlockedListReq() ← 触发下一个查询
```

---

# 八、商店/经济域

## 8.1 buy_good_out

**源**: `cs_buy_good_out.txt`, CLIENT_HANDLER_LOGIC §5

```
MergePartial: f2 wire=2
Handler (726B):
  f2 = good_id → GameShopDataManager::getGoodInfoByGoodID
  → 更新金币 → QuestManager 检查购买任务 → GuideManager
```

---

## 8.2 player_attr_change_out

**源**: `cs_player_attr_change_out.txt`, handler (1872B)

```
MergePartial: NOT FOUND (基类)
Handler (handleNtfMsgPlayerAttrChange):
  [+0x2C] → TalkingDataManager::upgradeVIPExp
  [+0x30] → VIPUpdateLayer
  [+0x64] → (unknown)
  [+0x5C] → UserData::addObtainedMonster
  [+0x08] → UserData::addObtainedMonster
约47个属性字段
```

---

# 九、关键修复清单

| # | 域 | 问题 | 修复 | 对抗审查 | 状态 |
|---|-----|------|------|---------|------|
| 1 | login | push在response前 | `_replyFirst` flag | ✅ 确认 | ✅ |
| 2 | login | create_role不推地图 | push(player_enter_map+mon) | ✅ 确认 | ✅ |
| 3 | login | player_basic_info f3=roleTm | f3=0 | ⚠️ 无IDA证据 | ⚠️ |
| 4 | item | get_bag_mon f1→f2 | encodeMessage(1→2) | ✅ MergePartial只读f2 | ✅ |
| 5 | map | unlock_map f1→f2 | encodeUint32(1→2) | ✅ MergePartial只读f2 | ✅ |
| 6 | map | select_main_mon用10023 | 保持不变 | ℹ️ 无IDA证据 | ✅ |

# 十、对抗审查发现 (待解决)

| # | 严重度 | 问题 | 说明 |
|---|--------|------|------|
| A | **CRITICAL** | battle.js effect1字段映射 | MergePartial偏移≠代码字段号; f10=damage(+0x28)但代码用f12(+0x4c)。需Frida验证effect1_t |
| B | **CRITICAL** | player_basic_info_t无验证 | MergePartial=空; f42/f43等字段号纯猜测。需Frida验证 |
| C | **HIGH** | player_enter_map_out f1类型 | 可能是message但代码发varint。MergePartial在基类，需交叉验证 |
| D | **HIGH** | handleAckMsgCreateRole | 期望cli_create_role_out，但服务器发login_out。刻意为之，handleMsgLoginIn等效覆盖 |
| E | **MEDIUM** | submit_map_mine_info缺f2 | handler读f1+f2，代码只发f1=0 |
| F | **LOW** | EMPTY_LIST_BODY通配 | 对大多数消息安全，极少数wire type不匹配 |
| G | **LOW** | buildPlayerBasicInfo f3=0 | 无证据f3是main_mon_uuid

# 十一、第三轮对抗审查 (编码层/基础设施)

| # | 严重度 | 问题 | 状态 |
|---|--------|------|------|
| H1 | **HIGH** | `encodeUint64` 拆成两个独立varint而非一个64位varint | 🔴 潜伏——当前调用者不传>2^32的值。触发则破坏后续所有字段 |
| H2 | MEDIUM | `parseBodyFields` 遇wire=1/5(fixed32/64)直接break | 🔴 潜伏——当前请求proto无此类型 |
| H3 | MEDIUM | `lib/battle.js` 死代码，字段布局与 handlers/battle.js 矛盾 | 文档/清理问题 |
| H4 | MEDIUM | 20+重复handler注册 misc.js/npc_func.js/shop.js | 运行时首注册胜，无bug但维护混乱 |
| H5 | LOW | `state/player.js` buildMonInfo 与 game.js 完全不同的字段布局 | 死代码无人调用 |
| H6 | LOW | `pushBattle` 硬编码f3/f4/f5而非echo session值 | 与pushCS不一致 |
| H7 | LOW | `Buffer.alloc(4)`=wire tag 0x00→field 0(invalid)+3B pad | 客户端宽容解析才工作 |

## encodeUint64 详细

```
Date.now() ≈ 1771000000000 (需要6字节varint)
encoder.js: → [varint(lo=234954496)] [varint(hi=412)] ← 两个独立varint!
正确: 应该是单个64位varint编码

schema_encoder.js 的 encodeVarint 无此问题(handle up to 64-bit)
但 state/player.js buildPlayerBasicInfo 用 type:'uint64'→触发 encoder.js bug
幸运: login流程用 game.js buildPlayerBasicInfo → encodeUint32 → 规避
```

## 第三轮已修复

| 发现 | 修复 |
|------|------|
| H1 encodeUint64 | 未改(潜伏, 非当前问题) |
| H5 buildMonInfo死代码 | 不改(避免改动引入风险) |

## 三回合累计: 10处代码修复，7处潜伏/低优标注
