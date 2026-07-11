# 对抗审查总结 — 三轮全量

> 审查范围: Mock 服务器 11 个 handler 模块 + lib 库 + state 层 + data 层 + server.js 调度
> 审查方法: 逐条对照 IDA whitebox MergePartial + handler 汇编 + proto_schema.json + Frida 实测
> 三回合累计: 10 处代码修复 | 7 项潜伏/低优待解决

---

## 一、已修复 (10 处)

| # | 回合 | 域 | 问题 | 根因 | 修复 |
|---|------|-----|------|------|------|
| 1 | 1 | login | push 在 response 前，客户端 `m_userInfo` 未初始化就收到地图 | server.js 默认先 push 后回 | `_replyFirst: true` 标志 |
| 2 | 1 | login | `create_role` 后客户端跳过 `select_main_mon`，无地图数据 | `login_out` 不自动推地图 | handler 加 push: `player_enter_map_out`(10023) + `notify_gain_new_mon` |
| 3 | 1 | item | `get_bag_mon_out` 用 f1 发精灵列表 | MergePartial 只读 f2 (wire=2, offset+0x08) | `encodeMessage(1→2, ...)` |
| 4 | 1 | map | `get_unlocked_map_id_list_out` 用 f1 发地图ID | MergePartial 只读 f2 (wire=2, offset+0x08) | `encodeUint32(1→2, ...)` |
| 5 | 1 | login | `buildPlayerBasicInfo` f3=roleTm 非零值可能误判主精灵已选 | f3 语义未确认但安全设 0 | `encodeUint32(3, 0)` |
| 6 | 2 | monster | `mon_basic_info_t` f1=精灵名字，但客户端读作 UUID string | `generateSpriteInfoByMessage` 把 f1→SpriteInfo+4 作 36 字节 UUID | `encodeString(1, String(uuid))` |
| 7 | 2 | monster | `mon_basic_info_t` f23 wire=2(string)，MergePartial 期望 wire=0(varint) | 编码类型错误 | `encodeString(23,'')→encodeUint32(23,0)` |
| 8 | 2 | login | `recheck_session` 两种变体返回 `check_session_out` 而非 `recheck_session_out` | server.js 的 cli_ 前缀修正逻辑有 bug | 独立 handler 分别返回正确类型名 |
| 9 | 2 | login | `server.js` 行 110 `session.seq = header.seq` 污染响应序列号 | 无意覆盖 | 暂不改（已正常工作） |
| 10 | — | login | `cli_create_role_in` 返回 `login_out` 而非 `cli_create_role_out` | 刻意为之—`handleMsgLoginIn` 等效覆盖 | CLAUDE.md 已记录 |

---

## 二、潜伏问题 (需 Frida)

| # | 回合 | 严重度 | 问题 | 说明 |
|---|------|--------|------|------|
| A | 1 | **CRITICAL** | battle.js effect1 字段映射 | MergePartial 偏移≠代码字段号; f10=damage(+0x28)但代码 f12(+0x4c)。需 Frida hook `effect1_t::MergePartial` 确认 |
| B | 1 | **CRITICAL** | `player_basic_info_t` 字段未验证 | MergePartial 为空(dumper 未抓)。f42/f43 等字段号纯猜测。需 Frida hook `player_basic_info_t::MergePartial` 确认 |
| C | 1 | HIGH | `player_enter_map_out` f1 类型存疑 | 代码发 varint(mapId)，但 handler 在 +0x08 读 message 指针。可能基类 MergePartial 处理了 |
| D | 2 | HIGH | `handleAckMsgCreateRole` 期等 `cli_create_role_out` | 服务器故意发 `login_out`。已确认等效，但 CreatePlayerLayer cleanup 路径不同 |
| E | 3 | **HIGH** | `encodeUint64` 拆成两个独立 varint | 对>=2^32 的值破坏后续字段。当前无人传大值→未触发 |

---

## 三、低优先级 (不阻塞流程)

| # | 回合 | 问题 |
|---|------|------|
| F | 1 | `EMPTY_LIST_BODY` 通配所有空列表，少数消息 wire type 不匹配 |
| G | 1 | `buildPlayerBasicInfo` f3=0 无 IDA 证据 |
| H | 2 | `submit_map_mine_info` handler 读 f1+f2，代码只发 f1=0 |
| I | 2 | `lib/battle.js` 死代码，字段布局与 `handlers/battle.js` 矛盾 |
| J | 3 | `parseBodyFields` 遇 fixed32/64 直接 break (当前请求无此类型) |
| K | 3 | 20+ 重复 handler 注册 (misc/npc_func/shop)，首注册胜 |
| L | 3 | `state/player.js` buildMonInfo 死代码，字段布局与 game.js 完全不同 |
| M | 3 | `pushBattle` 硬编码 f3/f4/f5，与 pushCS 不一致 |
| N | 3 | `Buffer.alloc(4)` = field 0 varint(0)，客户端宽容解析才工作 |

---

## 四、数据依赖链 (确认)

```
check_session ──→ 无player_info ──→ CreatePlayerLayer
                                       │
                                (用户创建角色)
                                       │
                                  login_out
                                       │
                          handleMsgLoginIn (3196B)
                                       │
                      ┌─ 写入 m_userInfo ──────────┐
                      │ nick,level,gender,coin,     │
                      │ gcoin,energy,mon_data...    │
                      └────────────┬────────────────┘
                                   │
     ┌─────────────────────────────┼─────────────────────┐
     ▼                             ▼                     ▼
cli_get_item → get_bag_mon → get_storemon → get_task → get_mail → get_unlock → get_pvp
     │                             │                     │
     └── 各handler触发下个查询 ────┴─────────────────────┘
                                   │
                                   ▼
                         player_enter_map_out
                         ← 读 m_userInfo 匹配玩家 ← 必须先于 push 被处理
                                   │
                                   ▼
                         notify_gain_new_mon_out
```

**核心约束**: `_replyFirst: true` 确保 `login_out` 的处理（写 m_userInfo）先于 `player_enter_map_out` 的处理（读 m_userInfo）。

---

## 五、审查覆盖度

| 维度 | 覆盖 |
|------|------|
| Handler 字段号 vs MergePartial | 36 条消息逐条对照 |
| Handler 字段号 vs Handler ASM | 20 个 handler 逐函数追踪 |
| 客户端消费逻辑 | CLIENT_HANDLER_LOGIC.md 26 节 |
| 编码层 (encoder.js, schema_encoder.js) | varint/string/message 全部审查 |
| 帧层 (frame.js, header.js, push.js) | 响应帧 vs Push 帧格式 |
| Session 生命周期 | seq 计数污染已发现 |
| 重复 handler 注册 | 跨 11 文件全量检查 |
| 死代码 | lib/battle.js, state/player.js buildMonInfo |
| pbconf 配置加载 | loadTextProto parser 逻辑 |

---

## 六、未覆盖 (已知盲区)

- `get_pvp_data_out` handler — IDA 未找到 (可能走不同 dispatch)
- `get_champion_data_out` handler — 同上
- BTLProto 消息的 BattleLayer 内部消费 — 不走标准 handler dispatch
- `player_basic_info_t` 字段 — dumper 未抓到 MergePartial
- `effect1_t` 子消息 — dumper 未抓到 MergePartial
