# 📄 Cheat Sheet — Number Systems & Data Representation

## Number System Bases

| System | Base | Digits Used |
|---|---|---|
| Binary | 2 | 0, 1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

## Quick Conversion Reference (0–15)

| Decimal | Binary | Octal | Hex |
|---|---|---|---|
| 0 | 0000 | 0 | 0 |
| 1 | 0001 | 1 | 1 |
| 2 | 0010 | 2 | 2 |
| 3 | 0011 | 3 | 3 |
| 4 | 0100 | 4 | 4 |
| 5 | 0101 | 5 | 5 |
| 6 | 0110 | 6 | 6 |
| 7 | 0111 | 7 | 7 |
| 8 | 1000 | 10 | 8 |
| 9 | 1001 | 11 | 9 |
| 10 | 1010 | 12 | A |
| 11 | 1011 | 13 | B |
| 12 | 1100 | 14 | C |
| 13 | 1101 | 15 | D |
| 14 | 1110 | 16 | E |
| 15 | 1111 | 17 | F |

## Conversion Methods

**Decimal → Binary:** Divide by 2 repeatedly, record remainders, read bottom-up.

**Binary → Decimal:** Multiply each bit by 2^(position), sum the results.
`1011 = (1×8)+(0×4)+(1×2)+(1×1) = 11`

**Binary → Hex:** Group bits into sets of 4 (right to left), convert each group.
`1011 0110 → B6`

**Hex → Binary:** Reverse — expand each hex digit into 4 binary bits.

## Memory Units (Powers of 2)

| Unit | Bytes |
|---|---|
| 1 Byte | 8 bits |
| 1 KB | 1,024 bytes (2¹⁰) |
| 1 MB | 1,024 KB (2²⁰) |
| 1 GB | 1,024 MB (2³⁰) |
| 1 TB | 1,024 GB (2⁴⁰) |

## Character Encoding

| Encoding | Characters Covered | Bits/Bytes per Character |
|---|---|---|
| ASCII | 128 (basic English + control chars) | 7 bits (1 byte) |
| Unicode | 140,000+ (all languages, symbols, emoji) | Varies by encoding |
| UTF-8 | Same as Unicode | 1–4 bytes (variable-width) |

## Common Uses in Web Development

- **Hex colors:** `#FF5733` — each pair of hex digits = Red, Green, Blue (0–255 each)
- **Binary flags/permissions:** Unix file permissions (e.g., `755`) are octal representations of binary permission bits
- **Character encoding declarations:** `<meta charset="UTF-8">` in every HTML document