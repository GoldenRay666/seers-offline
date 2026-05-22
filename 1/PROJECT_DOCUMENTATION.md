# 赛尔号战神联盟 (com.taomee.seers) - 离线模式修改文档

## 概述
基于 Cocos2d-x + Lua 的 Android 游戏 APK 反编译项目。
原始引擎: Cocos2d-x (C++), Lua 5.1, Protobuf 网络协议, libcurl HTTP 客户端。

## 离线模式修改清单

### 1. Java 层 (smali) 修改

#### 1.1 主 Activity - `smali/com/taomee/seer2/seer2.smali`
- **禁用 TalkingData 统计**: 注释掉 `sput v1, Lcom/tendcloud/tenddata/TalkingDataGA;->sPlatformType:I`
- **保留 PluginWrapper 初始化**: `ChannelManager.initSDK()` 仍然调用（native 层需要 plugin 系统）
- **禁用崩溃上报**: 注释掉 `UploadCrashInfo` 的创建和上传
- **禁用 VManager 广告 SDK**: 注释掉 `VManager.setVId()` 和 `getMessage()` 调用

#### 1.2 登录绕过 - `smali/com/taomee/pwdlogin/service/TaomeeLogin.smali`
- `onAutoLogin` 方法被完全重写：
  - 设置本地用户标识: `userId="local_user"`, `userName="Player"`, `session="offline_session"`
  - 调用 `ChannelManager.nativeLoginSuccess(userId, session)` 通知 native 层
  - 调用 `loginResponse.loginSuc()` 触发 plugin 回调链 → LoginWrapper → native

### 2. Native 层 (.so) 修改

#### 2.1 登录服务器 URL 重定向
文件: `lib/armeabi/libgame_logic.so` (原始备份: `libgame_logic.so.bak`)

| 原始 URL | 替换为 |
|----------|--------|
| `http://iseer2.login.61.com:8000/iseer2.fcgi?version=%d&channel=%d` | `http://127.0.0.1:8000/iseer2.fcgi?version=%d&channel=%d//////////` |
| `http://res.iseer20.61.com/app/itunes/` | `http://127.0.0.1/res/app/itunes//////` |

替换方式: 使用 `dd` 直接 hex 编辑，保持字符串长度不变（用 `/` 填充短出的10字节）。

### 3. Mock 服务器 (`mock_server.py`)

运行方式: `python3 mock_server.py`

提供三个本地服务:
| 端口 | 协议 | 用途 |
|------|------|------|
| 8000 | HTTP | 登录/服务器列表接口 (iseer2.fcgi) |
| 8001 | TCP + Protobuf | Game Login Server |
| 8002 | TCP + Protobuf | Game Server |

HTTP 接口返回:
- `loginIp = "127.0.0.1"`
- `loginPort = 8002`
- 包含一个离线服务器 (`serverId=1, serverName="Offline Server"`)

### 4. 项目架构分析

#### 关键发现:

**完整游戏系统:**
- 地图探索 (44个地图文件)
- 回合制战斗 (PvP/PvE, 4维类型交叉分类)
- 精灵捕捉/训练/进化/装备
- 任务系统 (3227行对话数据)
- 商城, 抽奖, VIP, 充值
- 战神之塔, 雷伊挑战
- 天气系统 (9种天气类型)

**网络架构:**
- HTTP: 登录认证 + 服务器列表获取 (libcurl 7.26.0)
- TCP + Protobuf: 游戏协议
- 消息格式: Varint长度前缀 + Protobuf二进制

**核心类 (从 .so 符号表提取):**
- `NetWorkUtil` - 网络通信 (connect2Server, sendMessage, encode/decode)
- `LoginManager` - 登录管理 (startConnectServer)
- `GameManager` - 游戏管理 (startGame, changeMap, getMainMenuLayer)
- `BaseLevelBuilder` - 关卡构建 (createSeer, createNpcs, createMapAnimations)
- `EnginePlayerManager` - 精灵管理
- `MessageHandler` - 消息处理
- `GameDataManager4Lua` - Lua数据桥接

**Lua文件状态:**
- 已存在: CaptureMonsterAI.lua, QuestDialog.lua, 9个GameConfigForLua/*.lua
- 缺失 (可能运行时从服务器下载): 
  - `luaScript/Network/handleMessage.lua` (网络消息处理)
  - `luaScript/Level/%d.lua` (关卡脚本)
  - `GameConfigForLua/NewItemConfig.lua`

### 5. 构建与安装

#### 前置条件
1. Java JDK 8+
2. apktool.jar (放入 C:\javatools\)
3. Android SDK (apksigner) 或 jarsigner
4. Python 3 (用于运行 mock 服务器)

#### 步骤
```
# 1. 重打包 APK
java -jar apktool.jar b C:\javatools\1 -o C:\javatools\1_offline.apk

# 2. 签名
apksigner sign --ks debug.keystore C:\javatools\1_offline.apk

# 3. 安装到模拟器/设备
adb install -r C:\javatools\1_offline.apk

# 4. 启动 mock 服务器
python3 C:\javatools\1\mock_server.py

# 5. 启动游戏
```

或使用 `build_offline.bat` 一键构建。

### 6. 已知限制

1. **TCP 游戏协议未完全实现**: mock 服务器返回通用成功响应，具体游戏功能可能因缺少正确的服务器数据而失败
2. **缺失 Lua 脚本**: `handleMessage.lua` 等可能从服务器下载的脚本在离线模式下不可用
3. **资源更新**: 资源 URL 已重定向但可能下载失败（通常不影响基本运行）
4. **未测试**: 需要在 Android 模拟器或真机上实际测试

### 7. 下一步建议

1. 在 Android 模拟器上安装 APK 并观察 logcat 输出
2. 根据网络请求日志增强 mock_server.py 的响应
3. 如果游戏在特定消息上卡住，分析该消息的 proto 定义并添加对应的 mock 响应
4. 考虑使用 Frida 动态 hook 网络函数来更快地开发和测试 mock 数据
