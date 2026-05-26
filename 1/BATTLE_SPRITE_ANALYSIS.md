# Battle Sprite Positioning Analysis (2026-05-26)

## Current State
- Battle enters and auto-wins with correctly-wrapped proto
- Left side (player/attacker): NO sprite
- Right side (enemy/defender): 迪兰 (default fallback sprite)

## Handler Chain (IDA Confirmed)

### `handleNtfMsgStartBattle` @ 0x62d9dc
Processes `ISeer20CSProto.btl_notify_battle_start_out` push notification.

```
1. removeEventSwallowLayer()
2. dynamic_cast → ISeer20CSProto::btl_notify_battle_start_out
3. Get field 1 (wrapped ISeer20BTLProto::btl_notify_battle_start_out)
4. Copy btl_type_t → BattleManager+0x1F4
5. Call BattleManager->vtable+0x20(BTL.field1)  // some setup
6. Loop through repeated btl_player_simple_info_t:
   - Compare player_info.field1 (uid) with UserData::m_userInfo
   - MATCH → addWaitingSprites(bm, player_info)  // player's own sprites
   - NO MATCH → setAttackee(bm, player_info)      // enemy sprites
7. BattleManager::start()  // always called
```

### Key Difference: Player vs Enemy path
- **Player side** (UID matches m_userInfo): `addWaitingSprites` → `updateAppearAttackerList`
  - Populates `std::vector<uint32>` at BattleManager+0x248
  - NOT the same vector that `getAttacker()` reads from
- **Enemy side** (UID mismatch): `setAttackee(btl_player_simple_info_t)` → `updateAppearSpriteList`
  - Populates `std::vector<SpriteBattleSimpleInfo>` at BattleManager+0x25C
  - The enemy default sprite (迪兰) appears even with no mon data — game provides fallback

### `setBattleSprite` @ 0x4666bc — NEVER CALLED
- Works on `std::vector<SpriteBattleSimpleInfo>` at BattleManager+0x1E8 (84-byte elements)
- `getAttacker()` reads from this vector
- `handleNtfMsgStartBattle` does NOT call setBattleSprite
- Without it, `getAttacker()` returns null → `addElfComponent` returns early → NO player sprite

### `addElfComponent` @ 0x44d50c
```
side=0 (attacker): getAttacker() → if null → return
side=1 (defender): [BattleManager+0x164] → if null → return
If valid: EnginePlayerManager::addAnimSprite(monId, 0, 0, 0)
```

## Proto Structures (IDA Verified)

### `ISeer20CSProto::btl_notify_battle_start_out`
- Field 1 (LEN): embedded ISeer20BTLProto::btl_notify_battle_start_out
- All other fields → unknown (skip)

### `ISeer20BTLProto::btl_notify_battle_start_out`
- Bitmask: 0x3 (fields 1+2 required)
- Field 1 (VARINT): int32 at +0x2C (weather/map_id)
- Field 2 (LEN): btl_type_t at +0x8
- Field 3 (LEN): repeated btl_player_simple_info_t at +0xC (optional)

### `btl_player_simple_info_t`
- Bitmask: 0x7F (fields 1-7 required)
- Field 1 (VARINT): uint32 uid at +0x8
- Field 2 (VARINT): int32 at +0xC
- Field 3 (LEN): string nick at +0x10
- Field 4 (VARINT): uint32 at +0x14
- Field 5 (VARINT): uint32 at +0x18
- Field 6 (VARINT): uint32 at +0x1C
- Field 7 (VARINT): uint32 at +0x20
- Field 8 (LEN): repeated btl_mon_simple_info_t at +0x24

### `btl_mon_simple_info_t`
- Bitmask: 0x1FF (fields 1-9 required)
- Field 1 (VARINT): uint32 mon_id at +0xC
- Field 2 (LEN): STRING mon_name at +0x8
- Field 3 (VARINT): uint32 level at +0x10
- Field 4 (VARINT): uint32 at +0x14
- Field 5 (VARINT): INT32 at +0x18
- Field 6 (VARINT): INT32 at +0x1C
- Field 7 (VARINT): uint32 at +0x20
- Field 8 (VARINT): uint32 at +0x48
- Field 9 (LEN): mon_btl_attr_level_t sub-message at +0x24

### `mon_btl_attr_level_t`
- Bitmask: 0x3F (6 INT32 fields all required)
- f1: hp, f2: atk, f3: def, f4: spd, f5, f6

### `btl_type_t`
- Field 1 (VARINT): uint32 (1=wild, 2=pvp, etc.)

### `ISeer20CSProto::start_battle_pve_out`
- CS proto: ALL fields unknown (no required fields)
- BTL proto: Field 1 (LEN) = btl_type_t

## `m_userInfo` = player_basic_info_t Field 3
- Set during login/role creation
- player_basic_info_t field 3 = roleTm (creation timestamp)
- Used as UID for player identification in battle

## Root Cause of Sprite Issue

The player sprite doesn't appear because:
1. `addWaitingSprites` populates uint32 ID list at +0x248 → NOT read by getAttacker
2. `getAttacker()` reads from 84-byte struct list at +0x1E8 → populated by `setBattleSprite`
3. `setBattleSprite` is NEVER called in the notification handler
4. Without `setBattleSprite`, getAttacker returns null, addElfComponent exits early

## Potential Fix: Frida Hook
Hook `BattleManager::start()` and call `setBattleSprite(0)` after start.
This would activate the first waiting sprite into the appear list.

## Key IDA Offsets
- handleNtfMsgStartBattle: 0x62d9dc
- BattleManager::start: 0x465c54
- addWaitingSprites: 0x466550
- setBattleSprite: 0x4666bc
- setAttackee(btl_player_simple_info_t): 0x466a3a
- updateAppearAttackerList: 0x466522
- updateAppearSpriteList: 0x466940
- getAttacker: 0x4463bc
- addElfComponent: 0x44d50c
- EnginePlayerManager::addAnimSprite(int,int,int,int): 0x558afc
- m_userInfo_ptr: 0xab3028
