# Lesson 07 – Data Representation in Computers

# Part 1 – Introduction to Data Representation

## Introduction

Computers are often described as machines that process data. Whether you type a document, watch a video, listen to music, browse the internet, or play a game, the computer is constantly storing, processing, and transmitting different kinds of data.

However, computers cannot understand information in the same way humans do.

Humans recognize:

- Letters
- Numbers
- Images
- Sounds
- Videos
- Symbols

Computers understand only one language:

```
Binary (0 and 1)
```

Every piece of information inside a computer is converted into binary before it can be stored or processed.

The method of converting real-world information into binary form is known as **data representation**.

---

# What is Data Representation?

**Data representation** is the process of converting different types of information into a format that a computer can store, process, and transmit.

Although humans work with text, numbers, images, and sounds, computers internally represent all of them using binary digits.

For example:

```
Letter

↓

Binary
```

```
Number

↓

Binary
```

```
Image

↓

Binary
```

```
Audio

↓

Binary
```

```
Video

↓

Binary
```

Thus, binary is the universal language of computers.

---

# Why is Data Representation Important?

Computers perform billions of operations every second.

To process information accurately, every type of data must follow a standardized representation.

Data representation enables computers to:

- Store information in memory.
- Process data using the CPU.
- Display information on screens.
- Transmit information over networks.
- Save files to storage devices.
- Exchange data between different systems.

Without data representation, computers would not be able to understand or manipulate digital information.

---

# Types of Data Stored by Computers

Modern computers work with many different types of data.

### Numeric Data

Examples:

```
25

150

3.14

-100
```

Used in:

- Calculations
- Banking
- Scientific computing
- Business applications

---

### Text Data

Examples:

```
Hello

Computer

Programming

नमस्ते

こんにちは
```

Stored using character encoding standards such as Unicode and UTF-8.

---

### Boolean Data

Boolean data has only two possible values.

```
True

False
```

Boolean values are widely used in:

- Decision making
- Programming
- Digital logic
- Database queries

---

### Image Data

Examples:

- Photographs
- Logos
- Digital drawings
- Icons

Images are represented using pixels, where each pixel stores color information in binary form.

---

### Audio Data

Examples:

- Songs
- Voice recordings
- Podcasts
- Sound effects

Audio is represented by converting sound waves into digital samples stored as binary data.

---

### Video Data

Examples:

- Movies
- Tutorials
- Live streaming
- Video conferencing

A video consists of:

- Thousands of image frames
- Audio
- Timing information

All of this is represented digitally using binary.

---

# How Computers Represent Data

Every type of information follows the same basic process.

```
Real-world Information

↓

Encoding

↓

Binary Representation

↓

Storage

↓

Processing

↓

Output
```

Regardless of whether the data is text, audio, or video, the final representation inside the computer is always binary.

---

# Binary as the Universal Language

Binary uses only two digits:

```
0

1
```

These digits correspond to the two stable states used in digital electronics.

Examples:

```
OFF → 0

ON → 1
```

Because electronic circuits can reliably distinguish only two states, binary became the foundation of digital computing.

---

# Data Representation and Hardware

Several hardware components work together to store and process represented data.

### CPU

Processes binary instructions and data.

---

### RAM

Temporarily stores data while programs are running.

---

### Storage Devices

Hard disks and SSDs permanently store binary data.

---

### Input Devices

Convert user actions into binary signals.

Examples:

- Keyboard
- Mouse
- Scanner
- Microphone
- Camera

---

### Output Devices

Convert binary data back into human-readable form.

Examples:

- Monitor
- Printer
- Speakers
- Projector

---

# Real-World Example

Suppose you type the word:

```
Computer
```

The process is:

```
Keyboard Input

↓

Unicode Characters

↓

UTF-8 Encoding

↓

Binary

↓

Stored in RAM

↓

Processed by CPU

↓

Displayed on Monitor
```

Although you see readable text, the computer works entirely with binary data.

---

# Applications of Data Representation

Data representation is essential in many areas of computing, including:

- Operating systems
- Programming languages
- Databases
- Web development
- Networking
- Artificial Intelligence
- Cloud computing
- Cybersecurity
- Mobile applications
- Embedded systems
- Game development
- Multimedia systems

Every digital application depends on accurate data representation.

---

# Importance for Developers

Understanding data representation helps developers:

- Understand how computers process information.
- Write efficient programs.
- Work with different data types.
- Optimize memory usage.
- Debug low-level software.
- Understand file formats.
- Build reliable software systems.

It also provides the foundation for studying computer architecture, operating systems, networking, and databases.

---

# Key Takeaways

- Data representation is the process of converting information into binary form.
- Computers understand only binary digits (0 and 1).
- Numbers, text, images, audio, and video are all represented using binary.
- Data representation enables storage, processing, and communication of digital information.
- Every modern computer system relies on standardized methods of data representation.

---

## Quick Knowledge Check

1. What is data representation?

2. Why do computers use binary?

3. Name five types of data stored by computers.

4. Which hardware component processes binary instructions?

5. How are images represented inside a computer?

6. What type of data contains only **True** and **False** values?

7. Why is data representation important in computing?

---

# End of Part 1

Next:

## Part 2 – Numeric Data Representation

# Lesson 07 – Data Representation in Computers

# Part 2 – Numeric Data Representation

## Introduction

Numbers are one of the most common types of data processed by computers.

Every day, computers perform millions of numerical calculations for:

- Banking
- Scientific research
- Business applications
- Engineering
- Gaming
- Artificial Intelligence
- Data Analysis
- Mobile Applications

Although humans work with decimal numbers, computers internally represent all numbers using **binary**.

Understanding how numbers are represented inside a computer is fundamental to computer science and programming.

---

# What is Numeric Data Representation?

**Numeric data representation** is the process of storing numbers in a binary format that a computer can understand and process.

Regardless of whether a number is:

- Whole
- Negative
- Decimal
- Fractional

the computer converts it into binary before storing it in memory.

Example:

```
Decimal

25
```

becomes

```
Binary

11001
```

Both represent the same value.

---

# Types of Numeric Data

Computers store different kinds of numbers.

### Integer Numbers

Integers are whole numbers without a fractional part.

Examples:

```
0

10

250

-35

9999
```

Integers are used in:

- Counting
- Indexing
- Programming variables
- Database records

---

### Floating-Point Numbers

Floating-point numbers contain a decimal point.

Examples:

```
3.14

0.5

98.75

-12.45
```

These numbers are used for:

- Scientific calculations
- Financial applications
- Graphics
- Simulations

Floating-point representation will be discussed in detail later in this lesson.

---

# Binary Representation of Numbers

Computers use the Binary Number System.

Example:

```
Decimal

13
```

Binary:

```
1101₂
```

Place value calculation:

```
1 × 8

+

1 × 4

+

0 × 2

+

1 × 1

=

13
```

The CPU performs calculations directly on these binary values.

---

# Place Value in Binary

Binary uses powers of two.

| Position | Power | Value |
|----------|------:|------:|
| 0 | 2⁰ | 1 |
| 1 | 2¹ | 2 |
| 2 | 2² | 4 |
| 3 | 2³ | 8 |
| 4 | 2⁴ | 16 |
| 5 | 2⁵ | 32 |
| 6 | 2⁶ | 64 |
| 7 | 2⁷ | 128 |

Example:

```
101101₂
```

Calculation:

```
1 × 32

+

0 × 16

+

1 × 8

+

1 × 4

+

0 × 2

+

1 × 1

=

45₁₀
```

---

# Why Binary is Used

Electronic circuits have only two stable states.

```
OFF → 0

ON → 1
```

This makes binary:

- Reliable
- Easy to implement in hardware
- Resistant to electrical noise
- Efficient for digital processing

Because of these advantages, every computer represents numbers using binary.

---

# Storage of Numbers in Memory

Numbers occupy memory in units called **bytes**.

Examples:

| Data Size | Memory Used |
|-----------|------------:|
| Byte | 8 Bits |
| Word | Depends on CPU architecture |
| Integer | Usually 4 Bytes |
| Long Integer | Usually 8 Bytes |
| Floating-Point Number | Usually 4 or 8 Bytes |

The exact size depends on the programming language, compiler, and computer architecture.

---

# Integer Representation

Computers reserve a fixed number of bits for integers.

Example using 8 bits:

```
00000101
```

represents

```
5
```

Example:

```
00011001
```

represents

```
25
```

The number of available bits determines the range of values that can be stored.

---

# Number Range

The number of bits limits the largest value that can be represented.

Examples:

| Bits | Unsigned Range |
|------|---------------:|
| 4 | 0–15 |
| 8 | 0–255 |
| 16 | 0–65,535 |
| 32 | 0–4,294,967,295 |
| 64 | Very Large Range |

Using more bits allows computers to store larger numbers.

---

# Binary Arithmetic

Once numbers are represented in binary, computers perform operations such as:

- Addition
- Subtraction
- Multiplication
- Division
- Comparisons

For example:

```
5

+

3
```

Internally becomes:

```
101

+

011

=

1000
```

The binary result:

```
1000₂
```

equals

```
8₁₀
```

This is how processors perform arithmetic operations.

---

# Numeric Data in Programming

Programming languages provide numeric data types.

Examples include:

- Integer (`int`)
- Short Integer (`short`)
- Long Integer (`long`)
- Floating Point (`float`)
- Double Precision (`double`)

These data types determine:

- Memory usage
- Range of values
- Precision

Understanding numeric representation helps developers choose appropriate data types.

---

# Real-World Applications

Numeric data representation is used in:

- Banking systems
- Scientific computing
- Weather forecasting
- Computer graphics
- Artificial Intelligence
- Robotics
- Machine Learning
- Video games
- Mobile applications
- Embedded systems

Every calculation performed by a computer depends on numeric data representation.

---

# Importance for Developers

Developers should understand numeric representation because it helps them:

- Choose appropriate data types.
- Prevent overflow and underflow errors.
- Optimize memory usage.
- Improve program performance.
- Understand how CPUs perform calculations.
- Debug low-level software.

Numeric data representation is a fundamental concept in programming and computer architecture.

---

# Key Takeaways

- Numeric data representation converts numbers into binary form.
- Computers perform calculations using binary numbers.
- Integers and floating-point numbers are the two primary numeric data types.
- The number of bits determines the range of values that can be stored.
- Programming languages provide different numeric data types for different purposes.
- Understanding numeric representation helps developers write efficient and reliable programs.

---

## Quick Knowledge Check

1. What is numeric data representation?

2. Why do computers use binary to represent numbers?

3. What is the difference between an integer and a floating-point number?

4. How many values can be represented using 8 unsigned bits?

5. Which hardware component performs arithmetic operations?

6. What determines the range of values that can be stored?

7. Why should developers understand numeric data representation?

---

# End of Part 2

Next:

## Part 3 – Signed and Unsigned Number Representation

# Lesson 07 – Data Representation in Computers

# Part 2 – Numeric Data Representation

## Introduction

Numbers are one of the most common types of data processed by computers.

Every day, computers perform millions of numerical calculations for:

- Banking
- Scientific research
- Business applications
- Engineering
- Gaming
- Artificial Intelligence
- Data Analysis
- Mobile Applications

Although humans work with decimal numbers, computers internally represent all numbers using **binary**.

Understanding how numbers are represented inside a computer is fundamental to computer science and programming.

---

# What is Numeric Data Representation?

**Numeric data representation** is the process of storing numbers in a binary format that a computer can understand and process.

Regardless of whether a number is:

- Whole
- Negative
- Decimal
- Fractional

the computer converts it into binary before storing it in memory.

Example:

```
Decimal

25
```

becomes

```
Binary

11001
```

Both represent the same value.

---

# Types of Numeric Data

Computers store different kinds of numbers.

### Integer Numbers

Integers are whole numbers without a fractional part.

Examples:

```
0

10

250

-35

9999
```

Integers are used in:

- Counting
- Indexing
- Programming variables
- Database records

---

### Floating-Point Numbers

Floating-point numbers contain a decimal point.

Examples:

```
3.14

0.5

98.75

-12.45
```

These numbers are used for:

- Scientific calculations
- Financial applications
- Graphics
- Simulations

Floating-point representation will be discussed in detail later in this lesson.

---

# Binary Representation of Numbers

Computers use the Binary Number System.

Example:

```
Decimal

13
```

Binary:

```
1101₂
```

Place value calculation:

```
1 × 8

+

1 × 4

+

0 × 2

+

1 × 1

=

13
```

The CPU performs calculations directly on these binary values.

---

# Place Value in Binary

Binary uses powers of two.

| Position | Power | Value |
|----------|------:|------:|
| 0 | 2⁰ | 1 |
| 1 | 2¹ | 2 |
| 2 | 2² | 4 |
| 3 | 2³ | 8 |
| 4 | 2⁴ | 16 |
| 5 | 2⁵ | 32 |
| 6 | 2⁶ | 64 |
| 7 | 2⁷ | 128 |

Example:

```
101101₂
```

Calculation:

```
1 × 32

+

0 × 16

+

1 × 8

+

1 × 4

+

0 × 2

+

1 × 1

=

45₁₀
```

---

# Why Binary is Used

Electronic circuits have only two stable states.

```
OFF → 0

ON → 1
```

This makes binary:

- Reliable
- Easy to implement in hardware
- Resistant to electrical noise
- Efficient for digital processing

Because of these advantages, every computer represents numbers using binary.

---

# Storage of Numbers in Memory

Numbers occupy memory in units called **bytes**.

Examples:

| Data Size | Memory Used |
|-----------|------------:|
| Byte | 8 Bits |
| Word | Depends on CPU architecture |
| Integer | Usually 4 Bytes |
| Long Integer | Usually 8 Bytes |
| Floating-Point Number | Usually 4 or 8 Bytes |

The exact size depends on the programming language, compiler, and computer architecture.

---

# Integer Representation

Computers reserve a fixed number of bits for integers.

Example using 8 bits:

```
00000101
```

represents

```
5
```

Example:

```
00011001
```

represents

```
25
```

The number of available bits determines the range of values that can be stored.

---

# Number Range

The number of bits limits the largest value that can be represented.

Examples:

| Bits | Unsigned Range |
|------|---------------:|
| 4 | 0–15 |
| 8 | 0–255 |
| 16 | 0–65,535 |
| 32 | 0–4,294,967,295 |
| 64 | Very Large Range |

Using more bits allows computers to store larger numbers.

---

# Binary Arithmetic

Once numbers are represented in binary, computers perform operations such as:

- Addition
- Subtraction
- Multiplication
- Division
- Comparisons

For example:

```
5

+

3
```

Internally becomes:

```
101

+

011

=

1000
```

The binary result:

```
1000₂
```

equals

```
8₁₀
```

This is how processors perform arithmetic operations.

---

# Numeric Data in Programming

Programming languages provide numeric data types.

Examples include:

- Integer (`int`)
- Short Integer (`short`)
- Long Integer (`long`)
- Floating Point (`float`)
- Double Precision (`double`)

These data types determine:

- Memory usage
- Range of values
- Precision

Understanding numeric representation helps developers choose appropriate data types.

---

# Real-World Applications

Numeric data representation is used in:

- Banking systems
- Scientific computing
- Weather forecasting
- Computer graphics
- Artificial Intelligence
- Robotics
- Machine Learning
- Video games
- Mobile applications
- Embedded systems

Every calculation performed by a computer depends on numeric data representation.

---

# Importance for Developers

Developers should understand numeric representation because it helps them:

- Choose appropriate data types.
- Prevent overflow and underflow errors.
- Optimize memory usage.
- Improve program performance.
- Understand how CPUs perform calculations.
- Debug low-level software.

Numeric data representation is a fundamental concept in programming and computer architecture.

---

# Key Takeaways

- Numeric data representation converts numbers into binary form.
- Computers perform calculations using binary numbers.
- Integers and floating-point numbers are the two primary numeric data types.
- The number of bits determines the range of values that can be stored.
- Programming languages provide different numeric data types for different purposes.
- Understanding numeric representation helps developers write efficient and reliable programs.

---

## Quick Knowledge Check

1. What is numeric data representation?

2. Why do computers use binary to represent numbers?

3. What is the difference between an integer and a floating-point number?

4. How many values can be represented using 8 unsigned bits?

5. Which hardware component performs arithmetic operations?

6. What determines the range of values that can be stored?

7. Why should developers understand numeric data representation?

---

# End of Part 2

Next:

## Part 3 – Signed and Unsigned Number Representation

# Lesson 07 – Data Representation in Computers

# Part 4 – Floating-Point Representation

## Introduction

In the previous part, we learned how computers represent **integer numbers**.

However, many real-world calculations involve numbers with decimal points, such as:

```
3.14

0.5

98.75

-12.45
```

These numbers are called **floating-point numbers**.

Unlike integers, floating-point numbers contain a fractional part.

Computers use a special method called **floating-point representation** to store and process these values efficiently.

---

# What is Floating-Point Representation?

**Floating-point representation** is a method of storing real numbers (numbers with fractional parts) in binary format.

It allows computers to represent:

- Whole numbers
- Decimal numbers
- Very small numbers
- Very large numbers

Floating-point representation is widely used in scientific computing, graphics, simulations, artificial intelligence, and engineering.

---

# Why is it Called "Floating Point"?

In decimal notation:

```
1234.56
```

The decimal point has a fixed position.

In floating-point representation, the decimal point (called the **binary point** in binary numbers) can "float" to different positions depending on the value being represented.

For example:

```
1.23456 × 10³
```

and

```
1234.56
```

represent the same value.

Similarly, binary floating-point numbers use powers of 2 instead of powers of 10.

---

# Scientific Notation

Floating-point representation is based on **scientific notation**.

Example:

```
4500
```

can be written as:

```
4.5 × 10³
```

Similarly,

```
0.0032
```

can be written as:

```
3.2 × 10⁻³
```

This notation makes it easier to represent extremely large and extremely small values.

---

# Binary Scientific Notation

Computers use powers of **2** instead of powers of **10**.

Example:

```
1011₂
```

can be expressed as:

```
1.011 × 2³
```

Here:

- **1.011** is the **significand (mantissa)**.
- **3** is the **exponent**.

Together, they represent the original binary number.

---

# Components of a Floating-Point Number

A floating-point number consists of three main parts:

1. **Sign Bit**
2. **Exponent**
3. **Mantissa (Significand)**

```
+----------------+----------------+----------------------+
| Sign Bit | Exponent | Mantissa (Fraction) |
+----------------+----------------+----------------------+
```

### Sign Bit

Indicates whether the number is:

```
0 → Positive

1 → Negative
```

### Exponent

Stores the power of two.

### Mantissa (Significand)

Stores the significant digits of the number.

---

# IEEE 754 Standard

Most modern computers use the **IEEE 754** standard for floating-point numbers.

It defines how floating-point values are stored and processed consistently across different hardware and software platforms.

The two most common formats are:

| Type | Size |
|------|------:|
| Single Precision | 32 bits |
| Double Precision | 64 bits |

---

# Single Precision (32-bit)

A 32-bit floating-point number is divided into:

| Field | Bits |
|-------|-----:|
| Sign | 1 |
| Exponent | 8 |
| Mantissa | 23 |

This format is commonly used when moderate precision is sufficient.

---

# Double Precision (64-bit)

A 64-bit floating-point number is divided into:

| Field | Bits |
|-------|-----:|
| Sign | 1 |
| Exponent | 11 |
| Mantissa | 52 |

Double precision provides greater accuracy and a much larger range of values than single precision.

---

# Precision

**Precision** refers to the number of significant digits that can be represented accurately.

Example:

```
3.141592653589793
```

A floating-point variable may store only a limited number of digits, depending on its precision.

Using more bits generally increases precision.

---

# Rounding Errors

Because floating-point numbers have limited precision, not every decimal value can be represented exactly.

For example:

```
0.1
```

does not have an exact binary representation.

As a result, calculations such as:

```
0.1 + 0.2
```

may produce a value very close to, but not exactly:

```
0.3
```

These small differences are called **rounding errors**.

---

# Floating-Point Arithmetic

Computers perform operations such as:

- Addition
- Subtraction
- Multiplication
- Division

using floating-point hardware.

Before calculations are performed, numbers may need to be aligned according to their exponents.

After the operation, the result is normalized and stored again in IEEE 754 format.

This process is handled automatically by the processor.

---

# Applications of Floating-Point Numbers

Floating-point representation is used in:

- Scientific calculations
- Engineering software
- Computer graphics
- Video games
- Artificial Intelligence
- Machine Learning
- Financial modeling
- Weather forecasting
- Physics simulations
- Space research

These applications require support for fractional values and very large or very small numbers.

---

# Integer vs Floating-Point Numbers

| Feature | Integer | Floating-Point |
|---------|---------|---------------|
| Fractional Values | No | Yes |
| Decimal Point | No | Yes |
| Precision | Exact | Limited |
| Memory Usage | Usually Less | Usually More |
| Common Use | Counting, Indexing | Measurements, Calculations |

Choosing the correct type depends on the nature of the data.

---

# Importance for Developers

Developers should understand floating-point representation because it helps them:

- Select appropriate numeric data types.
- Understand precision limitations.
- Avoid rounding errors.
- Write accurate scientific and financial applications.
- Optimize performance and memory usage.

A solid understanding of floating-point arithmetic is essential when working with numerical software.

---

# Key Takeaways

- Floating-point representation stores numbers with fractional parts.
- It is based on scientific notation using powers of two.
- Floating-point numbers consist of a sign bit, exponent, and mantissa.
- Most computers follow the IEEE 754 standard.
- Single precision uses 32 bits, while double precision uses 64 bits.
- Floating-point numbers may introduce rounding errors because not every decimal value can be represented exactly.
- Floating-point representation enables computers to handle a wide range of numerical values efficiently.

---

## Quick Knowledge Check

1. What is floating-point representation?

2. Why is it called "floating point"?

3. What are the three main components of a floating-point number?

4. Which standard is commonly used for floating-point representation?

5. How many bits are used in single-precision floating-point format?

6. Why do floating-point calculations sometimes produce rounding errors?

7. Name three applications where floating-point numbers are commonly used.

---

# End of Part 4

Next:

## Part 5 – Boolean Data Representation

# Lesson 07 – Data Representation in Computers

# Part 5 – Boolean Data Representation

## Introduction

Not all information processed by a computer is made up of numbers or text.

Many decisions made by computer programs require only two possible outcomes:

- Yes or No
- True or False
- On or Off
- Open or Closed
- Success or Failure

These two-state values are represented using **Boolean data**.

Boolean values are one of the most fundamental data types in computer science and programming because computers are built using digital circuits that operate with two stable states.

---

# What is Boolean Data?

**Boolean data** is a data type that has only two possible values:

```
True

False
```

In binary form, these values are commonly represented as:

```
True  → 1

False → 0
```

Although programming languages may display Boolean values as the words **true** and **false**, computers store and process them using binary digits.

---

# Origin of Boolean Logic

Boolean logic is named after the English mathematician **:contentReference[oaicite:0]{index=0}**, who developed an algebra based on logical values rather than numerical calculations.

His work became the foundation of:

- Digital electronics
- Computer architecture
- Programming logic
- Modern computing

Today, Boolean algebra is used in every digital computer.

---

# Binary and Boolean Values

Boolean values directly correspond to binary digits.

| Boolean Value | Binary Representation |
|--------------|----------------------:|
| False | 0 |
| True | 1 |

This close relationship makes Boolean data ideal for digital circuits and processors.

---

# Boolean Variables

Programming languages use Boolean variables to store logical values.

Examples:

```
isLoggedIn = true

isStudent = false

isAdmin = true

hasPermission = false
```

These variables help programs make decisions based on conditions.

---

# Boolean Expressions

A **Boolean expression** is a statement that evaluates to either **True** or **False**.

Examples:

```
10 > 5
```

Result:

```
True
```

---

```
8 < 3
```

Result:

```
False
```

---

```
100 == 100
```

Result:

```
True
```

Boolean expressions are commonly used in decision-making statements and loops.

---

# Logical Operators

Computers use logical operators to combine or modify Boolean values.

The three basic logical operators are:

### AND

The result is **True** only if **both** conditions are True.

| A | B | A AND B |
|---|---|---------|
| False | False | False |
| False | True | False |
| True | False | False |
| True | True | True |

---

### OR

The result is **True** if **at least one** condition is True.

| A | B | A OR B |
|---|---|--------|
| False | False | False |
| False | True | True |
| True | False | True |
| True | True | True |

---

### NOT

The NOT operator reverses a Boolean value.

| A | NOT A |
|---|--------|
| True | False |
| False | True |

---

# Boolean Logic in Programming

Boolean values control the flow of programs.

Examples include:

- `if` statements
- `else` statements
- `while` loops
- `for` loops
- Conditional expressions

Example:

```text
If age >= 18

Display:

Eligible to Vote

Else

Display:

Not Eligible
```

The comparison produces either **True** or **False**, allowing the program to choose the appropriate action.

---

# Boolean Representation in Memory

Although Boolean values conceptually require only one bit, computers often allocate one or more bytes for storage, depending on the programming language and hardware architecture.

Conceptually:

```
0 → False

1 → True
```

This binary representation makes Boolean operations extremely fast.

---

# Boolean Logic in Digital Circuits

Inside a computer, processors use **logic gates** to perform Boolean operations.

Common logic gates include:

- AND Gate
- OR Gate
- NOT Gate
- NAND Gate
- NOR Gate
- XOR Gate
- XNOR Gate

These gates are built using millions (or even billions) of tiny electronic transistors.

Together, they perform the logical operations required by every computer program.

---

# Real-World Applications

Boolean data is used in:

### Login Systems

```
Password Correct?

True

↓

Allow Login
```

---

### ATM Machines

```
PIN Correct?

True

↓

Continue Transaction
```

---

### Online Shopping

```
Payment Successful?

True

↓

Confirm Order
```

---

### Traffic Control Systems

```
Emergency Vehicle Detected?

True

↓

Change Signal
```

---

### Smart Home Devices

```
Motion Detected?

True

↓

Turn Lights On
```

Boolean values help systems make automated decisions quickly and efficiently.

---

# Importance for Developers

Understanding Boolean representation helps developers:

- Write conditional statements.
- Build decision-making logic.
- Create efficient algorithms.
- Work with digital circuits.
- Understand computer architecture.
- Develop reliable software.

Boolean logic is one of the most important concepts in programming and computer science.

---

# Key Takeaways

- Boolean data has only two possible values: **True** and **False**.
- Computers represent Boolean values using binary digits **0** and **1**.
- Boolean logic is based on the work of George Boole.
- Logical operators include **AND**, **OR**, and **NOT**.
- Boolean expressions control program execution and decision-making.
- Digital circuits use logic gates to implement Boolean operations.
- Every modern computer relies on Boolean logic for processing information.

---

## Quick Knowledge Check

1. What is Boolean data?

2. Which two values can a Boolean variable store?

3. How are **True** and **False** represented in binary?

4. Who developed Boolean algebra?

5. What is the purpose of the AND operator?

6. Name three common logic gates.

7. Give two real-world examples where Boolean logic is used.

---

# End of Part 5

Next:

## Part 6 – Character and Text Representation

# Lesson 07 – Data Representation in Computers

# Part 6 – Character and Text Representation

## Introduction

Numbers are only one type of data processed by computers.

Modern computers also work with:

- Letters
- Words
- Sentences
- Symbols
- Emojis
- Multiple languages

Humans can easily recognize text, but computers can only process **binary data (0s and 1s)**.

To store and display text correctly, computers use **character representation**, where every character is assigned a unique binary code through a character encoding standard.

---

# What is Character Representation?

**Character representation** is the method of storing letters, digits, punctuation marks, symbols, and other textual information in binary form.

Every character is assigned a unique code.

For example:

```
Character

A

↓

Unicode Code Point

U+0041

↓

UTF-8 Encoding

01000001
```

The computer stores the binary value, while users see the character **A**.

---

# Characters and Strings

A **character** is a single letter, digit, or symbol.

Examples:

```
A

5

@

#

😊
```

A **string** is a sequence of characters.

Examples:

```
Hello

Computer

Programming

नमस्ते

こんにちは
```

Programming languages store strings as collections of individual characters.

---

# Character Encoding

Character encoding defines how characters are converted into binary values.

Common encoding standards include:

- ASCII
- Extended ASCII
- Unicode
- UTF-8
- UTF-16
- UTF-32

Modern systems primarily use **Unicode** with **UTF-8** encoding because it supports nearly every language and symbol.

---

# Text Storage Process

When you type text using a keyboard, the computer follows these steps:

```
Keyboard Input

↓

Character

↓

Unicode Code Point

↓

UTF-8 Encoding

↓

Binary Data

↓

Stored in Memory

↓

Displayed on Screen
```

This process happens automatically and almost instantly.

---

# Representing English Text

Example:

```
CAT
```

Characters:

```
C

A

T
```

Each character has a unique Unicode code point and corresponding binary representation.

The sequence of binary values forms the stored text.

---

# Representing Multilingual Text

Unicode enables computers to represent text from different languages.

Examples:

```
English

Hello
```

```
Hindi

नमस्ते
```

```
Marathi

नमस्कार
```

```
Chinese

你好
```

```
Japanese

こんにちは
```

```
Arabic

مرحبا
```

All these languages can coexist in the same document because of Unicode.

---

# Representing Emojis

Emojis are also Unicode characters.

Examples:

```
😀

😊

❤️

🚀

🌍

💻
```

Each emoji has its own Unicode code point and is stored in binary using a Unicode encoding such as UTF-8.

---

# Text Representation in Programming

Programming languages store text using character and string data types.

Examples:

```
char

string
```

A character variable stores a single character, while a string variable stores multiple characters.

These data types are widely used in:

- User input
- File handling
- Database records
- Web applications
- Mobile applications

---

# Text Representation in Databases

Databases store names, addresses, messages, and other text using character encodings.

Example fields:

- Name
- Email
- Address
- City
- Country
- Comments

Using Unicode ensures that users can store and retrieve text in different languages without corruption.

---

# Text Representation on the Web

Web pages typically specify UTF-8 as the character encoding.

Example:

```html
<meta charset="UTF-8">
```

This tells the browser how to interpret and display the text correctly.

Without the correct encoding, characters may appear as unreadable symbols.

---

# Common Encoding Problems

If the wrong encoding is used, text may display incorrectly.

Examples:

```
?????
```

```
□ □ □
```

```
�
```

These problems usually occur when data is encoded using one standard and decoded using another.

Using UTF-8 consistently helps avoid such issues.

---

# Real-World Applications

Character and text representation are used in:

- Word processors
- Email systems
- Search engines
- Social media
- Messaging applications
- Online banking
- E-commerce websites
- Government portals
- Mobile applications
- Cloud services
- Programming languages
- Databases

Every application that processes text relies on proper character representation.

---

# Importance for Developers

Developers should understand character representation because it helps them:

- Build multilingual applications.
- Store text correctly in databases.
- Prevent encoding errors.
- Support international users.
- Display emojis and special symbols.
- Exchange text reliably across different systems.

Proper character representation is essential for modern software development.

---

# Key Takeaways

- Character representation converts text into binary form.
- Every character is assigned a unique code using a character encoding standard.
- Unicode is the universal character standard used in modern computing.
- UTF-8 is the most widely used encoding for storing and transmitting text.
- Strings are collections of individual characters.
- Proper encoding prevents data corruption and supports multilingual communication.
- Character representation is essential for programming, databases, and web development.

---

## Quick Knowledge Check

1. What is character representation?

2. What is the difference between a character and a string?

3. Which encoding standard is most widely used today?

4. Why is UTF-8 commonly used on websites?

5. What happens if text is decoded using the wrong encoding?

6. Can Unicode represent emojis and multiple languages?

7. Name three applications that rely on character representation.

---

# End of Part 6

Next:

## Part 7 – Image, Audio, and Video Representation

# Lesson 07 – Data Representation in Computers

# Part 7 – Image, Audio, and Video Representation

## Introduction

Computers do not store only numbers and text. Modern computer systems also process:

- Digital photographs
- Graphics
- Music
- Voice recordings
- Movies
- Online videos
- Video games
- Live video streams

Although humans see colorful images and hear clear sounds, computers store all multimedia data as **binary (0s and 1s)**.

Different techniques are used to represent images, audio, and video efficiently while maintaining quality and minimizing storage requirements.

---

# Digital Image Representation

A **digital image** is made up of thousands or even millions of tiny picture elements called **pixels**.

Each pixel stores information about its color and brightness.

```
Image

↓

Pixels

↓

Binary Data
```

The more pixels an image contains, the greater its level of detail.

---

# What is a Pixel?

A **pixel** (short for *picture element*) is the smallest individual unit of a digital image.

Each pixel has a specific color value.

Example:

```
🟥 🟥 🟩

🟦 🟨 ⬜

⬛ 🟧 🟪
```

Each colored square represents one pixel.

When millions of pixels are displayed together, they form a complete image.

---

# Image Resolution

**Resolution** refers to the number of pixels in an image.

Examples:

```
640 × 480

1280 × 720

1920 × 1080

3840 × 2160
```

Higher resolution means:

- More pixels
- Better image quality
- Larger file size

---

# Color Representation

Computers represent colors using binary values.

One of the most common color models is the **RGB (Red, Green, Blue)** model.

Each color is created by combining different amounts of:

- Red
- Green
- Blue

Example:

| Color | RGB Value |
|-------|-----------|
| Black | (0, 0, 0) |
| White | (255, 255, 255) |
| Red | (255, 0, 0) |
| Green | (0, 255, 0) |
| Blue | (0, 0, 255) |
| Yellow | (255, 255, 0) |

Each RGB component is typically stored using **8 bits**, giving a total of **24 bits** for one pixel.

---

# Image File Formats

Different file formats store image data in different ways.

Common image formats include:

- JPEG (.jpg)
- PNG (.png)
- GIF (.gif)
- BMP (.bmp)
- TIFF (.tiff)
- WebP (.webp)

Each format offers different advantages in terms of quality, transparency, animation, or compression.

---

# Digital Audio Representation

Sound travels as continuous waves.

To store sound digitally, computers convert these waves into binary values.

This process involves:

1. Sampling
2. Quantization
3. Binary Encoding

```
Sound Wave

↓

Sampling

↓

Digital Samples

↓

Binary Data
```

The resulting binary data can then be stored or transmitted.

---

# Sampling Rate

The **sampling rate** is the number of sound samples recorded every second.

Examples:

- 8,000 Hz
- 22,050 Hz
- 44,100 Hz (CD Quality)
- 48,000 Hz
- 96,000 Hz

A higher sampling rate generally produces better audio quality but requires more storage space.

---

# Bit Depth

**Bit depth** determines how accurately each audio sample is stored.

Common bit depths include:

- 8-bit
- 16-bit
- 24-bit
- 32-bit

Higher bit depth provides:

- Greater dynamic range
- Better sound quality
- More accurate recordings

---

# Audio File Formats

Popular audio formats include:

- MP3
- WAV
- AAC
- FLAC
- OGG
- AIFF

Some formats are compressed to reduce file size, while others preserve higher audio quality.

---

# Digital Video Representation

A **video** is a sequence of images called **frames**, displayed rapidly to create the illusion of motion.

A video also contains synchronized audio.

```
Frames

+

Audio

↓

Video File
```

Each frame is itself a digital image represented by pixels.

---

# Frame Rate

The **frame rate** is the number of frames displayed each second.

Common frame rates include:

- 24 FPS (Movies)
- 30 FPS (Television and Online Video)
- 60 FPS (Gaming and High-Quality Video)
- 120 FPS (High-Speed Displays)

A higher frame rate results in smoother motion.

---

# Video Resolution

Video resolution follows the same concept as image resolution.

Examples:

| Resolution | Common Name |
|------------|-------------|
| 1280 × 720 | HD |
| 1920 × 1080 | Full HD |
| 2560 × 1440 | Quad HD (QHD) |
| 3840 × 2160 | 4K Ultra HD |
| 7680 × 4320 | 8K Ultra HD |

Higher resolutions provide greater detail but increase storage and bandwidth requirements.

---

# Video File Formats

Common video formats include:

- MP4
- AVI
- MKV
- MOV
- WebM
- FLV

Most modern websites and streaming platforms use MP4 because of its wide compatibility and efficient compression.

---

# Multimedia Compression

Images, audio, and video files can be very large.

Compression techniques reduce file size while preserving acceptable quality.

Compression can be:

### Lossless Compression

- No information is lost.
- Original data can be perfectly restored.

Examples:

- PNG
- FLAC

---

### Lossy Compression

- Some information is permanently removed.
- Produces much smaller file sizes.

Examples:

- JPEG
- MP3
- MP4

Choosing the appropriate compression method depends on the application.

---

# Real-World Applications

Image, audio, and video representation are used in:

- Digital photography
- Streaming services
- Video conferencing
- Social media
- Online education
- Medical imaging
- Computer games
- Animation
- Film production
- Virtual Reality (VR)
- Augmented Reality (AR)

All of these applications rely on efficient multimedia representation.

---

# Importance for Developers

Understanding multimedia representation helps developers:

- Optimize file sizes.
- Choose suitable media formats.
- Improve application performance.
- Develop multimedia applications.
- Work with graphics, audio, and video APIs.
- Build efficient web and mobile applications.

Knowledge of multimedia representation is valuable in modern software development.

---

# Key Takeaways

- Digital images are made up of pixels.
- Image quality depends on resolution and color depth.
- Digital audio is created by sampling sound waves.
- Sampling rate and bit depth affect audio quality.
- Videos consist of image frames combined with audio.
- Compression reduces multimedia file size.
- Different file formats are optimized for different purposes.

---

## Quick Knowledge Check

1. What is a pixel?

2. What is image resolution?

3. Which color model is commonly used for digital images?

4. What is the purpose of sampling in digital audio?

5. What does frame rate measure?

6. What is the difference between lossless and lossy compression?

7. Name three common video file formats.

---

# End of Part 7

Next:

## Part 8 – Data Compression Basics

# Lesson 07 – Data Representation in Computers

# Part 8 – Data Compression Basics

## Introduction

Modern computers generate and store enormous amounts of digital data every day.

Examples include:

- Documents
- Images
- Audio files
- Videos
- Software applications
- Databases
- Backups

Without compression, these files would consume large amounts of storage space and require more time to transfer over networks.

**Data compression** reduces the size of digital data while preserving as much useful information as possible.

It is one of the most important technologies used in modern computing.

---

# What is Data Compression?

**Data compression** is the process of reducing the number of bits required to store or transmit data.

The goal is to:

- Save storage space
- Reduce transmission time
- Improve download speeds
- Reduce bandwidth usage
- Increase storage efficiency

Compressed files contain the same information or an acceptable approximation of it using fewer bits.

---

# Why is Data Compression Important?

Imagine storing:

- Thousands of photos
- Hundreds of videos
- Large software projects
- Cloud backups

Without compression:

- Storage devices would fill up quickly.
- Internet downloads would be much slower.
- Streaming services would consume much more bandwidth.
- File sharing would become inefficient.

Compression makes modern digital communication practical and efficient.

---

# How Data Compression Works

Compression algorithms identify repeated or unnecessary data and represent it more efficiently.

General process:

```
Original Data

↓

Compression Algorithm

↓

Compressed File

↓

Storage or Transmission

↓

Decompression

↓

Original or Approximate Data
```

When the file is needed, it is decompressed so that it can be used again.

---

# Types of Data Compression

There are two major types of compression:

1. **Lossless Compression**
2. **Lossy Compression**

---

# Lossless Compression

Lossless compression reduces file size **without losing any information**.

When the file is decompressed, it is restored exactly as it was before compression.

```
Original File

↓

Compress

↓

Smaller File

↓

Decompress

↓

Original File
```

No data is lost.

---

# Advantages of Lossless Compression

- Original data is preserved.
- No reduction in quality.
- Safe for important documents and software.
- Suitable for repeated editing.

---

# Common Lossless File Formats

Examples include:

- ZIP
- PNG
- GIF
- FLAC
- PDF (depending on content)

Lossless compression is commonly used for:

- Documents
- Program files
- Databases
- Source code
- Text files
- Backups

---

# Lossy Compression

Lossy compression achieves much smaller file sizes by permanently removing some data.

```
Original File

↓

Compress

↓

Smaller File

↓

Decompress

↓

Approximate Original
```

The decompressed file is very similar to the original but not identical.

---

# Advantages of Lossy Compression

- Much smaller file sizes.
- Faster downloads.
- Reduced bandwidth usage.
- Efficient streaming.
- Lower storage requirements.

---

# Common Lossy File Formats

Examples include:

- JPEG
- MP3
- MP4
- AAC
- WebP (lossy mode)

These formats are widely used for multimedia because slight quality loss is often difficult for users to notice.

---

# Lossless vs Lossy Compression

| Feature | Lossless | Lossy |
|---------|----------|--------|
| Original Data Preserved | Yes | No |
| Quality Loss | None | Some |
| Compression Ratio | Lower | Higher |
| Suitable for Editing | Yes | Usually No |
| Typical Use | Documents, Code, Databases | Photos, Audio, Video |

The appropriate compression method depends on the type of data and the intended use.

---

# Compression Ratio

The **compression ratio** compares the original file size with the compressed file size.

Example:

Original file:

```
100 MB
```

Compressed file:

```
25 MB
```

Compression ratio:

```
100 : 25

=

4 : 1
```

A higher compression ratio means greater reduction in file size.

---

# Data Compression in Everyday Life

Compression is used in many common applications:

### Web Browsing

Web pages load faster because images, scripts, and other resources are compressed.

---

### Streaming Services

Platforms such as YouTube, Netflix, and music streaming services compress multimedia so it can be delivered efficiently over the Internet.

---

### Email

Attachments are often compressed before being sent.

---

### Cloud Storage

Cloud services compress files to reduce storage costs and improve synchronization.

---

### Software Distribution

Applications and updates are frequently packaged into compressed files for faster downloads.

---

# Real-World Examples

### ZIP Archive

```
Project Folder

↓

ZIP Compression

↓

project.zip
```

This reduces storage space and simplifies file sharing.

---

### JPEG Image

A photograph taken by a digital camera is compressed before being stored, reducing file size while maintaining acceptable visual quality.

---

### MP3 Music

A song recorded in a studio is compressed into MP3 format so it can be streamed and downloaded efficiently.

---

### MP4 Video

Movies and online videos are compressed to reduce bandwidth usage while maintaining good viewing quality.

---

# Advantages of Data Compression

Data compression provides many benefits:

- Saves disk space.
- Speeds up file transfers.
- Reduces network bandwidth.
- Improves cloud storage efficiency.
- Enables faster downloads.
- Makes multimedia streaming practical.
- Lowers storage and transmission costs.

---

# Limitations of Data Compression

Despite its advantages, compression has some limitations.

### Lossless Compression

- Smaller reduction in file size.
- May not be suitable when maximum compression is required.

### Lossy Compression

- Permanent loss of some information.
- Repeated compression can reduce quality further.
- Not suitable for source code, executable files, or important documents.

Choosing the correct compression method depends on the type of data and the application's requirements.

---

# Importance for Developers

Developers should understand data compression because it helps them:

- Build faster applications.
- Optimize storage usage.
- Improve website performance.
- Reduce network traffic.
- Deliver multimedia efficiently.
- Design scalable cloud-based systems.

Compression is an essential technique in software development, networking, multimedia, and cloud computing.

---

# Key Takeaways

- Data compression reduces the number of bits required to store or transmit data.
- Lossless compression preserves all original information.
- Lossy compression removes some information to achieve smaller file sizes.
- Different file formats use different compression techniques.
- Compression improves storage efficiency and reduces transmission time.
- Modern computing depends heavily on compression for multimedia, cloud storage, and communication.

---

## Quick Knowledge Check

1. What is data compression?

2. Why is data compression important?

3. What is the difference between lossless and lossy compression?

4. Give three examples of lossless file formats.

5. Give three examples of lossy file formats.

6. What is a compression ratio?

7. Why is compression important for streaming services?

---

# End of Part 8

Next:

## Part 9 – Lesson Summary

# Lesson 07 – Data Representation in Computers

# Part 9 – Lesson Summary

## Introduction

In this lesson, we explored how computers represent, store, and process different types of digital information.

Although humans interact with information in many forms:

- Numbers
- Text
- Images
- Audio
- Video
- Symbols

computers internally process everything using:

```
Binary Data (0 and 1)
```

Data representation provides the methods and standards that allow computers to convert real-world information into a format that hardware can understand.

---

# What We Learned

Throughout this lesson, we studied:

- Introduction to Data Representation
- Numeric Data Representation
- Signed and Unsigned Numbers
- Floating-Point Representation
- Boolean Data Representation
- Character and Text Representation
- Image Representation
- Audio Representation
- Video Representation
- Data Compression Basics

Together, these concepts explain how computers store and process almost every type of digital information.

---

# Data Representation Overview

Every piece of digital information follows a similar process:

```
Real-World Information

↓

Encoding

↓

Binary Representation

↓

Storage

↓

Processing

↓

Output
```

The computer converts everything into binary before it can work with it.

---

# Numeric Data Representation Summary

Computers represent numbers using binary.

We learned:

- Integers represent whole numbers.
- Floating-point numbers represent decimal values.
- Binary digits determine storage capacity.
- More bits allow larger ranges of values.

Example:

```
Decimal

25

↓

Binary

11001
```

Numbers are processed by the CPU using binary arithmetic operations.

---

# Signed and Unsigned Numbers Summary

Computers need to represent both positive and negative values.

## Unsigned Numbers

Features:

- Represent only zero and positive values.
- Use all bits for the numeric value.
- Have a larger positive range.

Example (8-bit):

```
0 to 255
```

---

## Signed Numbers

Features:

- Represent positive and negative values.
- Use a sign representation.
- Modern systems use Two's Complement.

Example (8-bit):

```
-128 to +127
```

Signed and unsigned representations allow computers to handle different types of numerical data efficiently.

---

# Floating-Point Representation Summary

Floating-point numbers allow computers to store fractional values.

Examples:

```
3.14

0.5

98.75
```

We learned that floating-point numbers contain:

1. Sign Bit
2. Exponent
3. Mantissa

Modern computers follow:

```
IEEE 754 Standard
```

Floating-point representation enables:

- Scientific calculations
- Graphics
- Simulations
- Artificial Intelligence

However, limited precision can cause rounding errors.

---

# Boolean Data Representation Summary

Boolean data represents logical values.

Only two states exist:

```
True

False
```

Binary representation:

```
True  → 1

False → 0
```

Boolean logic is the foundation of:

- Programming conditions
- Decision making
- Digital circuits
- Logic gates

Common logical operators:

- AND
- OR
- NOT

---

# Character and Text Representation Summary

Computers cannot store letters directly.

Characters are converted into binary using encoding standards.

We learned about:

## ASCII

- Early character encoding standard.
- Designed mainly for English characters.

## Unicode

- Universal character standard.
- Supports almost all languages and symbols.

## UTF-8

- Most commonly used encoding on the web.
- Efficient and backward compatible with ASCII.

Text processing depends on accurate character representation.

---

# Image Representation Summary

Digital images are represented using:

```
Pixels
```

Each pixel stores color information.

Important concepts:

## Resolution

Number of pixels in an image.

Higher resolution:

- More detail
- Larger file size

---

## RGB Color Model

Colors are created using:

```
Red

Green

Blue
```

Each pixel stores binary color values.

Images are stored using formats such as:

- JPEG
- PNG
- GIF
- WebP

---

# Audio Representation Summary

Computers convert sound into digital data through:

1. Sampling
2. Quantization
3. Binary Encoding

Important concepts:

## Sampling Rate

Number of audio samples recorded per second.

## Bit Depth

Amount of information stored for each sample.

Higher values generally provide better audio quality.

Common audio formats:

- MP3
- WAV
- AAC
- FLAC

---

# Video Representation Summary

Video is created by displaying images rapidly.

A video contains:

```
Multiple Frames

+

Audio

↓

Video File
```

Important concepts:

## Frame Rate

Number of frames displayed per second.

## Resolution

Number of pixels in each frame.

Common formats:

- MP4
- AVI
- MKV
- WebM

---

# Data Compression Summary

Compression reduces file size by representing data more efficiently.

Two major types:

## Lossless Compression

- No data loss.
- Original data restored completely.

Examples:

- ZIP
- PNG
- FLAC

---

## Lossy Compression

- Removes some information.
- Produces smaller files.

Examples:

- JPEG
- MP3
- MP4

Compression enables:

- Faster downloads
- Efficient storage
- Multimedia streaming

---

# Importance for Developers

Understanding data representation helps developers:

- Choose suitable data types.
- Optimize memory usage.
- Handle multimedia efficiently.
- Prevent encoding problems.
- Build faster applications.
- Understand how computers process information.

These concepts form the foundation for:

- Programming
- Computer architecture
- Operating systems
- Databases
- Networking
- Artificial Intelligence

---

# Real-World Example

Consider watching an online video.

The complete process involves:

```
Camera Records Video

↓

Images Converted into Pixels

↓

Audio Converted into Digital Samples

↓

Data Compressed

↓

Stored on Servers

↓

Transferred Through Network

↓

Decoded by Your Device

↓

Displayed as Video and Sound
```

Every stage depends on data representation.

---

# Key Takeaways

- Computers represent all information using binary.
- Numbers are stored using integer and floating-point formats.
- Signed numbers allow negative values.
- Boolean values represent logical states.
- Text is stored using character encoding standards such as Unicode.
- Images are represented using pixels and color values.
- Audio is represented through sampling and digital encoding.
- Video combines images and audio into digital data.
- Compression reduces storage and transmission requirements.
- Data representation is the foundation of modern computing.

---

# Final Knowledge Check

1. What is data representation?

2. Why do computers use binary?

3. What is the difference between signed and unsigned numbers?

4. What standard is used for floating-point representation?

5. What are the three components of a floating-point number?

6. How is text stored inside computers?

7. What is a pixel?

8. How is digital audio created?

9. What is the difference between lossless and lossy compression?

10. Why is data representation important for developers?

---

# What's Next?

The final part of this lesson will include:

# Part 10 – Exercises, Review Questions, and Practical Activities

It will contain:

- Fill in the blanks
- Multiple choice questions
- True/False questions
- Short answer questions
- Practical activities
- Interview questions
- Mini project
- Lesson completion checklist

---

# End of Part 9

# Lesson 07 – Data Representation in Computers

# Part 10 – Exercises, Review Questions, and Practical Activities

## Lesson Review

In this lesson, we explored how computers represent different types of information internally.

Although humans interact with:

- Numbers
- Text
- Images
- Audio
- Video

computers process all information using:

```
Binary Data (0 and 1)
```

We learned that data representation provides the methods and standards that allow computers to convert real-world information into digital form.

---

# Exercise 1 – Fill in the Blanks

Complete the following sentences.

1. Computers represent all information internally using ______.

2. The smallest unit of digital information is called a ______.

3. Eight bits make one ______.

4. Integer and floating-point numbers are examples of ______ data representation.

5. Negative numbers are commonly represented using the ______ method.

6. Floating-point representation follows the ______ 754 standard.

7. Boolean values are represented using ______ and ______.

8. A digital image is made up of small elements called ______.

9. RGB stands for Red, Green, and ______.

10. Text is stored using character encoding standards such as ______.

11. The most commonly used web encoding standard is ______.

12. Audio is converted into digital form using a process called ______.

13. A video consists of multiple image ______ displayed rapidly.

14. Reducing file size while maintaining information is called data ______.

15. ZIP is an example of ______ compression.

---

# Exercise 2 – Multiple Choice Questions

## 1. What language do computers understand internally?

A. English

B. Decimal

C. Binary

D. ASCII

**Answer:** C

---

## 2. Which of the following is a numeric data type?

A. Integer

B. Image

C. Audio

D. Video

**Answer:** A

---

## 3. Which representation allows negative numbers?

A. Unsigned numbers

B. Signed numbers

C. ASCII

D. RGB

**Answer:** B

---

## 4. Which method is commonly used for representing negative integers?

A. ASCII

B. RGB

C. Two's Complement

D. UTF-8

**Answer:** C

---

## 5. Which standard defines floating-point representation?

A. IEEE 754

B. Unicode

C. HTTP

D. RGB

**Answer:** A

---

## 6. A Boolean value can contain:

A. Unlimited values

B. Only two values

C. Only numbers

D. Only characters

**Answer:** B

---

## 7. Which technology represents text characters universally?

A. JPEG

B. Unicode

C. MP3

D. ZIP

**Answer:** B

---

## 8. A digital image is made up of:

A. Bytes

B. Pixels

C. Frames

D. Samples

**Answer:** B

---

## 9. Which process converts sound into digital data?

A. Rendering

B. Sampling

C. Compression

D. Encoding

**Answer:** B

---

## 10. Which of the following is a lossy compression format?

A. PNG

B. ZIP

C. JPEG

D. FLAC

**Answer:** C

---

# Exercise 3 – True or False

Write True or False.

1. Computers store all types of data using binary.

2. A pixel is the smallest unit of a digital image.

3. Signed numbers cannot represent negative values.

4. Floating-point numbers store decimal values.

5. UTF-8 is used for character encoding.

6. Boolean data has only two possible states.

7. Audio files are stored as continuous sound waves.

8. Video is a sequence of images displayed quickly.

9. Lossless compression permanently removes information.

10. Compression reduces file size.

11. RGB is used for representing image colors.

12. Two's Complement is used for negative integer representation.

13. A higher resolution image contains fewer pixels.

14. Unicode supports multiple languages.

15. Data representation is important only for hardware engineers.

---

# Exercise 4 – Match the Following

| Column A | Column B |
|----------|----------|
| Binary | Computer internal representation |
| Integer | Whole number data |
| Floating Point | Decimal number representation |
| Boolean | True/False values |
| Unicode | Character encoding |
| Pixel | Image element |
| RGB | Color representation |
| Sampling | Audio conversion |
| Frame | Video image |
| Compression | Reduces file size |

---

# Exercise 5 – Short Answer Questions

Answer the following questions.

## 1. What is data representation?

---

## 2. Why do computers convert information into binary?

---

## 3. Explain the difference between signed and unsigned numbers.

---

## 4. What is floating-point representation?

---

## 5. What are the three parts of a floating-point number?

---

## 6. What is Boolean data?

---

## 7. Why is Unicode important?

---

## 8. What is the purpose of RGB color representation?

---

## 9. How is digital audio represented?

---

## 10. What is data compression?

---

# Exercise 6 – Practical Activities

## Activity 1 – Binary Number Representation

Convert the following decimal numbers into binary:

```
10

25

50

100
```

Verify your answers by converting the binary values back into decimal.

---

## Activity 2 – Explore Character Encoding

Create a text file containing:

```
Hello World

नमस्ते

こんにちは

😊
```

Save the file using UTF-8 encoding.

Verify that all characters display correctly.

---

## Activity 3 – Image Representation

Choose a digital image and observe:

- Resolution
- File size
- File format

Record:

```
Image Resolution:

File Format:

File Size:
```

Explain how changing resolution affects file size.

---

## Activity 4 – Audio Representation

Compare two audio files.

Observe:

- File size
- Format
- Bit rate
- Quality

Example:

```
MP3

WAV
```

Explain why their sizes are different.

---

## Activity 5 – Compression Experiment

Create a folder containing:

- Images
- Documents
- Text files

Compress the folder using ZIP.

Compare:

Before compression:

```
Size:
```

After compression:

```
Size:
```

Calculate the reduction percentage.

---

# Mini Project

# Build a Digital Data Analyzer Report

Create a report explaining how different types of data are represented inside computers.

Your report should include:

## Section 1 – Numbers

Explain:

- Binary numbers
- Signed numbers
- Floating-point numbers

---

## Section 2 – Text

Explain:

- ASCII
- Unicode
- UTF-8

---

## Section 3 – Images

Explain:

- Pixels
- Resolution
- RGB colors

---

## Section 4 – Audio and Video

Explain:

- Sampling
- Frame rate
- Compression

---

## Section 5 – Real-World Application

Choose one application:

Examples:

- YouTube
- Instagram
- Online banking
- Video games
- Mobile applications

Explain how data representation is used.

---

# Interview Questions

## Beginner Level

1. What is data representation?

2. Why do computers use binary?

3. What is a bit?

4. What is a byte?

5. What is Unicode?

---

## Intermediate Level

6. Explain signed and unsigned numbers.

7. What is Two's Complement?

8. Explain floating-point representation.

9. How are images stored digitally?

10. How is audio converted into digital data?

---

## Advanced Level

11. Why do floating-point rounding errors occur?

12. How does compression reduce file size?

13. Explain the difference between lossless and lossy compression.

14. Why is UTF-8 preferred on the web?

15. How does a computer process multimedia data?

---

# Lesson Completion Checklist

Mark each item when completed.

- [ ] I understand what data representation means.
- [ ] I understand numeric data representation.
- [ ] I can explain signed and unsigned numbers.
- [ ] I understand floating-point numbers.
- [ ] I understand Boolean representation.
- [ ] I understand character encoding.
- [ ] I understand image representation.
- [ ] I understand audio representation.
- [ ] I understand video representation.
- [ ] I understand data compression.
- [ ] I completed the exercises.
- [ ] I completed the practical activities.
- [ ] I can explain data representation in an interview.

---

# Congratulations!

You have completed:

```
Lesson 07 – Data Representation in Computers
```

You now understand how computers represent different forms of information internally.

These concepts are fundamental for learning:

- Programming
- Operating Systems
- Computer Architecture
- Databases
- Networking
- Artificial Intelligence
- Software Engineering

---

# End of Lesson 07

Next:

# Lesson 08 – Module Summary and Revision