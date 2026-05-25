# 逆向分析工作流

## 核心限定

1. **SO 逻辑正确**：`libgame_logic.so` 的编译代码是正确的。不修改 SO 二进制。
2. **服务器接近原生**：Mock 服务器发送的 proto 格式要与真实服务器一致。用 IDA 反编译确认字段类型和 wire format。
3. **最小 Frida**：仅用于追踪和修复客户端 Dispatch 层的已知 bug（CodedInputStream 偏移）。

## 环境

| 配置项 | 值 |
|--------|-----|
| 游戏包名 | com.taomee.seers |
| SO 文件 | lib/armeabi/libgame_logic.so |
| ADB 设备 | MNMZGERSNJJFIF9X (Redmi ARM 真机) |
| Frida 连接 | Gadget 模式, `frida -H 127.0.0.1:27042 Gadget -l <script>` |
| IDA 反编译 | C:/javatools/1/ida_merge_dump.log (MergePartial 函数) |
| Git 仓库 | C:/javatools (origin: https://github.com/GoldenRay666/seers-offline.git) |

## 工作步骤

1. **IDA 分析**：反编译目标 proto 的 `MergePartialFromCodedStream`，确认字段类型、wire type、编译后偏移
2. **Mock 修复**：根据 IDA 结果修正 proto 编码
3. **Frida 追踪**：Hook merge 入口、dispatchMessage、关键 handler
4. **交叉验证**：对比 Frida 日志和 IDA 反编译
5. **备份**：关键突破后 git commit

## 已确认发现

### 挖矿 proto (`submit_map_mine_info_out`)
- Merge 地址: 0x5cb57e
- Field 1: INT32 (FieldType=5) → msg+8 (item_id)
- Field 2: INT32 (FieldType=5) → msg+12 (ore_index)
- 编码: 标准 varint，无 zigzag
- Mock 格式: `encodeUint32(1, itemId) + encodeUint32(2, oreIndex)`
- ✅ 纯原生 merge 返回 1，矿石图片正常

### 帧格式
- `respHeaderLen = respHeader.length`（不加 4）
- `totalMsgLen = 8 + respHeader.length + respBody.length`

### Dispatch 层 CodedInputStream 偏移 Bug
- dispatch 用 `body = msgData + headerLen` 计算 body 位置
- 缺少 +4 跳过 headerLen 字段自身
- 导致 CodedInputStream 的 buffer 指针偏 -4 字节
- Frida 修复: `cs.add(4).writePointer(buf.add(4))` 在 merge onEnter 中

### 背包物品 (`cli_notify_item_bag_updates_out_one_t`)
- Merge 地址: 0x5cdf08
- Field 1-6,8: INT32，Field 7: STRING
- Handler (0x62f8f9) 只处理 f2/f3/f4/f5/f6/f7，跳过 f1(item_id)
- `updateItemInBag` 布局：+0=item_id, +4=count（标准 SaveItem）
- ❌ 待解决：handler 存 count 到 +0，item_id 未写入

## 当前 Frida 脚本

`hook_trace.js`:
- Guide bypass (endGuide after map entry)
- CS_FIX: 修正 mining merge 的 CodedInputStream 偏移
- Mining merge trace + fallback autofix
- Bag update trace
- getItemWithGridID trace
- getItemBagDump / createItemScrollPage trace
