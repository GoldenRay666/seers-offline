# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 项目身份

赛尔号战神联盟（com.taomee.seers）离线化改造 — Cocos2d-x 2.0.2 + Lua 5.1 Android 手游，逆向工程 + mock 服务器方案。

GitHub: https://github.com/GoldenRay666/seers-offline

## 必读文件（每次会话先读）

| 优先级 | 文件 | 内容 |
|--------|------|------|
| 1 | `RecoveredProject/Architecture.md` | 完整架构文档（逆向产出） |
| 2 | `RecoveredProject/RecoveryLog.md` | 各阶段恢复进度 |
| 3 | `RecoveredProject/MockServer/SessionArchitecture.md` | Mock 服务端会话生命周期 |
| 4 | `RecoveredProject/DirectoryReference.md` | RecoveredProject 目录地图（逆向产出总览） |
| 5 | `C:\Users\23287\.claude\projects\D--Dev-javatools\memory\` | 跨会话记忆 |
| 6 | `C:\Users\23287\.claude\projects\D--Dev-javatools\memory\MEMORY.md` | 记忆索引 |

## 核心架构（三层）

```
┌─ Java 层 (smali) ──────────────────────────────────┐
│  TaomeeLogin.smali → 本地凭证注入，跳过远程登录      │
│  seer2.smali       → 去分析 SDK + Frida Gadget 加载  │
│  AsyncHttpRequest  → Java HTTP 全部 fake 200          │
│  Util.smali        → 网络请求短路 return "{}"         │
└──────────────────────────────────────────────────────┘
                          ↓ JNI
┌─ Native 层 (lib/armeabi/libgame_logic.so, ARM) ─────┐
│  网络: NetWorkUtil (HTTP JSON + TCP Protobuf)        │
│  登录: LoginManager → TmLoginManager                  │
│  UI:   GuideLayer, AccountLoginLayer, 100+ CCBI      │
│  游戏: GameManager, BattleManager, QuestManager       │
│  协议: 374 protobuf messages, 50+ CMD handlers       │
│  补丁: URL 重定向 + login_ip wrapper + guide bypass   │
└──────────────────────────────────────────────────────┘
                          ↓ TCP (4 字节 BE 长度前缀 + proto)
┌─ Mock 服务器（双层架构）────────────────────────────┐
│  旧层 (1/lib/*.js): encoding/game/battle/handlers    │
│    → 经实战验证的 wire-format 编码逻辑                │
│  新层 (RecoveredProject/MockServer/handlers/):       │
│    → 11 个模块，按功能域划分（login/battle/map/...）  │
│    → Registry 模式自动加载，带 confidence 标注        │
│  server.js (124 行): 薄封装，合并新旧两层             │
│  HTTP :8000 — 服务器列表 + 账户认证                   │
│  TCP  :8002 — 62 个命令处理                          │
│  存档: save.json（写在 mock_server.js 的 CWD）        │
└──────────────────────────────────────────────────────┘
```

**协议帧**: `[4 字节 BE body 长度] [cs_msg_head_t proto] [命令 body proto]`
**关键规则**: body 必须 ≥ 4 字节（0 或 2 字节 → `invalid message body length: -2` → 客户端断连）

## 常用命令

### 构建与部署
```bash
# 一键构建（打包 + 签名 + 安装）
D:\Dev\javatools\1\build_offline.bat

# 或分步（工具在 tools/ 目录，非 C:\javatools\）：
java -jar tools/apktool.jar b 1 -o 1_offline.apk

# ★ 签名（Android 13+ 真机必须用 apksigner v2，jarsigner v1 装不上）：
# keystore alias=debug, 密码 android/android
C:/Users/23287/AppData/Local/Android/Sdk/build-tools/34.0.0/apksigner.bat sign \
  --ks tools/debug.keystore --ks-key-alias debug \
  --ks-pass pass:android --key-pass pass:android 1_offline.apk

# 装真机（hook 平台）：
adb -s MNMZGERSNJJFIF9X install -r 1_offline.apk

# 装 MuMu（模拟器，不可 hook）：
adb -s 127.0.0.1:7555 install -r 1_offline.apk

# 真机 gadget hook 版本注意：seer2.smali line~246 取消注释 loadLibrary("frida-gadget") 再构建
```

### Mock 服务器

**新版（推荐）**：
```bash
# 必须在 1/ 目录下运行（assets/PbConfig/*.pbconf 相对路径依赖）
cd D:\Dev\javatools\1 && node D:\Dev\javatools\RecoveredProject\MockServer\server.js

# 旧版（单文件，93 行，仅作参考）：
cd D:\Dev\javatools\1 && node mock_server.js

# 验证语法
node --check D:\Dev\javatools\RecoveredProject\MockServer\server.js

# 停止服务器
taskkill /F /IM node.exe

# save.json 写在 CWD：D:\Dev\javatools\save.json（不是 1/ 下）。删存档要删这个。
```

### ADB 端口转发（设备重连后必须重设）
```bash
adb -s 127.0.0.1:7555 reverse tcp:8000 tcp:8000
adb -s 127.0.0.1:7555 reverse tcp:8002 tcp:8002
```

### 启动游戏
```bash
adb -s 127.0.0.1:7555 shell am start -n com.taomee.seers/com.taomee.seer2.seer2
```

### 查看日志
```bash
adb -s 127.0.0.1:7555 logcat -v time -d | grep -E "cocos2d-x debug|signal" | tail -30
```

### Frida
```bash
# ★ hook 可用性分环境（2026-07-11 实测更正）：
#   - 真机 arm64 (MNMZGERSNJJFIF9X) + gadget 内嵌：hook 完全可用，.so 未 strip 有全符号。
#   - MuMu x86 (Houdini)：仅能读内存/查符号，hook 不可用（.so 只 r--p，attach 假成功不 fire）。
# 本地 frida CLI：C:/Users/23287/AppData/Local/Programs/Python/Python313/Scripts/frida.exe (17.9.10)

# ★ 真机 gadget hook（推荐做动态分析）：
#   前提：seer2.smali line~246 取消注释 loadLibrary("frida-gadget")，重建装机（见下方构建）。
adb -s MNMZGERSNJJFIF9X forward tcp:27042 tcp:27042
adb -s MNMZGERSNJJFIF9X shell am start -n com.taomee.seers/com.taomee.seer2.seer2   # gadget listen 27042
frida.exe -H 127.0.0.1:27042 -n Gadget -l 1/frida_realdevice_hook.js
#   脚本里用 m.enumerateSymbols() 按 mangled 名字拿地址（别用 x86 patch 偏移，对不上）。

# MuMu 只读内存/查符号（hook 无效）：
adb -s 127.0.0.1:7555 shell "su -c '/data/local/tmp/fs -D &'"
MSYS_NO_PATHCONV=1 frida.exe -H 127.0.0.1:27042 -n com.taomee.seers
```

### IDA 反编译（命令行）
```bash
"D:/BaiduNetdiskDownload/IDA_Pro_v8.3_Portable123/idat.exe" -A -S"script.py" "D:\Dev\javatools\1\lib\armeabi\libgame_logic.so"
```

### Git Bash 注意事项
- `adb shell` 路径被 MSYS 转译 → 加 `MSYS_NO_PATHCONV=1` 前缀
- `adb forward` 也需要 `MSYS_NO_PATHCONV=1`（否则端口号被转译）
- 用 `md5sum` 验证 patch 写入，不要用 `dd` 边界读取

## 关键路径

| 用途 | 路径 |
|------|------|
| APK 源码 (smali) | `1/` |
| smali 修改 | `1/smali/com/taomee/` |
| 原生库 | `1/lib/armeabi/libgame_logic.so` |
| 旧层 mock 库（编码/游戏逻辑） | `1/lib/*.js` |
| 新层 mock 处理器 | `RecoveredProject/MockServer/handlers/` |
| Mock 服务器入口 | `RecoveredProject/MockServer/server.js` |
| Frida 脚本 | `1/frida_*.js` |
| 构建脚本 | `1/build_offline.bat` |
| 模拟器 | MuMu `127.0.0.1:7555`（x86_64 + Houdini 翻译 ARM） |
| ARM 真机 | `MNMZGERSNJJFIF9X` |
| **恢复的源码工程** | `RecoveredProject/` |
| 　Java (jadx) | `RecoveredProject/RecoveredJava/` |
| 　C++ 骨架 | `RecoveredProject/RecoveredCPP/` |
| 　Lua 源码 | `RecoveredProject/RecoveredLua/` |
| 　原始资源 | `RecoveredProject/RecoveredAssets/` |

## 离线分析工具链（RE pipeline，仓库根，git 未跟踪）

整个 `RecoveredProject/` 逆向产出（RecoveredCPP 1903 文件 / RecoveredAssets 1833 / reverse_engineering 16651 / proto_decoded 80）由仓库根一批 Python 脚本**分阶段**生成。这些脚本 **git 未跟踪（本地工具，不在 commit 里）** —— 改运行时逻辑走上面的循环，这里只在需要重建/扩展逆向产物时用。

### 当前在用
| 脚本 | 阶段 | 产出 |
|------|------|------|
| `recover_symbols.py` | 2 | `reverse_engineering/RecoveredSymbols.json`（符号 demangle + 分类） |
| `extract_rtti.py` | 3/5 | RTTI/vtable/类继承 → `EngineBoundary.md` + `ClassHierarchy.md` |
| `decode_protos.py` / `decode_pbconf.py` | — | `proto_decoded/*.json`（用 `assets/PbProtoFile/*.proto` 解 `.pbconf`） |
| `gen_proto_headers.py` | — | `RecoveredCPP/Classes/proto/` 的 C++ proto 头 |
| `parse_ccbi.py` | — | `ccbi_decoded/`（CocosBuilder CCBI → UI 布局） |
| `build_knowledge_graph.py` | — | **`RecoveredProject/knowledge_graph.db`（18MB，权威 RE 知识库）** |

### 知识库（三个 .db，只有一个当前）
- `RecoveredProject/knowledge_graph.db`（18MB，**当前**）—— 节点 Class/Function/Proto/Handler/…​ + 边 calls/owns/handles/…​，每条 fact 带 evidence + confidence + source_refs。查逆向结论优先查它。
- `knowledge_base.db`（180KB）—— `auto_team.py` v2.1「自主逆向团队」用（Planner→Context→Analyst(Claude)→Reviewer→人工 gate→Curator，DeepSeek 驱动），流程见 `AUTO_TEAM_WORKFLOW.md`。
- `knowledge.db`（0 字节，**已废弃**）—— 旧 `main.py`/`context_builder.py`/`commit.py` 循环，已被 auto_team 取代，勿再用。

### RecoveredProject 文档地图
`DirectoryReference.md` = 目录总览。分阶段报告：`inspection_report.md`(P1) / `resource_inventory.md`(P2) / `native_analysis.md`(P3) / `lua_recovery.md`(P4) / `cpp_recovery.md`(P6) / `Architecture.md`·`BuildGuide.md`·`KnownIssues.md`·`RecoveryCoverage.md`·`RecoveryLog.md`(P10)。MockServer 侧另有 `HandlerCoverage.md`·`ProtocolDatabase.json`·`SerializerSpecification.md`·`SessionArchitecture.md`。

## .so Patch 规范

1. **始终从干净基线派生**：当前 `1/lib/armeabi/libgame_logic.so`（改坏了从 `.bak_*` 恢复）
2. **不要在已 patch 文件上叠加** — 不可追溯
3. **URL 替换必须等长**：不够用 `/` 填充，多了删 `/`
4. **已确认会崩的函数**（Houdini 翻译 bug，需要 BX LR patch）：
   - `GuideLayer::hideMaskLayer @ 0x48d9f2`
   - `GuideLayer::showMaskLayer @ 0x48da0e`
   - `GuideLayer::hideDialogNode @ 0x48da2a`
   - `GuideLayer::showDialogNode @ 0x48da3a`
5. **不要 patch 的函数**：beginGuide 系列、构造/析构、ccTouch*、onAssignCCB*、create 工厂方法

### .so 版本追踪

**干净基线 = 当前 `1/lib/armeabi/libgame_logic.so`**（不再维护独立 prepatch 文件；派生 patch 从它出发，改坏了从下面的 .bak 恢复）。

| 文件 | 用途 |
|------|------|
| `libgame_logic.so` | **当前工作副本 / 干净基线** |
| `libgame_logic.so.bak_20260608` | 备份 |
| `libgame_logic.so.bak_eventswallow` | 备份 |
| `libgame_logic.so.before_revert_mining` | 备份（回退 mining patch 前） |

> 旧的 `prepatch_guide_v3` / `arm_working` / `arm_fixgray` / `arm_fixtouch` 已删除，勿再引用。

## Mock Server 架构（双层）

### 旧层 (`1/lib/*.js`) — 经实战验证
- `encoding.js` (109 行): proto wire-format 编码（varint, string, message 等）
- `handlers.js` (399 行): CMD 映射 + 通用请求解析/响应构建
- `game.js` (285 行): `buildCheckSessionResponse`, `buildServerListResponse`, `buildPlayerEnterMapOut`, `getMonStats` 等
- `battle.js` (137 行): 战斗初始化 + effect 编码
- `config.js` (225 行): 玩家状态持久化（save.json 读写）

### 新层 (`RecoveredProject/MockServer/`) — 模块化
- `server.js` (124 行): 薄封装 — 导入旧层，用新 handler 做 pre-filter
- `handlers/` — 11 个功能域模块，每个导出 `[{in, confidence, handler}]` 数组：
  - `login.js`: check_session, create_role, select_main_mon, server_list
  - `battle.js`: ntf_start_battle, effect1, turn_over, battle_end（IDA 验证字段）
  - `map.js`: player_enter_map, submit_map_event（NPC/矿石/事件）
  - `quest.js`: 任务系统（accept/complete/progress）
  - `item.js`: 道具获取/使用/出售
  - `monster.js`: 精灵相关（gain_new_mon, evolve 等）
  - `shop.js`, `social.js`, `npc_func.js`, `misc.js`, `player.js`
- `lib/registry.js`: 自动扫描 handlers/ 目录，按 msgType 注册 dispatch
- `lib/encoder.js`, `lib/schema_encoder.js`, `lib/fields.js`: 编码辅助
- `lib/push.js`, `lib/session.js`: push 消息 + 会话管理
- `state/player.js`: 新版玩家状态（独立于旧 config.js）
- `data/config.js`, `data/proto_schema.json`: 配置 + proto schema

### Confidence 级别
- `VERIFIED`: IDA 反编译确认字段映射
- `LIKELY`: 游戏行为推测
- `UNKNOWN`: 未验证，可能有问题

### 运行铁律
- **必须在 `D:\Dev\javatools\1\` 目录下运行**：`cd D:/Dev/javatools/1 && node ../RecoveredProject/MockServer/server.js`
- 否则 `./assets/PbConfig/*.pbconf` 路径全错 → 0 任务/0 NPC/0 地图
- **save.json 写在 CWD**：`D:\Dev\javatools\save.json`（不是 `1/` 下）。删存档要删这个。
- 改完后 `node --check` 验证 → kill 旧进程 → 重启

## Mock Server 维护准则

### 不要做 ❌
- 不要把通用空列表回复改成 2 字节（`[10 00]`）。空 repeated 必须保持 4 字节占位 `[0a 00 10 00]`
- 不要为修 `decode message buffer error` 牺牲已工作的功能（这种错误游戏会忽略）
- 不要给 `cli_check_session_in` 第一次回的时候带上 role_info（会让游戏跳过 create_role 路径）
- 不要自动 push 多余 init 消息，除非确认客户端期望它们

### 要做 ✅
- `cli_check_session_out` 的 `server_info_t` 用 3 字段（id/name/status），不是 8 字段
- `cli_create_role_in` 必须回 `login_out`，不是 `cli_create_role_out`
- `select_main_mon_in` 处理时**先 push** `player_enter_map_out`，**再回** `select_main_mon_out`
- 改完后 `node --check` 验证 → kill 旧进程 → 重启
- 旧版 .js 突然变小（< 800 行）= 被覆盖，从 `.latest` 或 `.bak2` 恢复

## 决策树速查

| 现象 | 诊断 | 动作 |
|------|------|------|
| 游戏崩溃 | 看 tombstone backtrace | GuideLayer 系函数 → 加到 patch 列表 |
| 游戏卡住不进 | 看 logcat 最后一条 cocos2d-x | 服务端没收 = UI hang；服务端收了 = 看回包格式 |
| 角色创建后断连 | 90% mock 回包格式问题 | 查最近改了什么 4-byte body |
| 一启动就崩 | .so 被 patch 坏了 | 回滚到 `prepatch_guide_v3` 重做 |
| mock 行为反常 | 多个 node 进程 | `tasklist \| grep node`，killall 后重启 |
| 接任务后灰屏 | guide 未清理状态 | 查 GuideLayer patch 是否被覆盖 |
| 所有消息 body < 4 字节 | `invalid message body length: -2` | 补齐到 ≥ 4 字节 |

## original.apk 改造 checklist

从原始 APK 出发需要的全部修改：

### smali 修改（4 个文件）
| 文件 | 改动 |
|------|------|
| `TaomeeLogin.smali` | `onAutoLogin` 重写，URL → 127.0.0.1 |
| `seer2.smali` | 注释 TalkingData/UploadCrashInfo/VManager；加载 frida-gadget |
| `AsyncHttpRequest.smali` | `makeRequest` → 直接调 `sendSuccessMessage(200, null, "")` |
| `Util.smali` | 网络请求直接 `return "{}"` |

### .so 补丁（5 处）
| # | 地址 | 函数 | 改动 |
|---|------|------|------|
| 1 | 0x9a2075 | URL 字符串 | `iseer2.login.61.com` → `127.0.0.1:8000`，`/` 填充 |
| 2 | 0x992da6 | URL 字符串 | `res.iseer20.61.com` → `127.0.0.1:8000` |
| 3 | 0x43bee4 | `login_ip` wrapper | `LDR R0; BX LR; .word 0x7f000001` |
| 4 | 0x56934e | `httpGetDataCallback` | `15 f1 b7 fe` → `d2 f6 c9 fd` |
| 5 | 0x5cb5e6 | `submit_map_mine_info_out::Merge` | `0a d0`(BEQ) → `00 bf`(NOP) |

## 新版 Mock 服务器测试流程

真机测试三步，按顺序执行完等用户操作：

```bash
# 1. 连接设备
ADB="C:/Users/23287/AppData/Local/Android/Sdk/platform-tools/adb.exe"
DEV="MNMZGERSNJJFIF9X"
"$ADB" -s "$DEV" devices | grep "$DEV"

# 2. 杀旧服务器 + 清端口 + 转发
powershell -Command "Get-Process -Name node -ErrorAction SilentlyContinue | Stop-Process -Force"
taskkill /F /IM node.exe 2>nul
# 确认老服务器已死
netstat -ano | findstr ":8000.*LISTENING" && echo "WARN: port 8000 still in use" || echo "OK: port 8000 clear"
sleep 1
"$ADB" -s "$DEV" reverse --remove-all 2>/dev/null
sleep 1
"$ADB" -s "$DEV" reverse tcp:8000 tcp:8000
"$ADB" -s "$DEV" reverse tcp:8002 tcp:8002

# 3. 启动服务器（300 秒超时）
cd D:/Dev/javatools/1
timeout 300 node D:/Dev/javatools/RecoveredProject/MockServer/server.js > mock.log 2>&1 &
sleep 4
```

**不要自动启动游戏。** 服务器就绪后告诉用户，等用户操作。

## 核心原则

### 1. 分析优先级（真机动态 hook 可用，MuMu 仅静态）

**动态 hook 可用性（2026-07-11 实测更正）**：
- ✅ **真机 arm64 (MNMZGERSNJJFIF9X) + gadget 内嵌**：hook 完全可用。.so 未 strip（50240 导出），模块可见（r-x 10838016 字节原生执行），`Interceptor.attach` 真触发。见 [真机 hook memory]。
- ❌ **MuMu x86 模拟器**：ARM .so 经 Houdini 翻译仅 r--p 映射，模块不可见，Interceptor 假成功不 fire。仅能读内存。

**动态 hook 适用场景**：直接按名字 hook 每个 proto 的 `*::MergePartialFromCodedStream` = **动态观察客户端怎么消费回包字段**，比 IDA 静态更快更直观。

**静态分析资产**（MuMu 调试 or 补盲，仍然有用）：

| 资产 | 内容 | 用途 |
|------|------|------|
| `analysis_output/ida_logs/ida_register.log` | 154 条 CMD→handler 映射 | 确认客户端接收的消息类型 |
| `analysis_output/handlers/*.txt` | 20 个 handler 完整反编译 | 客户端收到消息后怎么消费每个字段 |
| `analysis_output/whitebox/btl_*.txt` | 每个 battle 消息的 MergePartial 偏移 | 字段号→C++ 偏移 |
| `analysis_output/whitebox/comm_*.txt` | mon_info_t 等公共类型的 MergePartial | 子消息字段布局 |
| `RecoveredProject/MockServer/data/proto_schema.json` | 565 条 IDA 验证的字段布局 | **权威 schema，se.encode() 用** |
| `analysis_output/ida_full_dump.json` | 462 message + 136 handler + 3678 consumer | 全量 RE 数据 |
| `analysis_output/PROTO_HANDLER_REFERENCE.md` | handler→consumer 参考 | 字段含义 + 客户端消费逻辑 |
| `analysis_output/CLIENT_HANDLER_LOGIC.md` | 各 handler 逐字段消费路径 | 字段→UserData/BattleManager 写入 |
| `analysis_output/CLIENT_ANALYSIS.md` | 全流程分析 | 登录/地图/战斗全链路 |
| `RecoveredProject/MockServer/data/ProtocolRegistry.json` | 协议单一事实源（258 条） | handler 写回包查这个 |
| `RecoveredProject/MockServer/PROTOCOL_REGISTRY.md` | 注册表人读索引 | |

**验证回包**：
1. 查 `ida_register.log` → 确认客户端注册了哪种 out 类型
2. 查 `proto_schema.json` / `whitebox/*.txt` → 取 MergePartial 字段布局
3. 查 `handlers/*.txt` / `CLIENT_HANDLER_LOGIC.md` → 确认每个字段的客户端含义（读哪个偏移、写到哪里）
4. （如果 hook 可用）hook 对应 `MergePartial` 确认字段实际被读

**每次写 handler 前**先查 `ProtocolRegistry.json`，用 `lib/schema_encoder.js` 的 `encode(msgName, {字段号:值})` 出 body，禁止手拼 buffer。

> 注意：`proto_schema.json` 的字段**编号**是 IDA 验证的（正确），但字段**名称**是 dumper 猜的（常错）。真实语义以 `whitebox/*.txt` 和 `handlers/*.txt` 的 C++ offset→consumer 为准。

### 2. 其他核心原则

- 中文交流，精简，直接给结论和命令
- 破坏性操作前先确认（kill 进程、改 /data/app、覆盖 mock 等）
- 协议分析查静态资产不用猜：`ProtocolRegistry.json` → `proto_schema.json` → `whitebox/*.txt` → `handlers/*.txt`
- 真机 hook → 按符号名 hook `MergePartial` 动态看字段消费；MuMu → IDA 静态替代
- **不要尝试在 MuMu 上用 Frida hook**（Houdini 翻译，attach 假成功不 fire）
- 每次关键发现写 memory 到 `C:\Users\23287\.claude\projects\D--Dev-javatools\memory\`
- 优先翻 `analysis_output/`（已有 IDA 输出），不要重新跑 IDA
- 动手前先 `ls 1/` 找现成脚本复用，不重复写
- 用户没 token 时立刻收尾，不要 sleep 等冷启动
