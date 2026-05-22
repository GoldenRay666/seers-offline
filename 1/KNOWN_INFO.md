# 赛尔号战神联盟 (com.taomee.seers) — 离线模式项目全貌

> 整理时间: 2026-05-22

---

## 一、项目概述

基于 Cocos2d-x 2.0.2.0 (C++ + Lua 5.1) 的 Android 手游 APK 反编译与离线化改造项目。

- **包名**: `com.taomee.seers`
- **引擎**: Cocos2d-x + Lua 5.1
- **网络协议**: HTTP (libcurl + JsonCpp) + TCP (Protobuf binary)
- **原生库**: `lib/armeabi/libgame_logic.so` (ARM, 通过 Houdini 在 x86_64 上翻译运行)
- **工具链**: apktool 2.x, jarsigner/apksigner, IDA Pro 8.3 + Hex-Rays, Frida 17.x, Ghidra 11.4.2

---

## 二、当前运行状态 (2026-05-22)

### 可工作的部分
- 登录绕过 (TaomeeLogin.smali 重写)
- 服务器列表显示
- 角色创建
- 精灵选择 (select_main_mon)
- 进入地图 (player_enter_map)
- 地图资源正确加载: NPC (`player_enter_map_out.npcs` 字段), 矿石 (`mine_info` 字段4)

### 阻塞问题
- **引导系统**: 进入地图后自动寻路完成，出现半透明遮罩 (GuideLayer)，拦截所有触摸 → 游戏无法交互
- 引导系统是纯客户端 C++ 代码，无法通过服务端绕过

### 性能
- 冷启动约 10-15 分钟 (Houdini 翻译 ARM 库到 x86_64)

---

## 三、项目文件结构

### 根目录 (`C:\javatools\1\`)

```
AndroidManifest.xml          # APK 清单 (已修改 READ_PHONE_STATE 权限)
apktool.yml                  # apktool 解包配置
build_offline.bat            # 一键构建脚本
mock_server.js               # 主 mock 服务器 (HTTP + TCP, Node.js)
mock_server.js.backup        # 备份
mock_server.js.bak2          # 备份 (55KB, 完整版)
mock_server.js.latest        # 最新备份
mock_server_complete.js      # 完整版 (29KB)
mock.log                     # 服务器运行日志 (35KB)
server.log                   # 旧服务器日志 (20KB)
server/                      # Python 版服务器目录
FRIDA_PLAN.md                # Frida 重构计划
PROJECT_DOCUMENTATION.md     # 项目文档

assets/                      # 游戏资源
  PageConfig.txt             # 页面配置
  PbProtoFile/               # Proto 描述符文件
  luaScript/                 # Lua 脚本 (部分缺失)
  UI/ccbi/                   # CocosBuilder UI 文件 (100+ CCBI)
  UI/ccbi/GuideLayer.ccbi    # 引导层 UI ← 关键文件

lib/armeabi/
  libgame_logic.so           # 原生游戏逻辑库 (已 patch URL)
  libgame_logic.so.modified  # 修改版
  libgame_logic.so.bak       # 原始备份

original/                    # 原始 APK 解包备份
smali/                       # 反编译 Java 代码
  com/taomee/seer2/          # 主 Activity
  com/taomee/pwdlogin/       # 登录系统
  com/taomee/android/pay/    # 支付 SDK
  com/loopj/android/http/    # HTTP 客户端库
  com/example/taomeeaccount/ # 账户认证

res/                         # Android 资源
build/                       # 构建产物 (apktool b 输出)

frida_lib/                   # Frida 相关脚本库
.claude/settings.local.json  # Claude Code 权限配置
```

### Python 分析脚本 (IDA/Ghidra 辅助)

| 文件 | 用途 |
|------|------|
| `analyze_enter_map.py` | 分析 player_enter_map_out 消息 |
| `analyze_guide.py` / `analyze_guide2.py` | 分析引导系统 |
| `check_field4.py` / `check_isinit.py` | Proto 字段/IsInitialized 验证 |
| `check_mod.py` | 检查 .so 修改 |
| `deep_scan.py` | 深度扫描 |
| `dump_all_msgs.py` | 导出所有 proto 消息 |
| `dump_basic_merge.py` | 合并 basic info 分析 |
| `dump_descriptor.py` | 导出 proto descriptor |
| `dump_init.py` / `dump_serialize.py` | 导出初始化/序列化函数 |
| `extract_default.py` | 提取默认值 |
| `find_*.py` (20+ 个) | 各类 IDA 符号/函数查找脚本 |
| `fix_protos.py` | 修复 proto 定义 |
| `get_bytes.py` | 提取字节数据 |
| `ida_*.py` (多个) | IDA 批量分析脚本 |
| `parse_fields.py` | 解析 proto 字段 |
| `patch_guide.py` | 引导系统补丁分析 |
| `simple_find.py` / `simple_list.py` | 简单查找/列表 |
| `trace_*.py` (多个) | 函数调用链追踪脚本 |

### Frida 脚本

| 文件 | 用途 |
|------|------|
| `bypass_guide.js` | 引导绕过 (hook showMaskLayer, beginGuide, CCLayerColor::setOpacity) |
| `frida_bypass.js` | 早期绕过脚本 |
| `frida_fix_crash.js` | 修复崩溃 |
| `frida_hook.py` | Python 版 Frida hook |
| `frida_attach.py` | 附加到进程 |
| `frida_daemon.py` / `frida_daemon_v2.py` | 守护进程版 |
| `frida_spawn.py` / `frida_spawn_v2.py` | 启动+注入 |
| `frida_fix.py` / `frida_work.py` | 修复/工作脚本 |
| `hook.js` | 通用 hook 模板 (8.9KB) |
| `hook_crash3.js` | 崩溃追踪 |
| `inject_frida.py` | 注入工具 |
| `run_frida.py` / `run_frida2.py` | 运行 Frida 脚本 |

---

## 四、Java 层 (smali) 修改

### 4.1 主 Activity — `smali/com/taomee/seer2/seer2.smali`
- 禁用 TalkingData 统计: 注释 `sput v1, Lcom/tendcloud/tenddata/TalkingDataGA;->sPlatformType:I`
- 保留 `ChannelManager.initSDK()` (native 层依赖 plugin 系统)
- 禁用崩溃上报: 注释 `UploadCrashInfo` 创建和上传
- 禁用 VManager 广告 SDK: 注释 `VManager.setVId()` 和 `getMessage()`

### 4.2 登录绕过 — `smali/com/taomee/pwdlogin/service/TaomeeLogin.smali`
`onAutoLogin` 方法完全重写:
- `userId="local_user"`, `userName="Player"`, `session="offline_session"`
- 调用 `ChannelManager.nativeLoginSuccess(userId, session)` 通知 native 层
- 调用 `loginResponse.loginSuc()` 触发 plugin 回调链

### 4.3 其他 smali 修改
- `smali/com/taomee/seer2/u/e/i.smali` — getRunningTasks 修复
- `AndroidManifest.xml` — READ_PHONE_STATE 权限

---

## 五、Native 层 (.so) 修改

### URL 重定向 (hex 编辑, 保持字符串长度不变, 用 `/` 填充)

| 原始 URL | 替换为 |
|----------|--------|
| `http://iseer2.login.61.com:8000/iseer2.fcgi?version=%d&channel=%d` | `http://127.0.0.1:8000/iseer2.fcgi?version=%d&channel=%d//////////` |
| `http://res.iseer20.61.com/app/itunes/` | `http://127.0.0.1/res/app/itunes//////` |

### 登录 IP 包装函数
- 地址 `0x43BEE4`: `login_ip` 包装函数 (将 JSON 字符串 IP 转成 proto uint32)

---

## 六、Mock 服务器

### HTTP 服务 (端口 8000)
- `/iseer2.fcgi` — 服务器列表接口 (JSON)
- `/account_service.php` — 账户认证 (JSON, `status_code:"0", user_id, session`)

### TCP 服务 (端口 8002)
- `check_session` — 会话验证
- `cli_get_server_list` — 获取服务器列表
- `cli_create_role` / `create_role` — 角色创建
- `cli_select_main_mon` — 精灵选择
- `player_enter_map` — 进入地图
- 50+ 命令处理覆盖 (任务系统, 背包, NPC 对话等)

### 任务系统
- TASK_DEFS: 教程任务 10001, 10002
- `buildMonInfo()`: 生成有效 mon_info_t (含所有子消息)
- 玩家状态追踪: 任务, 背包, 位置

---

## 七、认证流程

```
1. TaomeeLogin (Java Plugin) → HTTP GET http://maccount-httpd.61.com/account_service.php
2. 期望返回 JSON: {status_code:"0", user_id, session}
3. 然后调用 iseer2.fcgi 获取服务器列表 (JSON)
4. TCP 连接到游戏服务器 (端口 8002)
```

---

## 八、Proto 协议分析 (来自 ELF 符号 + IDA)

### player_enter_map_out
| 字段 | 类型 | 说明 |
|------|------|------|
| 1 | map_id | 地图 ID |
| 2 | players | repeated player_enter_map_out_player_t |
| 3 | npcs | repeated player_enter_map_out_npc_t |
| 4 | mine_info | repeated map_mine_info_t |
| 5 | events | repeated |

### player_enter_map_out_npc_t
| 字段 | 类型 | 说明 |
|------|------|------|
| 1 | npc_id | NPC ID |
| 2 | mons | repeated |

### player_enter_map_out_player_t
| 字段 | 类型 | 说明 |
|------|------|------|
| 1 | uid | 用户 ID |
| 2 | role_tm | 角色模板 |
| 3 | nick | 昵称 |
| 4 | x | X 坐标 |
| 5 | y | Y 坐标 |
| 6 | gender | 性别 |
| 7 | equip_id_list | 装备列表 |
| 8 | vip_level | VIP 等级 |

### map_mine_info_t
| 字段 | 类型 | 说明 |
|------|------|------|
| 1 | map_id | 地图 ID |
| 2 | remain_count | 剩余数量 |
| 3 | last_flush_time | 上次刷新时间 |

### mon_basic_info_t (23 字段)
- Presence mask: `0xF7F59` (offset 0x78)
- 字段 7, 13 是 SkipField
- SerializeWithCachedSizesToArray 地址: `0x58c85c`

### mon_info_t (7 字段)
- Mask: `0x79` at offset 0x28 (字段 1,4,5,6,7 required; 2,3 optional)
- SerializeWithCachedSizesToArray 地址: `0x58d5ec`

### mon_btl_attr_t (6 字段)
- Mask: `0x3F` (所有字段 required)

### player_info_t (13 字段)
| 字段 | 类型 | 说明 |
|------|------|------|
| 1 | userid | 用户 ID |
| 2 | role_tm | 角色模板 |
| 3 | nick | 昵称 |
| ... | ... | ... |
| 13 | vip_level | VIP 等级 |
- IsInitialized 地址: `0x5866b5`

### 其他关键消息
- `cli_get_server_list_out`: server_list(1), login_ip(2), login_port(3)
- `server_info_t`: server_id(1), server_name(2), server_status(3)
- `login_out`: basic(1), sys_cur_time(3)
- `select_main_mon_out`: mon_info(1) — IsInitialized 地址 `0x5b2bd0`

---

## 九、消息分发系统

- 50+ 命令处理器映射表
- 分发函数 (dispatchMessage) 通过 CMD ID 路由
- 核心类: `NetWorkUtil`, `LoginManager`, `GameManager`, `MessageHandler`

---

## 十、关键 native 函数地址

### 网络层
| 函数 | 签名 |
|------|------|
| `NetWorkUtil::connect2Server` | `_ZN11NetWorkUtil14connect2ServerEPKcifi` |
| `NetWorkUtil::sendMessage` | `_ZN11NetWorkUtil11sendMessageEPN14ISeer20CSProto13cs_msg_head_tEPN6google8protobuf7MessageEfi` |
| `NetWorkUtil::decodeMessage` | `_ZN11NetWorkUtil13decodeMessageEPciRS0_RiS1_S2_S2_` |
| `NetWorkUtil::dispatchMessage` | `_ZN11NetWorkUtil15dispatchMessageEPciS0_ii` |

### 登录层
| `LoginManager::startConnectServer` | `_ZN12LoginManager18startConnectServerEv` |
| `TmLoginManager::doLogin` | `_ZN14TmLoginManager7doLoginEv` |
| `TmLoginManager::loadPlatformPlugin` | `_ZN14TmLoginManager18loadPlatformPluginEv` |

### UI 层
| `AccountLoginLayer::setServerList` | `_ZN17AccountLoginLayer13setServerListERSt6vectorI16ServerListInfo_tSaIS1_EE` |
| `SelectServerLayer::onServerSelected` | `_ZN17SelectServerLayer16onServerSelectedEPN7cocos2d8CCObjectE` |
| `GameManager::startGame` | `_ZN11GameManager9startGameEv` |

---

## 十一、已知问题与尝试

### 问题1: create_role 断连 (已解决)
- 现象: 发送 `cli_create_role_in` 后无论回复什么都断开
- 尝试: 正确 proto, 空 body, 错误 CMD, 2s 延迟 — 全部断连
- 状态: 已解决 (2026-05-21 后的 mock_server.js 可以正常处理)

### 问题2: 引导系统灰屏 (阻塞中)
- 现象: 进入地图后出现半透明遮罩 (GuideLayer), 拦截所有触摸
- 根因: 引导系统是客户端 C++ 逻辑, 不依赖服务端数据
- 尝试方案:

**方案A: Frida Hook (尚未在真机测试)**
```
bypass_guide.js — hook showMaskLayer, beginGuide, CCLayerColor::setOpacity
```
前提: 需要 frida-server-x86_64 推送到设备 (已在 MuMu 模拟器上运行 frida-server)

**方案B: CCBI 二进制修改**
- 修改 `GuideLayer.ccbi` 中 `m_maskLayer` 的 opacity/color

**方案C: ADB 输入注入**
- `adb shell input tap` 模拟点击引导窗口区域

**方案D: 服务端数据**
- 提供 PVP/任务数据 — 但引导是客户端逻辑, 可能无效

---

## 十二、开发环境

### 路径
| 工具 | 路径 |
|------|------|
| 项目根目录 | `C:\javatools\1\` |
| 修改版 APK 源码 | `C:\javatools\new2\` |
| apktool.jar | `C:\javatools\apktool.jar` |
| debug.keystore | `C:\javatools\debug.keystore` |
| IDA Pro 8.3 | `D:\BaiduNetdiskDownload\IDA_Pro_v8.3_Portable123\` |
| Ghidra 11.4.2 | `C:\javatools\ghidra_11.4.2_PUBLIC\` |
| Android NDK r27c | `C:\javatools\xndk\android-ndk-r27c\` |
| Python 3.13 | `C:\Users\23287\AppData\Local\Programs\Python\Python313\python.exe` |
| Frida | `C:\Users\23287\AppData\Local\Programs\Python\Python313\Scripts\frida.exe` |
| ADB | `C:\Users\23287\AppData\Local\Android\Sdk\platform-tools\adb.exe` |
| Java JDK 23 | `C:\Program Files\Java\jdk-23\bin\jarsigner.exe` |

### 模拟器/设备
| 设备 | ADB 串号 | 说明 |
|------|----------|------|
| MuMu 模拟器 | `127.0.0.1:7555` | x86_64, Houdini 翻译 ARM, root 可用 |
| Xiaomi/Redmi | `MNMZGERSNJJFIF9X` | ARM 真机 |

### MuMu ADB
- 内置 ADB: `D:\MuMuPlayer\nx_main\adb.exe` (或 `D:\MuMuPlayer\nx_device\12.0\shell\adb.exe`)
- MuMu 管理器: `D:\MuMuPlayer\nx_main\MuMuManager.exe`

---

## 十三、网络配置

### hosts 重定向 (模拟器)
```
127.0.0.1  maccount.61.com
127.0.0.1  maccount-httpd.61.com
127.0.0.1  wlad.61.com
```

### ADB 端口转发
```bash
adb reverse tcp:8000 tcp:8000   # HTTP mock server
adb reverse tcp:8002 tcp:8002   # TCP mock server
```

---

## 十四、构建与部署

```bash
# 1. 打包 APK
java -jar C:\javatools\apktool.jar b C:\javatools\1 -o C:\javatools\1_offline.apk

# 2. 签名
jarsigner -sigalg SHA1withRSA -digestalg SHA1 \
  -keystore C:\javatools\debug.keystore \
  -storepass android -keypass android \
  C:\javatools\1_offline.apk debug

# 3. 安装
adb -s 127.0.0.1:7555 install -r C:\javatools\1_offline.apk

# 4. 启动 mock 服务器
node C:\javatools\1\mock_server.js

# 5. 启动游戏
adb -s 127.0.0.1:7555 shell am start -n com.taomee.seers/com.taomee.seer2.seer2

# 6. 查看日志
adb -s 127.0.0.1:7555 logcat -v time -d
```

或使用 `build_offline.bat` 一键构建。

---

## 十五、下一步计划

1. **Frida 引导绕过** — 推送 frida-server 到 MuMu 模拟器, 运行 `bypass_guide.js`
2. **CCBI 二进制修改** — 修改 GuideLayer.ccbi 中 mask 的 opacity 为 0
3. **ADB input tap** — 用 ADB 模拟点击通过引导步骤
4. **完善 mock 服务器** — 连接真机测试改进后的 mock 服务器
5. **IDA 深入分析** — 找到 CMD dispatch 函数, 定位引导触发逻辑

---

## 十六、附件说明

### 截图
| 文件 | 说明 |
|------|------|
| `current_screen.png` | 当前模拟器截图 (2026-05-22) |
| `javatools1screen.png` | 早期截图 (2026-05-22) |
| `screen1.png` | Frida 截图 (2026-05-22) |

### 日志输出
| 文件 | 说明 |
|------|------|
| `mock.log` | Mock 服务器日志 |
| `server.log` | 旧服务器日志 |
| `ida_guide_out.txt` | IDA 引导分析输出 (29KB) |
| `ida_submsg.txt` | IDA 子消息分析 (26KB) |
| `ida_ser_out.txt` | IDA 序列化分析 (19KB) |
| `ida_handler_out.txt` | IDA 处理器分析 (10KB) |
| `ida_check.txt` | IDA IsInitialized 检查 |
| `ida_desc_out.txt` | IDA descriptor 导出 |
| `ida_fields_out.txt` | IDA 字段分析 |
| `guide_analysis.txt` / `guide_analysis2.txt` | 引导分析结果 |
| `proto_field_analysis.txt` | Proto 字段分析 |
| `attach_out.txt` | Frida 附加输出 |
| `daemon2_stdout.txt` / `daemon_log.txt` | Frida daemon 输出 |
| `frida_attach_log.txt` | Frida 附加日志 |
| `frida_output.txt` | Frida 输出 |
| `spawn_log.txt` / `spawn2_log.txt` / `spawn3_log.txt` | Frida spawn 日志 |
| `scan_log.txt` / `fix_log.txt` / `work_log.txt` | 工作日志 |

### Proto 描述符 (assets/PbProtoFile/)
游戏自带的 protobuf descriptor 文件，包含所有消息类型定义。
