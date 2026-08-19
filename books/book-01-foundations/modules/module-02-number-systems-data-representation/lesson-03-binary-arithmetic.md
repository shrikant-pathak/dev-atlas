# Lesson 03 – Binary Arithmetic

# Part 1 – Introduction to Binary Arithmetic

## Introduction

Arithmetic is the foundation of every computing operation.

Every time a computer performs tasks such as:

- Adding numbers
- Calculating totals
- Processing images
- Running applications
- Executing programs
- Performing scientific calculations

the processor performs millions or billions of arithmetic operations internally.

Unlike humans, who normally calculate using the decimal system (Base-10), computers perform calculations using the **Binary Number System (Base-2)**.

This process is called **Binary Arithmetic**.

---

# What is Binary Arithmetic?

Binary Arithmetic is the process of performing mathematical operations using binary numbers.

The main binary arithmetic operations are:

1. Binary Addition
2. Binary Subtraction
3. Binary Multiplication
4. Binary Division

These operations follow the same mathematical principles as decimal arithmetic, but they use only two digits:

```
0 and 1
```

---

# Why Computers Use Binary Arithmetic

Computers use binary arithmetic because electronic circuits operate using two stable states.

These states are represented as:

```
OFF → 0

ON → 1
```

A processor is built from billions of tiny electronic switches called **transistors**.

These transistors can easily represent two conditions:

```
No electrical signal → 0

Electrical signal → 1
```

Because of this, binary calculations are faster, simpler, and more reliable for electronic hardware.

---

# Decimal Arithmetic vs Binary Arithmetic

Humans usually calculate using decimal.

Example:

```
25 + 15 = 40
```

Computers perform the same operation using binary.

Decimal:

```
25₁₀ + 15₁₀ = 40₁₀
```

Binary:

```
11001₂ + 01111₂ = 101000₂
```

The result represents the same value, but the calculation method is different.

---

# Binary Arithmetic Rules

Binary arithmetic follows the same basic concepts as decimal arithmetic:

- Addition requires carrying.
- Subtraction requires borrowing.
- Multiplication uses repeated addition.
- Division uses repeated subtraction.

The main difference is that binary has only two digits.

Decimal:

```
0 1 2 3 4 5 6 7 8 9
```

Binary:

```
0 1
```

---

# Importance in Computer Science

Understanding binary arithmetic helps learners understand:

- How CPUs calculate values.
- How machine instructions work.
- How memory stores numerical data.
- How programming languages interact with hardware.
- How digital circuits perform calculations.

It is one of the most important foundations of computer architecture.

---

# Real-World Example

When you use a calculator application:

You enter:

```
15 + 7
```

The computer does not directly calculate:

```
15 + 7
```

Instead, internally it converts the values into binary:

```
15 → 1111₂

7 → 0111₂
```

The processor performs binary arithmetic:

```
1111
+0111
-----
10110
```

Then the result is converted back and displayed:

```
22
```

---

# Key Takeaways

- Binary arithmetic is mathematical calculation using binary numbers.
- Computers perform all internal calculations using binary.
- Binary uses only two digits: 0 and 1.
- CPUs use binary because electronic circuits naturally support two states.
- Binary arithmetic includes addition, subtraction, multiplication, and division.
- Understanding binary arithmetic helps explain how processors work.

---

## Quick Knowledge Check

1. What is binary arithmetic?
2. Why do computers use binary instead of decimal?
3. What are the two digits used in binary?
4. Name the four basic binary arithmetic operations.
5. What hardware component makes binary processing possible?


# Part 2 – Binary Addition Fundamentals

## Introduction

Addition is the most basic arithmetic operation performed by computers.

Just like humans add decimal numbers, computers add binary numbers. The only difference is that binary uses only two digits:

```
0 and 1
```

Because there are only two possible digits, binary addition follows a very small set of rules.

Understanding these rules is the foundation for learning how processors perform calculations.

---

# Decimal Addition Reminder

Before learning binary addition, let's recall how decimal addition works.

Example:

```
  25
+ 13
----
  38
```

When the sum of digits exceeds 9, we carry a value to the next position.

Example:

```
  18
+ 25
----
  43
```

Here:

```
8 + 5 = 13
```

We write:

```
3
```

and carry:

```
1
```

Binary addition works in the same way, but the carry happens much sooner because binary only has two digits.

---

# Basic Binary Addition Rules

Binary addition has only four possible combinations.

| First Bit | Second Bit | Result | Carry |
|-----------|------------|--------|-------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 10 | 1 |

These four rules are the foundation of all binary addition.

---

# Rule 1: Adding 0 + 0

When both bits are zero:

```
0 + 0 = 0
```

Example:

```
  0
+ 0
---
  0
```

No carry is generated.

---

# Rule 2: Adding 0 + 1

When one bit is one and the other is zero:

```
0 + 1 = 1
```

Example:

```
  0
+ 1
---
  1
```

The result is one.

---

# Rule 3: Adding 1 + 0

Binary addition is symmetrical:

```
1 + 0 = 1
```

Example:

```
  1
+ 0
---
  1
```

The order does not matter.

---

# Rule 4: Adding 1 + 1

This is the most important rule.

In decimal:

```
1 + 1 = 2
```

But binary does not have the digit 2.

The value 2 is represented as:

```
10₂
```

Therefore:

```
1 + 1 = 10₂
```

Meaning:

- Write **0** in the current position.
- Carry **1** to the next position.

Example:

```
   1
 + 1
 ----
  10
```

This is similar to decimal:

```
9 + 1 = 10
```

where the extra value moves to the next place.

---

# Binary Addition Table

The complete addition table is:

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

Notice that:

```
1 + 1
```

produces:

```
Sum = 0
Carry = 1
```

This carry concept is the most important idea in binary arithmetic.

---

# Simple Binary Addition Examples

## Example 1

```
  101
+ 010
-----
  111
```

Calculation:

Right side:

```
1 + 0 = 1
```

Middle:

```
0 + 1 = 1
```

Left:

```
1 + 0 = 1
```

Result:

```
101₂ + 010₂ = 111₂
```

---

## Example 2

```
  110
+ 001
-----
  111
```

Calculation:

```
0 + 1 = 1

1 + 0 = 1

1 + 0 = 1
```

Result:

```
111₂
```

---

# Binary Addition Without Carry

When no column contains:

```
1 + 1
```

the addition is simple.

Example:

```
   1010
 + 0101
 -------
   1111
```

Each position follows:

```
0+0
0+1
1+0
```

No carry is generated.

---

# Why Binary Addition Matters

Binary addition is used everywhere inside computers:

- CPU calculations
- Address calculations
- Memory operations
- Program execution
- Digital circuits

A processor performs billions of binary additions every second.

---

# Common Mistakes

❌ Writing:

```
1 + 1 = 2
```

in binary.

✔ Correct:

```
1 + 1 = 10₂
```

---

❌ Forgetting the carry.

✔ The result contains:

```
0 in current position

1 carried to next position
```

---

❌ Reading binary results as decimal numbers.

✔ Always remember the base.

Example:

```
10₂ = 2₁₀
```

---

# Key Takeaways

- Binary addition uses only four rules.
- Binary digits are added from right to left.
- The only time a carry occurs is when:

```
1 + 1
```

- In binary:

```
1 + 1 = 10₂
```

- Carry operations are essential for CPU arithmetic.

---

## Quick Knowledge Check

1. How many basic rules exist in binary addition?
2. What is the result of:

```
1 + 0
```

3. What happens when:

```
1 + 1
```

is calculated in binary?

4. What value does:

```
10₂
```

represent in decimal?

5. Why is carry important in binary addition?


# Part 3 – Binary Addition Rules and Examples

## Introduction

In the previous section, we learned the four basic binary addition rules:

```
0 + 0 = 0

0 + 1 = 1

1 + 0 = 1

1 + 1 = 10
```

Now we will apply these rules to larger binary numbers.

Binary addition follows the same process as decimal addition:

1. Start from the rightmost bit.
2. Add the bits in each column.
3. Write the result bit.
4. Carry the extra value to the next column when required.

---

# Binary Addition Process

Consider the decimal example:

```
  25
+ 18
----
  43
```

We start adding from the right side.

Binary addition works the same way:

```
   1011
 + 0110
 -------
```

The rightmost bits are added first.

---

# Example 1 – Addition Without Carry

Add:

```
  1010
+ 0101
------
```

Step-by-step:

### Column 1

```
0 + 1 = 1
```

Result:

```
1
```

---

### Column 2

```
1 + 0 = 1
```

Result:

```
11
```

---

### Column 3

```
0 + 1 = 1
```

Result:

```
111
```

---

### Column 4

```
1 + 0 = 1
```

Final result:

```
  1010
+ 0101
------
  1111
```

Therefore:

```
1010₂ + 0101₂ = 1111₂
```

Decimal verification:

```
10 + 5 = 15
```

---

# Example 2 – Addition With One Carry

Add:

```
  1011
+ 0110
------
```

Start from the right:

---

### Column 1

```
1 + 0 = 1
```

Write:

```
1
```

---

### Column 2

```
1 + 1 = 10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 3

Now add:

```
0 + 1 + carry 1
```

Therefore:

```
0 + 1 + 1 = 10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 4

Add:

```
1 + 0 + carry 1
```

Result:

```
10
```

Write:

```
0
```

Carry:

```
1
```

Place the final carry at the beginning.

Final:

```
    1
  1011
+ 0110
------
 10001
```

Therefore:

```
1011₂ + 0110₂ = 10001₂
```

Decimal verification:

```
11 + 6 = 17
```

```
10001₂ = 17₁₀
```

---

# Example 3 – Multiple Carry Operations

Add:

```
   1111
 + 0001
 -------
```

Starting from the right:

---

### Column 1

```
1 + 1 = 10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 2

```
1 + 0 + carry 1
```

Equals:

```
10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 3

```
1 + 0 + carry 1
```

Equals:

```
10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 4

```
1 + 0 + carry 1
```

Equals:

```
10
```

Write:

```
0
```

Carry:

```
1
```

Final carry:

```
1
```

Final result:

```
    1111
+   0001
---------
   10000
```

Therefore:

```
1111₂ + 0001₂ = 10000₂
```

Decimal:

```
15 + 1 = 16
```

---

# Binary Addition Rules Summary

| Operation | Result |
|-----------|--------|
| 0 + 0 | 0 |
| 0 + 1 | 1 |
| 1 + 0 | 1 |
| 1 + 1 | 10 (0 + carry 1) |
| 1 + 1 + carry | 11 (1 + carry 1) |

---

# Understanding Carry in Binary

Carry is generated whenever the result is greater than the largest possible single binary digit.

The largest binary digit is:

```
1
```

Therefore:

```
1 + 1
```

cannot be written as a single digit.

The value becomes:

```
10₂
```

where:

```
0 = current position

1 = next position carry
```

---

# Binary Addition in Computer Processors

Processors perform binary addition using electronic circuits called:

**Adders**

The two most important types are:

## Half Adder

A circuit that adds two binary digits.

Inputs:

```
A
B
```

Outputs:

```
Sum
Carry
```

---

## Full Adder

A circuit that adds:

- First bit
- Second bit
- Previous carry

Inputs:

```
A
B
Carry-in
```

Outputs:

```
Sum
Carry-out
```

Modern CPUs contain millions of these logical operations working together.

---

# Common Mistakes

❌ Adding binary digits like decimal.

Wrong:

```
1 + 1 = 2
```

Correct:

```
1 + 1 = 10₂
```

---

❌ Forgetting previous carry.

Example:

```
1 + 1 + carry
```

must be calculated as:

```
1 + 1 + 1 = 11₂
```

---

❌ Dropping the final carry.

Always place the final carry at the beginning.

---

# Key Takeaways

- Binary addition follows the same concept as decimal addition.
- Calculations start from the rightmost bit.
- Carry occurs when the result exceeds one binary digit.
- The most important rule is:

```
1 + 1 = 10₂
```

- CPUs use adder circuits to perform binary calculations.
- Full adders allow processors to handle large binary numbers.

---

## Quick Knowledge Check

1. From which side do we start binary addition?
2. What happens when:

```
1 + 1
```

is calculated?

3. Add:

```
101₂ + 010₂
```

4. Why is carry required in binary addition?

5. What electronic circuit performs binary addition inside processors?


# Part 4 – Binary Carry Operations

## Introduction

In binary addition, a **carry operation** occurs when the sum of two or more binary digits produces a value that cannot fit into the current bit position.

Since binary has only two digits:

```
0 and 1
```

any result greater than **1** must be moved to the next higher position.

This movement of an extra value is called a **carry**.

---

# Understanding Carry in Decimal

Before understanding binary carry, let's review decimal carry.

Example:

```
   28
 + 15
 ----
   43
```

Right column:

```
8 + 5 = 13
```

We write:

```
3
```

and carry:

```
1
```

to the next column.

Binary works exactly the same way.

---

# Basic Binary Carry Rule

The most important binary carry rule is:

```
1 + 1 = 10₂
```

This means:

```
Write 0 in the current position.

Carry 1 to the next position.
```

Example:

```
    1
   ----
    1
+   1
------
   10
```

---

# Carry Table

| Bit A | Bit B | Carry In | Result | Carry Out |
|------|------|----------|--------|-----------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

The final row represents:

```
1 + 1 + 1 = 11₂
```

Meaning:

```
Result bit = 1

Carry bit = 1
```

---

# Example 1 – Single Carry

Add:

```
   101
 + 011
 -----
```

Start from the right.

### Column 1

```
1 + 1 = 10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 2

Now:

```
0 + 1 + carry 1
```

Equals:

```
10
```

Write:

```
0
```

Carry:

```
1
```

---

### Column 3

Now:

```
1 + 0 + carry 1
```

Equals:

```
10
```

Write:

```
0
```

Carry:

```
1
```

Place final carry:

```
    1
   101
 + 011
 ------
  1000
```

Result:

```
101₂ + 011₂ = 1000₂
```

Decimal:

```
5 + 3 = 8
```

---

# Example 2 – Multiple Carry Propagation

Add:

```
   1111
 + 0001
 -------
```

This creates a carry chain.

---

### First column

```
1 + 1 = 10
```

Result:

```
0
```

Carry:

```
1
```

---

### Second column

```
1 + 0 + 1
```

Equals:

```
10
```

Result:

```
0
```

Carry:

```
1
```

---

### Third column

```
1 + 0 + 1
```

Equals:

```
10
```

Result:

```
0
```

Carry:

```
1
```

---

### Fourth column

```
1 + 0 + 1
```

Equals:

```
10
```

Result:

```
0
```

Carry:

```
1
```

Final carry:

```
1
```

Final answer:

```
    1111
 +  0001
 --------
   10000
```

This is called **carry propagation**.

---

# Carry Propagation

Carry propagation happens when one carry creates another carry in the next position.

Example:

```
1111
+0001
----
10000
```

The carry moves through every bit.

This process is extremely important in processor design because it affects calculation speed.

---

# Carry in CPU Design

Inside a processor, binary addition is performed using electronic circuits called adders.

A simple adder contains:

## Half Adder

Handles:

```
A + B
```

Produces:

```
Sum
Carry
```

Example:

```
1 + 1

Sum = 0

Carry = 1
```

---

## Full Adder

Handles:

```
A + B + Previous Carry
```

Inputs:

```
A
B
Carry In
```

Outputs:

```
Sum
Carry Out
```

Multiple full adders are connected together to add larger numbers.

Example:

```
8-bit Adder

Full Adder
     ↓
Full Adder
     ↓
Full Adder
     ↓
Full Adder
     ↓
...
```

---

# Carry and Overflow

Carry is also important for detecting overflow.

Overflow occurs when the result is too large to fit inside the available number of bits.

Example:

Using 4 bits:

Largest value:

```
1111₂
```

Decimal:

```
15
```

Adding:

```
1111
+0001
----
10000
```

The result requires 5 bits.

If the computer only stores 4 bits:

```
0000
```

The extra carry is lost.

This condition is called **overflow**.

---

# Real-World Importance

Carry operations are used in:

- CPU arithmetic units
- Digital calculators
- Graphics processors
- Embedded systems
- Microcontrollers
- Cryptography algorithms
- Scientific computing

Every mathematical operation performed by a processor depends on accurate carry handling.

---

# Common Mistakes

❌ Thinking carry only happens in decimal.

✔ Carry exists in every positional number system.

---

❌ Ignoring carry during multi-bit addition.

✔ Every carry must be added to the next column.

---

❌ Dropping the final carry without considering overflow.

✔ The system must check whether the extra bit can be stored.

---

# Key Takeaways

- Carry occurs when a binary result exceeds one bit.
- The main binary carry rule is:

```
1 + 1 = 10₂
```

- Carry propagation allows computers to add large binary numbers.
- CPUs use half adders and full adders for binary calculations.
- Overflow occurs when the result exceeds the available bit size.

---

## Quick Knowledge Check

1. What is a carry in binary arithmetic?
2. When does a carry occur?
3. What is the result of:

```
1 + 1
```

in binary?

4. What is carry propagation?
5. Which CPU circuits perform binary addition?



# Part 5 – Binary Subtraction Fundamentals

## Introduction

Subtraction is one of the fundamental arithmetic operations performed by computers.

Just like addition, computers perform subtraction using the **Binary Number System (Base-2)**.

Binary subtraction follows the same principles as decimal subtraction, but it uses only two digits:

```
0 and 1
```

The main challenge in binary subtraction is handling situations where a larger digit needs to subtract from a smaller digit. This requires a process called **borrowing**.

---

# Decimal Subtraction Reminder

Before understanding binary subtraction, let's review decimal subtraction.

Example:

```
  52
- 28
----
  24
```

In the ones column:

```
2 - 8
```

cannot be performed directly.

So we borrow:

```
12 - 8 = 4
```

Binary subtraction uses the same borrowing idea.

---

# Basic Binary Subtraction Rules

Binary subtraction has four basic rules:

| First Bit | Second Bit | Result |
|-----------|------------|--------|
| 0 | 0 | 0 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |
| 0 | 1 | Borrow required |

---

# Rule 1: 0 - 0

When both bits are zero:

```
0 - 0 = 0
```

Example:

```
  0
- 0
---
  0
```

No borrowing is required.

---

# Rule 2: 1 - 0

Subtracting zero from one:

```
1 - 0 = 1
```

Example:

```
  1
- 0
---
  1
```

The value remains unchanged.

---

# Rule 3: 1 - 1

Subtracting one from one:

```
1 - 1 = 0
```

Example:

```
  1
- 1
---
  0
```

The result is zero.

---

# Rule 4: 0 - 1

This is the only case requiring borrowing.

A smaller value cannot subtract a larger value:

```
0 - 1
```

So we borrow from the next higher position.

In binary:

```
10₂ - 1₂ = 1₂
```

The borrowed value:

```
10₂
```

represents decimal:

```
2
```

Therefore:

```
2 - 1 = 1
```

---

# Binary Subtraction Table

Complete subtraction table:

| A | B | Result | Borrow |
|---|---|--------|--------|
| 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |

The last row is the important one:

```
0 - 1
```

requires borrowing.

---

# Example 1 – Binary Subtraction Without Borrow

Subtract:

```
   1011
 - 0010
 -------
```

Start from the right.

### Column 1

```
1 - 0 = 1
```

---

### Column 2

```
1 - 1 = 0
```

---

### Column 3

```
0 - 0 = 0
```

---

### Column 4

```
1 - 0 = 1
```

Result:

```
   1011
 - 0010
 -------
   1001
```

Decimal verification:

```
11 - 2 = 9
```

Therefore:

```
1011₂ - 0010₂ = 1001₂
```

---

# Example 2 – Binary Subtraction With Borrow

Subtract:

```
   1010
 - 0011
 -------
```

Start from the right.

---

### Column 1

```
0 - 1
```

Borrow required.

Borrow from the next bit:

```
10₂ - 1₂ = 1₂
```

Result:

```
1
```

---

### Column 2

The borrowed bit becomes:

```
0
```

Now:

```
0 - 1
```

Again requires borrowing.

Result:

```
1
```

---

### Column 3

After borrowing:

```
0 - 0 = 0
```

---

### Column 4

```
1 - 0 = 1
```

Final:

```
   1010
 - 0011
 -------
   0111
```

Decimal verification:

```
10 - 3 = 7
```

Therefore:

```
1010₂ - 0011₂ = 0111₂
```

---

# Why Borrowing Matters

Borrowing allows computers to subtract values when the current bit is too small.

Without borrowing:

```
0 - 1
```

would be impossible.

Borrowing allows the processor to continue calculations accurately.

---

# Binary Subtraction in Processors

Modern processors usually do not have a separate subtraction circuit.

Instead, they use:

- Binary addition circuits
- Complement methods

The most common method is:

## Two's Complement

Computers convert subtraction into addition:

Example:

```
A - B
```

becomes:

```
A + (-B)
```

The negative value is represented using two's complement.

This allows CPUs to use the same addition circuits for both addition and subtraction.

---

# Common Mistakes

❌ Treating binary subtraction exactly like decimal.

✔ Remember that borrowing changes binary values differently.

---

❌ Forgetting that:

```
10₂ = 2₁₀
```

during borrowing.

---

❌ Ignoring borrowed values in the next column.

✔ Every borrow changes the previous position.

---

# Key Takeaways

- Binary subtraction uses four basic rules.
- The only difficult case is:

```
0 - 1
```

- Borrowing solves this problem.
- Binary subtraction follows the same concept as decimal subtraction.
- CPUs often perform subtraction using addition circuits and two's complement.

---

## Quick Knowledge Check

1. What are the four basic binary subtraction rules?
2. Which binary subtraction case requires borrowing?
3. What does:

```
10₂
```

represent in decimal?

4. Why do processors use two's complement?
5. Solve:

```
1010₂ - 0010₂
```


# Part 6 – Binary Borrow Operations

## Introduction

In binary subtraction, a **borrow operation** occurs when a smaller binary digit needs to subtract a larger binary digit.

The most common case is:

```
0 - 1
```

Since zero cannot subtract one directly, the computer borrows value from the next higher bit.

This borrowed value allows the subtraction to continue.

---

# Understanding Borrow in Decimal

Before understanding binary borrowing, let's review decimal borrowing.

Example:

```
  52
- 38
----
  14
```

In the ones column:

```
2 - 8
```

is not possible.

So we borrow:

```
12 - 8 = 4
```

The tens digit decreases by one.

Binary subtraction follows the same principle.

---

# Basic Binary Borrow Rule

The key binary subtraction rule is:

```
0 - 1 requires borrowing
```

When borrowing occurs:

```
Borrowed 1 binary digit becomes 10₂
```

Because:

```
10₂ = 2₁₀
```

Therefore:

```
10₂ - 1₂ = 1₂
```

---

# Borrow Table

| Bit A | Bit B | Borrow Needed | Result |
|-------|-------|---------------|--------|
| 0 | 0 | No | 0 |
| 1 | 0 | No | 1 |
| 1 | 1 | No | 0 |
| 0 | 1 | Yes | 1 |

The last row creates the borrow operation.

---

# Example 1 – Single Borrow Operation

Subtract:

```
   1010
 - 0001
 --------
```

Start from the right.

---

### Column 1

```
0 - 1
```

Borrow required.

Borrow from the next bit:

```
10₂ - 1₂ = 1₂
```

Result:

```
1
```

---

### Column 2

The borrowed bit becomes:

```
0
```

Now:

```
0 - 0 = 0
```

---

### Column 3

```
0 - 0 = 0
```

---

### Column 4

```
1 - 0 = 1
```

Final result:

```
   1010
 - 0001
 --------
   1001
```

Decimal verification:

```
10 - 1 = 9
```

---

# Example 2 – Multiple Borrow Operations

Subtract:

```
   1000
 - 0001
 --------
```

This example demonstrates borrow propagation.

---

### Column 1

```
0 - 1
```

Need borrow.

The next bit is:

```
0
```

It cannot provide a borrow.

The borrow moves further left until it reaches:

```
1
```

The number:

```
1000₂
```

is transformed temporarily:

```
0111
```

with the final borrowed bit:

```
10₂
```

Now:

```
10₂ - 1₂ = 1₂
```

Result:

```
0111
```

Therefore:

```
1000₂ - 0001₂ = 0111₂
```

Decimal:

```
8 - 1 = 7
```

---

# Borrow Propagation

Borrow propagation occurs when a borrow must travel through multiple bits.

Example:

```
10000₂ - 00001₂
```

The subtraction requires borrowing across several zeros.

The borrow travels:

```
1 0 0 0 0
        ↓
0 1 1 1 1
```

Result:

```
01111₂
```

Decimal:

```
16 - 1 = 15
```

---

# Borrow vs Carry

Carry and borrow are opposite concepts.

| Operation | Purpose | Example |
|-----------|---------|---------|
| Carry | Addition | 1 + 1 = 10 |
| Borrow | Subtraction | 0 - 1 |

Addition:

```
1 + 1

Result:
0
Carry:
1
```

Subtraction:

```
0 - 1

Borrow from next position
```

---

# Binary Subtraction Inside CPUs

Processors usually do not perform subtraction using physical borrowing circuits.

Instead, they use:

- Addition circuits
- Negative number representation
- Two's complement arithmetic

Example:

Normal subtraction:

```
7 - 3
```

Processor converts it into:

```
7 + (-3)
```

Then performs binary addition.

This approach simplifies processor design.

---

# Two's Complement Connection

Two's complement allows computers to represent negative numbers.

Example:

Positive:

```
00000101
```

Negative representation:

```
11111011
```

The processor can then use the same adder circuit for:

- Addition
- Subtraction

---

# Real-World Importance

Borrow operations are important in:

- CPU arithmetic units
- Microcontrollers
- Digital calculators
- Embedded systems
- Graphics processors
- Scientific computing

Every subtraction performed by a computer depends on accurate handling of binary borrowing.

---

# Common Mistakes

❌ Forgetting that:

```
10₂ = 2₁₀
```

during borrowing.

---

❌ Borrowing from a zero without propagating the borrow.

✔ The borrow must travel until it reaches a bit containing:

```
1
```

---

❌ Confusing borrow with carry.

✔ Carry is for addition.

✔ Borrow is for subtraction.

---

# Key Takeaways

- Borrowing is required when:

```
0 - 1
```

occurs.

- Borrowing converts:

```
0 into 10₂
```

- Borrow propagation occurs when multiple zeros are involved.
- CPUs often handle subtraction using two's complement instead of direct borrowing.
- Carry and borrow are fundamental concepts in digital arithmetic.

---

## Quick Knowledge Check

1. When does binary borrowing occur?
2. What does:

```
10₂
```

represent in decimal?

3. What is borrow propagation?
4. How is borrow different from carry?
5. Solve:

```
1100₂ - 0010₂
```


# Part 7 – Binary Multiplication and Division

## Introduction

Multiplication and division are advanced arithmetic operations performed by computers.

Like addition and subtraction, these operations are based on binary numbers:

```
0 and 1
```

Computers do not multiply and divide in the same way humans do with decimal numbers.

Instead, processors use combinations of:

- Binary addition
- Binary shifting
- Logical operations
- Specialized arithmetic circuits

---

# Binary Multiplication

Binary multiplication follows the same idea as decimal multiplication.

The main difference is that binary has only two digits.

The basic multiplication rules are:

| Bit A | Bit B | Result |
|-------|-------|--------|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

# Binary Multiplication Rules Explained

## Rule 1

```
0 × 0 = 0
```

Example:

```
0
×0
--
0
```

---

## Rule 2

```
0 × 1 = 0
```

Example:

```
0
×1
--
0
```

---

## Rule 3

```
1 × 0 = 0
```

Example:

```
1
×0
--
0
```

---

## Rule 4

```
1 × 1 = 1
```

Example:

```
1
×1
--
1
```

Because binary only contains 0 and 1, multiplication is much simpler than decimal multiplication.

---

# Binary Multiplication Example

Multiply:

```
   101
 ×  11
 -------
```

This is similar to decimal multiplication.

First multiply by the right bit:

```
101 × 1

= 101
```

Next multiply by the next bit:

```
101 × 1

Shift one position left:

1010
```

Now add:

```
     101
+   1010
---------
    1111
```

Result:

```
101₂ × 11₂ = 1111₂
```

Decimal verification:

```
5 × 3 = 15
```

```
1111₂ = 15₁₀
```

---

# Binary Multiplication Uses Shifting

Computers use a technique called **bit shifting**.

Multiplying by 2:

```
101₂
```

Shift left:

```
1010₂
```

Decimal:

```
5 × 2 = 10
```

---

Multiplying by 4:

Shift left twice:

```
101₂

↓

1010₂

↓

10100₂
```

Decimal:

```
5 × 4 = 20
```

---

# Binary Multiplication in CPUs

Processors use:

- Multiplication circuits
- Shift operations
- Addition circuits

A multiplication operation is often performed as:

```
Repeated shifting
+
Repeated addition
```

Modern processors contain dedicated multiplication units called:

**Arithmetic Logic Units (ALU)**

---

# Binary Division

Division is the opposite of multiplication.

Binary division follows the same concept as decimal division.

It involves:

- Dividing values
- Finding quotient
- Finding remainder

---

# Binary Division Rules

Binary division follows simple rules:

| Operation | Result |
|-----------|--------|
| 0 ÷ 1 | 0 |
| 1 ÷ 1 | 1 |
| 0 ÷ 0 | Invalid |
| 1 ÷ 0 | Invalid |

Division by zero is not allowed in computing.

---

# Binary Division Example

Divide:

```
1010₂ ÷ 10₂
```

Convert to decimal:

```
1010₂ = 10₁₀

10₂ = 2₁₀
```

Calculation:

```
10 ÷ 2 = 5
```

Convert back:

```
5₁₀ = 101₂
```

Result:

```
1010₂ ÷ 10₂ = 101₂
```

---

# Binary Division Using Shifting

Computers optimize division using bit shifting.

Dividing by 2:

Right shift one bit.

Example:

```
1010₂
```

Shift right:

```
0101₂
```

Decimal:

```
10 ÷ 2 = 5
```

---

Dividing by 4:

Shift right twice:

```
10100₂

↓

1010₂

↓

0101₂
```

---

# Multiplication and Division by Powers of Two

Binary systems make multiplication and division by powers of two very efficient.

## Left Shift

Multiplication:

```
Number << 1
```

means:

```
Multiply by 2
```

Example:

```
0011₂

shift left

0110₂
```

Decimal:

```
3 × 2 = 6
```

---

## Right Shift

Division:

```
Number >> 1
```

means:

```
Divide by 2
```

Example:

```
1000₂

shift right

0100₂
```

Decimal:

```
8 ÷ 2 = 4
```

---

# Real-World Applications

Binary multiplication and division are used in:

- Graphics processing
- Image scaling
- Audio processing
- Scientific calculations
- Cryptography
- Machine learning
- Game engines
- Embedded systems

---

# Common Mistakes

❌ Thinking binary multiplication creates complex rules.

✔ Binary multiplication is simpler because only:

```
1 × 1 = 1
```

creates a value.

---

❌ Forgetting that shifting changes value.

Left shift:

```
×2
```

Right shift:

```
÷2
```

---

❌ Dividing by zero.

✔ Division by zero is undefined.

---

# Key Takeaways

- Binary multiplication uses four simple rules.
- Binary division follows the same idea as decimal division.
- Processors optimize multiplication and division using shifts.
- Left shifts multiply by powers of two.
- Right shifts divide by powers of two.
- ALU circuits perform arithmetic operations inside CPUs.

---

## Quick Knowledge Check

1. What are the four binary multiplication rules?
2. What happens when:

```
1 × 1
```

is calculated?

3. What does a left shift do?

4. What does a right shift do?

5. Why is division by zero not allowed?



# Part 8 – Binary Arithmetic in Computer Processors

## Introduction

Every calculation performed by a computer eventually becomes a binary operation.

Whether a computer is:

- Opening an application
- Playing a video
- Running a game
- Loading a webpage
- Processing data
- Performing scientific calculations

the processor is constantly performing binary arithmetic.

The component responsible for these calculations is called the:

# Arithmetic Logic Unit (ALU)

---

# What is the Arithmetic Logic Unit (ALU)?

The **Arithmetic Logic Unit** is a major component inside the CPU responsible for performing:

## Arithmetic Operations

- Addition
- Subtraction
- Multiplication
- Division

## Logical Operations

- AND
- OR
- NOT
- XOR
- Comparisons

The ALU works entirely with binary values.

Example:

Human calculation:

```
25 + 15
```

CPU calculation:

```
11001₂ + 01111₂
```

---

# How the CPU Performs Addition

The CPU uses electronic circuits called:

## Adders

Adders are digital circuits designed to perform binary addition.

The two main types are:

---

# Half Adder

A half adder adds two binary digits.

Inputs:

```
A
B
```

Outputs:

```
Sum
Carry
```

Example:

Input:

```
1 + 1
```

Output:

```
Sum = 0

Carry = 1
```

Because:

```
1 + 1 = 10₂
```

---

# Full Adder

A full adder handles:

- First binary digit
- Second binary digit
- Previous carry

Inputs:

```
A
B
Carry In
```

Outputs:

```
Sum
Carry Out
```

Example:

```
1 + 1 + 1
```

Result:

```
11₂
```

Meaning:

```
Sum = 1

Carry = 1
```

---

# Multiple Bit Addition

Computers need to add large numbers.

Example:

```
10110110
+
00101011
```

A processor connects multiple full adders together.

Structure:

```
Bit 7 → Full Adder

Bit 6 → Full Adder

Bit 5 → Full Adder

Bit 4 → Full Adder

Bit 3 → Full Adder

Bit 2 → Full Adder

Bit 1 → Full Adder

Bit 0 → Full Adder
```

This creates an 8-bit adder.

---

# How the CPU Performs Subtraction

Processors usually do not have a separate subtraction mechanism.

Instead, they convert subtraction into addition.

The method used is:

# Two's Complement

Example:

Instead of:

```
7 - 3
```

the processor performs:

```
7 + (-3)
```

The negative value is represented using binary two's complement.

---

# Two's Complement Example

Positive number:

```
00000101
```

(decimal 5)

To create -5:

Step 1:

Invert bits:

```
11111010
```

Step 2:

Add 1:

```
11111011
```

Therefore:

```
11111011
```

represents:

```
-5
```

The CPU can now use the same addition circuit.

---

# How the CPU Performs Multiplication

Processors perform multiplication using:

- Addition
- Bit shifting

Example:

```
5 × 3
```

Binary:

```
101₂ × 11₂
```

The processor performs:

```
Shift

Add

Shift

Add
```

Modern CPUs include specialized multiplication circuits for faster operations.

---

# How the CPU Performs Division

Division is more complex than addition and multiplication.

Processors use:

- Subtraction
- Shifting
- Comparison operations

Example:

```
10 ÷ 2
```

The CPU repeatedly determines:

- How many times the divisor fits.
- What remainder remains.

Modern processors contain dedicated division hardware to improve speed.

---

# Binary Arithmetic and CPU Clock Cycles

Processors perform operations according to clock cycles.

Example:

CPU clock:

```
3 GHz
```

means:

```
3 billion cycles per second
```

During these cycles, the CPU performs billions of binary operations.

---

# Binary Arithmetic and Programming

When developers write:

```javascript
let total = price + tax;
```

The programmer sees:

```
decimal values
```

But internally:

```
Decimal
↓
Binary representation
↓
ALU calculation
↓
Binary result
↓
Displayed value
```

The processor handles everything using binary arithmetic.

---

# Binary Arithmetic in Different Fields

## Operating Systems

Used for:

- Memory calculations
- File permissions
- System operations

---

## Networking

Used for:

- IP addresses
- Data packets
- Network masks

---

## Graphics

Used for:

- Pixel calculations
- Image processing
- Rendering

---

## Artificial Intelligence

Used for:

- Matrix calculations
- Neural network operations
- Data processing

---

# Why Understanding Binary Arithmetic Matters

For beginners, binary arithmetic may seem theoretical.

However, it forms the foundation of:

- Computer architecture
- Programming languages
- Digital electronics
- Embedded systems
- Cybersecurity
- Hardware engineering

Understanding binary arithmetic helps developers understand what happens beneath their code.

---

# Key Takeaways

- CPUs perform all calculations using binary arithmetic.
- The ALU is responsible for arithmetic and logical operations.
- Adders perform binary addition.
- Two's complement allows subtraction using addition circuits.
- Multiplication uses shifting and addition.
- Division uses subtraction, shifting, and comparison.
- Every program eventually becomes binary operations inside the processor.

---

## Quick Knowledge Check

1. What component performs arithmetic operations inside the CPU?

2. What is the purpose of an ALU?

3. What circuit performs binary addition?

4. Why do processors use two's complement?

5. How does a CPU perform multiplication efficiently?

6. Why is binary arithmetic important for programmers?


# Part 9 – Lesson Summary

# Lesson 03 – Binary Arithmetic Summary

## Introduction

In this lesson, we learned how computers perform mathematical operations using the **Binary Number System**.

Since computers operate using electronic circuits with two possible states:

```
ON  → 1

OFF → 0
```

all internal calculations are performed using binary arithmetic.

The four fundamental binary arithmetic operations are:

1. Binary Addition
2. Binary Subtraction
3. Binary Multiplication
4. Binary Division

---

# Binary Addition Summary

Binary addition is the process of adding binary numbers.

It follows four basic rules:

| Operation | Result |
|-----------|--------|
| 0 + 0 | 0 |
| 0 + 1 | 1 |
| 1 + 0 | 1 |
| 1 + 1 | 10 |

The most important rule:

```
1 + 1 = 10₂
```

This creates:

- A result bit of 0
- A carry bit of 1

---

# Carry Operations

A carry occurs when the result cannot fit into a single binary digit.

Example:

```
   1
  111
+ 001
-----
 1000
```

Important concepts:

- Carry moves to the next higher bit.
- Multiple carries can propagate through several positions.
- CPUs use adders to handle carry operations.

---

# Binary Subtraction Summary

Binary subtraction follows four rules:

| Operation | Result |
|-----------|--------|
| 0 - 0 | 0 |
| 1 - 0 | 1 |
| 1 - 1 | 0 |
| 0 - 1 | Borrow required |

The important case:

```
0 - 1
```

requires borrowing from the next higher bit.

---

# Borrow Operations

Borrowing allows subtraction when the current bit is too small.

Example:

```
10₂ - 1₂ = 1₂
```

Important concepts:

- Borrow converts a higher bit into a usable value.
- Borrow may propagate through multiple zeros.
- CPUs often use two's complement instead of direct borrowing.

---

# Binary Multiplication Summary

Binary multiplication is simpler than decimal multiplication because there are only two digits.

Rules:

| Operation | Result |
|-----------|--------|
| 0 × 0 | 0 |
| 0 × 1 | 0 |
| 1 × 0 | 0 |
| 1 × 1 | 1 |

Computers perform multiplication using:

- Binary addition
- Bit shifting
- Multiplication circuits

Example:

```
101₂ × 10₂
```

is equivalent to shifting:

```
1010₂
```

---

# Binary Division Summary

Binary division works similarly to decimal division.

It involves:

- Quotient calculation
- Remainder calculation
- Comparison
- Subtraction
- Shifting

Important rules:

```
0 ÷ 1 = 0

1 ÷ 1 = 1
```

Division by zero is invalid:

```
1 ÷ 0
```

---

# Bit Shifting

Bit shifting is a powerful binary operation.

## Left Shift

Moves bits left.

Effect:

```
Multiply by 2
```

Example:

```
0011₂

↓

0110₂
```

Decimal:

```
3 × 2 = 6
```

---

## Right Shift

Moves bits right.

Effect:

```
Divide by 2
```

Example:

```
1000₂

↓

0100₂
```

Decimal:

```
8 ÷ 2 = 4
```

---

# Binary Arithmetic Inside the CPU

The processor uses a component called:

# Arithmetic Logic Unit (ALU)

The ALU performs:

## Arithmetic

- Addition
- Subtraction
- Multiplication
- Division

## Logical Operations

- AND
- OR
- NOT
- XOR

---

# Important CPU Components

## Half Adder

Adds two binary bits.

Inputs:

```
A
B
```

Outputs:

```
Sum
Carry
```

---

## Full Adder

Adds:

```
A
B
Carry-in
```

Outputs:

```
Sum
Carry-out
```

Multiple full adders combine to create larger arithmetic circuits.

---

# Two's Complement

Computers represent negative numbers using two's complement.

Purpose:

- Allows subtraction using addition circuits.
- Simplifies CPU design.
- Provides a standard way to store signed numbers.

Example:

```
5 - 3
```

becomes:

```
5 + (-3)
```

inside the processor.

---

# Real-World Applications

Binary arithmetic is used in:

- CPUs
- Mobile devices
- Operating systems
- Programming languages
- Graphics processing
- Artificial intelligence
- Networking
- Embedded systems
- Digital electronics

---

# Key Concepts Learners Should Remember

Before moving forward, learners should remember:

## 1. Computers Calculate in Binary

Every operation eventually becomes:

```
0s and 1s
```

---

## 2. Addition Uses Carry

Remember:

```
1 + 1 = 10₂
```

---

## 3. Subtraction Uses Borrow

Remember:

```
0 - 1 requires borrowing
```

---

## 4. Multiplication Uses Shifting

Left shift:

```
×2
```

---

## 5. Division Uses Shifting

Right shift:

```
÷2
```

---

## 6. CPU Uses the ALU

The ALU is responsible for performing calculations.

---

## 7. Binary Arithmetic Is the Foundation of Computing

Understanding binary arithmetic helps explain:

- How processors work.
- How programs execute.
- How hardware performs calculations.
- How data is processed internally.

---

# Looking Ahead

In the next section:

# Part 10 – Learning Checkpoint & Practice Questions

Learners will test their understanding through:

- Concept questions
- Binary calculations
- True/False questions
- Fill-in-the-blanks
- Practical exercises
- Self-assessment checklist


# Part 10 – Learning Checkpoint & Practice Questions

# Lesson 03 – Binary Arithmetic

## Learning Checkpoint

Before continuing to the next lesson, make sure you understand:

- Binary addition
- Carry operations
- Binary subtraction
- Borrow operations
- Binary multiplication
- Binary division
- Bit shifting
- CPU arithmetic operations

---

# Section A – Concept Review Questions

## 1. What is binary arithmetic?

Answer:

__________________________________________________

---

## 2. Why do computers use binary arithmetic?

Answer:

__________________________________________________

---

## 3. What are the four basic binary arithmetic operations?

Answer:

__________________________________________________

---

## 4. What happens when:

```
1 + 1
```

is performed in binary?

Answer:

__________________________________________________

---

## 5. What is a carry operation?

Answer:

__________________________________________________

---

## 6. What is a borrow operation?

Answer:

__________________________________________________

---

## 7. Why is:

```
0 - 1
```

not directly possible in binary?

Answer:

__________________________________________________

---

## 8. What component of the CPU performs arithmetic operations?

Answer:

__________________________________________________

---

## 9. What is the purpose of a Full Adder?

Answer:

__________________________________________________

---

## 10. Why do processors use two's complement?

Answer:

__________________________________________________

---

# Section B – Binary Addition Practice

Perform the following binary additions.

---

## Question 1

```
   101
 + 010
 -----
```

Answer:

```
____________
```

---

## Question 2

```
   111
 + 001
 -----
```

Answer:

```
____________
```

---

## Question 3

```
   1011
 + 0101
 ------
```

Answer:

```
____________
```

---

## Question 4

```
   1111
 + 0001
 ------
```

Answer:

```
____________
```

---

# Section C – Binary Subtraction Practice

Perform the following binary subtractions.

---

## Question 1

```
   1010
 - 0010
 ------
```

Answer:

```
____________
```

---

## Question 2

```
   1110
 - 0101
 ------
```

Answer:

```
____________
```

---

## Question 3

```
   1000
 - 0001
 ------
```

Answer:

```
____________
```

---

## Question 4

```
   1100
 - 0011
 ------
```

Answer:

```
____________
```

---

# Section D – Binary Multiplication Practice

Solve:

---

## Question 1

```
101₂ × 10₂
```

Answer:

```
____________
```

---

## Question 2

```
11₂ × 11₂
```

Answer:

```
____________
```

---

## Question 3

```
110₂ × 10₂
```

Answer:

```
____________
```

---

# Section E – Binary Division Practice

Solve:

---

## Question 1

```
1010₂ ÷ 10₂
```

Answer:

```
____________
```

---

## Question 2

```
1100₂ ÷ 10₂
```

Answer:

```
____________
```

---

## Question 3

```
10000₂ ÷ 100₂
```

Answer:

```
____________
```

---

# Section F – True or False

Write True or False.

---

1. Binary uses only digits 0 and 1.

Answer:

______

---

2. Binary addition uses carry operations.

Answer:

______

---

3. The result of:

```
1 + 1
```

is:

```
11₂
```

Answer:

______

---

4. Borrowing is required when:

```
0 - 1
```

occurs.

Answer:

______

---

5. The ALU performs arithmetic operations inside the CPU.

Answer:

______

---

6. Left shifting a binary number divides it by 2.

Answer:

______

---

7. Right shifting a binary number divides it by 2.

Answer:

______

---

8. Two's complement is used to represent negative numbers.

Answer:

______

---

9. Multiplication in computers often uses shifting and addition.

Answer:

______

---

10. Computers perform calculations directly using decimal numbers internally.

Answer:

______

---

# Section G – Fill in the Blanks

Complete the sentences.

---

1. Binary arithmetic uses the digits ______ and ______.

---

2. The main CPU component responsible for calculations is the ______.

---

3. The equation:

```
1 + 1 = 10₂
```

creates a ______.

---

4. The process of taking value from a higher bit during subtraction is called ______.

---

5. A circuit that adds two binary bits is called a ______ adder.

---

6. A circuit that handles carry input is called a ______ adder.

---

7. A left shift usually multiplies a binary value by ______.

---

8. A right shift usually divides a binary value by ______.

---

9. Negative numbers are commonly represented using ______ complement.

---

10. Binary arithmetic is the foundation of ______ computing.

---

# Section H – Practical Understanding

Answer in your own words.

---

## 1. Explain why binary is suitable for electronic computers.

Answer:

__________________________________________________

---

## 2. Explain the difference between carry and borrow.

Answer:

__________________________________________________

---

## 3. Explain how a processor performs subtraction.

Answer:

__________________________________________________

---

## 4. Why are bit shifts useful in computing?

Answer:

__________________________________________________

---

## 5. How does binary arithmetic connect software and hardware?

Answer:

__________________________________________________

---

# Section I – Self Assessment Checklist

Before moving to Lesson 04, confirm:

✅ I understand why computers use binary.

✅ I know the four binary arithmetic operations.

✅ I can perform binary addition.

✅ I understand carry operations.

✅ I can perform binary subtraction.

✅ I understand borrow operations.

✅ I understand binary multiplication.

✅ I understand binary division.

✅ I understand bit shifting.

✅ I understand how the CPU performs arithmetic.

---

# Final Reflection

Write a short explanation:

**"How does a computer perform a simple calculation?"**

Include:

- Binary representation
- CPU processing
- ALU operation
- Final output

---

# Ready for the Next Lesson?

If you can complete this checkpoint confidently, you are ready for:

# Lesson 04 – Number System Conversions

You will learn:

- Decimal to Binary conversion
- Binary to Decimal conversion
- Decimal to Octal conversion
- Decimal to Hexadecimal conversion
- Binary to Hexadecimal conversion
- Hexadecimal to Binary conversion
- Conversion techniques used by programmers
