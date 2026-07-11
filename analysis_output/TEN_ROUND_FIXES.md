# 十一轮对抗审查 — 全部修复清单

> 审查方法: IDA 白盒 MergePartial + Handler 汇编逐条对照 + 旧版代码对比 × 11 轮对抗
> 审查范围: 11 个 handler 模块 + lib 库 + state 层 + data 层 + server.js
> 总修复: 42 处

---

## 第一轮: 协议字段号 + 顺序

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 1 | server.js | push 在 response 前，m_userInfo 未初始化 | `_replyFirst: true` |
| 2 | login.js | create_role 不推地图数据 | push `player_enter_map_out`(10023) + `notify_gain_new_mon` |
| 3 | misc.js | `get_bag_mon_out` f1→f2 | MergePartial 只读 f2 |
| 4 | misc.js | `get_unlocked_map_id_list_out` f1→f2 | MergePartial 只读 f2 |
| 5 | game.js | `buildPlayerBasicInfo` f3=roleTm | f3=0 |
| 6 | game.js | `buildPlayerBasicInfo` f6/f8/f9/f10-14=999999 | 全部清0 |

## 第二轮: UUID + wire type + 响应类型名

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 7 | game.js | `mon_basic_info_t` f1=名字，客户端读作 UUID | `encodeString(1, String(uuid))` |
| 8 | game.js | `mon_basic_info_t` f23 wire=2→应为 wire=0 | `encodeString→encodeUint32(23,0)` |
| 9 | login.js | `recheck_session` 回错类型名 | 独立 handler 返回正确类型 |

## 第三轮: 编码层潜伏 bug

| # | 领域 | 问题 | 状态 |
|---|------|------|------|
| — | encoder.js | `encodeUint64` 拆成两个 varint | 潜伏(无人触发) |
| — | header.js | `parseBodyFields` 遇 fixed32/64 break | 潜伏 |
| — | 多文件 | `lib/battle.js` 死代码; 重复 handler; `Buffer.alloc(4)` 脆弱 | 文档标记 |

## 第四轮: 精灵进化 + 任务步骤 + 重复代码

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 10 | monster.js | `mon_evolve_out` f1 应 message 非 varint | `encodeMessage(1, buildMonInfo())` |
| 11 | quest.js | `set_task_step_out` f2 wire=2 非 varint | `encodeString(2,'')` |
| 12 | player.js | `player_ready` 重复注册 | 删除重复 |

## 第五轮: 游戏逻辑 — 道具/经济/战斗奖励

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 13 | item.js | `use_item` 删整堆而非减1 | count>1减，count=1删 |
| 14 | item.js | `sell_item` 无限印钞 | 读 body 找物品 |
| 15 | shop.js | `buy_good` 不检查余额 | 余额不足拒绝 |
| 16 | battle.js | 战斗胜利不推送奖励 | `pushBattle(gain_prize_out)` |
| 17 | item.js | 挖矿不推进任务步数 | `advanceTask(MINING)` |

## 第六轮: 纠正第四轮 + 进化推送 + 奖励格式

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 18 | monster.js | 第四轮错放 f1→应为 f2 | f1=resultCode, f2=message |
| 19 | monster.js | `notify_mon_info_chg` f1=bytes 非 uint32 | `encodeString(1, uuid)` |
| 20 | battle.js | `gain_prize_out` 应 f2=prize_t 非 f1+f4 | `encodeMessage(2, prize)` |
| 21 | monster.js | `mon_evolve` push/response 顺序 | `_replyFirst: true` |

## 第七轮: 根因 — pbconf enum 字符串不转数字

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 22 | game.js | pbconf enum 存为字符串→step_type=0 | `ENUM_MAP` + `resolveEnum()` |
| 23 | game.js | `advanceTask` 字符串!==数字永远不匹配 | `resolveEnum(s.step_type)` |
| 24 | game.js | `buildPbTaskInfo` step_type/task_type=0 | 全部 wrap `resolveEnum()` |
| 25 | shop.js | `buy_good` 背包推送缺 message 包装 | `encodeMessage(3, ...)` |

## 第八轮: 导入缺失 + link 过滤 + 时间一致性 + 空值保护

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 26 | monster.js | `encodeString` 未导入 → 运行时崩溃 | 加导入 |
| 27 | game.js | `advanceTask` link 非数组时过滤失效 | `Array.isArray` 规范化 |
| 28 | player.js | `createRole` roleTm 毫秒 vs 秒 | `Math.floor(Date.now()/1000)` |
| 29 | game.js | `ps.tasks` 空值遍历崩溃 | `(ps.tasks\|\|[])` |
| 30 | item.js | `ps.items.find` 空值崩溃 | `(ps.items\|\|[]).find` |

## 第九轮: quest 导入 + ENUM_MAP 缺失 + shop 成本 + 原子写入

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 31 | quest.js | `encodeString` 未导入 → set_task_step 崩溃 | 加导入 |
| 32 | game.js | 9 种 step_type 不在 ENUM_MAP→解析为 0 | 加 14 个缺失枚举 |
| 33 | shop.js | `good.cost` 是数组→读取 undefined→免费 | `Array.isArray` 取 [0] |
| 34 | player.js | save.json 非原子写入 | temp + rename |

## 第十轮: 旧版对比 + server status + buy_good_out 结果码

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 35 | shop.js | `buy_good_out` f2=goodId→应为 1 | f2→1 |
| 36 | game.js | server_info_t status=0(离线)→应为 1 | status→1 |
| 37 | server.js | HTTP server_list online_status=0 | →1 |
| 38 | — | Lua/CCBI 无服务端依赖 | 确认 |

---

## 按严重度分类

| 严重度 | 数量 | 代表问题 |
|--------|------|---------|
| CRITICAL | 6 | encodeString 导入缺失(×2)、enum 不转数字、link 过滤失效、cost 数组访问、advanceTask 不匹配 |
| HIGH | 10 | push 顺序、字段号错误、余额不检查、无限印钞、堆栈删除、奖励不推送、资源字段为0、step_type 覆盖不全 |
| MEDIUM | 16 | wire type 修正、响应类型名、roleTm 一致性、空值保护、原子写入、server status、重复代码 |
| LOW | 6 | EMPTY_LIST_BODY、硬编码值、死代码、编码潜伏 bug |

## 按文件分类

| 文件 | 修改次数 |
|------|---------|
| lib/game.js | 11 |
| handlers/battle.js | 4 |
| handlers/shop.js | 4 |
| handlers/item.js | 4 |
| handlers/monster.js | 4 |
| handlers/login.js | 3 |
| handlers/misc.js | 2 |
| handlers/quest.js | 2 |
| state/player.js | 2 |
| server.js | 2 |
| handlers/player.js | 1 |

## 已知盲区 (需 Frida 动态验证)

| 盲区 | 影响 |
|------|------|
| `effect1_t` 字段映射 | battle.js 手拼 buffer 的字段号可能不对 |
| `player_basic_info_t` 字段号 | MergePartial 为空，f42/f43 等纯猜测 |
| `player_enter_map_out` f1 类型 | 代码发 varint，handler 在 +0x08 读 pointer |

---

## 第十一轮: 旧版代码对比

| # | 文件 | 问题 | 修复 |
|---|------|------|------|
| 39 | battle.js | `turn_over` info_t Hp/HpChg f4/f5 交换、缺 f6=BtlAttrLevel | IDA 验证: f4=Hp, f5=HpChg, f6=BtlAttrLevel |
| 40 | login.js | create_role 忽略用户昵称性别 | parseBodyFields 读 f2(昵称) + f3(性别) |
| 41 | login.js | select_main_mon 推 10001→应为 10023 | 恢复旧版值 |
| 42 | login.js | cli_login_in 无 handler | 新增 handler |

## 更新统计

| 严重度 | 数量 |
|--------|------|
| CRITICAL | 7 |
| HIGH | 11 |
| MEDIUM | 18 |
| LOW | 6 |

| 文件 | 修改次数 |
|------|---------|
| handlers/login.js | 6 |
| lib/game.js | 11 |
| handlers/battle.js | 5 |
| handlers/shop.js | 4 |
| handlers/item.js | 4 |
| handlers/monster.js | 4 |
| handlers/misc.js | 2 |
| handlers/quest.js | 2 |
| state/player.js | 2 |
| server.js | 2 |
| handlers/player.js | 1 |
