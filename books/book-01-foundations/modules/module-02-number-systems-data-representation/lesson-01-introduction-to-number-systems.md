# Lesson 01: Introduction to Number Systems

## Learning Objectives

By the end of this lesson, you will be able to:

- Define a number system.
- Explain why number systems are important in computing.
- Understand the concept of a base (radix).
- Identify the most common number systems used in computer science.
- Explain why computers use the binary number system.
- Describe the relationship between number systems and digital data.

---

# Introduction

Numbers are an essential part of everyday life. We use them to count objects, tell time, measure distances, calculate expenses, identify phone numbers, and perform countless other tasks. Although we use numbers constantly, we rarely think about the system that makes them possible.

A **number system** is a standardized way of representing and expressing numbers using a specific set of symbols and mathematical rules. Different number systems use different sets of digits and different bases (also called **radix**) to represent values.

In our daily lives, we primarily use the **Decimal Number System**, which is based on ten digits:

```
0 1 2 3 4 5 6 7 8 9
```

This system is also known as the **Base-10 Number System** because it contains ten unique digits before repeating place values.

Computers, however, do not use the decimal system internally. Unlike humans, computers are built from millions (or even billions) of tiny electronic switches called **transistors**. Each transistor has only two stable states:

- ON
- OFF

These two electrical states are represented digitally as:

```
ON  → 1
OFF → 0
```

Because of this hardware design, computers naturally use the **Binary Number System**, which contains only two digits:

```
0 and 1
```

Every operation performed by a computer—whether opening a web browser, playing a song, displaying an image, running a game, or executing a program—is ultimately carried out using combinations of these two binary digits.

Understanding number systems is one of the most important foundations of computer science. Before learning programming, networking, databases, operating systems, cybersecurity, or computer architecture, it is important to understand how computers represent and process information.

Throughout this module, you will learn how different number systems work, how to convert numbers from one system to another, perform binary arithmetic, understand memory units, and discover how computers represent text, images, audio, video, and other forms of digital data.

By the end of this module, you will have a solid understanding of how computers "think" mathematically and why binary is at the heart of every modern digital device.

---

## Why This Lesson Matters

This lesson lays the foundation for the rest of the module. The concepts introduced here will help you understand:

- Computer Architecture
- Programming Languages
- Data Storage
- Memory Organization
- Networking
- Digital Electronics
- Operating Systems
- Databases
- Cybersecurity

Mastering number systems will make these advanced topics much easier to learn because they all rely on the same fundamental principles of digital representation.


# Part 2 – What Is a Number System?

## What Is a Number System?

A **number system** is a method of representing numbers using a specific set of symbols (called **digits**) and a defined set of mathematical rules. It provides a consistent way to write, read, compare, and perform calculations with numbers.

Every number system is built around two important concepts:

- **Digits (Symbols):** The characters used to represent numbers.
- **Base (Radix):** The total number of unique digits available in that number system.

For example, the Decimal Number System uses ten digits:

```
0 1 2 3 4 5 6 7 8 9
```

Since it has ten unique digits, its base (radix) is **10**.

Similarly, the Binary Number System uses only two digits:

```
0 1
```

Therefore, its base is **2**.

---

## Components of a Number System

Every number system consists of the following components:

### 1. Digits (Symbols)

Digits are the basic symbols used to write numbers.

Examples:

| Number System | Digits Used |
|--------------|-------------|
| Binary | 0, 1 |
| Decimal | 0–9 |
| Octal | 0–7 |
| Hexadecimal | 0–9, A–F |

Each number system has a fixed set of valid symbols. Using a symbol outside that set makes the number invalid in that system.

**Examples:**

- **101101₂** ✅ Valid Binary Number
- **1021₂** ❌ Invalid (digit **2** is not allowed in binary)
- **734₈** ✅ Valid Octal Number
- **789₈** ❌ Invalid (digits **8** and **9** are not allowed in octal)

---

### 2. Base (Radix)

The **base**, also called the **radix**, tells us how many unique digits a number system contains before place values increase.

| Base | Number System |
|------:|---------------|
| 2 | Binary |
| 8 | Octal |
| 10 | Decimal |
| 16 | Hexadecimal |

For example:

- Base 2 → digits **0–1**
- Base 8 → digits **0–7**
- Base 10 → digits **0–9**
- Base 16 → digits **0–9** and **A–F**

---

### 3. Place Value

The value of a digit depends on **both the digit itself and its position** within the number.

Consider the decimal number:

```
5,483
```

| Digit | Place Value | Actual Value |
|------:|------------:|-------------:|
| 5 | Thousands | 5 × 1000 = 5000 |
| 4 | Hundreds | 4 × 100 = 400 |
| 8 | Tens | 8 × 10 = 80 |
| 3 | Ones | 3 × 1 = 3 |

Adding these values together:

```
5000 + 400 + 80 + 3 = 5483
```

This is called a **positional number system**, where the position of each digit determines its contribution to the final value.

---

## Why Place Value Is Important

Place value allows a small set of digits to represent very large numbers efficiently.

For example:

```
7
70
700
7000
```

Although each number contains the digit **7**, its value changes because its position changes.

The same principle applies to **binary**, **octal**, and **hexadecimal** number systems. The only difference is that each system uses a different base.

---

## Key Points

- A number system is a structured way of representing numbers.
- Every number system has a fixed set of valid digits.
- The **base (radix)** determines how many unique digits are available.
- The position of each digit determines its place value.
- Decimal, Binary, Octal, and Hexadecimal are all **positional number systems**.

---

## Quick Knowledge Check

1. What is a number system?
2. What is meant by the base (radix) of a number system?
3. How many digits are used in the binary number system?
4. Why is the decimal number system called Base-10?
5. Why is place value important in positional number systems?


# Part 3 – Why Number Systems Matter

## Why Do We Need Different Number Systems?

At first glance, it may seem that the **Decimal Number System** is sufficient for all calculations. After all, we use decimal numbers every day for counting, measuring, shopping, banking, and many other activities.

However, computers and digital devices operate very differently from humans. Different number systems exist because different applications require different ways of representing and processing information efficiently.

Each number system has unique advantages, making it suitable for specific tasks in mathematics, electronics, computer engineering, programming, and digital communication.

---

## Number Systems in Everyday Life

Humans naturally use the **Decimal Number System (Base-10)** because we have ten fingers, making counting and calculations intuitive.

Examples include:

- Counting money
- Measuring height and weight
- Recording temperatures
- Calculating distances
- Managing finances
- Reading clocks and calendars

For people, decimal numbers are easy to understand and communicate.

---

## Number Systems in Computers

Computers are electronic machines built from billions of tiny switches called **transistors**.

Each transistor can exist in only two stable electrical states:

```
ON
OFF
```

These states are represented digitally as:

```
ON  = 1
OFF = 0
```

Because of this hardware limitation, computers use the **Binary Number System (Base-2)**.

Everything processed by a computer is ultimately stored and manipulated as combinations of **0s and 1s**, including:

- Numbers
- Text
- Images
- Audio
- Videos
- Documents
- Programs
- Games
- Websites

No matter how complex the application appears, the computer internally works with binary data.

---

## Why Not Use Decimal Inside Computers?

Imagine building an electronic circuit that must reliably distinguish **ten different voltage levels** instead of just two.

This would make the hardware:

- More expensive
- More complex
- More susceptible to electrical noise
- Less reliable
- More difficult to manufacture

Using only two voltage levels (0 and 1) makes digital circuits:

- Simpler
- Faster
- More reliable
- Easier to design
- Less prone to errors

This simplicity is one of the main reasons binary became the universal language of computing.

---

## Why Are Octal and Hexadecimal Used?

Although computers use binary internally, long binary numbers are difficult for humans to read.

For example:

```
111111110101101010001111
```

This is hard to interpret at a glance.

The same value can be written more compactly in hexadecimal:

```
FF5A8F
```

Or in octal:

```
77552417
```

Using octal and hexadecimal makes it easier for programmers, engineers, and system administrators to:

- Read memory addresses
- Debug programs
- Analyze machine code
- Configure hardware
- Work with binary data efficiently

These number systems act as a human-friendly representation of binary values.

---

## Where Are Different Number Systems Used?

| Number System | Common Applications |
|---------------|---------------------|
| Decimal (Base-10) | Everyday calculations, banking, education, business |
| Binary (Base-2) | Computer hardware, processors, memory, digital electronics |
| Octal (Base-8) | Legacy computing systems, UNIX file permissions |
| Hexadecimal (Base-16) | Memory addresses, programming, debugging, color codes, networking |

---

## Real-World Examples

You may already encounter hexadecimal without realizing it.

Examples include:

- HTML and CSS color codes (`#FF5733`)
- MAC addresses (`00:1A:2B:3C:4D:5E`)
- Memory addresses in operating systems
- Error codes and debugging tools
- Network packet analysis
- Embedded systems and microcontrollers

Similarly, binary is used internally whenever you:

- Turn on a computer
- Save a file
- Open a website
- Send an email
- Watch a video
- Play a game

---

## Key Takeaways

- Humans primarily use the decimal number system because it is easy to understand.
- Computers use binary because electronic circuits have only two stable states.
- Octal and hexadecimal provide compact, human-readable representations of binary values.
- Different number systems exist because they solve different practical problems.
- Understanding these systems is essential for programming, networking, cybersecurity, operating systems, and computer architecture.

---

## Quick Knowledge Check

1. Why do humans mainly use the decimal number system?
2. Why do computers use binary instead of decimal?
3. What advantage does hexadecimal have over binary?
4. Name two real-world applications of hexadecimal.
5. Why is understanding number systems important for computer science?



# Part 4 – Base (Radix) and Place Value

## Understanding Base (Radix)

Every number system is built around a **base**, also known as the **radix**.

The **base** tells us:

- How many unique digits are available.
- The value assigned to each position in a number.
- When the counting sequence repeats.

Think of the base as the "counting capacity" of a number system.

| Number System | Base (Radix) | Digits Used |
|---------------|-------------:|-------------|
| Binary | 2 | 0, 1 |
| Octal | 8 | 0–7 |
| Decimal | 10 | 0–9 |
| Hexadecimal | 16 | 0–9, A–F |

---

## What Happens When We Reach the Highest Digit?

Every number system follows the same counting principle.

### Decimal (Base-10)

Digits available:

```
0 1 2 3 4 5 6 7 8 9
```

After reaching **9**, the next number becomes:

```
10
```

A new place value is created.

---

### Binary (Base-2)

Digits available:

```
0 1
```

Counting sequence:

```
0
1
10
11
100
101
110
111
1000
```

Notice that after **1**, the next value is **10** because binary has only two digits.

---

### Octal (Base-8)

Digits available:

```
0 1 2 3 4 5 6 7
```

Counting sequence:

```
6
7
10
11
12
```

After **7**, counting continues with **10**.

---

### Hexadecimal (Base-16)

Digits available:

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

After **F**, the next value becomes:

```
10
```

---

# Understanding Place Value

The value of a digit depends on **its position** within the number.

Each position represents a power of the base.

---

## Decimal Place Values

Example:

```
5483
```

| Position | Power | Value |
|----------|------:|------:|
| Ones | 10⁰ | 1 |
| Tens | 10¹ | 10 |
| Hundreds | 10² | 100 |
| Thousands | 10³ | 1000 |

Calculation:

```
5 × 1000 = 5000
4 × 100  = 400
8 × 10   = 80
3 × 1    = 3

Total = 5483
```

---

## Binary Place Values

Example:

```
101101₂
```

| Position | Power | Value |
|----------|------:|------:|
| 2⁵ | 32 |
| 2⁴ | 16 |
| 2³ | 8 |
| 2² | 4 |
| 2¹ | 2 |
| 2⁰ | 1 |

Calculation:

```
1×32 +
0×16 +
1×8 +
1×4 +
0×2 +
1×1

= 45
```

Therefore:

```
101101₂ = 45₁₀
```

---

## Octal Place Values

Example:

```
527₈
```

| Position | Power | Value |
|----------|------:|------:|
| 8² | 64 |
| 8¹ | 8 |
| 8⁰ | 1 |

Calculation:

```
5×64 = 320
2×8  = 16
7×1  = 7

Total = 343
```

---

## Hexadecimal Place Values

Example:

```
2A₁₆
```

Remember:

```
A = 10
```

| Position | Power | Value |
|----------|------:|------:|
| 16¹ | 16 |
| 16⁰ | 1 |

Calculation:

```
2×16 = 32
10×1 = 10

Total = 42
```

Therefore:

```
2A₁₆ = 42₁₀
```

---

# General Formula

For any positional number system:

```
Number = Σ (Digit × Base^Position)
```

Where:

- Σ (Sigma) means "sum of"
- Digit is the value at each position
- Base is the radix of the number system
- Position starts at 0 from the rightmost digit

This formula applies to binary, octal, decimal, hexadecimal, and any other positional number system.

---

# Common Mistakes

❌ Thinking that the digit alone determines the value.

✔ The **position** of the digit is equally important.

---

❌ Assuming all number systems use powers of 10.

✔ Each system uses powers of **its own base**:

- Binary → powers of 2
- Octal → powers of 8
- Decimal → powers of 10
- Hexadecimal → powers of 16

---

# Key Takeaways

- The **base (radix)** determines the number of unique digits.
- Place value depends on powers of the base.
- The same digit can represent different values depending on its position.
- Positional notation makes it possible to represent very large numbers using a limited set of digits.
- Understanding place value is essential before learning number system conversions.

---

## Quick Knowledge Check

1. What is the base (radix) of the hexadecimal number system?
2. Which digits are valid in an octal number?
3. What does the position of a digit represent?
4. Which powers are used in the binary number system?
5. Convert **101101₂** to decimal using place values.


# Part 5 – Common Number Systems

## Introduction

Different number systems have been developed to solve different mathematical and practical problems. While humans primarily use the **Decimal Number System**, computers and digital electronics rely heavily on **Binary**, with **Octal** and **Hexadecimal** serving as compact representations of binary data.

Understanding the characteristics, digits, and applications of each number system is essential for anyone studying computer science, programming, networking, cybersecurity, or digital electronics.

The four most common number systems in computing are:

1. Decimal (Base-10)
2. Binary (Base-2)
3. Octal (Base-8)
4. Hexadecimal (Base-16)

---

# 1. Decimal Number System (Base-10)

The **Decimal Number System** is the most widely used number system in everyday life.

It contains **10 unique digits**:

```
0 1 2 3 4 5 6 7 8 9
```

After the digit **9**, counting continues by increasing the place value.

### Examples

```
15
247
3,596
98,421
```

### Common Applications

- Daily counting
- Banking and finance
- Measurements
- Scientific calculations
- Education
- Business

### Advantages

- Familiar and easy for humans
- Suitable for everyday arithmetic
- Universally accepted for general-purpose calculations

---

# 2. Binary Number System (Base-2)

The **Binary Number System** is the foundation of all modern digital computers.

It contains only **two digits**:

```
0
1
```

Each binary digit is called a **bit**.

### Examples

```
1010₂
110101₂
11111111₂
100000000₂
```

### Why Binary?

Electronic circuits can easily distinguish between two stable electrical states:

```
OFF → 0
ON  → 1
```

This makes binary simple, reliable, and efficient for digital hardware.

### Common Applications

- Computer processors
- Memory systems
- Digital electronics
- Networking
- Data storage
- Machine language

---

# 3. Octal Number System (Base-8)

The **Octal Number System** uses **eight digits**:

```
0 1 2 3 4 5 6 7
```

Digits **8** and **9** are **not valid** in octal numbers.

### Examples

```
17₈
245₈
731₈
```

### Why Use Octal?

Long binary numbers are difficult to read.

Octal provides a shorter representation because **one octal digit corresponds to three binary bits**.

Example:

```
Binary : 101 111 010

Octal  : 572₈
```

### Common Applications

- Legacy computer systems
- UNIX/Linux file permissions
- Embedded systems
- Digital electronics

---

# 4. Hexadecimal Number System (Base-16)

The **Hexadecimal Number System** uses **16 symbols**.

```
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Letters represent decimal values:

| Hex Digit | Decimal Value |
|-----------|--------------:|
| A | 10 |
| B | 11 |
| C | 12 |
| D | 13 |
| E | 14 |
| F | 15 |

### Examples

```
1A₁₆
2F₁₆
7C₁₆
FF₁₆
```

### Why Use Hexadecimal?

Hexadecimal is much easier for humans to read than long binary numbers because **one hexadecimal digit represents four binary bits**.

Example:

```
Binary      : 1111 1010

Hexadecimal : FA₁₆
```

### Common Applications

- Memory addresses
- Programming
- Debugging
- HTML/CSS color codes
- Networking
- Machine code
- Embedded systems

---

# Comparison of Number Systems

| Number System | Base | Valid Digits | Common Uses |
|---------------|-----:|--------------|-------------|
| Binary | 2 | 0–1 | Computers, digital circuits, machine language |
| Octal | 8 | 0–7 | UNIX permissions, legacy systems |
| Decimal | 10 | 0–9 | Everyday calculations |
| Hexadecimal | 16 | 0–9, A–F | Programming, memory, debugging, networking |

---

# Choosing the Right Number System

Each number system is designed for a specific purpose:

- **Decimal** is ideal for human calculations.
- **Binary** is ideal for digital hardware.
- **Octal** simplifies groups of three binary bits.
- **Hexadecimal** simplifies groups of four binary bits and is widely used in modern computing.

Although they look different, all four systems represent numerical values. The difference lies in the symbols they use and the base on which they are built.

---

# Key Takeaways

- Decimal is the standard number system used in everyday life.
- Binary is the language of computers.
- Octal provides a compact representation of binary using groups of three bits.
- Hexadecimal provides a compact representation of binary using groups of four bits.
- Understanding all four systems is essential for computer science and software development.

---

## Quick Knowledge Check

1. Which number system is commonly used in everyday life?
2. Why do computers use the binary number system?
3. Which digits are valid in the octal number system?
4. What do the letters A–F represent in hexadecimal?
5. Why is hexadecimal widely used in programming and debugging?


# Part 6 – Why Computers Use Binary

## Introduction

One of the most common questions beginners ask is:

> **"Why do computers use only 0 and 1 instead of the decimal numbers that humans use?"**

The answer lies in the way computer hardware is built.

Computers are electronic machines. At their core, they contain billions of tiny electronic switches called **transistors**. These transistors control the flow of electricity and perform all calculations and logical operations inside a computer.

Because a transistor has only **two stable electrical states**, binary becomes the simplest and most reliable way to represent information.

---

# Understanding Transistors

A **transistor** is a semiconductor device that acts like an electronic switch.

It has two primary states:

```
ON
OFF
```

In digital electronics, these states are represented as:

| Electrical State | Binary Value |
|------------------|:------------:|
| OFF | 0 |
| ON | 1 |

A modern processor may contain **billions of transistors**, each switching on and off billions of times per second.

These tiny switches work together to process instructions, perform calculations, store data, and communicate with memory and other hardware components.

---

# Why Not Use Decimal?

Imagine designing a circuit that must distinguish between **ten different voltage levels** instead of just two.

For example:

```
0V
0.5V
1.0V
1.5V
...
4.5V
```

Even small electrical noise or fluctuations could cause the circuit to misinterpret one voltage level as another.

This would make computers:

- Less reliable
- More expensive
- Harder to manufacture
- More prone to errors
- Slower to operate

Using only two clearly distinguishable states—**ON** and **OFF**—greatly improves reliability and simplifies circuit design.

---

# Binary and Digital Circuits

Every digital circuit inside a computer is built to recognize two conditions:

```
0 = LOW Voltage
1 = HIGH Voltage
```

These binary values are used by logic gates, memory cells, processors, and storage devices to perform all digital operations.

Examples include:

- Adding two numbers
- Comparing values
- Storing files
- Running applications
- Displaying graphics
- Playing audio
- Accessing the internet

Although these tasks appear different to users, they are all performed using combinations of binary digits.

---

# Binary and Logic Gates

Logic gates are the building blocks of digital electronics.

Common logic gates include:

- AND
- OR
- NOT
- NAND
- NOR
- XOR
- XNOR

Each gate accepts binary inputs (0 or 1) and produces a binary output.

For example, an AND gate works as follows:

| Input A | Input B | Output |
|:-------:|:-------:|:------:|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

Complex processors perform billions of these logical operations every second.

---

# Binary Represents Everything

A common misconception is that binary is only used for numbers.

In reality, binary represents all forms of digital information.

Examples include:

### Text

Each character is assigned a binary value using character encoding systems such as ASCII or Unicode.

Example:

```
A → 01000001
```

---

### Images

Every pixel in a digital image is stored using binary values that describe its color and brightness.

---

### Audio

Sound waves are converted into binary data through digital sampling.

---

### Video

A video is a sequence of images combined with audio, all stored and processed in binary.

---

### Software

Every application, game, website, and operating system is ultimately stored as binary instructions that the CPU can execute.

---

# Advantages of Binary

Using binary offers several important advantages:

- Simple hardware design
- High reliability
- Faster electronic switching
- Lower manufacturing complexity
- Better resistance to electrical noise
- Easier implementation of digital logic
- Consistent and accurate data processing

These advantages have made binary the universal language of modern computing.

---

# Real-World Example

When you type the letter **A** on your keyboard:

1. The keyboard detects the key press.
2. The operating system identifies the key.
3. The character is converted into its binary representation.
4. The CPU processes the binary data.
5. The graphics system converts it into pixels.
6. The monitor displays the character **A** on the screen.

Although you only see a single letter, the computer processes everything internally as binary data.

---

# Key Takeaways

- Computers use binary because electronic hardware naturally supports two stable states.
- Transistors act as switches that represent 0 (OFF) and 1 (ON).
- Binary simplifies hardware design and improves reliability.
- Logic gates perform operations using binary values.
- All digital information—including text, images, audio, video, and software—is ultimately represented in binary.

---

## Quick Knowledge Check

1. What is a transistor?
2. Why are only two electrical states used in digital computers?
3. What do binary digits 0 and 1 represent in electronic circuits?
4. Name any four types of digital information that are stored as binary.
5. Why is binary more reliable than using multiple voltage levels?

# Part 7 – Real-World Examples of Number Systems

## Introduction

Number systems are not just theoretical concepts studied in computer science—they are used every day in the technology around us. Whether you are browsing the internet, developing software, designing websites, or using a smartphone, different number systems work behind the scenes.

Understanding where these number systems are used helps explain why they are an essential part of computing.

---

# Example 1 – Computers Process Binary

Every computer stores and processes information in binary.

For example, when you save a document:

1. You type text using your keyboard.
2. The operating system converts the text into binary.
3. The binary data is written to storage (SSD or HDD).
4. When you reopen the file, the binary data is converted back into readable text.

Although you see letters and words, the computer only stores combinations of **0s and 1s**.

---

# Example 2 – Website Color Codes

Web designers and front-end developers often use **hexadecimal color codes** in HTML and CSS.

Example:

```css
color: #FF5733;
background-color: #00FF00;
```

Each pair of hexadecimal digits represents the intensity of the:

- Red (R)
- Green (G)
- Blue (B)

These values are eventually converted into binary so the graphics hardware can display the correct color on your screen.

---

# Example 3 – Memory Addresses

Operating systems and processors use **hexadecimal numbers** to represent memory locations because they are shorter and easier to read than binary.

For example:

```
0x7FFE1234
```

This hexadecimal address corresponds to a much longer binary value internally.

---

# Example 4 – Network Hardware

Every network device has a unique **MAC (Media Access Control) address**.

Example:

```
00:1A:2B:3C:4D:5E
```

MAC addresses are written in hexadecimal because it provides a compact representation of binary data.

---

# Example 5 – File Permissions in Linux

UNIX and Linux operating systems often use **octal numbers** to represent file permissions.

Examples:

```
755
644
777
600
```

Each octal digit corresponds to a specific set of read, write, and execute permissions.

---

# Example 6 – Character Encoding

When you type a character, it is converted into a numeric code using standards such as **ASCII** or **Unicode**.

For example:

```
Character : A

ASCII Decimal : 65

Binary : 01000001

Hexadecimal : 41
```

This allows computers to store, process, and exchange text consistently across different systems.

---

# Example 7 – Digital Images

A digital image is made up of thousands or millions of tiny **pixels**.

Each pixel stores numerical values representing its color.

These values are stored in binary and often displayed using hexadecimal notation.

For example:

```
White : #FFFFFF
Black : #000000
Blue  : #0000FF
```

---

# Example 8 – Mobile Applications and Games

Every mobile app and game is ultimately converted into **machine code**, which consists of binary instructions executed by the processor.

No matter how advanced the software appears, it is processed internally using binary.

---

# Example 9 – QR Codes and Barcodes

QR codes and barcodes represent information in machine-readable formats.

Scanners convert these patterns into binary data, allowing computers to retrieve product details, website URLs, payment information, and more.

---

# Example 10 – Everyday Digital Devices

Many devices around us rely on binary processing, including:

- Smartphones
- Laptops and desktop computers
- Smart TVs
- Smartwatches
- Digital cameras
- ATMs
- Gaming consoles
- Routers
- Printers
- Smart home devices

Although these devices perform different tasks, they all process information using binary.

---

# Summary Table

| Number System | Real-World Examples |
|---------------|---------------------|
| Decimal | Everyday calculations, finance, education |
| Binary | Computer hardware, processors, memory, machine language |
| Octal | UNIX/Linux file permissions, legacy systems |
| Hexadecimal | CSS color codes, memory addresses, MAC addresses, debugging |

---

# Key Takeaways

- Number systems are used throughout modern computing.
- Binary is the internal language of all digital devices.
- Hexadecimal provides a compact way to represent binary values.
- Octal is still used in specific computing applications, particularly UNIX/Linux permissions.
- Understanding number systems helps explain how software and hardware communicate.

---

## Quick Knowledge Check

1. Why are hexadecimal color codes used in web development?
2. What number system is used internally by computers?
3. Where might you encounter octal numbers in practice?
4. Why are MAC addresses written in hexadecimal?
5. Name three everyday devices that rely on binary processing.


# Part 8 – Key Terms & Glossary

Understanding the following terms will help you throughout this module and in later topics such as computer architecture, programming, operating systems, networking, and digital electronics.

---

# Glossary of Key Terms

| Term | Definition |
|------|------------|
| **Number System** | A method of representing numbers using a defined set of digits and mathematical rules. |
| **Digit** | A symbol used to represent a value in a number system. For example, decimal uses 0–9, while binary uses only 0 and 1. |
| **Base (Radix)** | The total number of unique digits available in a number system. For example, binary has base 2 and decimal has base 10. |
| **Positional Number System** | A number system in which the value of a digit depends on both the digit itself and its position. |
| **Place Value** | The value assigned to a digit based on its position within a number. Each position represents a power of the base. |
| **Binary Number System** | A base-2 number system that uses only the digits 0 and 1. It is the foundation of modern computing. |
| **Decimal Number System** | A base-10 number system that uses the digits 0–9. It is the standard number system used in everyday life. |
| **Octal Number System** | A base-8 number system that uses the digits 0–7. It is commonly used in UNIX/Linux file permissions and some legacy systems. |
| **Hexadecimal Number System** | A base-16 number system that uses the digits 0–9 and the letters A–F. It is widely used in programming, memory addressing, and networking. |
| **Bit** | Short for **Binary Digit**. The smallest unit of digital information, represented by either 0 or 1. |
| **Byte** | A group of 8 bits. A byte is commonly used to represent a single character or a small unit of data. |
| **Transistor** | A semiconductor device that acts as an electronic switch. Billions of transistors work together inside a CPU to process binary data. |
| **Logic Gate** | A digital electronic circuit that performs logical operations using binary inputs and outputs. Examples include AND, OR, and NOT gates. |
| **Machine Language** | The lowest-level programming language, consisting entirely of binary instructions that a CPU can execute directly. |
| **Memory Address** | A unique location in a computer's memory where data or instructions are stored. These addresses are often displayed in hexadecimal. |
| **Character Encoding** | A standard that assigns numeric values to characters, enabling computers to store and exchange text. Common standards include ASCII and Unicode. |
| **ASCII** | American Standard Code for Information Interchange. A character encoding standard that maps characters to numeric values. |
| **Unicode** | A universal character encoding standard that supports characters from most of the world's writing systems. |
| **UTF-8** | A widely used Unicode encoding format that is compatible with ASCII and efficient for storing multilingual text. |
| **Digital Data** | Information stored or transmitted in binary form, including text, images, audio, video, and software. |

---

# Important Facts to Remember

- Humans primarily use the **Decimal Number System (Base-10)**.
- Computers internally use the **Binary Number System (Base-2)**.
- **Octal (Base-8)** and **Hexadecimal (Base-16)** are compact ways of representing binary values.
- The **base (radix)** determines the number of unique digits in a number system.
- In positional number systems, the **position** of a digit determines its value.
- Binary is used because digital circuits have only two stable electrical states: **ON** and **OFF**.
- Every digital file—whether it is text, an image, audio, or video—is ultimately represented in binary.
- Hexadecimal is commonly used in programming, debugging, memory addresses, MAC addresses, and web color codes.

---

# Lesson 01 Recap

After completing this lesson, you should now be able to:

- Explain what a number system is.
- Describe the concept of a base (radix).
- Identify the four major number systems used in computing.
- Understand why computers use binary.
- Explain how place value works in positional number systems.
- Recognize real-world applications of decimal, binary, octal, and hexadecimal.

This knowledge provides the conceptual foundation for the rest of Module 02, where you will learn how to work with these number systems through conversions, arithmetic, memory units, and data representation.


# Part 9 – Lesson Summary

## Lesson Summary

In this lesson, you were introduced to the concept of **number systems**, which form the mathematical foundation of all digital computing. While humans naturally use the **Decimal Number System (Base-10)** for everyday activities, computers rely on the **Binary Number System (Base-2)** because their electronic circuits operate using only two stable states: **ON** and **OFF**.

You learned that every number system is defined by its **base (radix)**, which determines the set of valid digits and the place value of each position. Understanding **positional notation** is essential because the value of a digit depends not only on the digit itself but also on where it appears in the number.

The lesson also introduced the four major number systems used in computer science:

- **Decimal (Base-10)** – The standard system used in daily life.
- **Binary (Base-2)** – The language of digital computers.
- **Octal (Base-8)** – A compact representation of binary, especially in legacy systems and UNIX/Linux permissions.
- **Hexadecimal (Base-16)** – A human-friendly representation of binary widely used in programming, networking, debugging, and memory addressing.

You explored why computers use binary instead of decimal, learning about **transistors**, **logic gates**, and how all digital information—such as text, images, audio, video, and software—is ultimately represented using combinations of **0s and 1s**.

Finally, you saw how number systems appear in everyday technology through examples like:

- HTML and CSS hexadecimal color codes
- Memory addresses
- MAC addresses
- Linux file permissions
- Character encoding
- Digital images
- Mobile applications
- QR codes and barcodes

These examples demonstrate that number systems are not just theoretical concepts but practical tools used throughout modern computing.

---

## Key Concepts to Remember

- A **number system** is a method of representing numbers using a defined set of symbols and rules.
- The **base (radix)** determines the number of unique digits in a number system.
- The **position** of a digit determines its value in a positional number system.
- Computers use the **Binary Number System** because electronic hardware naturally supports two stable states.
- **Octal** and **Hexadecimal** provide shorter, more human-readable representations of binary values.
- Binary is the foundation of all digital data, including text, graphics, sound, video, and software.
- A strong understanding of number systems is essential for studying programming, computer architecture, operating systems, networking, cybersecurity, and digital electronics.

---

## Looking Ahead

In **Lesson 02 – Decimal, Binary, Octal & Hexadecimal**, you will take a deeper look at each of the four major number systems. You will learn:

- The structure of each number system.
- Valid digits and place values.
- Counting methods in different bases.
- Practical examples and real-world applications.
- The relationship between these systems and binary representation.

This lesson establishes the foundation that will make later topics—such as binary arithmetic and number system conversions—much easier to understand.


# Part 10 – Learning Checkpoint & Practice Questions

## Learning Checkpoint

Before moving to **Lesson 02**, make sure you can confidently answer the following questions.

If you cannot answer one or more of these questions, revisit the relevant section of this lesson before continuing.

---

# Section A – Quick Review Questions

1. What is a number system?

2. What is meant by the base (radix) of a number system?

3. What is the difference between a digit and a number?

4. Which number system do humans commonly use?

5. Which number system do computers use internally?

6. Why do computers use binary instead of decimal?

7. What are the four major number systems used in computing?

8. Which digits are valid in the Binary Number System?

9. Which digits are valid in the Octal Number System?

10. Which symbols are used in the Hexadecimal Number System?

---

# Section B – Concept Check

Answer the following questions in your own words.

### 1. Why is binary considered the language of computers?

---

### 2. Explain the concept of place value.

---

### 3. What is the purpose of hexadecimal in computing?

---

### 4. Why is the decimal number system suitable for humans?

---

### 5. Give three examples where hexadecimal is used in real life.

---

# Section C – True or False

Write **True** or **False** for each statement.

1. Binary uses ten digits.
2. Decimal is a Base-10 number system.
3. Hexadecimal contains sixteen unique symbols.
4. Computers process information using binary.
5. Octal uses the digits 0 through 7.
6. A transistor has two stable electrical states.
7. Every digital image is ultimately stored as binary.
8. ASCII is a character encoding standard.
9. Hexadecimal is commonly used for memory addresses.
10. Binary and decimal always use the same place values.

---

# Section D – Fill in the Blanks

1. The Binary Number System has a base of **______**.
2. The Decimal Number System has a base of **______**.
3. The Hexadecimal Number System has a base of **______**.
4. A **______** is the smallest unit of digital information.
5. Eight bits make one **______**.
6. The letters **A** to **F** are used in the **______** number system.
7. Computers use **______** internally to process data.
8. The value of a digit depends on its **______** in a positional number system.
9. The base of the Octal Number System is **______**.
10. A transistor behaves like an electronic **______**.

---

# Section E – Match the Following

| Column A | Column B |
|----------|----------|
| Binary | Base-2 |
| Decimal | Base-10 |
| Octal | Base-8 |
| Hexadecimal | Base-16 |
| Transistor | Electronic Switch |
| Bit | Smallest Unit of Data |
| Byte | Eight Bits |
| ASCII | Character Encoding |
| Unicode | Universal Character Set |
| Logic Gate | Performs Logical Operations |

---

# Section F – Practical Thinking

1. Why would building computers with ten electrical states be more difficult than using only two?

2. Why is hexadecimal easier for programmers to read than long binary numbers?

3. Explain how pressing a key on a keyboard eventually results in binary data being processed by the computer.

4. Identify three devices you use every day that rely on binary processing.

---

# Section G – Reflection

Think about the following questions.

- Which concept in this lesson was easiest to understand?
- Which concept needs more practice?
- How do number systems help you understand how computers work internally?
- Why is learning binary important for future programming and computer science topics?

Write your answers in your own words.

---

# Lesson 01 Completion Checklist

Before moving to Lesson 02, make sure you can:

- ✅ Define a number system.
- ✅ Explain the meaning of base (radix).
- ✅ Describe positional notation and place value.
- ✅ Identify the four major number systems.
- ✅ Explain why computers use binary.
- ✅ Describe the role of transistors and logic gates.
- ✅ Identify real-world applications of binary, octal, decimal, and hexadecimal.
- ✅ Understand the importance of number systems in computer science.

If you can confidently complete this checklist, you are ready to continue to **Lesson 02 – Decimal, Binary, Octal & Hexadecimal**.

---

# What's Next?

In the next lesson, you will study each number system in greater detail. You will learn:

- Decimal Number System
- Binary Number System
- Octal Number System
- Hexadecimal Number System
- Counting in Different Bases
- Comparing Number Systems
- Preparing for Number System Conversions

These concepts will build directly on the foundation established in this lesson.



