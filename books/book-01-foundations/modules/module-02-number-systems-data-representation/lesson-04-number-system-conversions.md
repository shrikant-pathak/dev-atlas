# Lesson 04 – Number System Conversions

# Part 1 – Introduction to Number System Conversion

## Introduction

Computers understand and process information using the **Binary Number System (Base-2)**.

However, humans normally use the **Decimal Number System (Base-10)** for everyday calculations.

Because computers and humans use different number systems, we need a way to convert values between different formats.

This process is called:

# Number System Conversion

---

# What is Number System Conversion?

Number system conversion is the process of changing a number from one base system into another while keeping the same numerical value.

The value remains the same, but its representation changes.

Example:

Decimal:

```
10₁₀
```

Binary:

```
1010₂
```

Hexadecimal:

```
A₁₆
```

All represent the same value:

```
Ten
```

---

# Why Do We Need Number System Conversion?

Different number systems are useful in different areas of computing.

## Decimal

Used by humans:

- Counting
- Finance
- Measurements
- Daily calculations

Example:

```
500
```

---

## Binary

Used by computers:

- CPU operations
- Memory storage
- Digital circuits
- Machine instructions

Example:

```
111110100
```

---

## Octal

Used in specific computing areas:

- UNIX/Linux permissions
- Legacy systems
- Embedded systems

Example:

```
755₈
```

---

## Hexadecimal

Used by programmers and engineers:

- Memory addresses
- Debugging
- Programming
- Web colors
- Machine-level operations

Example:

```
0xFF
```

---

# Relationship Between Number Systems

The most important relationships are:

## Binary and Octal

One octal digit represents three binary bits.

Example:

```
111₂ = 7₈
```

Because:

```
111₂
=
7₈
```

---

## Binary and Hexadecimal

One hexadecimal digit represents four binary bits.

Example:

```
1111₂ = F₁₆
```

Because:

```
1111₂
=
15₁₀
=
F₁₆
```

---

# Common Number System Conversions

In computing, the most common conversions are:

## Decimal ↔ Binary

Examples:

```
25₁₀ → 11001₂

11001₂ → 25₁₀
```

Used when:

- Understanding computer storage
- Learning programming fundamentals
- Studying computer architecture

---

## Decimal ↔ Octal

Examples:

```
64₁₀ → 100₈

100₈ → 64₁₀
```

Used mainly in:

- UNIX/Linux permissions
- Older systems

---

## Decimal ↔ Hexadecimal

Examples:

```
255₁₀ → FF₁₆

FF₁₆ → 255₁₀
```

Used frequently in:

- Programming
- Memory representation
- Web development

---

## Binary ↔ Hexadecimal

Example:

```
11111111₂
```

becomes:

```
FF₁₆
```

This conversion is common because hexadecimal provides a shorter representation of binary data.

---

# Positional Value Reminder

All conversions depend on place value.

Example:

Decimal:

```
345
```

means:

```
3×100 + 4×10 + 5×1
```

Binary:

```
1011₂
```

means:

```
1×8 + 0×4 + 1×2 + 1×1
```

=

```
11₁₀
```

---

# Conversion Methods

Different conversions use different techniques.

## Decimal to Binary

Method:

```
Repeated division by 2
```

---

## Binary to Decimal

Method:

```
Multiply each bit by its positional value
```

---

## Decimal to Octal

Method:

```
Repeated division by 8
```

---

## Decimal to Hexadecimal

Method:

```
Repeated division by 16
```

---

## Binary to Hexadecimal

Method:

```
Group bits into groups of four
```

---

# Real-World Example

When a developer writes:

```css
color: #FF0000;
```

The computer internally interprets:

```
FF
↓
11111111
↓
Binary values
↓
Digital signals
```

Similarly, when a programmer debugs memory:

```
0x7FFE1234
```

they are reading a hexadecimal representation of binary data.

---

# Importance for Developers

Understanding conversions helps developers:

- Read memory addresses.
- Understand data storage.
- Debug programs.
- Work with low-level systems.
- Understand networking.
- Work with embedded devices.
- Understand computer architecture.

---

# Key Takeaways

- Number system conversion changes representation without changing value.
- Computers use binary internally.
- Humans commonly use decimal.
- Programmers frequently use hexadecimal.
- Octal is still used in specific computing areas.
- Binary connects all number systems used in computers.
- Conversion skills are essential for understanding how computers store and process data.

---

## Quick Knowledge Check

1. What is number system conversion?

2. Why do computers use binary?

3. Which number system is commonly used by programmers?

4. How many binary bits represent one hexadecimal digit?

5. How many binary bits represent one octal digit?

6. What method is used for decimal-to-binary conversion?


# Part 2 – Decimal to Binary Conversion

## Introduction

The Decimal Number System is the number system used by humans in everyday life.

It is based on:

```
Base = 10
```

It uses ten digits:

```
0, 1, 2, 3, 4, 5, 6, 7, 8, 9
```

Examples of decimal numbers:

```
25₁₀
100₁₀
500₁₀
```

Computers, however, do not understand decimal numbers directly.

Inside a computer, all information is represented using the:

```
Binary Number System
```

Binary is based on:

```
Base = 2
```

and uses only two digits:

```
0 and 1
```

Examples:

```
1010₂
11001₂
11111111₂
```

Therefore, decimal-to-binary conversion is one of the most important concepts in computer fundamentals.

---

# What is Decimal to Binary Conversion?

Decimal-to-binary conversion is the process of converting a number from:

```
Decimal (Base 10)
```

to:

```
Binary (Base 2)
```

The numerical value remains the same.

Only the representation changes.

Example:

```
Decimal:

10₁₀


Binary:

1010₂
```

Both represent the same value.

---

# Why Convert Decimal to Binary?

Computers use binary internally because electronic circuits have two stable states:

```
ON  → 1

OFF → 0
```

Every piece of information inside a computer eventually becomes binary:

- Numbers
- Text
- Images
- Videos
- Programs
- Instructions

Developers and computer engineers convert between decimal and binary to understand how computers store and process data.

---

# Decimal to Binary Conversion Method

The most common method is:

# Repeated Division by 2 Method

## Steps:

1. Divide the decimal number by 2.
2. Record the remainder.
3. Divide the quotient again by 2.
4. Continue until the quotient becomes 0.
5. Read the remainders from bottom to top.

The final sequence of remainders is the binary equivalent.

---

# Example 1 – Convert 10₁₀ to Binary

Convert:

```
10₁₀
```

Step-by-step division:

```
10 ÷ 2 = 5 remainder 0

5 ÷ 2 = 2 remainder 1

2 ÷ 2 = 1 remainder 0

1 ÷ 2 = 0 remainder 1
```

Now collect the remainders from bottom to top:

```
1010
```

Therefore:

```
10₁₀ = 1010₂
```

---

## Verification

To verify the answer, convert binary back to decimal.

Binary:

```
1010₂
```

Using positional values:

```
(1 × 2³)
+
(0 × 2²)
+
(1 × 2¹)
+
(0 × 2⁰)
```

Calculation:

```
(1 × 8)
+
(0 × 4)
+
(1 × 2)
+
(0 × 1)

= 8 + 0 + 2 + 0

= 10
```

Therefore:

```
1010₂ = 10₁₀
```

---

# Example 2 – Convert 25₁₀ to Binary

Convert:

```
25₁₀
```

Division process:

```
25 ÷ 2 = 12 remainder 1

12 ÷ 2 = 6 remainder 0

6 ÷ 2 = 3 remainder 0

3 ÷ 2 = 1 remainder 1

1 ÷ 2 = 0 remainder 1
```

Read the remainders from bottom to top:

```
11001
```

Therefore:

```
25₁₀ = 11001₂
```

---

## Verification

```
11001₂
```

Position values:

```
1 × 2⁴
+
1 × 2³
+
0 × 2²
+
0 × 2¹
+
1 × 2⁰
```

Calculation:

```
16 + 8 + 0 + 0 + 1

= 25
```

Therefore:

```
11001₂ = 25₁₀
```

---

# Example 3 – Convert 50₁₀ to Binary

Convert:

```
50₁₀
```

Division process:

```
50 ÷ 2 = 25 remainder 0

25 ÷ 2 = 12 remainder 1

12 ÷ 2 = 6 remainder 0

6 ÷ 2 = 3 remainder 0

3 ÷ 2 = 1 remainder 1

1 ÷ 2 = 0 remainder 1
```

Reading remainders from bottom to top:

```
110010
```

Therefore:

```
50₁₀ = 110010₂
```

---

# Alternative Method – Using Powers of Two

Binary numbers are based on powers of two.

Common binary positions:

| Power | Value |
|---|---:|
| 2⁰ | 1 |
| 2¹ | 2 |
| 2² | 4 |
| 2³ | 8 |
| 2⁴ | 16 |
| 2⁵ | 32 |
| 2⁶ | 64 |
| 2⁷ | 128 |

---

# Example – Convert 45₁₀ to Binary

Find powers of two that add up to 45.

```
45 = 32 + 8 + 4 + 1
```

Arrange positions:

|32|16|8|4|2|1|
|-|-|-|-|-|-|
|1|0|1|1|0|1|

Therefore:

```
45₁₀ = 101101₂
```

---

# Decimal to Binary Conversion Table

| Decimal | Binary |
|---|---|
| 0 | 0 |
| 1 | 1 |
| 2 | 10 |
| 3 | 11 |
| 4 | 100 |
| 5 | 101 |
| 6 | 110 |
| 7 | 111 |
| 8 | 1000 |
| 9 | 1001 |
| 10 | 1010 |
| 15 | 1111 |
| 16 | 10000 |
| 20 | 10100 |
| 25 | 11001 |

---

# Common Mistakes

## Mistake 1: Reading remainders in the wrong direction

Incorrect:

```
Top to bottom
```

Correct:

```
Bottom to top
```

---

## Mistake 2: Forgetting binary place values

Binary positions start from:

```
2⁰ = 1
```

and increase:

```
2¹ = 2

2² = 4

2³ = 8
```

---

## Mistake 3: Not verifying the result

Always verify:

```
Binary → Decimal
```

to confirm the conversion.

---

# Real-World Applications

Decimal-to-binary conversion is used in:

## Computer Memory

Understanding how values are stored.

---

## Programming

Understanding:

- Data types
- Bit operations
- Low-level programming

---

## Networking

Understanding:

- IP addresses
- Network masks
- Binary calculations

---

## Computer Architecture

Understanding:

- CPU operations
- Machine instructions
- Hardware circuits

---

# Key Takeaways

- Decimal uses base 10.
- Binary uses base 2.
- Computers store information using binary.
- Decimal-to-binary conversion uses repeated division by 2.
- Remainders are read from bottom to top.
- Binary values can be verified using powers of two.
- Understanding conversions helps programmers understand how computers work internally.

---

# Quick Knowledge Check

1. What base does the decimal number system use?

2. What digits are used in binary?

3. Which method is commonly used for decimal-to-binary conversion?

4. Convert:

```
5₁₀ = ?
```

5. Convert:

```
20₁₀ = ?
```

6. Convert:

```
100₁₀ = ?
```

7. Why do computers convert decimal values into binary?

---

# End of Part 2

Next:

## Part 3 – Binary to Decimal Conversion
---

# Part 3 – Binary to Decimal Conversion

## Introduction

In the previous part, we learned how to convert decimal numbers into binary numbers. In this section, we will learn the reverse process—converting binary numbers back into decimal numbers.

Computers internally store all numerical values in binary format. However, humans generally find decimal numbers easier to read and understand. Binary-to-decimal conversion helps programmers, engineers, and students interpret the values stored and processed by computer systems.

---

# What is Binary to Decimal Conversion?

Binary-to-decimal conversion is the process of converting a binary (base-2) number into its equivalent decimal (base-10) number.

Unlike decimal-to-binary conversion, this method does not use repeated division. Instead, each binary digit is multiplied by its positional value (a power of 2), and the results are added together.

Example:

```
1010₂ = 10₁₀
```

The value remains the same; only the number system changes.

---

# Understanding Binary Place Values

Every position in a binary number represents a power of 2.

| Binary Position | Power of 2 | Decimal Value |
|----------------:|-----------:|--------------:|
| 7 | 2⁷ | 128 |
| 6 | 2⁶ | 64 |
| 5 | 2⁵ | 32 |
| 4 | 2⁴ | 16 |
| 3 | 2³ | 8 |
| 2 | 2² | 4 |
| 1 | 2¹ | 2 |
| 0 | 2⁰ | 1 |

The rightmost bit always represents:

```
2⁰ = 1
```

Each position to the left doubles in value.

---

# Binary to Decimal Conversion Method

Follow these steps:

1. Write the binary number.
2. Assign powers of 2 from right to left.
3. Multiply each binary digit by its corresponding positional value.
4. Add all the products together.
5. The sum is the decimal equivalent.

---

# Example 1 – Convert 1010₂ to Decimal

Binary number:

```
1010₂
```

Assign positional values:

| Binary Digit | 1 | 0 | 1 | 0 |
|--------------|---|---|---|---|
| Power of 2   | 2³ | 2² | 2¹ | 2⁰ |
| Decimal Value| 8 | 4 | 2 | 1 |

Multiply each digit by its positional value:

```
(1 × 8)
+
(0 × 4)
+
(1 × 2)
+
(0 × 1)
```

Calculation:

```
8 + 0 + 2 + 0 = 10
```

Therefore,

```
1010₂ = 10₁₀
```

---

# Example 2 – Convert 11001₂ to Decimal

Binary number:

```
11001₂
```

Assign positional values:

| Binary Digit | 1 | 1 | 0 | 0 | 1 |
|--------------|---|---|---|---|---|
| Power of 2   | 2⁴ | 2³ | 2² | 2¹ | 2⁰ |
| Decimal Value| 16 | 8 | 4 | 2 | 1 |

Calculation:

```
(1 × 16)
+
(1 × 8)
+
(0 × 4)
+
(0 × 2)
+
(1 × 1)

= 16 + 8 + 0 + 0 + 1

= 25
```

Therefore,

```
11001₂ = 25₁₀
```

---

# Example 3 – Convert 11111111₂ to Decimal

Binary number:

```
11111111₂
```

Calculation:

```
128 + 64 + 32 + 16 + 8 + 4 + 2 + 1

= 255
```

Therefore,

```
11111111₂ = 255₁₀
```

---

# Example 4 – Convert 100000₂ to Decimal

Binary number:

```
100000₂
```

Calculation:

```
(1 × 32)
+
(0 × 16)
+
(0 × 8)
+
(0 × 4)
+
(0 × 2)
+
(0 × 1)

= 32
```

Therefore,

```
100000₂ = 32₁₀
```

---

# Shortcut Method

For smaller binary numbers, identify only the positions containing **1** and add their decimal values.

Example:

```
101101₂
```

Position values:

|32|16|8|4|2|1|
|--|--|--|--|--|--|
|1|0|1|1|0|1|

Calculation:

```
32 + 8 + 4 + 1

= 45
```

Therefore,

```
101101₂ = 45₁₀
```

---

# Binary to Decimal Conversion Table

| Binary | Decimal |
|---------|--------:|
| 0 | 0 |
| 1 | 1 |
| 10 | 2 |
| 11 | 3 |
| 100 | 4 |
| 101 | 5 |
| 110 | 6 |
| 111 | 7 |
| 1000 | 8 |
| 1001 | 9 |
| 1010 | 10 |
| 1111 | 15 |
| 10000 | 16 |
| 11001 | 25 |
| 11111111 | 255 |

---

# Real-World Applications

Binary-to-decimal conversion is widely used in:

- Reading memory values
- Computer architecture
- Network addressing
- Digital electronics
- Embedded systems
- Operating systems
- Programming and debugging

---

# Common Mistakes

## 1. Starting place values from the left

Always start with **2⁰** at the **rightmost** bit.

---

## 2. Adding every positional value

Only add the positional values where the binary digit is **1**.

---

## 3. Using powers of 10 instead of powers of 2

Binary numbers always use powers of **2**, never powers of **10**.

---

# Key Takeaways

- Binary numbers use base 2.
- Decimal numbers use base 10.
- Every binary position represents a power of 2.
- The rightmost bit always has a value of 1 (2⁰).
- Only positions containing **1** contribute to the decimal value.
- Binary-to-decimal conversion is essential for understanding how computers represent and process data.

---

## Quick Knowledge Check

1. What is the decimal value of `101₂`?

2. Convert `1111₂` into decimal.

3. Convert `10000₂` into decimal.

4. Which positional value does the rightmost binary digit represent?

5. Why is binary-to-decimal conversion important in programming?

6. Convert `100101₂` into decimal.


---

# Part 4 – Decimal to Octal Conversion

## Introduction

In the previous parts, we learned how to convert numbers between the decimal and binary number systems. Another important number system used in computing is the **Octal Number System (Base-8)**.

Although octal is not as widely used today as binary or hexadecimal, it still plays an important role in areas such as UNIX/Linux file permissions, embedded systems, and digital electronics.

Learning decimal-to-octal conversion helps build a strong understanding of positional number systems and prepares learners for more advanced computer science topics.

---

# What is Decimal to Octal Conversion?

Decimal-to-octal conversion is the process of converting a decimal (base-10) number into its equivalent octal (base-8) number.

The value of the number remains the same; only its representation changes.

Example:

```
64₁₀ = 100₈
```

Both numbers represent the same value.

---

# Understanding the Octal Number System

The octal number system uses:

```
Base = 8
```

It contains only eight digits:

```
0, 1, 2, 3, 4, 5, 6, 7
```

Unlike the decimal system, octal numbers cannot contain the digits:

```
8 or 9
```

Example of valid octal numbers:

```
7₈
25₈
146₈
755₈
```

Invalid octal numbers:

```
89₈
128₈
```

because they contain digits that do not exist in the octal system.

---

# Why is Octal Used?

Octal provides a shorter representation of binary numbers.

Every octal digit represents exactly **three binary bits**.

Example:

| Binary | Octal |
|--------|------:|
| 000 | 0 |
| 001 | 1 |
| 010 | 2 |
| 011 | 3 |
| 100 | 4 |
| 101 | 5 |
| 110 | 6 |
| 111 | 7 |

This relationship makes octal useful for representing binary values more compactly.

---

# Decimal to Octal Conversion Method

The most common method is:

## Repeated Division by 8

### Steps

1. Divide the decimal number by 8.
2. Record the remainder.
3. Divide the quotient by 8 again.
4. Continue until the quotient becomes 0.
5. Read the remainders from bottom to top.

The resulting sequence is the octal equivalent.

---

# Example 1 – Convert 64₁₀ to Octal

Convert:

```
64₁₀
```

Division process:

```
64 ÷ 8 = 8 remainder 0

8 ÷ 8 = 1 remainder 0

1 ÷ 8 = 0 remainder 1
```

Read the remainders from bottom to top:

```
100
```

Therefore:

```
64₁₀ = 100₈
```

---

## Verification

Convert the octal number back into decimal.

```
100₈
```

Calculation:

```
(1 × 8²)

+

(0 × 8¹)

+

(0 × 8⁰)

= 64
```

Therefore,

```
100₈ = 64₁₀
```

---

# Example 2 – Convert 83₁₀ to Octal

Division process:

```
83 ÷ 8 = 10 remainder 3

10 ÷ 8 = 1 remainder 2

1 ÷ 8 = 0 remainder 1
```

Read upward:

```
123
```

Therefore:

```
83₁₀ = 123₈
```

Verification:

```
(1 × 64)

+

(2 × 8)

+

(3 × 1)

=

64 + 16 + 3

= 83
```

---

# Example 3 – Convert 125₁₀ to Octal

Division process:

```
125 ÷ 8 = 15 remainder 5

15 ÷ 8 = 1 remainder 7

1 ÷ 8 = 0 remainder 1
```

Read upward:

```
175
```

Therefore:

```
125₁₀ = 175₈
```

---

# Example 4 – Convert 255₁₀ to Octal

Division process:

```
255 ÷ 8 = 31 remainder 7

31 ÷ 8 = 3 remainder 7

3 ÷ 8 = 0 remainder 3
```

Read upward:

```
377
```

Therefore:

```
255₁₀ = 377₈
```

---

# Decimal to Octal Conversion Table

| Decimal | Octal |
|---------:|------:|
| 0 | 0 |
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |
| 5 | 5 |
| 6 | 6 |
| 7 | 7 |
| 8 | 10 |
| 9 | 11 |
| 10 | 12 |
| 15 | 17 |
| 16 | 20 |
| 32 | 40 |
| 64 | 100 |
| 83 | 123 |
| 125 | 175 |
| 255 | 377 |

---

# Relationship Between Binary and Octal

Each octal digit corresponds to exactly **three binary bits**.

| Octal | Binary |
|------:|:------|
| 0 | 000 |
| 1 | 001 |
| 2 | 010 |
| 3 | 011 |
| 4 | 100 |
| 5 | 101 |
| 6 | 110 |
| 7 | 111 |

Example:

```
101101₂
```

Group into three bits:

```
101 101
```

Convert each group:

```
101 = 5

101 = 5
```

Therefore:

```
101101₂ = 55₈
```

---

# Real-World Applications

Decimal-to-octal conversion is useful in:

- UNIX/Linux file permissions
- Embedded systems
- Digital electronics
- Legacy computer systems
- Computer science education

Example:

Linux permissions:

```
755
644
777
600
```

These values are written in octal notation.

---

# Common Mistakes

## Mistake 1: Dividing by 10 instead of 8

Always divide by the base of the target number system.

For octal:

```
Divide by 8
```

---

## Mistake 2: Reading remainders from top to bottom

Always read the remainders:

```
Bottom → Top
```

---

## Mistake 3: Using digits 8 or 9

Octal numbers only contain:

```
0–7
```

Digits 8 and 9 are never valid in an octal number.

---

# Key Takeaways

- Octal uses base 8.
- Octal digits range from 0 to 7.
- Decimal-to-octal conversion uses repeated division by 8.
- Read the remainders from bottom to top.
- One octal digit represents three binary bits.
- Octal is still important in UNIX/Linux systems and digital electronics.

---

## Quick Knowledge Check

1. What is the base of the octal number system?

2. Which digits are valid in octal numbers?

3. Convert **64₁₀** into octal.

4. Convert **125₁₀** into octal.

5. How many binary bits are represented by one octal digit?

6. Why is octal still used in modern computing?


---

# Part 5 – Octal to Decimal Conversion

## Introduction

In the previous part, we learned how to convert decimal numbers into octal numbers. In this section, we will learn the reverse process—converting octal numbers back into decimal numbers.

Although octal numbers are less common than decimal or binary in everyday computing, they are still widely used in UNIX/Linux file permissions, embedded systems, and digital electronics. Understanding octal-to-decimal conversion helps programmers interpret octal values correctly.

---

# What is Octal to Decimal Conversion?

Octal-to-decimal conversion is the process of converting a number from the **Octal Number System (Base-8)** to the **Decimal Number System (Base-10)**.

The value of the number remains unchanged. Only its representation changes.

Example:

```
100₈ = 64₁₀
```

Both numbers represent the same value.

---

# Understanding Octal Place Values

Every position in an octal number represents a power of **8**.

| Octal Position | Power of 8 | Decimal Value |
|---------------:|-----------:|--------------:|
| 5 | 8⁵ | 32768 |
| 4 | 8⁴ | 4096 |
| 3 | 8³ | 512 |
| 2 | 8² | 64 |
| 1 | 8¹ | 8 |
| 0 | 8⁰ | 1 |

The rightmost digit always represents:

```
8⁰ = 1
```

Each position to the left is multiplied by another power of 8.

---

# Octal to Decimal Conversion Method

Follow these steps:

1. Write the octal number.
2. Assign powers of 8 from right to left.
3. Multiply each octal digit by its positional value.
4. Add all the products together.
5. The sum is the decimal equivalent.

---

# Example 1 – Convert 100₈ to Decimal

Octal number:

```
100₈
```

Assign place values:

| Octal Digit | 1 | 0 | 0 |
|-------------|---|---|---|
| Power of 8  | 8² | 8¹ | 8⁰ |
| Decimal Value | 64 | 8 | 1 |

Calculation:

```
(1 × 64)

+

(0 × 8)

+

(0 × 1)

= 64
```

Therefore,

```
100₈ = 64₁₀
```

---

# Example 2 – Convert 123₈ to Decimal

Octal number:

```
123₈
```

Calculation:

```
(1 × 8²)

+

(2 × 8¹)

+

(3 × 8⁰)

=

(1 × 64)

+

(2 × 8)

+

(3 × 1)

=

64 + 16 + 3

= 83
```

Therefore,

```
123₈ = 83₁₀
```

---

# Example 3 – Convert 175₈ to Decimal

Calculation:

```
(1 × 64)

+

(7 × 8)

+

(5 × 1)

=

64 + 56 + 5

= 125
```

Therefore,

```
175₈ = 125₁₀
```

---

# Example 4 – Convert 377₈ to Decimal

Calculation:

```
(3 × 64)

+

(7 × 8)

+

(7 × 1)

=

192 + 56 + 7

= 255
```

Therefore,

```
377₈ = 255₁₀
```

---

# Shortcut Method

Remember the positional values of octal numbers:

| Position | Value |
|---------:|------:|
| 8⁰ | 1 |
| 8¹ | 8 |
| 8² | 64 |
| 8³ | 512 |
| 8⁴ | 4096 |

Multiply each digit by its corresponding positional value and add the results.

---

# Octal to Decimal Conversion Table

| Octal | Decimal |
|------:|--------:|
| 0 | 0 |
| 1 | 1 |
| 7 | 7 |
| 10 | 8 |
| 11 | 9 |
| 12 | 10 |
| 17 | 15 |
| 20 | 16 |
| 40 | 32 |
| 100 | 64 |
| 123 | 83 |
| 175 | 125 |
| 377 | 255 |

---

# Relationship Between Octal and Binary

Each octal digit represents exactly **three binary bits**.

| Octal | Binary |
|------:|:------|
| 0 | 000 |
| 1 | 001 |
| 2 | 010 |
| 3 | 011 |
| 4 | 100 |
| 5 | 101 |
| 6 | 110 |
| 7 | 111 |

Example:

```
55₈
```

Convert each digit:

```
5 → 101

5 → 101
```

Binary:

```
101101₂
```

---

# Real-World Applications

Octal-to-decimal conversion is useful in:

- Reading UNIX/Linux file permissions
- Embedded systems
- Digital electronics
- Legacy computer systems
- Understanding binary grouping

---

# Common Mistakes

## Mistake 1: Using powers of 10

Octal numbers use powers of:

```
8
```

not powers of 10.

---

## Mistake 2: Starting from the left

Always assign:

```
8⁰
```

to the **rightmost** digit.

---

## Mistake 3: Incorrect multiplication

Multiply every digit by its correct positional value before adding the results.

---

# Key Takeaways

- Octal uses base 8.
- Every position represents a power of 8.
- The rightmost digit has a value of **8⁰ = 1**.
- Multiply each digit by its positional value and add the results.
- Octal-to-decimal conversion is commonly used when interpreting UNIX/Linux permissions and embedded system values.

---

## Quick Knowledge Check

1. What is the base of the octal number system?

2. Convert **100₈** into decimal.

3. Convert **123₈** into decimal.

4. Convert **377₈** into decimal.

5. Which positional value does the rightmost octal digit represent?

6. Where is octal notation commonly used in modern computing?


---

# Part 6 – Decimal to Hexadecimal Conversion

## Introduction

In the previous parts, we learned how to convert decimal numbers into binary and octal numbers. Another important number system used extensively in computing is the **Hexadecimal Number System (Base-16)**.

Hexadecimal provides a compact and human-readable representation of binary numbers. Since computers internally store data in binary, programmers often use hexadecimal to simplify reading, writing, and debugging binary values.

Learning decimal-to-hexadecimal conversion is an essential skill for programmers, system administrators, cybersecurity professionals, and computer engineers.

---

# What is Decimal to Hexadecimal Conversion?

Decimal-to-hexadecimal conversion is the process of converting a decimal (base-10) number into its hexadecimal (base-16) equivalent.

The value of the number remains the same; only its representation changes.

Example:

```
255₁₀ = FF₁₆
```

Both numbers represent the same value.

---

# Understanding the Hexadecimal Number System

The hexadecimal number system uses:

```
Base = 16
```

It consists of sixteen symbols.

| Decimal | Hexadecimal |
|---------:|:-----------:|
| 0 | 0 |
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |
| 5 | 5 |
| 6 | 6 |
| 7 | 7 |
| 8 | 8 |
| 9 | 9 |
| 10 | A |
| 11 | B |
| 12 | C |
| 13 | D |
| 14 | E |
| 15 | F |

After the digit 9, letters are used instead of new numeric symbols.

```
A = 10
B = 11
C = 12
D = 13
E = 14
F = 15
```

---

# Why is Hexadecimal Used?

Hexadecimal is widely used because it is much shorter than binary.

Every hexadecimal digit represents exactly **four binary bits**.

Example:

| Binary | Hexadecimal |
|:------:|:-----------:|
| 0000 | 0 |
| 0001 | 1 |
| 0010 | 2 |
| 0011 | 3 |
| 0100 | 4 |
| 0101 | 5 |
| 0110 | 6 |
| 0111 | 7 |
| 1000 | 8 |
| 1001 | 9 |
| 1010 | A |
| 1011 | B |
| 1100 | C |
| 1101 | D |
| 1110 | E |
| 1111 | F |

Instead of writing:

```
11111111₂
```

we simply write:

```
FF₁₆
```

---

# Decimal to Hexadecimal Conversion Method

The most common method is:

## Repeated Division by 16

### Steps

1. Divide the decimal number by 16.
2. Record the remainder.
3. Divide the quotient by 16 again.
4. Continue until the quotient becomes 0.
5. Convert remainders greater than 9 into hexadecimal letters.
6. Read the remainders from bottom to top.

The resulting sequence is the hexadecimal equivalent.

---

# Example 1 – Convert 255₁₀ to Hexadecimal

Division process:

```
255 ÷ 16 = 15 remainder 15

15 ÷ 16 = 0 remainder 15
```

Convert the remainders:

```
15 = F
```

Read upward:

```
FF
```

Therefore,

```
255₁₀ = FF₁₆
```

---

## Verification

Convert the hexadecimal number back into decimal.

```
FF₁₆
```

Calculation:

```
(F × 16¹)

+

(F × 16⁰)

=

(15 × 16)

+

(15 × 1)

=

240 + 15

= 255
```

---

# Example 2 – Convert 26₁₀ to Hexadecimal

Division process:

```
26 ÷ 16 = 1 remainder 10

1 ÷ 16 = 0 remainder 1
```

Convert:

```
10 = A
```

Read upward:

```
1A
```

Therefore,

```
26₁₀ = 1A₁₆
```

---

# Example 3 – Convert 100₁₀ to Hexadecimal

Division process:

```
100 ÷ 16 = 6 remainder 4

6 ÷ 16 = 0 remainder 6
```

Read upward:

```
64
```

Therefore,

```
100₁₀ = 64₁₆
```

---

# Example 4 – Convert 4095₁₀ to Hexadecimal

Division process:

```
4095 ÷ 16 = 255 remainder 15

255 ÷ 16 = 15 remainder 15

15 ÷ 16 = 0 remainder 15
```

Convert:

```
15 = F
```

Read upward:

```
FFF
```

Therefore,

```
4095₁₀ = FFF₁₆
```

---

# Decimal to Hexadecimal Conversion Table

| Decimal | Hexadecimal |
|---------:|:-----------:|
| 0 | 0 |
| 1 | 1 |
| 10 | A |
| 15 | F |
| 16 | 10 |
| 26 | 1A |
| 31 | 1F |
| 64 | 40 |
| 100 | 64 |
| 127 | 7F |
| 128 | 80 |
| 255 | FF |
| 512 | 200 |
| 1024 | 400 |
| 4095 | FFF |

---

# Relationship Between Binary and Hexadecimal

Each hexadecimal digit represents exactly **four binary bits**.

| Hexadecimal | Binary |
|:-----------:|:------:|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| 4 | 0100 |
| 5 | 0101 |
| 6 | 0110 |
| 7 | 0111 |
| 8 | 1000 |
| 9 | 1001 |
| A | 1010 |
| B | 1011 |
| C | 1100 |
| D | 1101 |
| E | 1110 |
| F | 1111 |

Example:

```
11111111₂
```

Group into four bits:

```
1111 1111
```

Convert each group:

```
1111 = F

1111 = F
```

Therefore,

```
11111111₂ = FF₁₆
```

---

# Real-World Applications

Hexadecimal is widely used in:

- Memory addresses
- Computer architecture
- Machine code
- Debugging software
- Operating systems
- Network protocols
- Digital electronics
- Web development (CSS colors)

Examples:

Memory address:

```
0x7FFE1234
```

CSS color:

```css
#FF0000
```

IPv6 address:

```
2001:0DB8::1
```

---

# Common Mistakes

## Mistake 1: Forgetting hexadecimal letters

Remember:

```
A = 10
B = 11
C = 12
D = 13
E = 14
F = 15
```

---

## Mistake 2: Reading remainders in the wrong direction

Always read the remainders:

```
Bottom → Top
```

---

## Mistake 3: Dividing by 10

Hexadecimal uses:

```
Base = 16
```

Always divide by **16**, not by 10.

---

# Key Takeaways

- Hexadecimal uses base 16.
- It contains sixteen symbols: 0–9 and A–F.
- Decimal-to-hexadecimal conversion uses repeated division by 16.
- Read remainders from bottom to top.
- One hexadecimal digit represents four binary bits.
- Hexadecimal provides a compact representation of binary data.
- Hexadecimal is widely used in programming, networking, cybersecurity, and computer architecture.

---

## Quick Knowledge Check

1. What is the base of the hexadecimal number system?

2. Which hexadecimal digit represents the decimal value 15?

3. Convert **26₁₀** into hexadecimal.

4. Convert **255₁₀** into hexadecimal.

5. How many binary bits are represented by one hexadecimal digit?

6. Name three real-world applications of hexadecimal numbers.


---

# Part 7 – Binary and Hexadecimal Conversion

## Introduction

Binary and hexadecimal are the two most commonly used number systems in computer science. Computers process and store data in binary, while programmers often use hexadecimal because it provides a shorter and more readable representation of binary values.

Instead of writing long binary numbers, developers can represent the same information using hexadecimal digits. Since one hexadecimal digit corresponds to exactly four binary bits, conversions between binary and hexadecimal are quick and efficient.

Understanding binary and hexadecimal conversion is an essential skill for programming, debugging, networking, cybersecurity, operating systems, and computer architecture.

---

# Relationship Between Binary and Hexadecimal

The hexadecimal number system uses **Base-16**, while the binary number system uses **Base-2**.

The relationship between them is straightforward:

```
1 Hexadecimal Digit = 4 Binary Bits
```

This means every group of four binary digits (called a **nibble**) can be represented by one hexadecimal digit.

Example:

```
1111₂ = F₁₆
```

```
1010₂ = A₁₆
```

```
1100₂ = C₁₆
```

---

# Binary to Hexadecimal Conversion

To convert a binary number into hexadecimal:

1. Start grouping the binary digits from the **right**.
2. Form groups of **four bits**.
3. Add leading zeros if the leftmost group has fewer than four bits.
4. Replace each group with its hexadecimal equivalent.

---

# Binary to Hexadecimal Conversion Table

| Binary | Hexadecimal |
|:------:|:-----------:|
|0000|0|
|0001|1|
|0010|2|
|0011|3|
|0100|4|
|0101|5|
|0110|6|
|0111|7|
|1000|8|
|1001|9|
|1010|A|
|1011|B|
|1100|C|
|1101|D|
|1110|E|
|1111|F|

---

# Example 1 – Convert 10101111₂ to Hexadecimal

Binary number:

```
10101111₂
```

Group into four bits:

```
1010 1111
```

Convert each group:

```
1010 = A

1111 = F
```

Therefore,

```
10101111₂ = AF₁₆
```

---

# Example 2 – Convert 110101₂ to Hexadecimal

Binary number:

```
110101₂
```

Group from the right:

```
11 0101
```

Add leading zeros:

```
0011 0101
```

Convert:

```
0011 = 3

0101 = 5
```

Therefore,

```
110101₂ = 35₁₆
```

---

# Example 3 – Convert 11111111₂ to Hexadecimal

Group the bits:

```
1111 1111
```

Convert:

```
1111 = F

1111 = F
```

Therefore,

```
11111111₂ = FF₁₆
```

---

# Hexadecimal to Binary Conversion

To convert hexadecimal into binary:

1. Write each hexadecimal digit separately.
2. Replace each hexadecimal digit with its four-bit binary equivalent.
3. Combine all four-bit groups.

No mathematical calculation is required.

---

# Example 1 – Convert A5₁₆ to Binary

Hexadecimal number:

```
A5₁₆
```

Convert each digit:

```
A = 1010

5 = 0101
```

Combine them:

```
10100101₂
```

Therefore,

```
A5₁₆ = 10100101₂
```

---

# Example 2 – Convert FF₁₆ to Binary

Hexadecimal number:

```
FF₁₆
```

Convert:

```
F = 1111

F = 1111
```

Combine:

```
11111111₂
```

Therefore,

```
FF₁₆ = 11111111₂
```

---

# Example 3 – Convert 3C₁₆ to Binary

Hexadecimal number:

```
3C₁₆
```

Convert:

```
3 = 0011

C = 1100
```

Combine:

```
00111100₂
```

Therefore,

```
3C₁₆ = 00111100₂
```

---

# Binary and Hexadecimal Conversion Table

| Binary | Hexadecimal |
|:------:|:-----------:|
|0000|0|
|0001|1|
|0010|2|
|0011|3|
|0100|4|
|0101|5|
|0110|6|
|0111|7|
|1000|8|
|1001|9|
|1010|A|
|1011|B|
|1100|C|
|1101|D|
|1110|E|
|1111|F|

---

# Why Programmers Prefer Hexadecimal

Writing long binary numbers is difficult.

For example:

Binary:

```
1111111111111111
```

Hexadecimal:

```
FFFF
```

Both represent the same value, but hexadecimal is:

- Easier to read
- Easier to remember
- Less prone to typing mistakes
- More compact

Because of these advantages, most programming tools display binary data in hexadecimal format.

---

# Real-World Applications

Binary and hexadecimal conversions are used in:

## Memory Addresses

Example:

```
0x7FFE1234
```

---

## Machine Code

Processors execute binary instructions, but developers usually view them in hexadecimal.

---

## Debugging

Debuggers display memory values using hexadecimal notation.

Example:

```
0xFF
```

---

## Network Programming

Protocols often represent packet data using hexadecimal values.

---

## Web Development

CSS colors use hexadecimal notation.

Examples:

```css
#FF0000
#00FF00
#0000FF
#FFFFFF
#000000
```

---

## Cybersecurity

Hexadecimal is commonly used when analyzing:

- Malware
- Memory dumps
- Packet captures
- File signatures
- Digital forensics

---

# Common Mistakes

## Mistake 1: Grouping from the left

Always group binary digits from the **rightmost** side.

---

## Mistake 2: Forgetting leading zeros

If the first group has fewer than four bits, add leading zeros.

Example:

```
101₂
```

Correct grouping:

```
0101
```

---

## Mistake 3: Using incorrect hexadecimal values

Remember:

```
A = 10
B = 11
C = 12
D = 13
E = 14
F = 15
```

---

# Key Takeaways

- Binary uses base 2.
- Hexadecimal uses base 16.
- One hexadecimal digit represents four binary bits.
- Binary-to-hexadecimal conversion uses four-bit grouping.
- Hexadecimal-to-binary conversion replaces each hexadecimal digit with its four-bit binary equivalent.
- Hexadecimal provides a compact and readable representation of binary data.
- Binary and hexadecimal conversions are widely used in programming, networking, cybersecurity, and computer architecture.

---

## Quick Knowledge Check

1. How many binary bits are represented by one hexadecimal digit?

2. Convert **11110000₂** into hexadecimal.

3. Convert **A5₁₆** into binary.

4. Convert **3C₁₆** into binary.

5. Why is hexadecimal preferred over binary by programmers?

6. Name four real-world applications of hexadecimal notation.


---

# Part 8 – Number System Conversion Techniques in Programming

## Introduction

Number system conversions are not just academic exercises—they are used extensively in software development, computer engineering, networking, cybersecurity, and operating systems.

Although programming languages allow developers to work with decimal numbers directly, computers always process data in binary. During software development, programmers frequently convert between decimal, binary, octal, and hexadecimal to understand how data is stored, transmitted, and processed.

A solid understanding of number system conversions helps developers write better programs, debug applications efficiently, and understand the internal workings of computer systems.

---

# Why Programmers Need Number System Conversions

Modern programming languages automatically convert many values behind the scenes. However, developers still need to understand number systems because they work with:

- Memory addresses
- Machine instructions
- Bitwise operations
- Network protocols
- File formats
- Character encoding
- Embedded systems
- Digital electronics
- Operating systems

Understanding number systems makes debugging easier and helps developers write more efficient code.

---

# Number Systems Used in Programming

| Number System | Base | Common Usage |
|--------------|-----:|--------------|
| Decimal | 10 | General calculations |
| Binary | 2 | Internal computer processing |
| Octal | 8 | UNIX/Linux file permissions |
| Hexadecimal | 16 | Memory addresses, debugging, colors, networking |

Each number system serves a specific purpose depending on the application.

---

# Binary in Programming

Computers internally process every instruction in binary.

Example:

```text
Decimal:
25

Binary:
11001
```

Boolean values are also represented using binary concepts.

Example:

```text
True  → 1

False → 0
```

Binary is heavily used in:

- Digital circuits
- CPU instructions
- Memory storage
- Bitwise operations

---

# Hexadecimal in Programming

Hexadecimal is much easier to read than binary.

Example:

Binary:

```text
11111111
```

Hexadecimal:

```text
FF
```

Because one hexadecimal digit represents four binary bits, programmers frequently use hexadecimal while working with:

- Memory locations
- Machine code
- Debuggers
- Network packets
- Hardware registers

---

# Octal in Programming

Although octal is used less frequently today, it remains important in UNIX and Linux systems.

For example, file permissions are written using octal notation.

Common permission values:

```text
755
644
777
600
```

Each octal digit represents a set of three binary permission bits.

---

# Decimal in Programming

Most user input and program output use decimal numbers because they are easy for humans to understand.

Example:

```text
Age: 25

Price: 499

Temperature: 32
```

Internally, these values are converted into binary before processing.

---

# Number Literals in Programming Languages

Most programming languages allow numbers to be written in different number systems.

### Decimal

```javascript
let number = 25;
```

---

### Binary

```javascript
let binaryNumber = 0b11001;
```

---

### Octal

```javascript
let octalNumber = 0o31;
```

---

### Hexadecimal

```javascript
let hexadecimalNumber = 0x19;
```

All four variables represent the same decimal value:

```text
25
```

---

# Converting Numbers in JavaScript

JavaScript provides built-in methods to convert numbers between different number systems.

## Decimal to Binary

```javascript
let decimal = 25;

console.log(decimal.toString(2));
```

Output:

```text
11001
```

---

## Decimal to Octal

```javascript
let decimal = 25;

console.log(decimal.toString(8));
```

Output:

```text
31
```

---

## Decimal to Hexadecimal

```javascript
let decimal = 255;

console.log(decimal.toString(16));
```

Output:

```text
ff
```

---

## Binary to Decimal

```javascript
let binary = "11001";

console.log(parseInt(binary, 2));
```

Output:

```text
25
```

---

## Octal to Decimal

```javascript
let octal = "31";

console.log(parseInt(octal, 8));
```

Output:

```text
25
```

---

## Hexadecimal to Decimal

```javascript
let hexadecimal = "FF";

console.log(parseInt(hexadecimal, 16));
```

Output:

```text
255
```

---

# Bitwise Operations

Bitwise operators work directly on binary values.

Common operators include:

| Operator | Description |
|-----------|-------------|
| `&` | Bitwise AND |
| `|` | Bitwise OR |
| `^` | Bitwise XOR |
| `~` | Bitwise NOT |
| `<<` | Left Shift |
| `>>` | Right Shift |

Example:

```javascript
let a = 5;
let b = 3;

console.log(a & b);
```

The numbers are first converted to binary before the operation is performed.

---

# Memory Representation

Memory addresses are almost always displayed in hexadecimal.

Example:

```text
0x7FFE1234
```

Internally, this address is stored as binary, but hexadecimal makes it much easier for developers to read.

---

# Networking

IP addresses, subnet masks, and packet data often require binary and hexadecimal conversions.

Example:

IPv4 Address:

```text
192.168.1.1
```

Binary representation:

```text
11000000.10101000.00000001.00000001
```

---

# Web Development

Web developers use hexadecimal values to represent colors.

Examples:

```css
#FF0000
```

Red

```css
#00FF00
```

Green

```css
#0000FF
```

Blue

```css
#FFFFFF
```

White

```css
#000000
```

Black

---

# Cybersecurity

Security professionals frequently analyze hexadecimal data while examining:

- Memory dumps
- Executable files
- Network packets
- Malware
- Digital evidence

Many cybersecurity tools display information in hexadecimal because it is compact and closely matches binary data.

---

# Common Mistakes

## Mistake 1: Confusing Number Bases

Remember:

- Decimal → Base 10
- Binary → Base 2
- Octal → Base 8
- Hexadecimal → Base 16

---

## Mistake 2: Forgetting Programming Prefixes

Many programming languages use prefixes to identify number systems.

```text
0b → Binary

0o → Octal

0x → Hexadecimal
```

---

## Mistake 3: Assuming Computers Store Decimal Numbers

Computers always store data in binary, even if programmers write numbers in decimal.

---

# Real-World Applications

Number system conversions are essential in:

- Software development
- Operating systems
- Embedded systems
- Robotics
- Networking
- Database systems
- Cybersecurity
- Computer graphics
- Compiler design
- Computer architecture

---

# Key Takeaways

- Computers process data in binary.
- Programmers frequently use hexadecimal because it is compact and easy to read.
- Octal is commonly used in UNIX/Linux file permissions.
- Programming languages support decimal, binary, octal, and hexadecimal literals.
- Built-in functions can convert values between different number systems.
- Understanding conversions is essential for debugging, networking, cybersecurity, and system programming.

---

## Quick Knowledge Check

1. Why do programmers prefer hexadecimal over binary?

2. Which number system is commonly used for Linux file permissions?

3. What prefix is used for hexadecimal numbers in many programming languages?

4. Which JavaScript method converts a decimal number into hexadecimal?

5. Which function converts a hexadecimal string into a decimal number?

6. Name five real-world applications where number system conversions are commonly used.



---

# Part 9 – Lesson Summary

## Introduction

In this lesson, we explored one of the most important concepts in computer science—**Number System Conversions**. Since computers operate using the binary number system while humans generally use the decimal number system, understanding how to convert between different number systems is a fundamental skill for every computer professional.

We learned how decimal, binary, octal, and hexadecimal number systems are related and how to convert values between them using systematic methods. These concepts form the foundation for advanced topics such as computer architecture, operating systems, networking, embedded systems, cybersecurity, and software development.

---

# What We Learned

During this lesson, we covered the following topics:

- Introduction to number system conversions
- Decimal to binary conversion
- Binary to decimal conversion
- Decimal to octal conversion
- Octal to decimal conversion
- Decimal to hexadecimal conversion
- Binary and hexadecimal conversion
- Practical applications of number system conversions in programming

Each conversion technique helps us understand how computers represent, store, and process information internally.

---

# Conversion Methods at a Glance

| Conversion | Primary Method |
|------------|----------------|
| Decimal → Binary | Repeated division by 2 |
| Binary → Decimal | Positional values (powers of 2) |
| Decimal → Octal | Repeated division by 8 |
| Octal → Decimal | Positional values (powers of 8) |
| Decimal → Hexadecimal | Repeated division by 16 |
| Hexadecimal → Decimal | Positional values (powers of 16) |
| Binary → Hexadecimal | Group binary digits into groups of 4 bits |
| Hexadecimal → Binary | Replace each hexadecimal digit with its 4-bit binary equivalent |

Choosing the correct conversion method makes the conversion process simple and accurate.

---

# Relationship Between Number Systems

Understanding the relationship between different number systems is essential.

| Number System | Base | Digits Used |
|--------------|-----:|-------------|
| Binary | 2 | 0–1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

Some important relationships are:

```
1 Octal Digit = 3 Binary Bits
```

```
1 Hexadecimal Digit = 4 Binary Bits
```

These relationships allow quick conversions between binary, octal, and hexadecimal.

---

# Why Number System Conversion Matters

Number system conversion is important because computers internally represent all data using binary.

Programmers frequently work with hexadecimal because it is compact and easier to read.

Octal remains useful in specific areas such as UNIX/Linux file permissions.

Without understanding these conversions, it becomes difficult to understand:

- Computer memory
- Machine instructions
- Digital electronics
- Bitwise operations
- Networking
- Debugging
- Operating systems

---

# Real-World Applications

Number system conversions are used in many areas of computing.

## Programming

Developers convert between decimal, binary, and hexadecimal while writing and debugging software.

---

## Computer Architecture

Processors execute binary instructions but documentation often uses hexadecimal notation.

---

## Networking

IP addresses, subnet masks, MAC addresses, and packet data rely on binary and hexadecimal representations.

---

## Operating Systems

Memory addresses and system-level data structures are commonly displayed in hexadecimal.

---

## UNIX/Linux Systems

File permissions use octal notation.

Examples:

```
755

644

777

600
```

---

## Cybersecurity

Security professionals use hexadecimal while examining:

- Memory dumps
- Malware
- Packet captures
- Executable files
- Digital forensic evidence

---

## Embedded Systems

Microcontrollers and hardware registers are often programmed using hexadecimal values.

---

# Best Practices

When performing number system conversions:

- Identify the source and destination number systems.
- Choose the correct conversion method.
- Work step by step without skipping calculations.
- Verify your answers whenever possible.
- Remember the relationships between binary, octal, and hexadecimal.
- Practice conversions regularly to improve speed and accuracy.

---

# Common Mistakes to Avoid

Avoid these common mistakes:

- Reading remainders in the wrong order during repeated division.
- Forgetting that binary uses powers of 2.
- Forgetting that octal uses powers of 8.
- Forgetting that hexadecimal uses powers of 16.
- Using incorrect hexadecimal symbols.
- Forgetting to pad binary numbers with leading zeros when grouping bits.
- Confusing decimal digits with hexadecimal digits.

Careful practice helps eliminate these mistakes.

---

# Key Formulas and Relationships

### Decimal to Binary

```
Repeated Division by 2
```

---

### Decimal to Octal

```
Repeated Division by 8
```

---

### Decimal to Hexadecimal

```
Repeated Division by 16
```

---

### Binary to Decimal

```
Sum of (Binary Digit × Power of 2)
```

---

### Octal to Decimal

```
Sum of (Octal Digit × Power of 8)
```

---

### Hexadecimal to Decimal

```
Sum of (Hex Digit × Power of 16)
```

---

### Binary to Hexadecimal

```
Group bits into groups of 4
```

---

### Binary to Octal

```
Group bits into groups of 3
```

---

# Lesson Highlights

After completing this lesson, you should be able to:

- Explain the purpose of number system conversion.
- Convert decimal numbers into binary, octal, and hexadecimal.
- Convert binary, octal, and hexadecimal numbers back into decimal.
- Convert binary directly into hexadecimal.
- Explain why hexadecimal is widely used in programming.
- Describe where octal is used in modern computing.
- Understand how computers internally represent numerical data.

These concepts provide the foundation for future lessons involving memory organization, machine language, assembly language, networking, and low-level programming.

---

# Preparing for the Next Lesson

The next lesson focuses on:

**Lesson 05 – Bits, Bytes, and Memory Units**

In the next lesson, you will learn about:

- Bits and bytes
- Nibbles and words
- Kilobytes, megabytes, gigabytes, and terabytes
- Binary prefixes (KiB, MiB, GiB)
- Memory measurement
- Storage devices
- Data size calculations

These topics build directly on the number systems covered in this lesson.

---

# Final Takeaways

Remember these important points:

- Computers process information using binary.
- Humans normally work with decimal.
- Octal uses base 8 and hexadecimal uses base 16.
- One octal digit represents three binary bits.
- One hexadecimal digit represents four binary bits.
- Number system conversions are essential in programming, networking, cybersecurity, operating systems, and computer architecture.
- Mastering these conversions makes it easier to understand how computers store and manipulate data.

By practicing these conversion techniques regularly, you will build a strong foundation for advanced topics in computer science and software development.

---

# End of Lesson 04

You have successfully completed **Lesson 04 – Number System Conversions**.

Continue with **Part 10 – Learning Checkpoint & Practice Questions** to test your understanding before moving to the next lesson.


---

# Part 10 – Learning Checkpoint & Practice Questions

## Introduction

Congratulations! You have completed **Lesson 04 – Number System Conversions**.

In this final part, you will review everything you learned through revision questions, practice exercises, conversion problems, and interview-style questions.

Do not rush through this section. Practice is the key to mastering number system conversions. The more conversions you perform, the faster and more accurate you will become.

---

# Lesson Revision

By now, you should understand:

- Decimal Number System
- Binary Number System
- Octal Number System
- Hexadecimal Number System
- Decimal to Binary Conversion
- Binary to Decimal Conversion
- Decimal to Octal Conversion
- Octal to Decimal Conversion
- Decimal to Hexadecimal Conversion
- Binary and Hexadecimal Conversion
- Practical applications of number systems in computing

If you can confidently explain and perform these conversions, you are ready to move on to the next lesson.

---

# Quick Revision Table

| Number System | Base | Digits Used |
|--------------|-----:|-------------|
| Binary | 2 | 0–1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

---

# Important Relationships

Remember these important facts:

```
1 Octal Digit = 3 Binary Bits
```

```
1 Hexadecimal Digit = 4 Binary Bits
```

---

# Conversion Methods Summary

| Conversion | Method |
|------------|--------|
| Decimal → Binary | Repeated Division by 2 |
| Binary → Decimal | Powers of 2 |
| Decimal → Octal | Repeated Division by 8 |
| Octal → Decimal | Powers of 8 |
| Decimal → Hexadecimal | Repeated Division by 16 |
| Hexadecimal → Decimal | Powers of 16 |
| Binary → Hexadecimal | Group into 4 bits |
| Binary → Octal | Group into 3 bits |

---

# Practice Questions – Level 1

Convert the following decimal numbers into binary.

1.

```
5₁₀
```

2.

```
10₁₀
```

3.

```
20₁₀
```

4.

```
50₁₀
```

5.

```
100₁₀
```

---

# Practice Questions – Level 2

Convert the following binary numbers into decimal.

1.

```
101₂
```

2.

```
1111₂
```

3.

```
100101₂
```

4.

```
110010₂
```

5.

```
11111111₂
```

---

# Practice Questions – Level 3

Convert the following decimal numbers into octal.

1.

```
16₁₀
```

2.

```
32₁₀
```

3.

```
64₁₀
```

4.

```
83₁₀
```

5.

```
125₁₀
```

---

# Practice Questions – Level 4

Convert the following octal numbers into decimal.

1.

```
20₈
```

2.

```
40₈
```

3.

```
123₈
```

4.

```
175₈
```

5.

```
377₈
```

---

# Practice Questions – Level 5

Convert the following decimal numbers into hexadecimal.

1.

```
26₁₀
```

2.

```
64₁₀
```

3.

```
100₁₀
```

4.

```
255₁₀
```

5.

```
1024₁₀
```

---

# Practice Questions – Level 6

Convert the following hexadecimal numbers into decimal.

1.

```
A₁₆
```

2.

```
1F₁₆
```

3.

```
40₁₆
```

4.

```
64₁₆
```

5.

```
FF₁₆
```

---

# Practice Questions – Level 7

Convert the following binary numbers into hexadecimal.

1.

```
1010₂
```

2.

```
1111₂
```

3.

```
11001100₂
```

4.

```
10101010₂
```

5.

```
11111111₂
```

---

# Practice Questions – Level 8

Convert the following hexadecimal numbers into binary.

1.

```
A₁₆
```

2.

```
1F₁₆
```

3.

```
3C₁₆
```

4.

```
7F₁₆
```

5.

```
FF₁₆
```

---

# Theory Questions

Answer the following questions in your own words.

1. What is number system conversion?

2. Why do computers use binary instead of decimal?

3. Why is hexadecimal widely used by programmers?

4. Why is octal still used in UNIX/Linux systems?

5. What is the repeated division method?

6. What is positional notation?

7. How are binary and hexadecimal related?

8. How are binary and octal related?

9. Why is hexadecimal easier to read than binary?

10. What are the advantages of understanding number systems in programming?

---

# Scenario-Based Questions

### Question 1

A programmer is debugging memory values displayed as:

```
0xFF
```

Why is hexadecimal used instead of binary?

---

### Question 2

A Linux administrator changes file permissions from:

```
644
```

to

```
755
```

Which number system is being used?

---

### Question 3

A CPU stores all instructions internally.

Which number system does it actually use?

---

### Question 4

A web developer writes:

```css
color: #00FF00;
```

Which number system is being used?

---

### Question 5

A cybersecurity analyst is inspecting packet data displayed in hexadecimal.

Why is hexadecimal preferred for packet analysis?

---

# Interview Questions

These are commonly asked during technical interviews and academic assessments.

1. What is a number system?

2. What is the difference between decimal and binary?

3. Explain decimal-to-binary conversion.

4. Explain binary-to-decimal conversion.

5. What is hexadecimal?

6. Why is hexadecimal preferred over binary?

7. What is octal?

8. Where is octal commonly used?

9. What is positional notation?

10. Explain the relationship between binary and hexadecimal.

11. Explain the relationship between binary and octal.

12. How many binary bits are represented by one hexadecimal digit?

13. How many binary bits are represented by one octal digit?

14. What are the practical applications of number system conversions?

15. Why are number systems important in computer science?

---

# Mini Project

Complete the following conversion table.

| Decimal | Binary | Octal | Hexadecimal |
|---------:|:------:|:-----:|:-----------:|
| 10 | | | |
| 25 | | | |
| 50 | | | |
| 64 | | | |
| 100 | | | |
| 125 | | | |
| 255 | | | |
| 512 | | | |
| 1024 | | | |

Verify every answer by converting it back to decimal.

---

# Self-Assessment Checklist

Tick each item after completing the lesson.

- [ ] I can explain number system conversion.
- [ ] I can convert decimal numbers into binary.
- [ ] I can convert binary numbers into decimal.
- [ ] I can convert decimal numbers into octal.
- [ ] I can convert octal numbers into decimal.
- [ ] I can convert decimal numbers into hexadecimal.
- [ ] I can convert hexadecimal numbers into decimal.
- [ ] I can convert binary numbers into hexadecimal.
- [ ] I can convert hexadecimal numbers into binary.
- [ ] I understand where binary, octal, and hexadecimal are used.
- [ ] I can solve conversion problems without assistance.

---

# What's Next?

In the next lesson, you will learn about **Bits, Bytes, and Memory Units**.

Topics include:

- Bit
- Nibble
- Byte
- Word
- Kilobyte (KB)
- Megabyte (MB)
- Gigabyte (GB)
- Terabyte (TB)
- Binary prefixes (KiB, MiB, GiB)
- Memory and storage calculations

This lesson builds directly on the number system concepts you have just mastered.

---

# Congratulations!

You have successfully completed **Lesson 04 – Number System Conversions**.

You now understand how to convert between decimal, binary, octal, and hexadecimal number systems and where these conversions are used in real-world computing.

With these concepts mastered, you are ready to continue to **Lesson 05 – Bits, Bytes, and Memory Units** and deepen your understanding of how computers store and process data.

---

# End of Lesson 04