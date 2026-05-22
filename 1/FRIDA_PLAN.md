# Frida 重构计划

## 目标
用 Frida hook 分析并重构游戏，使其本地离线可运行。

## 原始 APK
明天用户提供原始 APK，用 apktool 解包得到原始 smali 和 .so。

## 架构已知信息

### 引擎
- Cocos2d-x 2.0.2.0 (C++ + Lua 5.1)
- ARM native 库: libgame_logic.so (houdini 翻译在 x86_64 上运行)
- 网络: HTTP (libcurl + JsonCpp) + TCP (protobuf binary)

### 关键 native 函数 (从 .so 符号表)

**网络层:**
- `_ZN11NetWorkUtil14connect2ServerEPKcifi` — TCP连接
- `_ZN11NetWorkUtil11sendMessageEPN14ISeer20CSProto13cs_msg_head_tEPN6google8protobuf7MessageEfi` — 发送消息
- `_ZN11NetWorkUtil13decodeMessageEPciRS0_RiS1_S2_S2_` — 解码消息
- `_ZN11NetWorkUtil15dispatchMessageEPciS0_ii` — 分发消息

**登录层:**
- `_ZN12LoginManager18startConnectServerEv` — 开始连接服务器
- `_ZN14TmLoginManager7doLoginEv` — 执行登录
- `_ZN14TmLoginManager18loadPlatformPluginEv` — 加载平台插件

**JSON 解析:**
- `_Z12parseJsonStrPKcRN4Json5ValueE` — JsonCpp 解析

**UI 层:**
- `_ZN17AccountLoginLayer13setServerListERSt6vectorI16ServerListInfo_tSaIS1_EE` — 设置服务器列表
- `_ZN17SelectServerLayer16onServerSelectedEPN7cocos2d8CCObjectE` — 点击服务器
- `_ZN11GameManager9startGameEv` — 开始游戏

**Lua 桥接:**
- `GameDataManager4Lua::get*` 系列

### Proto 消息结构 (从 descriptor 提取)

**cli_get_server_list_out:**
- server_list (field 1): repeated server_info_t
- login_ip (field 2): required uint32
- login_port (field 3): required uint32

**server_info_t:**
- server_id (field 1): required uint32
- server_name (field 2): required string
- server_status (field 3): required uint32

**login_out:**
- basic (field 1): required player_basic_info_t
- sys_cur_time (field 3): optional int32

**player_basic_info_t:**
- nick (field 1): bytes
- role_tm (field 2): int32
- last_login_tm (field 3): int32
- last_logout_tm (field 4): int32

### 今日发现的问题
1. 服务器列表显示需要 JSON 中 login_ip 为字符串，但 proto 需要 uint32 —— JsonCpp 和 protobuf 类型冲突
2. 点击服务器后 SIGABRT 崩溃，疑似 `CHECK failed: IsInitialized()` 
3. TCP 连接从未被发起，崩溃在本地处理阶段

## Hook 策略

### Phase 1: 抓包分析
Hook connect2Server, sendMessage, decodeMessage → 看到游戏发什么数据

### Phase 2: 绕过崩溃
Hook SelectServerLayer::onServerSelected → 追踪执行路径，找到 abort 原因

### Phase 3: Mock 数据
Hook dispatchMessage → 拦截服务器响应，注入假数据

### Phase 4: 离线模式
Hook LoginManager → 跳过服务器验证，直接进入游戏
