# 赛尔号战神联盟离线化项目 —— 工作流程提示词

> 用途：把这份提示词作为新会话的背景注入，让助手能立刻接续本项目的调试节奏，不再走弯路。

---

## 项目身份

- 工程根目录 `C:\javatools\`，APK 解包目录 `C:\javatools\1\`
- 包名 `com.taomee.seers`，引擎 Cocos2d-x 2.0.2 + Lua 5.1，原生库 `lib/armeabi/libgame_logic.so`（ARM）
- 运行环境 MuMu 模拟器 (`adb 127.0.0.1:7555`，root 已开)，CPU x86_64，**ARM 库通过 Houdini 翻译运行**
- mock 服务端在 `C:\javatools\1\mock_server.js`（Node.js, 8000 HTTP + 8002 TCP）
- 详细背景一律先读 `C:\javatools\KNOWN_INFO.md`；不要重复发现已记录的问题

---

## 第一原则：先读背景再动手

任何任务开始前必读：
1. `KNOWN_INFO.md` 的「§二 当前运行状态」——别去尝试已知阻塞的方案
2. `~\.claude\projects\C--javatools\memory\` 下的所有 memory 文件——之前会话的关键发现都在那
3. 用户给定的具体现象（截图/日志/错误信息）——优先级高于猜测

读完后明确告诉用户：本次问题是 (a) 已知阻塞、(b) 已知阻塞的新表现、(c) 未记录的新问题。然后**只回答用户问的那个**，不要主动扩展工作面。

---

## 协议分析三步法（核心方法论）

**每次遇到 proto 格式/字段映射问题，依次执行这三步，不要跳过：**

### 第一步：分析 mock 日志

`mock.log.new` 是黄金数据源，直接读：
- 客户端发了什么 CMD？字段列表是什么？
- mock 回了多少字节 body？body 的 hex dump 是什么？
- 客户端收到后断连了还是继续发了下一条消息？
- **关键信号**：返回 null → 客户端超时断连（2 字节 body → `invalid message body length: -2` → 必须 ≥4 字节）

此步产出：确定问题出在哪个消息，当前发送的 body hex 是什么。

### 第二步：Frida 监控二进制函数

写 Frida 脚本 hook 相关函数的 `MergePartialFromCodedStream` 和 `IsInitialized`：

```javascript
Interceptor.attach(mergeAddr, {
    onEnter(args) { this.msg = args[0]; },
    onLeave(retval) {
        // retval=0 → merge 失败（字段不匹配/IsInitialized 失败）
        // retval=1 → merge 成功
        // dump msg 内存看哪些字段有值
    }
});
```

- 挖矿/打开背包触发目标消息
- 看 `ret=0` 还是 `ret=1`
- 看 msg dump 中哪些 offset 有值（对比 IDA 验证）

此步产出：确定 merge 是否成功，哪些字段被写入，哪个 IsInitialized 返回 false。

### 第三步：IDA 反编译确认字段映射

跑 IDA 脚本反编译目标消息的 `MergePartialFromCodedStream`：

```python
idaapi.auto_wait()
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if target in name and "MergePartialFromCodedStream" in name:
        # disassemble full function
```

从 ARM 汇编中提取：
- switch case 的 field number
- `ReadPrimitive` 的 target offset（如 `ADDS R1, #8` = msg+8）
- `ReadMessageNoVirtual` 的 vector offset
- mask 的 offset 和 bit 位
- `IsInitialized` 检查哪个 mask bit

此步产出：精确的 `wire field → compiled offset` 映射表，**直接作为 mock 编码依据**。

### 三步法示例（本次会话）

- **Step 1** mock.log：`cli_get_item_out` 只发了 2 字节 → 客户端断连 → 改为 ≥4 字节后通过
- **Step 2** Frida：`bag_updates_out` merge ret=1，msg+0x68=30(capacity)，mask+0x70=1 → 父消息格式正确
- **Step 3** IDA：`get_item_out_one_t` f1→msg+8(item_id REQUIRED), f2→msg+0xC(grid_id); `bag_updates_out_one_t` f1→msg+8(grid_id REQUIRED), f2→msg+0xC(item_id) → **两个 one_t 字段 1 含义不同**，mock 需区分编码

---
## 三层故障定位框架（旧版，保留用于非 proto 问题）

每次"游戏不工作"都按三层依次排除，**不要跳层**：

### 第一层：服务端协议层
读 `C:\javatools\1\mock.log` / `mock.log.new`，看：
- 客户端发了哪些 CMD？最后一个 CMD 是什么？
- 我们回了多大的 body？格式对不对？
- 客户端是断连了还是还连着？

如果服务端没收到任何请求，跳到第二层。

### 第二层：客户端 Lua/cocos2d-x 层
```bash
adb -s 127.0.0.1:7555 logcat -d 2>&1 | grep -E "cocos2d-x debug|signal" | tail -30
```
看关键模式：
- `decode message buffer error` ——非致命，proto schema 不严格匹配，客户端会忽略继续。**不要花时间去修这个除非它确实阻塞了**。
- `invalid message body length: -2` ——致命，body 字节对齐有问题。最常见诱因：把 `[0a 00 10 00]` 缩短为 `[10 00]`。空 repeated 必须保持 4 字节占位符。
- `time out. cmd: ...` ——服务端没回或回得慢
- `connect to server` / `NetWorkUtil::onConnectResult(2)` ——TCP 连上了
- `goToFrontend1..6` ——splash 阶段；进度卡在 frontend6 + nativeTouchesBegin/End 但没后续 = UI hang
- `add other seer X` / `the player has added before` ——成功进入地图
- `Error! Quest Not Exists!` / `quest XXXXX added` ——任务系统跑通

### 第三层：Houdini 翻译层（最难）
当 logcat 出现 `Fatal signal 11 (SIGSEGV)` 时立刻看 tombstone：
```bash
MSYS_NO_PATHCONV=1 adb -s 127.0.0.1:7555 shell 'ls -la /data/tombstones/'
MSYS_NO_PATHCONV=1 adb -s 127.0.0.1:7555 shell 'head -120 /data/tombstones/tombstone_XX'
```
**Tombstone 的 stack: 段才是黄金**。`backtrace` 段往往只显示 `libhoudini.so` 内部偏移；真正的崩溃源头在 `stack:` 段里 `_ZN10... +N` 的符号——那是 Houdini 翻译时正在处理的 ARM 函数。

判定要点：
- 如果 backtrace 全在 `libhoudini.so` 而 stack 里指向 libgame_logic.so 的具体 C++ 函数，那是 **Houdini 翻译该 ARM 函数时崩了**，不是该函数本身的逻辑 bug
- 多个 tombstone 同一签名 = 确定性崩溃，不是偶发，**重启没用**
- "fault addr 0x0" 通常意味着虚函数调用时 vtable 链有 NULL，但崩点是 Houdini 翻译器，不是游戏代码

---

## 关键工具速查

| 工具 | 路径 | 备注 |
|------|------|------|
| ADB | `C:/Users/23287/AppData/Local/Android/Sdk/platform-tools/adb.exe` | 设备 `127.0.0.1:7555` |
| Python | `C:/Users/23287/AppData/Local/Programs/Python/Python313/python.exe` | 用来跑 patch 脚本和 ELF 解析 |
| Frida | `C:/Users/23287/AppData/Local/Programs/Python/Python313/Scripts/frida.exe` | 17.x。ARM 真机通过 Gadget（APK 注入）无 root 使用：`adb forward tcp:27042 tcp:27042` → `frida -H 127.0.0.1:27042`。**Gadget 模式 `Module.findExportByName` 不可用**，用 `enumerateExports` 替代；高频 `send()` 需限流避免崩溃 |
| Frida Gadget | `1/lib/armeabi/libfrida-gadget.so` + `.config.so` | listen 模式 0.0.0.0:27042, on_load=resume |
| Autofix | `1/frida_mine_autofix.js` | 挖矿道具+背包修复，每游戏进程启动后需执行一次 |
| Java JDK | `C:/Program Files/Java/jdk-23/bin/jarsigner.exe` | 重打包 APK 时签名用 |
| apktool | `C:/javatools/apktool.jar` | `java -jar apktool.jar b 1 -o 1_offline.apk` |
| IDA 输出 | `C:/javatools/1/ida_*.txt` | 已有的反编译产物，**优先翻这些**而不是重新跑 IDA |

---

## Git Bash 上 adb 的坑

`adb shell` 路径会被 MSYS 转译成 Windows 路径。一律加前缀：
```bash
MSYS_NO_PATHCONV=1 adb -s 127.0.0.1:7555 shell 'cp /data/local/tmp/x /data/app/y'
```
否则 `/data/local/tmp` 会变成 `C:/Program Files/Git/data/local/tmp`，命令静默失败。

`adb shell dd bs=1 skip=N count=M` 在某些 Android 6 上有边界 bug。**验证 patch 是否正确写入用 md5sum 而不是 dd**：
```bash
MSYS_NO_PATHCONV=1 adb shell 'md5sum /data/app/.../libgame_logic.so'
python -c "import hashlib; print(hashlib.md5(open('local.so','rb').read()).hexdigest())"
```

---

## 二进制 patch 工作流（Houdini 崩溃唯一可行解）

### 流程

1. 从 IDA 输出（`ida_guide_out.txt` 等）找目标函数虚拟地址（Thumb 入口，**LSB 不带 1**）
2. ELF32 解析：所有 PT_LOAD 段的 `vaddr → file_offset` 映射，找出函数对应的文件偏移
3. 把入口前 2 字节改成 `70 47`（Thumb `BX LR`，立即返回）
4. push 到 `/data/local/tmp/`，root cp 到 `/data/app/com.taomee.seers-1/lib/arm/libgame_logic.so`
5. **一定先备份**原始 .so（`*.prepatch_*`），并保留一份"基准副本"用于后续从干净状态重新生成 patch

### 已确认 Houdini 会崩的函数（仅这几个需要 patch）

| 虚拟地址 | 函数 |
|---------|------|
| `0x48d9f2` | `GuideLayer::hideMaskLayer` |
| `0x48da0e` | `GuideLayer::showMaskLayer` |
| `0x48da2a` | `GuideLayer::hideDialogNode` |
| `0x48da3a` | `GuideLayer::showDialogNode`（让 Eva 对话不出现，绕过卡死） |

**不要 patch 的函数**：
- `GameGuideManager::beginGuide`、`GameOpenAssignFunctionManager::beginGuide` ——会破坏角色创建流程
- 构造/析构（`C2/D0/D1/D2`）——破坏对象生命周期
- `ccTouchBegan/Ended/Moved` ——破坏触摸输入
- `onAssignCCBMemberVariable`、`onResolveCCB*` ——破坏 CCB 反序列化
- `create`、`createByCCBFile` ——工厂方法

### 模板脚本

`patch_guidelayer_final.py` / `patch_guidelayer_v2.py` 是工作模板。新加 patch 时**始终从 `lib/armeabi/libgame_logic.so.prepatch_guide_v3`（干净基线）派生**，不要在已 patch 文件上叠加，否则 v2/v3 之间的纠错难追溯。

---

## mock_server.js 维护准则

### 不要做的事

- ❌ **不要**把通用空列表回复改成 `[10 00]`（2 字节）。必须是 `[0a 00 10 00]`（4 字节占位）。客户端解码 < 4 字节 body 时报 `invalid message body length: -2` 然后断连
- ❌ **不要**为修 `decode message buffer error` 牺牲已工作的功能。这种错误游戏会忽略
- ❌ **不要**给 `cli_check_session_in` 第一次回的时候带上 role_info——会让游戏跳过 create_role 路径
- ❌ **不要**自动 push 多余 init 消息（`pushInitMessages` 那种 8 条），除非确认客户端期望它们

### 要做的事

- ✅ `cli_check_session_out` 的 `server_info_t` 用 KNOWN_INFO §八 标定的 3 字段（id/name/status），不是 8 字段
- ✅ `cli_create_role_in` 必须回 `login_out`，不是 `cli_create_role_out`
- ✅ `select_main_mon_in` 处理时**先 push** `player_enter_map_out`（用 `pushMessage`），**再回** `select_main_mon_out`
- ✅ 改完后 `node --check` 验证语法 → kill 旧进程 → 用 `node mock_server.js > mock.log.new 2>&1 &` 重启
- ✅ 状态保存在 `mock_server.js.regression_*`、`.latest`、`.bak2`、`_complete.js`——遇到 .js 突然变小（< 800 行）就是被某次未保存修改覆盖了，**从 `.latest` 恢复**

---

## 用户偏好

- 中文交流，回答精简，**直接给结论和命令**，不写大段铺垫
- 涉及不可逆/影响范围大的操作（kill 进程、改 /data/app、改 mock 等）**先用 AskUserQuestion 确认**
- 用户说"我没 token 了"、"手动测试时直接停"——立刻收尾，提供脚本让用户手动跑，**不要再 sleep 90 秒等游戏冷启动**
- 不要主动跑游戏验证。用户会自己测、自己截图、自己反馈现象。我的工作是写脚本和分析日志
- 用户喜欢看 patch 写入后的 md5 校验和 push 命令的回显，确认到设备的链路通了

---

## 一次会话的标准节奏

1. **读用户描述 + 必要的日志**：mock.log / logcat / tombstone / 截图。一次性读完，不要反复打断用户去要更多信息
2. **三层定位**：服务端 → 客户端 cocos2d-x → Houdini，跳过已排除的层
3. **写 patch / 改 mock**：保留干净基线，记录每条改动的 why
4. **md5 验证 + push 回执**：让用户能自己校对设备和本地一致
5. **明确告诉用户**："我已 force-stop，请你手动启动 + 反馈现象"
6. **写 memory**：本次的非显然发现写到 `~\.claude\projects\C--javatools\memory\` 下，文件名 kebab-case，索引在 `MEMORY.md`

---

## 已知后续阻塞清单（写本提示词时未解决）

- ~~选宠界面文本错乱~~（用户已自己修复）
- ~~伊娃博士对话内容 `哈哈哈哈啊` 占位文本~~（ARM 上 GuideLayer 完整运行后文本正常）
- ~~伊娃对话框无法互动~~ **→ 已解决：ARM 真机 + patch `GameGuideManager::guideWalkToEva @ 0x46f97c` → BX LR**
- **MuMu x86_64 永远无法走过 Eva 对话**（Houdini 翻译层 bug 导致 GuideLayer 触摸路由永久损坏）
- ~~接任务后灰屏~~ **→ 已解决（2026-05-23）**：根因是引导系统在接任务后未调用 `endGuide()` 清理状态，导致 input/movement 残留锁。Frida trace 确认 EventSwallowLayer 已正确 remove、showMaskLayer 已 patch 为 no-op、isInGuide 返回 0——灰屏是网络等待遮罩，下面的游戏因 guide 未结束而拒绝交互。**修复：`guideWalkToEva @ 0x46f97c` 从单纯 BX LR 改为 `PUSH {R4, LR}; BL endGuide; POP {R4, PC}`**

## ARM 真机工作版本（2026-05-23）

**可用 APK**: `1_seers_final.apk`（基于 `arm_fixgray`，gray screen + push frame fixed）
- 二进制 patch: `guideWalkToEva @ 0x46f97c` → PUSH LR; BL endGuide; POP PC（8 字节）
- 所有 GuideLayer 函数**均未 patch**（ARM 原生执行）
- **push 帧格式已修复**：`mock_server.js` 中 `pushMessage` 的 `headerLen = headerProto.length`（不是 `4 + protoLen`）
- .so 基线: `libgame_logic.so.arm_fixgray`

### Frida 运行时修复（每次游戏启动后执行一次）

```bash
frida -H 127.0.0.1:27042 -l 1/frida_mine_autofix.js Gadget
```

autofix 做了：
1. 劫持 `submit_map_mine_info_out` Merge → 写入 item_id/count 到 msg+8/+12（挖矿 UI 显示）
2. 劫持 `one_t::IsInitialized` → 强制返回 true（绕过 proto 版本不匹配）
3. 劫持 `cli_get_item_out` Merge → 强制返回 true
4. 背包打开时调用 `removeEventSwallowLayer`（尝试修复退出按钮）
5. 挖矿后调用 `QuestManager::setProgress(10002, step=1)`

### Mock 服务器关键修复

- **push 帧**：`headerLen = headerProto.length`（行 408）
- **挖矿响应 body**：`[0a 00] + encodeUint32(2, oreIndex)` → Frida 读 oreIndex 映射真实 ID
- **矿石映射**：`oreIndexMap = {10001: 1(黄铁矿), 10023: 2(赤晶矿)}`
- **get_item 返回 null**（不发送响应，避免覆盖背包数据）
- **smali URL**：`http://127.0.0.1:8000/account_service.php`（真实设备 adb reverse）

### 已解决的 ARM 问题

| 问题 | 方案 |
|------|------|
| 伊娃对话阻塞 | `guideWalkToEva` → BL endGuide |
| 挖矿网络超时 | mock 回复 ≥ 4 字节 |
| `obtain_task` 缺失 | TASK_DEFS 添加 id=1 |
| `recheck_session` 角色丢失 | 返回已有角色 |
| 接任务后灰屏 | guideWalkToEva → BL endGuide 清理引导状态 |
| 挖矿 UI 无道具 | Frida 劫持 Merge 写入 msg+8/+12 |
| push 全部失败 | headerLen 多算 4 字节 → 修正为 protoLen |

### Proto 字段映射速查（编译后代码 vs Descriptor）

**`submit_map_mine_info_out`**: msg+8=mine_item_id, msg+12=mine_item_count
**`cli_notify_item_bag_updates_out`**: capacity(1), del_grid(2), new_grid(3), update_grid(4)
**`cli_notify_item_bag_updates_out_one_t`** (descriptor): grid_id(1), item_id(2), count(3), level(4), get_time(5), wearing(6), mon_uuid(7), prefix_id(8)
**`cli_get_item_out`**: capacity(1), one(2)  ← one_t: item_id(1), grid_id(2), count(3), level(4), get_time(5), wearing(6), mon_uuid(7), prefix_id(8)
**注意**: bag_updates 的 one_t 和 get_item_out 的 one_t 字段号不同！bag_updates_one_t 的 field1=grid_id，get_item_out_one_t 的 field1=item_id
**`one_t`** (实测编译后映射): wire field1→compiled field2(item_id@msg+8), wire field2→compiled field3(count@msg+12), 编译后 field1(required)无 wire 映射 → IsInitialized=false

### 待解决的阻塞（2026-05-23 更新）

**挖矿后道具不入背包** → 大部分已解决：
1. push 帧格式 bug（`headerLen = 4 + protoLen` 应为 `headerLen = protoLen`）→ **已修复**
2. `cli_notify_item_bag_updates_out` push 的 body 格式：
   - 父消息: capacity(field1), del_grid(field2), new_grid(field3, repeated one_t), update_grid(field4) → **已修复，mock 发送 capacity=999 + new_grid=field3**
   - one_t: 使用编译后映射 wire f1=item_id, wire f2=count（非 descriptor 的 grid_id/field1 → item_id/field2）
   - `one_t::IsInitialized()` 返回 false → **Frida 劫持 IsInitialized 返回 true**
3. `cli_get_item_out` 响应 **已禁用（return null）**，避免覆盖 push 写入的正确数据
4. **初始容量推送**：select_main_mon 时推送 capacity=999（`cli_notify_item_bag_updates_out` field1）
5. 背包 UI 退出按钮不响应（`frida_fix_bag.js` 或 autofix 中 removeEventSwallowLayer 已处理）

**道具入包链路已完全打通**：挖矿 → mock push bag update → merge 成功 → handler → `updateItemInBag` 被调用 → 道具写入背包。

**Capacity=0 问题**：可能是 UI 从非 proto 路径读取容量（如 UserData 静态成员或 Lua config），如果 proto push 不生效需 Frida 直接写内存。

## 关键 .so 版本

| 文件 | 用途 |
|------|------|
| `libgame_logic.so.prepatch_guide_v3` | **干净基线**（MuMu x86，GuideLayer 已 patch） |
| `libgame_logic.so.arm_working` | ARM 工作版（仅 walkToEva patch） |
| `libgame_logic.so.arm_fixgray` | **当前 APK 基线**（walkToEva→BL endGuide, 8 字节） |
| `libgame_logic.so.arm_fixtouch` | BattleFinishedLayer touch fix（**已回退**，系误报） |
| `magisk_patched_boot.img` | 已 patch 待刷入的 Magisk boot（未使用） |

---

## 决策树速查

> 游戏崩溃了 → 看 tombstone backtrace 里的符号 → 是 GuideLayer 系函数 → 加到 patch 列表
> 游戏卡住不进 → 看 logcat 最后一条 cocos2d-x 是什么 → 服务端没收 = UI hang，等用户截图；服务端收了 = 看回包格式
> 角色创建后断连 → 90% 是 mock 回包格式问题；查最近改了什么 4-byte body
> 一启动就崩 → 大概率 .so 被 patch 坏了，回滚到 `prepatch_guide_v3` 重做
> mock 行为反常 → 检查是不是有多个 node 进程，`tasklist | grep node`，killall 后重启
> **所有消息回复 body 必须 ≥ 4 字节**，0 或 2 字节导致 `invalid message body length: -2`
> **接任务后灰屏** → 等 root + Frida trace，**不要猜 patch**

---

最后：**这个项目有大量历史尝试散落在 `1/` 目录里（`frida_*.py`、`trace_*.py` 等），动手前先 `ls 1/` 找有没有现成的脚本可以复用，不要每次重写**。
