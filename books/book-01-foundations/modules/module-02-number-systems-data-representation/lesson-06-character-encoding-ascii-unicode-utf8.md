# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 1 – Introduction to Character Encoding

## Introduction

In the previous lesson, we learned how computers store data using **bits**, **bytes**, and **memory units**. We also explored how storage devices organize and manage digital information.

However, a new question arises:

> **How does a computer store letters, numbers, punctuation marks, symbols, and emojis if it only understands binary (0s and 1s)?**

The answer lies in **Character Encoding**.

Character encoding is a system that allows computers to represent human-readable characters as binary numbers. Every letter, digit, punctuation mark, and symbol is assigned a unique numeric value, which is then stored in binary form.

Without character encoding, computers would not be able to display text, create documents, browse websites, send emails, or write program source code.

Character encoding is one of the most fundamental concepts in computer science because almost every digital application depends on it.

---

# What is a Character?

A **character** is any individual symbol that can be represented by a computer.

Characters include:

- Uppercase letters (A–Z)
- Lowercase letters (a–z)
- Digits (0–9)
- Punctuation marks
- Mathematical symbols
- Currency symbols
- Spaces
- Control characters
- Emojis
- Characters from different languages

Examples:

```
A

b

7

@

#

$

?

!

😊

न

中
```

Every one of these is considered a character.

---

# What is Character Encoding?

Character encoding is the process of assigning a unique numeric value to every character so that computers can store, process, and display text correctly.

Instead of storing the letter:

```
A
```

a computer stores its assigned numerical value.

That value is then converted into binary.

For example:

```
Character

↓

Numeric Code

↓

Binary

↓

Stored in Memory
```

When the data is read, the reverse process occurs.

```
Binary

↓

Numeric Code

↓

Character

↓

Displayed on Screen
```

---

# Why Do Computers Need Character Encoding?

Computers understand only binary numbers.

They cannot directly understand characters such as:

```
A

B

1

@

%
```

Character encoding creates a standard method for converting these characters into binary values.

Without character encoding, computers would not know:

- Which binary pattern represents the letter **A**
- Which binary pattern represents the digit **5**
- Which binary pattern represents the symbol **@**
- Which binary pattern represents an emoji 😊

Encoding solves this problem by defining a consistent mapping between characters and numeric values.

---

# How Character Encoding Works

The basic process consists of four steps.

### Step 1

The user enters a character.

Example:

```
A
```

↓

### Step 2

The encoding standard assigns a numeric code.

Example:

```
65
```

↓

### Step 3

The numeric code is converted into binary.

Example:

```
01000001
```

↓

### Step 4

The binary value is stored in memory or transmitted over a network.

When the computer reads the binary value, it performs the reverse conversion and displays:

```
A
```

---

# Character Encoding Process

The complete process can be visualized as:

```
Character

↓

Character Encoding

↓

Numeric Value

↓

Binary Representation

↓

Stored in Memory

↓

Retrieved

↓

Decoded

↓

Displayed as Character
```

This process happens automatically every time you type on a keyboard or open a text file.

---

# Real-World Example

Suppose you type:

```
Hello
```

The computer does not store the word directly.

Instead, each character is converted into its corresponding numeric code.

```
H

↓

Numeric Code

↓

Binary
```

```
e

↓

Numeric Code

↓

Binary
```

```
l

↓

Numeric Code

↓

Binary
```

```
l

↓

Numeric Code

↓

Binary
```

```
o

↓

Numeric Code

↓

Binary
```

The collection of binary values is stored in memory or on disk.

When you open the file later, the binary values are decoded back into:

```
Hello
```

---

# Where is Character Encoding Used?

Character encoding is used in almost every computing system.

Examples include:

- Text editors
- Word processors
- Programming languages
- Operating systems
- Web browsers
- Databases
- Email systems
- Mobile applications
- Messaging platforms
- Search engines
- Social media websites

Whenever text is stored or transmitted, character encoding is involved.

---

# Common Character Encoding Standards

Over the years, several encoding standards have been developed.

The most important ones are:

### ASCII

Designed for English characters and basic control codes.

---

### Extended ASCII

Expanded the original ASCII standard to include additional symbols and characters.

---

### Unicode

Created to support characters from almost every writing system in the world.

---

### UTF-8

The most widely used Unicode encoding today, especially on the web.

---

### UTF-16

A Unicode encoding commonly used in many software platforms and programming environments.

---

### UTF-32

A Unicode encoding where every character occupies four bytes.

Each of these standards will be discussed in detail in the upcoming parts of this lesson.

---

# Importance of Character Encoding

Character encoding makes modern computing possible.

It enables computers to:

- Display text correctly.
- Store documents.
- Process programming source code.
- Exchange information between systems.
- Support multiple languages.
- Represent mathematical symbols.
- Display emojis and special characters.
- Enable international communication.

Without standardized character encoding, text created on one computer might appear incorrectly on another.

---

# Common Problems Without Proper Encoding

Incorrect character encoding can produce unreadable or corrupted text.

For example:

Correct text:

```
Hello World
```

Incorrectly decoded text:

```
HÃ©llo WÃ¶rld
```

Another example:

```
?????
```

or

```
□ □ □ □
```

These issues occur when text is decoded using the wrong character encoding.

Using the correct encoding standard ensures that text appears exactly as intended.

---

# Key Takeaways

- Computers understand only binary numbers.
- Character encoding assigns numeric values to characters.
- The numeric values are stored as binary data.
- Character encoding allows computers to store, process, and display text.
- Every letter, digit, punctuation mark, and symbol has an assigned code.
- Character encoding is essential for programming, web development, databases, operating systems, and digital communication.
- Modern systems primarily use Unicode and UTF-8 for representing text.

---

## Quick Knowledge Check

1. What is a character?

2. What is character encoding?

3. Why do computers need character encoding?

4. What is the basic process of character encoding?

5. Name three common character encoding standards.

6. Why can incorrectly encoded text appear as unreadable symbols?

7. Which character encoding is most commonly used on the modern web?

---

# End of Part 1

Next:

## Part 2 – ASCII Character Set

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 2 – ASCII Character Set

## Introduction

In the previous part, we learned that computers use **character encoding** to represent letters, numbers, punctuation marks, and symbols as binary data.

The first widely accepted character encoding standard was **ASCII**.

ASCII provided a common way for computers to store, process, and exchange text. Before ASCII, different computer manufacturers used their own encoding systems, making it difficult for computers to communicate with one another.

Although modern systems primarily use Unicode, ASCII remains one of the most important standards in computer science because it forms the foundation of many modern encoding systems.

---

# What is ASCII?

**ASCII** stands for:

```
American Standard Code for Information Interchange
```

It is a character encoding standard developed to represent text in computers and communication devices.

ASCII assigns a unique numeric value to each character.

These numeric values are stored in binary form inside a computer.

For example:

```
Character

↓

ASCII Code

↓

Binary

↓

Stored in Memory
```

When the data is read, the binary value is converted back into the original character.

---

# History of ASCII

ASCII was developed during the early days of computing to establish a common standard for exchanging information between different computer systems.

Before ASCII:

- Different manufacturers used different character codes.
- Data exchange between systems was difficult.
- Documents created on one system often could not be read correctly on another.

ASCII solved this problem by defining a standard set of character codes.

Its widespread adoption made data communication much more reliable.

---

# ASCII Uses 7 Bits

The original ASCII standard uses:

```
7 Bits
```

With 7 bits, ASCII can represent:

```
2⁷

=

128 Characters
```

These characters are assigned numeric codes from:

```
0

to

127
```

Each code corresponds to a specific character or control function.

---

# Categories of ASCII Characters

The 128 ASCII codes are divided into two main categories.

## 1. Control Characters

ASCII codes:

```
0 – 31
```

and

```
127
```

These are **non-printable characters** used to control devices or formatting.

Examples include:

- New Line
- Tab
- Carriage Return
- Backspace
- Escape
- Delete

These characters are not displayed as visible text.

---

## 2. Printable Characters

ASCII codes:

```
32 – 126
```

These are the visible characters that appear on the screen.

They include:

- Uppercase letters
- Lowercase letters
- Numbers
- Punctuation marks
- Mathematical symbols
- Special symbols
- Space character

---

# ASCII Character Table (Examples)

| Character | ASCII Code | Binary |
|-----------|-----------:|---------|
| A | 65 | 1000001 |
| B | 66 | 1000010 |
| C | 67 | 1000011 |
| a | 97 | 1100001 |
| b | 98 | 1100010 |
| c | 99 | 1100011 |
| 0 | 48 | 0110000 |
| 1 | 49 | 0110001 |
| 2 | 50 | 0110010 |
| Space | 32 | 0100000 |
| ! | 33 | 0100001 |
| @ | 64 | 1000000 |

The numeric value is what the computer stores internally. The binary representation is derived from that value.

---

# Uppercase Letters in ASCII

The uppercase English alphabet occupies ASCII codes:

```
65

to

90
```

Examples:

| Letter | ASCII Code |
|--------|-----------:|
| A | 65 |
| B | 66 |
| C | 67 |
| X | 88 |
| Y | 89 |
| Z | 90 |

---

# Lowercase Letters in ASCII

The lowercase English alphabet occupies ASCII codes:

```
97

to

122
```

Examples:

| Letter | ASCII Code |
|--------|-----------:|
| a | 97 |
| b | 98 |
| c | 99 |
| x | 120 |
| y | 121 |
| z | 122 |

Notice that uppercase and lowercase letters have different ASCII codes.

---

# Digits in ASCII

The digits use ASCII codes:

```
48

to

57
```

Examples:

| Digit | ASCII Code |
|-------|-----------:|
| 0 | 48 |
| 1 | 49 |
| 2 | 50 |
| 5 | 53 |
| 9 | 57 |

This allows computers to distinguish between numeric characters and actual numeric values.

---

# Common ASCII Symbols

ASCII also defines many commonly used symbols.

Examples:

| Symbol | ASCII Code |
|--------|-----------:|
| ! | 33 |
| " | 34 |
| # | 35 |
| $ | 36 |
| % | 37 |
| & | 38 |
| ( | 40 |
| ) | 41 |
| * | 42 |
| + | 43 |
| , | 44 |
| - | 45 |
| . | 46 |
| / | 47 |
| : | 58 |
| ; | 59 |
| ? | 63 |
| @ | 64 |

These symbols are widely used in programming languages, documents, and operating systems.

---

# Control Characters

Some commonly used ASCII control characters include:

| Character | ASCII Code | Purpose |
|-----------|-----------:|---------|
| NUL | 0 | Null character |
| TAB | 9 | Horizontal tab |
| LF | 10 | Line feed (new line on many systems) |
| CR | 13 | Carriage return |
| ESC | 27 | Escape |
| DEL | 127 | Delete |

Although these characters are not printed, they are essential for text formatting and communication.

---

# Advantages of ASCII

ASCII became popular because it offered several benefits.

- Simple and easy to implement
- Standardized text representation
- Compatible across different computer systems
- Efficient storage using only 7 bits
- Supported by almost all programming languages
- Forms the basis of many modern character encodings

Even today, the first 128 Unicode characters are identical to ASCII.

---

# Limitations of ASCII

Despite its importance, ASCII has several limitations.

### Limited Character Set

ASCII supports only:

- English letters
- Digits
- Basic punctuation
- Control characters

It does **not** support characters from most other languages.

---

### No International Language Support

ASCII cannot represent characters such as:

```
न

中

أ

Ж

é

ü
```

This makes it unsuitable for multilingual computing.

---

### No Emoji Support

ASCII cannot represent modern symbols such as:

```
😊

🚀

🌍

❤️
```

Support for these characters requires Unicode.

---

# Real-World Applications

ASCII is still widely used in:

- Programming languages
- Source code files
- Network protocols
- Configuration files
- Log files
- Text-based communication
- Command-line interfaces

Many programming languages and operating systems remain ASCII-compatible for basic English text.

---

# Key Takeaways

- ASCII stands for **American Standard Code for Information Interchange**.
- ASCII is a 7-bit character encoding standard.
- It represents **128 unique characters**.
- ASCII includes printable characters and control characters.
- Uppercase letters use codes **65–90**.
- Lowercase letters use codes **97–122**.
- Digits use codes **48–57**.
- ASCII is simple and efficient but limited to English and basic symbols.
- Modern systems use Unicode while maintaining compatibility with ASCII.

---

## Quick Knowledge Check

1. What does ASCII stand for?

2. How many bits does the original ASCII standard use?

3. How many characters can ASCII represent?

4. What is the ASCII code for the letter **A**?

5. What ASCII code range is used for uppercase letters?

6. What is the difference between printable and control characters?

7. Why is ASCII not suitable for representing all world languages?

---

# End of Part 2

Next:

## Part 3 – Extended ASCII

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 3 – Extended ASCII

## Introduction

In the previous part, we learned about the **ASCII (American Standard Code for Information Interchange)** standard.

ASCII was a major milestone in computer history because it provided a common way to represent text using **7 bits**. However, ASCII had an important limitation—it could represent only **128 characters**, which was sufficient for basic English but inadequate for many other languages and symbols.

To overcome this limitation, **Extended ASCII** was introduced.

Extended ASCII increased the number of available character codes by using **8 bits** instead of 7 bits, allowing computers to represent additional letters, symbols, and graphical characters.

Although Extended ASCII improved upon the original ASCII standard, it still had several limitations that eventually led to the development of Unicode.

---

# What is Extended ASCII?

Extended ASCII is an enhancement of the original ASCII character set.

Instead of using:

```
7 Bits
```

it uses:

```
8 Bits
```

With 8 bits, the total number of possible character combinations becomes:

```
2⁸

=

256 Characters
```

Character codes range from:

```
0

to

255
```

The first 128 codes remain identical to the original ASCII standard, while the additional 128 codes are used for extended characters.

---

# ASCII vs Extended ASCII

| Feature | ASCII | Extended ASCII |
|---------|-------|----------------|
| Bits Used | 7 | 8 |
| Number of Characters | 128 | 256 |
| Character Codes | 0–127 | 0–255 |
| English Support | Yes | Yes |
| Additional Symbols | Limited | Yes |
| International Characters | Very Limited | Improved |

Extended ASCII maintained backward compatibility with ASCII while expanding the available character set.

---

# Character Range

Extended ASCII can be divided into two sections.

## Standard ASCII

```
0 – 127
```

These characters are exactly the same as the original ASCII standard.

They include:

- English letters
- Digits
- Punctuation marks
- Control characters

---

## Extended Characters

```
128 – 255
```

These additional codes include:

- Accented letters
- Currency symbols
- Mathematical symbols
- Box-drawing characters
- Special punctuation
- Language-specific characters

These extra characters made Extended ASCII more useful for international users.

---

# Examples of Extended ASCII Characters

Some commonly used extended characters include:

| Character | Description |
|-----------|-------------|
| é | Letter e with acute accent |
| ü | Letter u with umlaut |
| ñ | Letter n with tilde |
| £ | British Pound symbol |
| ¥ | Japanese Yen symbol |
| © | Copyright symbol |
| ® | Registered trademark symbol |
| ± | Plus-minus symbol |
| ° | Degree symbol |
| µ | Micro symbol |

These characters were not available in the original ASCII standard.

---

# Box-Drawing Characters

Extended ASCII also introduced special characters for creating simple graphical interfaces in text mode.

Examples:

```
┌ ─ ┐

│   │

└ ─ ┘
```

These box-drawing characters were widely used in early operating systems and text-based software before graphical user interfaces became common.

---

# Why Was Extended ASCII Needed?

As computers became more widely used around the world, users needed support for:

- European languages
- Scientific notation
- Mathematical symbols
- Currency symbols
- Technical documentation

The original ASCII standard was not sufficient for these requirements.

Extended ASCII provided additional character codes without changing the basic ASCII structure.

---

# Code Pages

One important limitation of Extended ASCII was that there was **no single universal standard** for the additional 128 characters.

Different computer systems used different **code pages**.

A **code page** is a specific mapping of character codes (128–255) to symbols.

For example:

- One code page might assign a code to **é**.
- Another code page might assign the same code to a completely different character.

As a result, text created on one computer could appear incorrectly on another if they used different code pages.

---

# Common Extended ASCII Code Pages

Some well-known code pages include:

- ISO 8859-1 (Latin-1)
- Windows-1252
- IBM Code Page 437
- ISO 8859-5 (Cyrillic)
- ISO 8859-6 (Arabic)

Each code page supported different languages or regional requirements.

---

# Limitations of Extended ASCII

Although Extended ASCII was an improvement over ASCII, it still had significant drawbacks.

## Limited Number of Characters

Extended ASCII supports only:

```
256 Characters
```

This is not enough to represent all the world's writing systems.

---

## Multiple Code Pages

Different systems used different code pages.

This often caused text corruption when files were shared between computers.

---

## No Universal Standard

There was no single Extended ASCII table accepted worldwide.

Different operating systems and software applications interpreted character codes differently.

---

## No Emoji Support

Extended ASCII cannot represent modern emojis.

Examples:

```
😊

🚀

🌍

🎉
```

These require Unicode.

---

## Limited Language Support

Extended ASCII can represent some European languages but cannot fully support:

- Hindi
- Chinese
- Japanese
- Korean
- Arabic
- Hebrew
- Tamil
- Telugu
- Marathi
- Many other languages

---

# Real-World Example

Suppose a document contains the character:

```
é
```

On one system, it may display correctly.

On another system using a different code page, the same binary value could display as:

```
Ú
```

or another incorrect character.

This problem was common before Unicode became the universal standard.

---

# Transition to Unicode

The limitations of Extended ASCII highlighted the need for a universal encoding system.

Developers required a standard that could:

- Represent characters from every language.
- Eliminate code page conflicts.
- Support mathematical symbols.
- Include emojis.
- Ensure consistent text across different platforms.

Unicode was developed to meet these requirements.

Modern computers now use Unicode instead of Extended ASCII for most text processing.

---

# Importance of Extended ASCII

Although it has largely been replaced by Unicode, Extended ASCII remains important because:

- It played a key role in the evolution of character encoding.
- Many legacy systems still use Extended ASCII code pages.
- Older documents and software may still rely on these encodings.
- Understanding Extended ASCII helps explain why Unicode was developed.

---

# Key Takeaways

- Extended ASCII expands the original ASCII standard from **7 bits** to **8 bits**.
- It supports **256 characters** instead of **128**.
- The first **128 characters** are identical to standard ASCII.
- Additional codes provide accented letters, symbols, and graphical characters.
- Different systems used different code pages, leading to compatibility issues.
- Extended ASCII cannot represent all world languages or emojis.
- Unicode was created to overcome these limitations.

---

## Quick Knowledge Check

1. How many bits does Extended ASCII use?

2. How many characters can Extended ASCII represent?

3. Which character codes are identical to the original ASCII standard?

4. What is a code page?

5. Why could text appear incorrectly on different computers using Extended ASCII?

6. Name two limitations of Extended ASCII.

7. Which modern character encoding standard replaced Extended ASCII for most applications?

---

# End of Part 3

Next:

## Part 4 – Unicode

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 4 – Unicode

## Introduction

In the previous part, we learned that **Extended ASCII** increased the number of available characters from **128** to **256** by using **8 bits**.

Although this improvement allowed computers to represent more symbols and characters, it still could not support all of the world's languages. Different computer systems also used different **code pages**, causing compatibility problems when text was shared between systems.

To solve these issues, a universal character encoding standard called **Unicode** was developed.

Today, Unicode is the world's most widely used character standard and forms the foundation of modern computing, programming, web development, and digital communication.

---

# What is Unicode?

**Unicode** is an international character encoding standard designed to represent characters from almost every writing system in the world.

Unlike ASCII, which focuses mainly on English characters, Unicode includes:

- English
- Hindi
- Marathi
- Chinese
- Japanese
- Korean
- Arabic
- Hebrew
- Russian
- Tamil
- Telugu
- Gujarati
- Bengali
- Mathematical symbols
- Currency symbols
- Technical symbols
- Musical notation
- Emojis
- Thousands of additional characters

Its goal is simple:

> **Assign a unique code to every character, regardless of the platform, programming language, or operating system.**

---

# Why Was Unicode Developed?

Before Unicode:

- Different operating systems used different code pages.
- Files created on one computer often displayed incorrectly on another.
- Many languages could not be represented.
- International communication was difficult.

Unicode solved these problems by creating **one universal character set**.

This allows computers worldwide to represent text consistently.

---

# Unicode Character Set

Unicode is capable of representing **well over one million possible code points**, although only a portion of them are currently assigned to characters.

These code points cover:

- Modern languages
- Ancient scripts
- Mathematical notation
- Scientific symbols
- Currency symbols
- Technical symbols
- Musical notation
- Braille
- Emojis
- Historic writing systems

New characters continue to be added as the Unicode Standard evolves.

---

# Unicode Code Points

Every Unicode character is assigned a unique **code point**.

A code point is written in the form:

```
U+XXXX
```

where:

- **U+** indicates a Unicode code point.
- **XXXX** is the hexadecimal value assigned to the character.

Examples:

| Character | Unicode Code Point |
|-----------|-------------------|
| A | U+0041 |
| B | U+0042 |
| a | U+0061 |
| 0 | U+0030 |
| Space | U+0020 |
| @ | U+0040 |
| ₹ | U+20B9 |
| 😊 | U+1F60A |

Each code point uniquely identifies a character.

---

# Unicode Examples

### English

```
A

↓

U+0041
```

---

### Hindi

```
अ

↓

U+0905
```

---

### Marathi

```
म

↓

U+092E
```

---

### Chinese

```
中

↓

U+4E2D
```

---

### Japanese

```
あ

↓

U+3042
```

---

### Arabic

```
ا

↓

U+0627
```

---

### Emoji

```
😊

↓

U+1F60A
```

Unicode allows all of these characters to coexist in the same document.

---

# Unicode and Binary

Unicode code points are **not** stored directly in memory.

Instead, they are encoded using a **Unicode Transformation Format (UTF)**.

Common Unicode encoding formats include:

- UTF-8
- UTF-16
- UTF-32

For example:

```
Character

↓

Unicode Code Point

↓

UTF Encoding

↓

Binary Data

↓

Stored in Memory
```

We will study UTF encodings in the next parts of this lesson.

---

# Unicode Blocks

Unicode organizes characters into logical groups called **blocks**.

Examples include:

- Basic Latin
- Latin-1 Supplement
- Greek
- Cyrillic
- Arabic
- Devanagari
- Hebrew
- Hiragana
- Katakana
- CJK Unified Ideographs
- Mathematical Operators
- Currency Symbols
- Emoticons

This organization helps software efficiently process and display characters from different writing systems.

---

# Advantages of Unicode

Unicode offers many advantages over earlier encoding standards.

### Universal Character Set

Supports characters from almost every language and writing system.

---

### Platform Independent

Text encoded with Unicode can be exchanged reliably between different operating systems and applications.

---

### Consistency

Each character has one unique code point, eliminating code page conflicts.

---

### Multilingual Support

A single document can contain multiple languages.

Example:

```
English

हिन्दी

मराठी

中文

العربية

😊
```

---

### Emoji Support

Unicode provides standardized code points for emojis and symbols.

Examples:

```
😀

🚀

🌍

🎉

❤️
```

---

### Future Expansion

Unicode is designed to grow as new characters and symbols are needed.

---

# Real-World Applications

Unicode is used in almost every modern computing system, including:

- Operating systems
- Web browsers
- Programming languages
- Databases
- Mobile applications
- Social media platforms
- Search engines
- Email systems
- Cloud services
- Digital publishing

Without Unicode, global communication over the Internet would be extremely difficult.

---

# Unicode vs ASCII

| Feature | ASCII | Unicode |
|---------|-------|----------|
| Bits Used | 7 | Uses UTF encodings |
| Characters | 128 | Supports a vast range of characters |
| Languages | Mainly English | Almost all world languages |
| Emojis | No | Yes |
| Code Pages | Not Required | Not Required |
| International Support | Very Limited | Excellent |

Unicode retains compatibility with ASCII because the first 128 Unicode code points correspond to the original ASCII characters.

---

# Common Misconceptions

## Misconception 1

Unicode is **not** the same as UTF-8.

Unicode defines the **characters and their code points**, while UTF-8 is one way of encoding those code points into bytes.

---

## Misconception 2

Unicode is **not** limited to English.

It supports characters from languages across the world.

---

## Misconception 3

Unicode is **not** only for text.

It also includes:

- Mathematical symbols
- Technical symbols
- Currency symbols
- Musical notation
- Emojis
- Many other specialized character sets

---

# Importance for Developers

Understanding Unicode helps developers:

- Build multilingual applications.
- Correctly store and retrieve text.
- Prevent character corruption.
- Handle international user input.
- Process emojis and special symbols.
- Develop globally compatible software.

Unicode knowledge is essential for modern software development.

---

# Key Takeaways

- Unicode is a universal character encoding standard.
- Every character is assigned a unique **Unicode code point**.
- Unicode supports almost every writing system in the world.
- It eliminates the compatibility problems of ASCII and Extended ASCII.
- Unicode code points are stored using UTF encodings such as UTF-8, UTF-16, and UTF-32.
- Unicode enables multilingual computing and modern digital communication.
- Most modern software, websites, and programming languages rely on Unicode.

---

## Quick Knowledge Check

1. What is Unicode?

2. Why was Unicode developed?

3. What is a Unicode code point?

4. How is a Unicode code point written?

5. Name three Unicode encoding formats.

6. Why is Unicode better than Extended ASCII?

7. Can Unicode represent emojis and multiple languages in the same document?

---

# End of Part 4

Next:

## Part 5 – UTF-8 Encoding

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 5 – UTF-8 Encoding

## Introduction

In the previous part, we learned that **Unicode** assigns a unique code point to every character.

For example:

```
A

↓

U+0041
```

```
अ

↓

U+0905
```

```
😊

↓

U+1F60A
```

However, computers cannot store Unicode code points directly in memory.

Instead, the code points must first be converted into binary data using an **encoding format**.

The most widely used Unicode encoding format today is:

```
UTF-8
```

Almost every modern website, operating system, programming language, and database uses UTF-8 because it is efficient, compact, and compatible with ASCII.

---

# What is UTF-8?

**UTF-8** stands for:

```
Unicode Transformation Format – 8-bit
```

UTF-8 is a variable-length character encoding used to represent Unicode characters.

Unlike ASCII, which always uses 7 bits, or UTF-32, which always uses 4 bytes, UTF-8 uses **one to four bytes** depending on the character.

This makes UTF-8 both flexible and storage-efficient.

---

# Why is UTF-8 Needed?

Unicode defines the code points for characters, but it does not specify how those code points should be stored in memory.

UTF-8 solves this problem by converting Unicode code points into sequences of bytes.

Process:

```
Character

↓

Unicode Code Point

↓

UTF-8 Encoding

↓

Binary Bytes

↓

Stored in Memory
```

Whenever text is displayed or transmitted, the reverse process converts the stored bytes back into characters.

---

# Variable-Length Encoding

UTF-8 uses a **variable number of bytes** for different characters.

| Character Type | Bytes Used |
|---------------|-----------:|
| Basic ASCII characters | 1 Byte |
| Many European characters | 2 Bytes |
| Most Asian language characters | 3 Bytes |
| Emojis and some special symbols | 4 Bytes |

This approach saves storage space because common English characters require only one byte.

---

# UTF-8 Byte Structure

UTF-8 organizes characters as follows:

| Bytes | Binary Pattern |
|-------:|----------------|
| 1 Byte | `0xxxxxxx` |
| 2 Bytes | `110xxxxx 10xxxxxx` |
| 3 Bytes | `1110xxxx 10xxxxxx 10xxxxxx` |
| 4 Bytes | `11110xxx 10xxxxxx 10xxxxxx 10xxxxxx` |

These patterns help computers determine where one character ends and the next begins.

---

# UTF-8 Examples

### Example 1 – English Letter

Character:

```
A
```

Unicode:

```
U+0041
```

UTF-8 Storage:

```
1 Byte
```

---

### Example 2 – Currency Symbol

Character:

```
€
```

Unicode:

```
U+20AC
```

UTF-8 Storage:

```
3 Bytes
```

---

### Example 3 – Hindi Character

Character:

```
अ
```

Unicode:

```
U+0905
```

UTF-8 Storage:

```
3 Bytes
```

---

### Example 4 – Emoji

Character:

```
😊
```

Unicode:

```
U+1F60A
```

UTF-8 Storage:

```
4 Bytes
```

---

# ASCII Compatibility

One of the biggest advantages of UTF-8 is that it is fully compatible with ASCII.

The first **128 Unicode characters** are exactly the same as ASCII.

Examples:

| Character | ASCII Code | Unicode | UTF-8 Bytes |
|-----------|-----------:|----------|------------:|
| A | 65 | U+0041 | 1 |
| B | 66 | U+0042 | 1 |
| 0 | 48 | U+0030 | 1 |
| @ | 64 | U+0040 | 1 |
| Space | 32 | U+0020 | 1 |

This compatibility allowed older ASCII-based software to continue working while supporting Unicode.

---

# UTF-8 Storage Efficiency

Consider the following text:

```
Hello World
```

All characters are basic ASCII characters.

Each character uses:

```
1 Byte
```

If the text contains:

```
Hello 😊
```

The letters still use:

```
1 Byte each
```

The emoji uses:

```
4 Bytes
```

UTF-8 therefore uses additional storage only when needed.

---

# Advantages of UTF-8

UTF-8 has become the most popular Unicode encoding because of several important advantages.

### Efficient Storage

English text occupies very little storage because common characters use only one byte.

---

### ASCII Compatibility

Older ASCII documents remain valid UTF-8 documents.

---

### Worldwide Language Support

UTF-8 supports virtually every writing system, including:

- English
- Hindi
- Marathi
- Chinese
- Japanese
- Korean
- Arabic
- Russian
- Tamil
- Telugu
- Bengali
- Gujarati
- Many others

---

### Emoji Support

UTF-8 fully supports Unicode emojis.

Examples:

```
😀

🚀

🌍

❤️

🎉
```

---

### Internet Standard

UTF-8 is the default encoding used by most websites and web technologies.

---

# Real-World Applications

UTF-8 is used in:

- HTML documents
- CSS files
- JavaScript source code
- Python programs
- Java applications
- Databases
- JSON files
- XML documents
- APIs
- Email systems
- Markdown files
- Git repositories

If you've written HTML pages or Markdown files, you've almost certainly used UTF-8.

---

# Common Misconceptions

## Misconception 1

UTF-8 does **not** use exactly 8 bits for every character.

It uses **one to four bytes**, depending on the character.

---

## Misconception 2

UTF-8 is **not** a replacement for Unicode.

Unicode defines the characters, while UTF-8 defines how they are encoded into bytes.

---

## Misconception 3

UTF-8 does **not** make all characters the same size.

Different characters require different numbers of bytes.

---

# Why UTF-8 Became the Web Standard

UTF-8 became the preferred encoding because it:

- Is efficient for English text.
- Supports almost every language.
- Supports emojis.
- Is backward compatible with ASCII.
- Reduces compatibility issues between systems.
- Is supported by all modern browsers and programming languages.

Today, UTF-8 is the recommended encoding for nearly all new software and websites.

---

# Key Takeaways

- UTF-8 stands for **Unicode Transformation Format – 8-bit**.
- UTF-8 encodes Unicode code points into binary bytes.
- It uses **1 to 4 bytes** per character.
- ASCII characters require only **1 byte**.
- UTF-8 is fully compatible with ASCII.
- It supports virtually every language and emoji.
- UTF-8 is the most widely used character encoding on the modern web.

---

## Quick Knowledge Check

1. What does UTF-8 stand for?

2. Why is UTF-8 needed?

3. How many bytes can UTF-8 use for a character?

4. How many bytes does the letter **A** use in UTF-8?

5. Why is UTF-8 considered storage-efficient?

6. Is UTF-8 compatible with ASCII?

7. Why is UTF-8 the preferred encoding for websites?

---

# End of Part 5

Next:

## Part 6 – UTF-16 and UTF-32

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 6 – UTF-16 and UTF-32

## Introduction

In the previous part, we learned about **UTF-8**, the most widely used Unicode encoding format.

UTF-8 is efficient because it uses **1 to 4 bytes** depending on the character being stored.

However, UTF-8 is not the only way to encode Unicode characters.

Two other important Unicode encoding formats are:

- UTF-16
- UTF-32

Like UTF-8, both UTF-16 and UTF-32 represent the same Unicode characters. The difference lies in **how those characters are stored in memory**.

Different software platforms and operating systems choose different Unicode encoding formats based on their requirements.

---

# What is UTF-16?

**UTF-16** stands for:

```
Unicode Transformation Format – 16-bit
```

UTF-16 stores Unicode characters using:

- **2 bytes (16 bits)** for most commonly used characters.
- **4 bytes (32 bits)** for less common characters, such as many emojis and certain historical scripts.

Unlike UTF-8, which may use as little as one byte, UTF-16 starts with two bytes for most characters.

---

# UTF-16 Storage

Examples:

### English Letter

```
A
```

Unicode:

```
U+0041
```

Typical UTF-16 Storage:

```
2 Bytes
```

---

### Hindi Character

```
अ
```

Unicode:

```
U+0905
```

Typical UTF-16 Storage:

```
2 Bytes
```

---

### Emoji

```
😊
```

Unicode:

```
U+1F60A
```

Typical UTF-16 Storage:

```
4 Bytes
```

Characters outside the most commonly used Unicode range require two 16-bit units (known as a **surrogate pair**), resulting in a total of 4 bytes.

---

# Advantages of UTF-16

UTF-16 offers several advantages.

### Efficient for Many Languages

Many commonly used writing systems fit within a single 16-bit code unit.

---

### Faster Access

Since many characters occupy the same size, some text-processing operations can be simpler than with UTF-8.

---

### Widely Supported

UTF-16 has been widely used in operating systems, programming languages, and application frameworks.

---

# Limitations of UTF-16

Despite its strengths, UTF-16 also has limitations.

- English text generally requires more storage than UTF-8.
- Some characters still require 4 bytes.
- Processing surrogate pairs adds complexity for characters outside the basic multilingual range.

---

# What is UTF-32?

**UTF-32** stands for:

```
Unicode Transformation Format – 32-bit
```

UTF-32 stores **every Unicode character using exactly 4 bytes (32 bits)**.

Unlike UTF-8 and UTF-16, UTF-32 uses a **fixed-length** encoding.

This means every character occupies the same amount of memory.

---

# UTF-32 Storage

Examples:

### English Letter

```
A
```

Storage:

```
4 Bytes
```

---

### Hindi Character

```
अ
```

Storage:

```
4 Bytes
```

---

### Chinese Character

```
中
```

Storage:

```
4 Bytes
```

---

### Emoji

```
😊
```

Storage:

```
4 Bytes
```

Regardless of the character, UTF-32 always uses four bytes.

---

# Advantages of UTF-32

### Fixed-Length Encoding

Every character has the same size.

This simplifies character indexing because each character starts at a predictable memory location.

---

### Simple Processing

Software can locate the *n*th character directly without decoding variable-length byte sequences.

---

### Complete Unicode Support

UTF-32 can represent every Unicode character without using surrogate pairs.

---

# Limitations of UTF-32

### High Memory Usage

Even simple English text uses four bytes per character.

Example:

```
Hello
```

UTF-8:

```
5 Bytes
```

UTF-32:

```
20 Bytes
```

For large documents, this difference becomes significant.

---

### Inefficient Storage

Because every character occupies four bytes, UTF-32 requires much more storage than UTF-8 for most text.

---

### Limited Practical Use

UTF-32 is mainly used in specialized software where fixed-length character representation is more important than storage efficiency.

---

# UTF-8 vs UTF-16 vs UTF-32

| Feature | UTF-8 | UTF-16 | UTF-32 |
|---------|-------|--------|--------|
| Character Size | 1–4 Bytes | 2 or 4 Bytes | 4 Bytes |
| ASCII Compatibility | Yes | No | No |
| Storage Efficiency for English | Excellent | Good | Poor |
| Storage Efficiency for Multilingual Text | Excellent | Very Good | Poor |
| Fixed-Length Encoding | No | No | Yes |
| Emoji Support | Yes | Yes | Yes |
| Common Usage | Web, files, APIs | Applications, platforms | Specialized systems |

---

# Which Encoding Should You Use?

The choice depends on the application.

### UTF-8

Best for:

- Websites
- HTML
- CSS
- JavaScript
- Markdown
- JSON
- XML
- APIs
- Source code
- Git repositories

---

### UTF-16

Often used in:

- Some operating systems
- Desktop applications
- Certain programming language runtimes
- Software frameworks

---

### UTF-32

Suitable for:

- Specialized software
- Internal text processing
- Research applications
- Systems where fixed-length character representation is beneficial

---

# Real-World Example

Suppose you create a web page containing:

```
Hello World
```

The page is usually saved as:

```
UTF-8
```

Now consider a multilingual document:

```
Hello

नमस्ते

こんにちは

😊
```

This document can also be stored using UTF-8.

If another application prefers UTF-16 internally, it can convert the text without changing the characters.

Regardless of the encoding used, the displayed text remains the same.

---

# Common Misconceptions

## Misconception 1

UTF-16 is **not** a replacement for Unicode.

Unicode defines the characters, while UTF-16 defines one method of encoding them.

---

## Misconception 2

UTF-32 is **not** faster in every situation.

Although fixed-length encoding simplifies some operations, its increased memory usage can reduce overall efficiency.

---

## Misconception 3

Changing from UTF-8 to UTF-16 does **not** change the text itself.

Only the internal byte representation changes.

---

# Importance for Developers

Developers should understand UTF-16 and UTF-32 because they:

- Help explain how different software stores text.
- Improve understanding of memory usage.
- Prevent character encoding errors.
- Assist in debugging internationalization issues.
- Provide insight into how programming languages process strings.

Even if you primarily use UTF-8, understanding the other Unicode encodings is valuable.

---

# Key Takeaways

- UTF-16 uses **2 or 4 bytes** per character.
- UTF-32 always uses **4 bytes** per character.
- UTF-8, UTF-16, and UTF-32 all represent the same Unicode characters.
- The difference lies in how characters are encoded and stored.
- UTF-8 is the most common encoding for web technologies.
- UTF-16 is widely used in many software platforms.
- UTF-32 is simple but requires significantly more memory.

---

## Quick Knowledge Check

1. What does UTF-16 stand for?

2. How many bytes does UTF-16 use for most characters?

3. How many bytes does UTF-32 use for every character?

4. Which encoding is fixed-length?

5. Which encoding is most storage-efficient for English text?

6. Can UTF-8, UTF-16, and UTF-32 all represent the same Unicode characters?

7. Why is UTF-32 less commonly used?

---

# End of Part 6

Next:

## Part 7 – Character Encoding in Programming and Web Development

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 7 – Character Encoding in Programming and Web Development

## Introduction

In the previous parts of this lesson, we learned about:

- ASCII
- Extended ASCII
- Unicode
- UTF-8
- UTF-16
- UTF-32

These standards define how computers represent characters internally.

However, character encoding is not just a theoretical concept—it is used every day in programming, web development, databases, operating systems, and digital communication.

Whenever you create a program, save a file, develop a website, or exchange data over the Internet, character encoding ensures that text is stored and displayed correctly.

Understanding character encoding helps developers build applications that work reliably across different platforms, languages, and devices.

---

# Character Encoding in Programming

Programming languages work with text by storing characters according to a character encoding standard.

Common programming tasks involving character encoding include:

- Reading text files
- Writing text files
- Displaying text on the screen
- Receiving keyboard input
- Sending data over networks
- Processing strings
- Storing information in databases

If the correct encoding is not used, text may become unreadable or corrupted.

---

# Strings and Character Encoding

A **string** is a sequence of characters.

Example:

```
Hello
```

A computer stores this string by encoding each character.

```
H

↓

Unicode Code Point

↓

UTF Encoding

↓

Binary
```

The same process is repeated for every character in the string.

Programming languages automatically perform these conversions, allowing developers to work with text instead of raw binary values.

---

# Source Code Files

Every source code file is saved using a character encoding.

Examples include:

- C
- C++
- Java
- Python
- JavaScript
- TypeScript
- Go
- Rust
- Kotlin

Most modern development tools save source files using **UTF-8**.

Using a consistent encoding ensures that identifiers, comments, and string literals are stored correctly.

---

# Character Encoding in Web Development

Character encoding is essential for websites.

A web page contains:

- Text
- Numbers
- Symbols
- Emojis
- Multiple languages

Browsers must know which encoding is used to display this content correctly.

The recommended encoding for modern web pages is:

```
UTF-8
```

---

# HTML Character Encoding

In HTML, the document encoding is declared using the `<meta>` element.

Example:

```html
<meta charset="UTF-8">
```

This tells the browser to interpret the document using UTF-8.

Without the correct declaration, browsers may display incorrect characters.

---

# CSS and Character Encoding

CSS files also contain text.

They may include:

- Selectors
- Property names
- Values
- Comments
- Font names

Modern CSS files are typically saved using UTF-8, ensuring consistent interpretation across browsers.

---

# JavaScript and Character Encoding

JavaScript source files are generally saved using UTF-8.

JavaScript strings can contain:

```
Hello

नमस्ते

こんにちは

😊
```

Because JavaScript uses Unicode, applications can work with multilingual text and emojis without changing the programming language itself.

---

# Databases and Character Encoding

Databases store large amounts of text.

Examples include:

- User names
- Password hints
- Product descriptions
- Blog posts
- Comments
- Messages
- Emails

Using a Unicode-compatible encoding allows a database to store text from multiple languages correctly.

Modern database systems commonly support UTF-8.

---

# APIs and Data Exchange

Applications often exchange data using formats such as:

- JSON
- XML

These formats are commonly encoded using UTF-8.

Example JSON:

```json
{
  "name": "Shrikant",
  "city": "Pune",
  "message": "Hello 😊"
}
```

Because UTF-8 supports Unicode, applications can exchange multilingual text reliably.

---

# Email and Messaging

Emails and messaging applications depend on character encoding.

Examples include:

- Email clients
- Instant messaging
- Social media
- Collaboration tools

Without Unicode, users would not be able to send messages containing:

- Different languages
- Currency symbols
- Mathematical symbols
- Emojis

Character encoding ensures that messages appear correctly for recipients around the world.

---

# Common Encoding Problems

Using different encodings during reading and writing can produce incorrect output.

For example, intended text:

```
Café
```

May incorrectly appear as:

```
CafÃ©
```

Similarly:

```
नमस्ते
```

Could appear as unreadable symbols if decoded using the wrong encoding.

These problems occur when the encoding used to save data does not match the encoding used to read it.

---

# Best Practices for Developers

To avoid character encoding issues:

- Save source code files using UTF-8.
- Use UTF-8 for HTML, CSS, JavaScript, JSON, and XML files.
- Ensure databases use Unicode-compatible encodings.
- Keep the same encoding throughout the application.
- Test applications using multiple languages and special characters.
- Verify that data exchanged between systems uses the expected encoding.

Following these practices helps create reliable and globally compatible software.

---

# Real-World Applications

Character encoding is used in:

- Operating systems
- Web browsers
- Search engines
- Programming languages
- Database management systems
- Mobile applications
- Cloud services
- Digital publishing
- Online banking
- E-commerce websites
- Social media platforms
- Messaging applications

Every modern software system relies on proper character encoding.

---

# Importance for Developers

Understanding character encoding helps developers:

- Build multilingual applications.
- Prevent text corruption.
- Correctly process user input.
- Handle international data.
- Support emojis and special symbols.
- Improve application compatibility across platforms.

Character encoding is an essential part of software development and web development.

---

# Key Takeaways

- Programming languages use character encoding to store and process text.
- Most modern source code files are saved using UTF-8.
- HTML documents specify their encoding using `<meta charset="UTF-8">`.
- Databases and APIs commonly use UTF-8 for multilingual data.
- Using the wrong encoding can result in corrupted or unreadable text.
- Consistent use of UTF-8 helps ensure compatibility across systems and applications.

---

## Quick Knowledge Check

1. Why is character encoding important in programming?

2. Which encoding is commonly used for modern source code files?

3. How is UTF-8 specified in an HTML document?

4. Why should databases support Unicode?

5. What can happen if a file is read using the wrong character encoding?

6. Why is UTF-8 recommended for web development?

7. Name three areas where character encoding is commonly used.

---

# End of Part 7

Next:

## Part 8 – Emoji and Multilingual Text

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 8 – Emoji and Multilingual Text

## Introduction

Modern computers are expected to display and process text from languages all over the world. They must also support thousands of symbols, mathematical notations, currency signs, and emojis.

Early character encoding standards such as **ASCII** and **Extended ASCII** could represent only a limited set of characters, mainly for English and a few additional symbols. They were not designed for global communication.

The introduction of **Unicode** solved this problem by providing a universal character set that supports almost every writing system in use today.

As a result, modern computers can display multiple languages and emojis within the same document, web page, or application.

---

# What is Multilingual Text?

**Multilingual text** refers to text that contains characters from more than one language or writing system.

For example:

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

A modern application can display all of these together because of Unicode.

---

# Unicode and World Languages

Unicode supports characters from almost every writing system used around the world.

Examples include:

- English
- Hindi
- Marathi
- Sanskrit
- Tamil
- Telugu
- Gujarati
- Bengali
- Punjabi
- Malayalam
- Kannada
- Chinese
- Japanese
- Korean
- Arabic
- Hebrew
- Russian
- Greek
- Thai
- Many others

This makes Unicode the foundation of international computing.

---

# Mixing Multiple Languages

Unicode allows different languages to appear in the same document.

Example:

```
Welcome

स्वागत है

欢迎

ようこそ

مرحباً
```

Each language uses a different writing system, but Unicode represents all of them using unique code points.

---

# What are Emojis?

**Emojis** are standardized graphical characters used to express emotions, objects, activities, places, and ideas in digital communication.

Examples:

```
😀

😊

😂

❤️

👍

🚀

🌍

📚

💻

🎉
```

Unlike images, emojis are Unicode characters.

Each emoji has its own Unicode code point.

---

# Unicode Code Points for Emojis

Examples:

| Emoji | Unicode Code Point |
|--------|--------------------|
| 😀 | U+1F600 |
| 😊 | U+1F60A |
| ❤️ | U+2764 |
| 🚀 | U+1F680 |
| 🌍 | U+1F30D |
| 💻 | U+1F4BB |

Applications display these code points using fonts that contain emoji designs.

---

# How Emojis are Stored

The process is similar to storing text.

```
Emoji

↓

Unicode Code Point

↓

UTF-8 / UTF-16 / UTF-32 Encoding

↓

Binary Data

↓

Stored in Memory
```

When the data is read, the encoding is decoded and the corresponding emoji is displayed.

---

# Why Unicode is Important for Emojis

ASCII and Extended ASCII cannot represent emojis because they provide too few character codes.

Unicode includes thousands of emoji characters and continues to add new ones over time.

This allows applications to display a consistent set of emojis across different platforms.

---

# Character Encoding in Social Media

Social media platforms rely heavily on Unicode.

Users frequently combine:

- Text
- Emojis
- Symbols
- Multiple languages

Example:

```
Hello 😊

नमस्ते 🌸

こんにちは 🎉

مرحباً 🌍
```

Without Unicode, displaying this content correctly would not be possible.

---

# Character Encoding in Messaging Applications

Messaging platforms such as chat applications and email services depend on Unicode to support global communication.

Users can send:

- Greetings
- Emojis
- Mathematical symbols
- Currency symbols
- Different languages

The recipient sees the same text because both systems interpret the Unicode data correctly.

---

# Fonts and Character Display

Unicode defines **which character** is stored, but it does **not** define **how the character looks**.

The appearance of a character depends on the font being used.

For example, the same Unicode character may look slightly different in different fonts while still representing the same underlying code point.

The same is true for emojis—different operating systems may display the same Unicode emoji with slightly different artwork.

---

# Common Encoding Problems

If a system does not support the required Unicode characters or fonts, text may not display correctly.

Possible results include:

```
□ □ □ □
```

or

```
?????
```

or

```
�
```

These symbols indicate that the character could not be decoded or displayed properly.

Using Unicode-compatible software and fonts helps prevent these problems.

---

# Real-World Applications

Unicode and multilingual text support are used in:

- Web browsers
- Search engines
- Email systems
- Mobile phones
- Operating systems
- Online banking
- E-commerce websites
- Government portals
- Educational platforms
- Social media
- Messaging applications
- Digital publishing

These systems rely on Unicode to serve users from different countries and language backgrounds.

---

# Importance for Developers

Understanding Unicode and multilingual text enables developers to:

- Build international applications.
- Support users from different regions.
- Handle multilingual databases.
- Display emojis correctly.
- Process text reliably across platforms.
- Avoid encoding-related errors.

Proper character encoding is essential for creating software that works globally.

---

# Key Takeaways

- Unicode supports almost every writing system in the world.
- Multilingual text contains characters from multiple languages.
- Emojis are Unicode characters with unique code points.
- UTF-8, UTF-16, and UTF-32 can all encode Unicode characters.
- Fonts determine how Unicode characters and emojis appear on the screen.
- Unicode enables global communication across websites, applications, and operating systems.

---

## Quick Knowledge Check

1. What is multilingual text?

2. Why is Unicode important for international communication?

3. Are emojis images or Unicode characters?

4. Can a single document contain multiple languages using Unicode?

5. What determines how a Unicode character appears on the screen?

6. Why can't ASCII represent emojis?

7. Name three applications that rely on Unicode for multilingual text.

---

# End of Part 8

Next:

## Part 9 – Lesson Summary

# Lesson 06 – Character Encoding (ASCII, Unicode, UTF-8)

# Part 9 – Lesson Summary

## Introduction

In this lesson, we explored how computers represent, store, process, and exchange text using **character encoding**.

Although humans read letters, numbers, punctuation marks, and symbols, computers ultimately store everything as **binary data (0s and 1s)**. Character encoding provides the rules that map these binary values to readable characters.

We studied the evolution of character encoding from the original **ASCII** standard to **Extended ASCII**, and finally to the **Unicode Standard**, which supports almost every language and symbol used in modern computing.

We also learned about **UTF-8**, **UTF-16**, and **UTF-32**, the encoding formats that store Unicode characters in computer memory.

Finally, we explored how character encoding is used in programming, web development, databases, messaging applications, and multilingual communication.

---

# Topics Covered

During this lesson, we studied the following topics:

- Introduction to Character Encoding
- ASCII (American Standard Code for Information Interchange)
- Extended ASCII
- Unicode
- UTF-8 Encoding
- UTF-16 and UTF-32
- Character Encoding in Programming and Web Development
- Emoji and Multilingual Text

Together, these concepts explain how computers handle text across different platforms, operating systems, and languages.

---

# Evolution of Character Encoding

The development of character encoding can be summarized as follows:

```
ASCII

↓

Extended ASCII

↓

Unicode

↓

UTF-8 / UTF-16 / UTF-32

↓

Modern Computing
```

Each new standard addressed the limitations of the previous one and improved support for international communication.

---

# ASCII Recap

ASCII was the first widely accepted character encoding standard.

Main features:

- Uses **7 bits**
- Represents **128 characters**
- Supports English letters, digits, punctuation marks, and control characters
- Still forms the basis of many modern systems

ASCII was ideal for early computers but could not represent most world languages.

---

# Extended ASCII Recap

Extended ASCII expanded the original ASCII standard.

Main features:

- Uses **8 bits**
- Supports **256 characters**
- Adds accented letters, symbols, and graphical characters
- Introduced different code pages

Although it supported more characters, it lacked a universal standard and could not represent all writing systems.

---

# Unicode Recap

Unicode solved the compatibility problems of ASCII and Extended ASCII.

Key features:

- Assigns a unique code point to every character
- Supports almost every language in the world
- Includes mathematical symbols, currency symbols, technical symbols, and emojis
- Provides consistent character representation across platforms

Unicode is now the foundation of modern text processing.

---

# UTF Encodings Recap

Unicode characters are stored in memory using encoding formats.

### UTF-8

- Uses **1 to 4 bytes**
- Fully compatible with ASCII
- Efficient for English text
- Most widely used on the web

---

### UTF-16

- Uses **2 or 4 bytes**
- Commonly used by many software platforms
- Efficient for many writing systems

---

### UTF-32

- Uses **4 bytes** for every character
- Fixed-length encoding
- Simple character indexing
- Higher memory usage

All three encodings represent the same Unicode characters but store them differently.

---

# Character Encoding in Modern Computing

Character encoding is used in nearly every area of computing.

Examples include:

- Operating systems
- Programming languages
- Web browsers
- HTML documents
- CSS files
- JavaScript programs
- Databases
- JSON and XML data
- Email systems
- Messaging applications
- Cloud services
- Mobile applications
- Digital publishing

Without character encoding, computers could not correctly display or exchange text.

---

# Importance for Developers

Developers use character encoding to:

- Store text correctly.
- Display multilingual content.
- Prevent data corruption.
- Process user input.
- Support emojis and special symbols.
- Build globally compatible software.
- Exchange information between different systems.

Understanding character encoding is an essential skill for software development.

---

# Real-World Example

Consider the message:

```
Hello 😊

नमस्ते

こんにちは

مرحباً
```

When you type this message:

1. Each character is assigned a Unicode code point.
2. The code points are encoded using UTF-8 (or another UTF encoding).
3. The encoded bytes are stored or transmitted.
4. The receiving device decodes the bytes.
5. The original characters are displayed correctly.

This process happens automatically every time we use modern computers or the Internet.

---

# Key Takeaways

- Character encoding maps binary data to readable characters.
- ASCII introduced a standard for English text.
- Extended ASCII expanded the available character set but had compatibility limitations.
- Unicode provides a universal character set for almost every writing system.
- UTF-8, UTF-16, and UTF-32 are different ways of encoding Unicode characters.
- UTF-8 is the most widely used encoding for websites and software.
- Modern computing relies on Unicode for multilingual communication and emoji support.

---

# Glossary

| Term | Meaning |
|------|---------|
| Character Encoding | Method of representing characters using binary values |
| ASCII | 7-bit character encoding standard |
| Extended ASCII | 8-bit extension of ASCII with 256 characters |
| Unicode | Universal character standard for almost all languages |
| Code Point | Unique identifier assigned to a Unicode character |
| UTF-8 | Variable-length Unicode encoding using 1–4 bytes |
| UTF-16 | Unicode encoding using 2 or 4 bytes |
| UTF-32 | Unicode encoding using 4 bytes for every character |
| Emoji | Unicode character representing an emotion, object, or symbol |
| Multilingual Text | Text containing characters from multiple languages |

---

# Final Knowledge Check

1. What is character encoding?

2. Why was ASCII developed?

3. What limitation led to the creation of Extended ASCII?

4. Why was Unicode introduced?

5. What is a Unicode code point?

6. What is the difference between Unicode and UTF-8?

7. How many bytes can UTF-8 use for a character?

8. Which Unicode encoding always uses 4 bytes?

9. Why is UTF-8 the preferred encoding for modern websites?

10. How does Unicode support multilingual communication?

---

# What's Next?

In the next lesson, you will learn:

# Lesson 07 – Data Representation in Computers

You will explore:

- How computers represent different types of data
- Numeric data representation
- Signed and unsigned numbers
- Floating-point representation
- Boolean values
- Character and text storage
- Images, audio, and video representation
- Data compression basics
- Real-world applications of data representation

This lesson will build on your understanding of number systems and character encoding to explain how computers store and process all forms of digital information.

---

# End of Lesson 06

