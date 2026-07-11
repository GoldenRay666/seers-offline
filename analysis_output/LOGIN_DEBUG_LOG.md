# 登录调试记录 — 2026-07-11

## 现象

创建角色后闪退/灰屏卡住。

## 服务器收到的消息序列

```
cli_check_session_in → cli_check_session_out (24B)
cli_lookup_random_nick_in → cli_lookup_random_nick_out (56B)
cli_create_role_in → login_out (74B)
cli_get_item_in → out (18B)           ← 客户端跳过了 select_main_mon
get_bag_mon_in → out (185B)
get_storemon_index_in → out (4B)
get_task_list_in → out (4B)
get_mail_head_list_in → out (54B)
get_unlocked_map_id_list_in → out (252B)
get_pvp_data_in → out (6B)
→ 客户端断开/卡住
```

## 关键发现

1. **客户端跳过 select_main_mon_in**：create_role → login_out 后直接进入游戏世界发查询
2. **player_basic_info_t schema 为空**：proto_schema.json 里 `player_basic_info_t.fields=[]`，
   dumper 没抓到 MergePartial 字段（可能是不同 codegen）
3. **两个 buildPlayerBasicInfo 不一致**：
   - `lib/game.js:117` → fields 1-14, 42, 43
   - `state/player.js:127` → fields 1-11, 30, 31, 90, 91
4. **IDA handler 显示 login_out 有 4 个字段**：
   - f1: player_basic_info_t (+0x08)
   - f2: functional_switch_info_t (+0x0C)
   - f3: cur_time int32 (+0x10)
   - f4: talent int32 (+0x20... 实际上是 +0x34)
5. **延迟 push player_enter_map_out 导致灰屏**：map 10023 = "我的小屋"（空房间），无 NPC

## 已验证

- GuideLayer BX LR patches 不存在（原始函数序言完整）
- .so URL patches 正确（127.0.0.1:8000）
- map.pbconf 有 70 个地图，10023 = 我的小屋（MAP_TYPE_HOME）
- player_basic_info_t MergePartial → IS_NULL（dumper 确认空）

## 待解决

1. player_basic_info_t 的真实字段布局（Frida 动态观察）
2. 客户端为什么跳过 select_main_mon
3. 登录后应该自动进入哪个地图（不是 10023）
