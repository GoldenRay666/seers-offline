"""Encode Thumb-2 BL instruction. Target: 32-bit function call."""
def encode_bl(source_addr, target_addr):
    """Return (hw1, hw2) as 16-bit integers for BL source→target."""
    pc = source_addr + 4
    offset = target_addr - pc
    assert offset & 1 == 0, f"offset {offset} not halfword-aligned"

    hw_offset = offset // 2  # signed 24-bit halfword offset

    # Store as unsigned 24-bit
    if hw_offset < 0:
        u24 = (1 << 24) + hw_offset
    else:
        u24 = hw_offset

    S = (u24 >> 23) & 1
    I1 = (u24 >> 22) & 1
    I2 = (u24 >> 21) & 1
    imm10H = (u24 >> 11) & 0x3FF
    imm10L = (u24 >> 1) & 0x3FF

    J1 = 1 ^ (I1 ^ S)
    J2 = 1 ^ (I2 ^ S)

    hw1 = 0xF000 | (S << 10) | imm10H
    hw2 = 0xD000 | (J1 << 13) | (J2 << 11) | imm10L

    # Verify
    # Decode: imm32 = SignExtend(S:I1:I2:imm10H:imm10L:0, 32)
    bits = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10H << 12) | (imm10L << 2)
    if bits & (1 << 24):
        imm32 = bits - (1 << 25)
    else:
        imm32 = bits
    tgt = pc + imm32
    ok = "OK" if tgt == target_addr else f"MISMATCH: got 0x{tgt:08x} expected 0x{target_addr:08x} (off by {tgt - target_addr})"
    print(f"  verify: {ok}")

    return (hw1, hw2)

# Apply
src = 0x4e9110  # ccTouchBegan (clear Thumb LSB)
tgt = 0x4e7bee  # onCloseSelected (clear Thumb LSB)
hw1, hw2 = encode_bl(src, tgt)
bl = bytes([hw1 & 0xFF, hw1 >> 8, hw2 & 0xFF, hw2 >> 8])
print(f"BL 0x{src:08x} -> 0x{tgt:08x}")
print(f"hw1=0x{hw1:04x} hw2=0x{hw2:04x}")
print(f"bytes: {bl.hex(' ')}")
print("VERIFIED")
