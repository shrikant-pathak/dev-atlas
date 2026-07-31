# Lesson 02: Decimal, Binary, Octal & Hexadecimal

## Learning Objectives

By the end of this lesson, you will be able to:

- Explain the characteristics of the four major number systems.
- Identify the valid digits used in each number system.
- Understand the base (radix) of each number system.
- Count correctly in decimal, binary, octal, and hexadecimal.
- Compare different number systems.
- Recognize where each number system is used in computing and everyday life.

---

# Introduction

In the previous lesson, you learned what a **number system** is, why different number systems exist, and why computers use the **Binary Number System**. You also explored the concepts of **base (radix)**, **place value**, and the importance of number systems in computer science.

In this lesson, we will study the **four major number systems** used in mathematics and computing:

- **Decimal (Base-10)**
- **Binary (Base-2)**
- **Octal (Base-8)**
- **Hexadecimal (Base-16)**

Although these number systems look different, they all represent numerical values. The primary difference is the **number of unique digits (symbols)** each system uses.

For example:

| Number System | Base | Valid Digits |
|---------------|-----:|--------------|
| Binary | 2 | 0, 1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

Each number system is designed for a particular purpose.

- **Decimal** is the standard system used by people in everyday life.
- **Binary** is the language of digital computers and electronic circuits.
- **Octal** provides a compact way to represent binary values in groups of three bits.
- **Hexadecimal** provides an even more compact representation of binary using groups of four bits, making it especially useful for programmers and engineers.

Understanding these number systems is an essential step before learning:

- Binary arithmetic
- Number system conversions
- Memory representation
- Character encoding
- Computer architecture
- Programming fundamentals

Throughout this lesson, you will explore how each number system works, how counting differs between them, and where each one is used in real-world computing.


# Part 2 – Decimal Number System (Base-10)

## Introduction

The **Decimal Number System** is the most commonly used number system in the world. It is the standard system for everyday counting, arithmetic, commerce, science, engineering, and education.

Almost every calculation we perform in daily life—such as counting money, measuring distance, checking time, or recording temperatures—uses the decimal system.

The decimal system is also known as the **Base-10 Number System** because it contains **ten unique digits**.

---

# Digits Used in Decimal

The decimal number system uses the following digits:

```
0 1 2 3 4 5 6 7 8 9
```

After the digit **9**, counting continues by increasing the place value.

Example:

```
7
8
9
10
11
12
...
98
99
100
```

This pattern continues indefinitely.

---

# Why Base-10?

The decimal system has a **base (radix) of 10** because it contains ten unique digits before the place value increases.

When the highest digit (**9**) is reached, the next value is represented by carrying over to the next position.

Example:

```
9 + 1 = 10

99 + 1 = 100

999 + 1 = 1000
```

Each carry creates a new place value.

---

# Decimal Place Values

Each position in a decimal number represents a power of **10**.

Example:

```
48,572
```

| Position | Power of 10 | Value |
|----------|------------:|------:|
| Ten-Thousands | 10⁴ | 10,000 |
| Thousands | 10³ | 1,000 |
| Hundreds | 10² | 100 |
| Tens | 10¹ | 10 |
| Ones | 10⁰ | 1 |

Expanded form:

```
4 × 10⁴ = 40,000
8 × 10³ = 8,000
5 × 10² = 500
7 × 10¹ = 70
2 × 10⁰ = 2
```

Total:

```
40,000 + 8,000 + 500 + 70 + 2 = 48,572
```

---

# Characteristics of the Decimal Number System

- Base (Radix): **10**
- Digits: **0–9**
- Uses positional notation
- Each place value is a power of **10**
- Most familiar number system for humans

---

# Advantages of Decimal

The decimal number system offers several benefits:

- Easy for humans to understand and use.
- Widely accepted around the world.
- Suitable for everyday arithmetic and financial calculations.
- Supported by calculators, spreadsheets, and most software applications.
- Provides a convenient way to represent very large and very small numbers.

---

# Limitations of Decimal in Computing

Although decimal is ideal for humans, it is **not** the preferred number system for computer hardware.

Electronic circuits naturally operate using only two stable electrical states:

- ON
- OFF

Representing ten distinct electrical states would make digital circuits more complex and less reliable.

For this reason, computers internally use the **Binary Number System**, even though users interact with decimal numbers most of the time.

---

# Real-World Applications

The decimal system is used in almost every aspect of daily life, including:

- Counting objects
- Banking and finance
- Shopping and billing
- Scientific measurements
- Engineering calculations
- Education
- Sports scoring
- Population statistics
- Temperature measurement
- Time calculations (alongside other units)

---

# Worked Examples

### Example 1

```
Number: 256
```

Expanded form:

```
2 × 100 = 200
5 × 10  = 50
6 × 1   = 6

Total = 256
```

---

### Example 2

```
Number: 7,304
```

Expanded form:

```
7 × 1000 = 7000
3 × 100  = 300
0 × 10   = 0
4 × 1    = 4

Total = 7,304
```

---

# Common Mistakes

❌ Confusing a digit with a number.

✔ A **digit** is a single symbol (0–9), while a **number** may contain one or more digits.

---

❌ Assuming all number systems use powers of 10.

✔ Only the decimal number system uses powers of 10. Other number systems use powers of their own base.

---

# Key Takeaways

- The decimal number system has a base of **10**.
- It uses the digits **0 through 9**.
- Each position represents a power of **10**.
- Decimal is the standard number system used by humans.
- Computers display decimal values to users but process data internally using binary.

---

## Quick Knowledge Check

1. Why is the decimal number system called Base-10?
2. Which digits are valid in the decimal system?
3. What does each position represent in a decimal number?
4. Expand the number **3,482** using place values.
5. Why do computers not use decimal internally?


# Part 3 – Binary Number System (Base-2)

## Introduction

The **Binary Number System** is the fundamental language of modern computers and digital electronics. Unlike the decimal system, which uses ten digits (0–9), the binary system uses only **two digits**:

```
0 and 1
```

Because it contains two unique digits, it is called the **Base-2 Number System**.

Every digital device—including computers, smartphones, tablets, gaming consoles, routers, smart TVs, and embedded systems—stores and processes information using binary.

Although users see text, images, videos, and applications, the computer internally represents all of them as combinations of **0s and 1s**.

---

# Why Computers Use Binary

Computers are built from billions of tiny electronic switches called **transistors**.

Each transistor has only two stable electrical states:

```
OFF
ON
```

These states are represented digitally as:

```
OFF → 0
ON  → 1
```

Because hardware naturally supports only two stable states, binary is the simplest and most reliable way to represent and process information.

---

# Digits Used in Binary

Binary contains only two valid digits:

```
0
1
```

Any other digit is **invalid** in the binary number system.

### Valid Examples

```
0
1
10
1010
110011
11111111
```

### Invalid Examples

```
102
2101
10012
```

The digits **2–9** cannot appear in a binary number.

---

# Binary Counting

Since binary has only two digits, counting looks different from decimal.

| Decimal | Binary |
|--------:|:------:|
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
| 11 | 1011 |
| 12 | 1100 |
| 13 | 1101 |
| 14 | 1110 |
| 15 | 1111 |

Notice that after **1**, counting continues with **10** because there are no additional digits available in Base-2.

---

# Binary Place Values

Each position in a binary number represents a power of **2**.

Example:

```
101101₂
```

| Position | Power of 2 | Value |
|----------|-----------:|------:|
| 2⁵ | 32 |
| 2⁴ | 16 |
| 2³ | 8 |
| 2² | 4 |
| 2¹ | 2 |
| 2⁰ | 1 |

Calculation:

```
1 × 32 = 32
0 × 16 = 0
1 × 8  = 8
1 × 4  = 4
0 × 2  = 0
1 × 1  = 1

Total = 45
```

Therefore:

```
101101₂ = 45₁₀
```

---

# Understanding Bits

Each binary digit is called a **bit** (**Binary Digit**).

Examples:

```
1 bit  = 0 or 1

4 bits = 1010

8 bits = 11001010
```

Bits are the smallest unit of digital information.

Eight bits together form one **byte**, which is commonly used to represent a character or a small unit of data.

---

# Advantages of Binary

Binary provides several important benefits:

- Simple electronic implementation
- Reliable digital circuits
- Fast processing
- Easy error detection
- Efficient logical operations
- Universal compatibility across digital systems

These advantages make binary the foundation of all modern computing.

---

# Real-World Applications

Binary is used in almost every digital technology, including:

- CPUs and GPUs
- RAM and storage devices
- Operating systems
- Programming languages (machine code)
- Computer networks
- Digital communication
- Embedded systems
- Robotics
- Internet of Things (IoT) devices

Regardless of the application, the underlying data is represented as binary.

---

# Worked Examples

### Example 1

```
Binary Number: 1101₂
```

Expanded form:

```
1 × 8 = 8
1 × 4 = 4
0 × 2 = 0
1 × 1 = 1

Total = 13
```

---

### Example 2

```
Binary Number: 10010₂
```

Expanded form:

```
1 × 16 = 16
0 × 8  = 0
0 × 4  = 0
1 × 2  = 2
0 × 1  = 0

Total = 18
```

---

# Common Mistakes

❌ Using digits other than 0 and 1 in binary numbers.

✔ Binary numbers may contain **only** the digits **0** and **1**.

---

❌ Forgetting that each position represents a power of **2**.

✔ Binary place values are:

```
1
2
4
8
16
32
64
128
...
```

---

❌ Reading binary numbers like decimal numbers.

✔ Always evaluate a binary number using powers of **2**, not powers of **10**.

---

# Key Takeaways

- Binary is a Base-2 number system.
- It uses only two digits: **0** and **1**.
- Computers use binary because digital hardware naturally operates with two stable electrical states.
- Each binary digit is called a **bit**.
- Binary numbers use powers of **2** for place values.
- Every form of digital information is ultimately represented using binary.

---

## Quick Knowledge Check

1. Why is binary called the Base-2 number system?
2. Which digits are valid in binary?
3. What is a bit?
4. Expand the binary number **1101₂** using place values.
5. Why is binary ideal for digital electronics?


# Part 4 – Octal Number System (Base-8)

## Introduction

The **Octal Number System** is a **Base-8** number system that uses **eight unique digits**.

```
0 1 2 3 4 5 6 7
```

Unlike the decimal system, which uses ten digits, or the binary system, which uses two digits, the octal system uses only the digits **0 through 7**.

Although octal is less common than binary and hexadecimal in modern software development, it remains important in computer science because it provides a shorter and more readable way to represent binary numbers.

---

# Why Base-8?

The octal number system is called **Base-8** because it contains **eight unique digits**.

```
0
1
2
3
4
5
6
7
```

After **7**, counting continues by increasing the place value.

Example:

```
6
7
10
11
12
13
14
15
16
17
20
```

Notice that the digit **8** never appears in an octal number.

---

# Valid and Invalid Digits

### Valid Digits

```
0
1
2
3
4
5
6
7
```

### Invalid Digits

```
8
9
```

### Valid Examples

```
7₈
15₈
127₈
705₈
```

### Invalid Examples

```
89₈
178₈
902₈
```

Any number containing **8** or **9** is **not** a valid octal number.

---

# Octal Place Values

Each position in an octal number represents a power of **8**.

Example:

```
527₈
```

| Position | Power of 8 | Value |
|----------|-----------:|------:|
| 8² | 64 |
| 8¹ | 8 |
| 8⁰ | 1 |

Expanded form:

```
5 × 64 = 320
2 × 8  = 16
7 × 1  = 7

Total = 343
```

Therefore:

```
527₈ = 343₁₀
```

---

# Binary and Octal Relationship

One of the biggest advantages of octal is its close relationship with binary.

**One octal digit represents exactly three binary bits.**

| Octal | Binary |
|:-----:|:------:|
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
Binary : 101 110 011

Octal  : 563₈
```

This grouping makes long binary numbers easier for humans to read.

---

# Advantages of Octal

The octal number system offers several benefits:

- Shorter representation than binary.
- Easier for humans to read and write.
- Simplifies working with groups of three binary bits.
- Useful in certain operating system and embedded system contexts.

---

# Real-World Applications

Although hexadecimal is more common today, octal is still encountered in areas such as:

- UNIX/Linux file permissions (for example: `755`, `644`, `600`)
- Some embedded systems
- Legacy computer systems
- Digital electronics
- Educational examples in computer science

---

# Worked Examples

### Example 1

```
Octal Number: 345₈
```

Expanded form:

```
3 × 64 = 192
4 × 8  = 32
5 × 1  = 5

Total = 229
```

Therefore:

```
345₈ = 229₁₀
```

---

### Example 2

```
Octal Number: 17₈
```

Expanded form:

```
1 × 8 = 8
7 × 1 = 7

Total = 15
```

Therefore:

```
17₈ = 15₁₀
```

---

# Common Mistakes

❌ Writing the digits **8** or **9** in an octal number.

✔ Octal numbers can contain only the digits **0–7**.

---

❌ Using powers of **10** instead of powers of **8**.

✔ Octal place values are:

```
1
8
64
512
4096
...
```

Each position is a power of **8**.

---

❌ Assuming octal is obsolete.

✔ While hexadecimal is more widely used today, octal remains important in Linux permissions, legacy systems, and understanding binary grouping.

---

# Key Takeaways

- Octal is a **Base-8** number system.
- It uses the digits **0 through 7**.
- Each position represents a power of **8**.
- One octal digit corresponds to **three binary bits**.
- Octal provides a compact representation of binary values.
- It is still used in UNIX/Linux file permissions and some specialized computing environments.

---

## Quick Knowledge Check

1. Why is the octal number system called Base-8?
2. Which digits are valid in octal?
3. What power determines each place value in octal?
4. How many binary bits does one octal digit represent?
5. Name two real-world applications of the octal number system.


# Part 5 – Hexadecimal Number System (Base-16)

## Introduction

The **Hexadecimal Number System** is a **Base-16** number system that uses **16 unique symbols** to represent values.

Unlike decimal, which uses only the digits **0–9**, hexadecimal extends the available symbols by adding the letters **A–F**.

```
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Because it contains sixteen unique symbols, it is called the **Base-16 Number System**.

Hexadecimal is widely used in computer science because it provides a compact and human-readable representation of binary data.

---

# Why Base-16?

The hexadecimal system contains **16 unique symbols**.

| Symbol | Decimal Value |
|:------:|--------------:|
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
| A | 10 |
| B | 11 |
| C | 12 |
| D | 13 |
| E | 14 |
| F | 15 |

After **F**, counting continues by increasing the place value.

Example:

```
E
F
10
11
12
...
1F
20
```

---

# Valid Digits

Hexadecimal numbers may contain:

```
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Letters may also be written in lowercase:

```
a b c d e f
```

Most programming languages accept both uppercase and lowercase letters, though uppercase is commonly used in educational material.

---

# Valid and Invalid Examples

### Valid

```
A3₁₆
1F₁₆
FF₁₆
2B7₁₆
9C₁₆
```

### Invalid

```
1G₁₆
Z4₁₆
2X₁₆
```

Letters beyond **F** are not valid hexadecimal digits.

---

# Hexadecimal Place Values

Each position represents a power of **16**.

Example:

```
2A₁₆
```

| Position | Power of 16 | Value |
|----------|------------:|------:|
| 16¹ | 16 |
| 16⁰ | 1 |

Expanded form:

```
2 × 16 = 32
A × 1  = 10

Total = 42
```

Therefore:

```
2A₁₆ = 42₁₀
```

---

# Binary and Hexadecimal Relationship

One hexadecimal digit represents **exactly four binary bits**.

| Hex | Binary |
|:---:|:------:|
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
Binary      : 1111 1010

Hexadecimal : FA₁₆
```

This makes hexadecimal much shorter and easier to read than long binary numbers.

---

# Advantages of Hexadecimal

Hexadecimal offers several advantages:

- Compact representation of binary data.
- Easier for humans to read than binary.
- Reduces the likelihood of reading errors.
- Convenient for memory addresses and debugging.
- Widely supported by programming languages and development tools.

---

# Real-World Applications

Hexadecimal appears throughout modern computing.

### Programming

Many programming languages use hexadecimal notation.

Examples:

```c
0xFF
0x1A
0x2B
```

---

### Memory Addresses

Operating systems and debuggers display memory addresses in hexadecimal.

Example:

```
0x7FFE12A0
```

---

### HTML & CSS Colors

Web developers define colors using hexadecimal RGB values.

```css
#FF0000
#00FF00
#0000FF
#FFFFFF
#000000
```

Each pair of hexadecimal digits represents the intensity of the **Red**, **Green**, and **Blue** color channels.

---

### MAC Addresses

Every network interface card (NIC) has a MAC address written in hexadecimal.

Example:

```
00:1A:2B:3C:4D:5E
```

---

### Debugging and System Logs

Developers often inspect hexadecimal values while debugging software, examining memory dumps, or analyzing binary files.

---

# Worked Examples

### Example 1

```
Hexadecimal Number: 3F₁₆
```

Expanded form:

```
3 × 16 = 48
F × 1  = 15

Total = 63
```

Therefore:

```
3F₁₆ = 63₁₀
```

---

### Example 2

```
Hexadecimal Number: B4₁₆
```

Expanded form:

```
B = 11

11 × 16 = 176
4 × 1   = 4

Total = 180
```

Therefore:

```
B4₁₆ = 180₁₀
```

---

# Common Mistakes

❌ Assuming **A** represents the first letter of the alphabet rather than the value **10**.

✔ In hexadecimal:

```
A = 10
B = 11
C = 12
D = 13
E = 14
F = 15
```

---

❌ Forgetting that hexadecimal uses powers of **16**.

✔ Hexadecimal place values are:

```
1
16
256
4096
65536
...
```

---

❌ Thinking hexadecimal is a separate type of data.

✔ Hexadecimal is simply another way of representing binary values in a shorter, more readable form.

---

# Key Takeaways

- Hexadecimal is a **Base-16** number system.
- It uses the digits **0–9** and the letters **A–F**.
- Each position represents a power of **16**.
- One hexadecimal digit corresponds to **four binary bits**.
- Hexadecimal is widely used in programming, networking, debugging, memory addressing, and web development.

---

## Quick Knowledge Check

1. Why is hexadecimal called Base-16?
2. What decimal values do the letters **A–F** represent?
3. How many binary bits are represented by one hexadecimal digit?
4. Why is hexadecimal easier to read than binary?
5. Name four real-world applications of hexadecimal.


# Part 6 – Comparing the Four Number Systems

## Introduction

By now, you have studied the four major number systems used in mathematics and computing:

- Decimal (Base-10)
- Binary (Base-2)
- Octal (Base-8)
- Hexadecimal (Base-16)

Although they use different symbols and bases, they all represent numerical values using **positional notation**. The primary differences are the number of unique digits available, the place values, and their practical applications.

Understanding these differences will make it much easier to learn **number system conversions** in the next lessons.

---

# Comparison Table

| Feature | Binary | Octal | Decimal | Hexadecimal |
|---------|:------:|:------:|:-------:|:-----------:|
| Base (Radix) | 2 | 8 | 10 | 16 |
| Valid Digits | 0–1 | 0–7 | 0–9 | 0–9, A–F |
| Place Values | Powers of 2 | Powers of 8 | Powers of 10 | Powers of 16 |
| Common Users | Computers | UNIX/Linux, legacy systems | Humans | Programmers, network engineers |
| Typical Applications | Machine language, memory | File permissions | Daily calculations | Memory addresses, CSS colors, debugging |

---

# Counting Comparison

The same numerical value looks different depending on the number system.

| Decimal | Binary | Octal | Hexadecimal |
|--------:|:------:|:------:|:-----------:|
| 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 |
| 2 | 10 | 2 | 2 |
| 3 | 11 | 3 | 3 |
| 4 | 100 | 4 | 4 |
| 5 | 101 | 5 | 5 |
| 6 | 110 | 6 | 6 |
| 7 | 111 | 7 | 7 |
| 8 | 1000 | 10 | 8 |
| 9 | 1001 | 11 | 9 |
| 10 | 1010 | 12 | A |
| 11 | 1011 | 13 | B |
| 12 | 1100 | 14 | C |
| 13 | 1101 | 15 | D |
| 14 | 1110 | 16 | E |
| 15 | 1111 | 17 | F |
| 16 | 10000 | 20 | 10 |

This table demonstrates that the **value remains the same**, while the representation changes according to the base.

---

# Relationship Between Number Systems

The four number systems are closely related.

### Decimal

- Best suited for human calculations.
- Used in education, finance, science, and everyday life.

---

### Binary

- Used internally by digital computers.
- Represents electrical states using **0** and **1**.
- Forms the foundation of all digital data.

---

### Octal

- Groups binary digits into sets of **three bits**.
- Makes certain binary values easier to read.
- Still used for UNIX/Linux file permissions.

Example:

```
Binary : 110 101 011

Octal  : 653₈
```

---

### Hexadecimal

- Groups binary digits into sets of **four bits**.
- Provides a compact representation of binary.
- Common in programming, networking, memory addressing, and debugging.

Example:

```
Binary      : 1110 1011

Hexadecimal : EB₁₆
```

---

# Advantages and Limitations

| Number System | Advantages | Limitations |
|---------------|------------|-------------|
| Binary | Simple for hardware, reliable, efficient | Long numbers are difficult for humans to read |
| Octal | Shorter than binary, easy grouping of 3 bits | Less common in modern software development |
| Decimal | Familiar and intuitive for people | Inefficient for direct electronic implementation |
| Hexadecimal | Compact, readable, ideal for programmers | Requires learning additional symbols (A–F) |

---

# Choosing the Right Number System

Different tasks benefit from different number systems.

### Use Decimal When:

- Performing everyday arithmetic.
- Recording measurements.
- Working with finance or statistics.

### Use Binary When:

- Understanding computer hardware.
- Studying digital electronics.
- Learning machine-level computing.

### Use Octal When:

- Working with UNIX/Linux file permissions.
- Studying legacy systems.
- Grouping binary values into three-bit sets.

### Use Hexadecimal When:

- Programming.
- Debugging software.
- Reading memory addresses.
- Configuring network hardware.
- Designing web pages with CSS colors.

---

# Common Misconceptions

❌ Binary, octal, decimal, and hexadecimal represent different quantities.

✔ They often represent the **same quantity** using different bases.

Example:

```
Decimal      : 26

Binary       : 11010₂

Octal        : 32₈

Hexadecimal  : 1A₁₆
```

Each notation represents the value **26**.

---

❌ Hexadecimal is a programming language.

✔ Hexadecimal is simply a **number system** used to represent values in a compact form.

---

# Key Takeaways

- All four number systems represent numerical values using positional notation.
- The primary difference is the **base (radix)** and the symbols available.
- Binary is the language of computer hardware.
- Decimal is the standard system for humans.
- Octal and hexadecimal provide shorter, more readable representations of binary.
- Understanding these relationships is essential before learning number system conversions.

---

## Quick Knowledge Check

1. Which number system uses the digits **0–7**?
2. Which system groups binary digits into sets of **four bits**?
3. Why is decimal preferred for everyday calculations?
4. Why is binary preferred for digital electronics?
5. Write the decimal value **15** in binary, octal, and hexadecimal using the comparison table.


# Part 7 – Counting in Different Number Systems

## Introduction

Counting is one of the easiest ways to understand how different number systems work. Although every number system represents numerical values, each one follows its own counting pattern based on its **base (radix)**.

The key idea is simple:

- When the highest valid digit is reached, the count **rolls over** to the next place value.
- The highest valid digit depends on the base of the number system.

Let's explore how counting works in each of the four major number systems.

---

# Counting in Decimal (Base-10)

The decimal system uses ten digits:

```
0 1 2 3 4 5 6 7 8 9
```

After **9**, counting continues with a new place value.

```
8
9
10
11
12
13
...
98
99
100
```

The carry occurs because there are no digits beyond **9**.

---

# Counting in Binary (Base-2)

Binary uses only two digits:

```
0
1
```

After **1**, the next value becomes **10**.

| Decimal | Binary |
|--------:|:------:|
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
| 11 | 1011 |
| 12 | 1100 |
| 13 | 1101 |
| 14 | 1110 |
| 15 | 1111 |
| 16 | 10000 |

Notice that every position represents a power of **2**.

---

# Counting in Octal (Base-8)

Octal uses eight digits:

```
0 1 2 3 4 5 6 7
```

After **7**, counting continues with **10**.

```
6
7
10
11
12
13
14
15
16
17
20
21
22
```

Since octal has no digits **8** or **9**, the carry occurs immediately after **7**.

---

# Counting in Hexadecimal (Base-16)

Hexadecimal uses sixteen symbols:

```
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Where:

```
A = 10
B = 11
C = 12
D = 13
E = 14
F = 15
```

After **F**, counting continues with **10**.

```
...
8
9
A
B
C
D
E
F
10
11
12
...
1E
1F
20
```

---

# Side-by-Side Counting Comparison

| Decimal | Binary | Octal | Hexadecimal |
|--------:|:------:|:------:|:-----------:|
| 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 |
| 2 | 10 | 2 | 2 |
| 3 | 11 | 3 | 3 |
| 4 | 100 | 4 | 4 |
| 5 | 101 | 5 | 5 |
| 6 | 110 | 6 | 6 |
| 7 | 111 | 7 | 7 |
| 8 | 1000 | 10 | 8 |
| 9 | 1001 | 11 | 9 |
| 10 | 1010 | 12 | A |
| 11 | 1011 | 13 | B |
| 12 | 1100 | 14 | C |
| 13 | 1101 | 15 | D |
| 14 | 1110 | 16 | E |
| 15 | 1111 | 17 | F |
| 16 | 10000 | 20 | 10 |

This comparison highlights how the **same quantity** is written differently depending on the number system.

---

# Counting Pattern Rule

Every positional number system follows the same general rule:

1. Start at **0**.
2. Count using only the valid digits for that base.
3. When the highest digit is reached, reset it to **0** and increase the next position by **1**.
4. Continue the process as numbers grow larger.

For example:

- Base-2 → carry after **1**
- Base-8 → carry after **7**
- Base-10 → carry after **9**
- Base-16 → carry after **F**

---

# Practical Exercise

Complete the next five numbers in each sequence.

### Decimal

```
18
19
__
__
__
```

---

### Binary

```
1010
1011
____
____
____
```

---

### Octal

```
15
16
17
____
____
```

---

### Hexadecimal

```
C
D
E
F
____
```

---

# Common Mistakes

❌ Writing the digit **2** in binary.

✔ Binary uses only **0** and **1**.

---

❌ Writing **8** or **9** in octal.

✔ Octal uses only **0–7**.

---

❌ Thinking **A** in hexadecimal is a letter instead of a value.

✔ In hexadecimal:

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

- Every number system has its own counting sequence based on its base.
- Counting rolls over when the highest valid digit is reached.
- Binary carries after **1**, octal after **7**, decimal after **9**, and hexadecimal after **F**.
- Learning counting patterns makes number system conversions much easier.

---

## Quick Knowledge Check

1. After **1111₂**, what is the next binary number?
2. After **17₈**, what is the next octal number?
3. After **F₁₆**, what is the next hexadecimal number?
4. Why does each number system have a different counting sequence?
5. Which number system introduces the letters **A–F**?


# Part 8 – Real-World Applications of Number Systems

## Introduction

Number systems are much more than mathematical concepts—they are fundamental to modern computing. Every digital device, application, and network depends on one or more number systems to store, process, transmit, and display information.

Although users generally work with decimal numbers, computers constantly switch between binary, octal, and hexadecimal representations behind the scenes.

Understanding where each number system is used helps learners appreciate why these topics are essential in computer science and software development.

---

# Decimal in Everyday Life

The **Decimal Number System (Base-10)** is the standard system used by people around the world.

### Common Uses

- Counting objects
- Banking and finance
- Shopping and billing
- Scientific measurements
- Engineering calculations
- School mathematics
- Population statistics
- Sports scoring
- Temperature measurement
- Business reports

### Example

```
Laptop Price : ₹55,000

Temperature : 32°C

Distance : 120 km
```

Humans naturally think and calculate using decimal numbers.

---

# Binary in Computers

The **Binary Number System (Base-2)** is the internal language of digital computers.

Everything processed by a computer is ultimately represented using combinations of **0** and **1**.

### Common Uses

- CPU instruction execution
- RAM and cache memory
- SSDs and hard drives
- Digital communication
- Machine language
- Embedded systems
- Robotics
- Internet of Things (IoT) devices

### Example

When you press a key on your keyboard:

1. The keyboard detects the key press.
2. The operating system identifies the character.
3. The character is converted into binary.
4. The CPU processes the binary data.
5. The result is displayed on the screen.

---

# Octal in Computing

Although less common today, the **Octal Number System (Base-8)** is still important in specific areas.

### Common Uses

- UNIX/Linux file permissions
- Legacy computer systems
- Embedded systems
- Educational demonstrations of binary grouping

### Example

Linux permissions:

```
755
644
600
700
```

Each octal digit represents a group of three binary bits.

---

# Hexadecimal in Programming

The **Hexadecimal Number System (Base-16)** is widely used because it provides a compact representation of binary values.

### Common Uses

- Programming
- Debugging
- Memory addresses
- System logs
- Firmware development
- Embedded systems

### Example

```
0x1A
0xFF
0x7B
```

Many programming languages use the `0x` prefix to indicate hexadecimal values.

---

# Hexadecimal in Web Development

Front-end developers use hexadecimal values to define colors in HTML and CSS.

Examples:

```css
color: #FF0000;
background-color: #00FF00;
border-color: #0000FF;
```

Where:

- `#FF0000` → Red
- `#00FF00` → Green
- `#0000FF` → Blue
- `#FFFFFF` → White
- `#000000` → Black

Each pair of hexadecimal digits represents the intensity of the Red, Green, and Blue (RGB) color channels.

---

# Hexadecimal in Networking

Networking devices use hexadecimal notation in several places.

### MAC Address Example

```
00:1A:2B:3C:4D:5E
```

Every network interface card (NIC) has a unique MAC address written in hexadecimal.

---

# Character Encoding

Computers store characters using numeric encoding standards such as **ASCII**, **Unicode**, and **UTF-8**.

Example:

```
Character : A

ASCII Decimal : 65

Binary : 01000001

Hexadecimal : 41
```

This allows computers to store and exchange text consistently across different systems.

---

# Digital Media

Every form of digital media is ultimately represented as binary.

Examples include:

- Text documents
- Images
- Audio files
- Videos
- Mobile applications
- Games
- PDF documents
- Databases

Even though users see meaningful content, the computer stores and processes it using binary values.

---

# Comparison of Applications

| Number System | Common Applications |
|---------------|---------------------|
| Decimal | Daily calculations, education, finance, science |
| Binary | Computer hardware, processors, memory, machine language |
| Octal | UNIX/Linux permissions, legacy systems, embedded systems |
| Hexadecimal | Programming, debugging, networking, memory addresses, CSS colors |

---

# Why Developers Learn Multiple Number Systems

Software developers, system administrators, network engineers, cybersecurity professionals, and embedded systems engineers frequently work with multiple number systems.

Examples include:

- Reading hexadecimal memory dumps.
- Configuring Linux file permissions.
- Debugging software using hexadecimal values.
- Interpreting binary flags and bit masks.
- Designing hardware interfaces.
- Creating web pages with hexadecimal color codes.

Understanding these number systems improves problem-solving skills and makes it easier to work with low-level computer systems.

---

# Key Takeaways

- Decimal is designed for human use.
- Binary is the internal language of computers.
- Octal provides a compact representation of binary in groups of three bits.
- Hexadecimal provides a compact representation of binary in groups of four bits.
- Modern computing relies on all four number systems for different tasks.

---

## Quick Knowledge Check

1. Which number system is commonly used by people in everyday life?
2. Why do computers use binary internally?
3. Where is octal still commonly used?
4. Name three applications of hexadecimal.
5. Why is hexadecimal preferred over long binary numbers in programming?


# Part 9 – Lesson Summary

## Lesson Summary

In this lesson, you explored the four major number systems used in mathematics and computer science:

- Decimal
- Binary
- Octal
- Hexadecimal

You learned that every number system is based on a specific **base (radix)**, which determines the number of unique symbols available and the value represented by each position.

Although these number systems use different symbols, they all follow the same principle of **positional notation**, where the value of a digit depends on both the digit itself and its position.

---

# Decimal Number System (Base-10)

The **Decimal Number System** is the system humans use in everyday life.

Key points:

- Uses ten digits:

```
0–9
```

- Base value:

```
10
```

- Each position represents a power of 10.
- Used for human calculations, measurements, finance, and daily activities.

Example:

```
572₁₀

= 5×10² + 7×10¹ + 2×10⁰
```

---

# Binary Number System (Base-2)

The **Binary Number System** is the foundation of digital computing.

Key points:

- Uses only two digits:

```
0 and 1
```

- Base value:

```
2
```

- Each position represents a power of 2.
- Used internally by all computers and digital devices.

Computers use binary because electronic circuits naturally operate with two stable states:

```
OFF → 0

ON → 1
```

---

# Octal Number System (Base-8)

The **Octal Number System** uses eight symbols.

Key points:

- Uses digits:

```
0–7
```

- Base value:

```
8
```

- Each position represents a power of 8.
- One octal digit represents three binary bits.

Common uses:

- UNIX/Linux file permissions
- Legacy computer systems
- Some embedded systems

Example:

```
111 101 001₂

= 751₈
```

---

# Hexadecimal Number System (Base-16)

The **Hexadecimal Number System** is one of the most important systems for programmers and computer professionals.

Key points:

- Uses sixteen symbols:

```
0–9 and A–F
```

- Base value:

```
16
```

- Each position represents a power of 16.
- One hexadecimal digit represents four binary bits.

Common uses:

- Programming
- Debugging
- Memory addresses
- MAC addresses
- CSS color codes

Example:

```
1111 1010₂

= FA₁₆
```

---

# Relationship Between Number Systems

The four systems are connected:

```
Binary → Octal
3 bits = 1 octal digit

Binary → Hexadecimal
4 bits = 1 hexadecimal digit
```

This relationship allows programmers and engineers to work with binary data more efficiently.

---

# Important Concepts Learned

After completing this lesson, you should understand:

## Base (Radix)

The number of unique symbols available in a number system.

Examples:

```
Binary = Base 2

Octal = Base 8

Decimal = Base 10

Hexadecimal = Base 16
```

---

## Place Value

The value of each position depends on the base.

Examples:

Binary:

```
1, 2, 4, 8, 16, 32...
```

Decimal:

```
1, 10, 100, 1000...
```

Hexadecimal:

```
1, 16, 256, 4096...
```

---

## Counting Patterns

Each number system follows its own counting rules.

- Binary resets after 1.
- Octal resets after 7.
- Decimal resets after 9.
- Hexadecimal resets after F.

---

# Why This Lesson Matters

Understanding number systems is essential for future topics including:

- Binary arithmetic
- Number system conversions
- Memory representation
- Character encoding
- Computer architecture
- Programming languages
- Networking
- Cybersecurity

Without a strong understanding of number systems, many advanced computing concepts become difficult to understand.

---

# Final Lesson Takeaways

Remember these core ideas:

- Number systems allow computers and humans to represent values.
- The base determines the available digits and place values.
- Decimal is designed for humans.
- Binary is designed for computers.
- Octal and hexadecimal make binary easier for humans to read.
- Every digital device ultimately works with binary data.
- Learning different number systems builds the foundation for understanding how computers operate internally.

---

## Looking Ahead

In the next lesson:

# Lesson 03 – Binary Arithmetic

You will learn:

- Binary addition
- Binary subtraction
- Binary multiplication
- Binary division
- Carry and borrow concepts
- Binary arithmetic rules
- Practical examples

These skills are essential for understanding how processors perform calculations internally.


# Part 10 – Learning Checkpoint & Practice Questions

## Learning Checkpoint

Before progressing to the next lesson, make sure you can confidently explain the concepts covered in this lesson.

This checkpoint tests your understanding of:

- Decimal
- Binary
- Octal
- Hexadecimal
- Bases and digits
- Place values
- Counting patterns
- Real-world applications

---

# Section A – Quick Review Questions

### 1. What is a number system?

---

### 2. What does the base (radix) of a number system represent?

---

### 3. What is the base of the Decimal Number System?

---

### 4. Which digits are used in the Binary Number System?

---

### 5. Why do computers use binary instead of decimal?

---

### 6. What is the base of the Octal Number System?

---

### 7. Which digits are valid in an octal number?

---

### 8. What symbols are used in hexadecimal?

---

### 9. What decimal values do A–F represent in hexadecimal?

---

### 10. How many binary bits are represented by one hexadecimal digit?

---

# Section B – Identify the Number System

Identify the number system used in each value.

### 1.

```
101101
```

Answer:

_________________

---

### 2.

```
527
```

Answer:

_________________

---

### 3.

```
3A7
```

Answer:

_________________

---

### 4.

```
985
```

Answer:

_________________

---

### 5.

```
11110000
```

Answer:

_________________

---

# Section C – True or False

Write **True** or **False**.

1. Binary is a Base-2 number system.

2. Decimal uses the digits 0–9.

3. Octal allows the digit 8.

4. Hexadecimal uses A–F as additional symbols.

5. Computers store information internally as binary.

6. One hexadecimal digit represents three binary bits.

7. Octal numbers are based on powers of 8.

8. Decimal numbers use powers of 10.

9. Hexadecimal is commonly used in programming.

10. Binary and decimal always have the same representation.

---

# Section D – Fill in the Blanks

1. The Binary Number System has a base of ______.

2. The Octal Number System uses digits from ______ to ______.

3. The Decimal Number System uses ______ unique digits.

4. The Hexadecimal Number System has a base of ______.

5. A single binary digit is called a ______.

6. One hexadecimal digit represents ______ binary bits.

7. Computers use binary because electronic circuits have ______ stable states.

8. The hexadecimal value A represents decimal ______.

9. Linux file permissions commonly use the ______ number system.

10. Each position in a number system represents a power of the system's ______.

---

# Section E – Compare the Number Systems

Complete the table.

| Number System | Base | Digits Used | Common Use |
|---------------|-----:|-------------|------------|
| Binary | | | |
| Octal | | | |
| Decimal | | | |
| Hexadecimal | | | |

---

# Section F – Practical Exercises

## Exercise 1

Write the first 10 numbers in:

### Binary

```
0
1
__
__
__
__
__
__
__
__
```

---

### Octal

```
0
1
__
__
__
__
__
__
__
__
```

---

### Hexadecimal

```
0
1
__
__
__
__
__
__
__
__
```

---

# Exercise 2

Explain the following:

### Question 1

Why is hexadecimal preferred over binary when programmers work with memory addresses?

---

### Question 2

Why is decimal easier for humans compared to binary?

---

### Question 3

Why does a computer processor not directly use decimal numbers internally?

---

# Section G – Real-World Understanding

Match the number system with its application.

| Application | Number System |
|-------------|---------------|
| Everyday calculations | |
| CPU processing | |
| CSS color codes | |
| Linux permissions | |
| Memory addresses | |
| Digital circuits | |

---

# Section H – Self Assessment Checklist

Before moving to Lesson 03, you should be able to:

- ✅ Define a number system.
- ✅ Explain the meaning of base (radix).
- ✅ Identify decimal, binary, octal, and hexadecimal.
- ✅ List the valid digits of each system.
- ✅ Explain why computers use binary.
- ✅ Understand the relationship between binary and hexadecimal.
- ✅ Understand the relationship between binary and octal.
- ✅ Count in different number systems.
- ✅ Identify real-world uses of each number system.

---

# Final Reflection

Answer these questions in your own words:

1. Why is binary the foundation of modern computing?

2. Why do programmers prefer hexadecimal over binary?

3. Which number system do humans use most often and why?

4. How do different number systems make computing easier?

5. Where might you personally encounter hexadecimal or binary in technology?

---

# Ready for the Next Lesson?

If you can complete this checkpoint confidently, you are ready for:

# Lesson 03 – Binary Arithmetic

In the next lesson, you will learn how computers perform calculations using binary numbers, including:

- Binary addition
- Binary subtraction
- Binary multiplication
- Binary division
- Carry and borrow operations
- How processors perform arithmetic internally

