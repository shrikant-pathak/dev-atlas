# Lesson 05: Operators

## Learning Objectives
By the end of this lesson, you will be able to:
- Use arithmetic, assignment, comparison, and logical operators
- Understand operator precedence and use parentheses to control it
- Write and evaluate expressions
- Use the ternary operator as a compact alternative to a simple if/else

## Introduction

In Lesson 04 you learned how JavaScript's types behave, including how `===` avoids the coercion surprises of `==`. An **operator** lets you combine, compare, or transform values, and an **expression** is any piece of code that produces a value. `2 + 2` is an expression; so is `age >= 18`; so is `"Hello, " + name`.

## Arithmetic Operators

```js
const sum = 5 + 3;        // 8
const diff = 5 - 3;       // 2
const product = 5 * 3;    // 15
const quotient = 5 / 3;   // 1.6666...
const remainder = 5 % 3;  // 2  (modulo — "remainder after division")
const power = 5 ** 2;     // 25 (exponentiation, ES2016)
```

Increment and decrement shortcuts:

```js
let count = 0;
count++;   // count is now 1
count--;   // count is now 0
```

## Assignment Operators

`=` assigns a value. JavaScript also offers compound assignment operators that combine an operation with assignment:

```js
let total = 10;
total += 5;   // total = total + 5  → 15
total -= 3;   // total = total - 3  → 12
total *= 2;   // total = total * 2  → 24
total /= 4;   // total = total / 4  → 6
```

## Comparison Operators

Comparison operators produce a `boolean` result.

```js
5 > 3;      // true
5 < 3;      // false
5 >= 5;     // true
5 <= 4;     // false
5 == "5";   // true  — loose equality, coerces types (Lesson 04)
5 === "5";  // false — strict equality, no coercion
5 != "5";   // false — loose inequality
5 !== "5";  // true  — strict inequality
```

As covered in Lesson 04, **always prefer `===` and `!==`** over `==` and `!=` to avoid coercion surprises.

## Logical Operators

Used to combine or invert boolean expressions:

```js
const isAdult = true;
const hasID = false;

isAdult && hasID;   // AND — true only if both are true → false
isAdult || hasID;   // OR  — true if at least one is true → true
!isAdult;           // NOT — inverts the value → false
```

These become essential in Lesson 06 — most real-world conditions combine more than one check, e.g. "logged in AND has an active subscription."

## Operator Precedence

Like arithmetic in math class, JavaScript operators have a precedence order — multiplication/division before addition/subtraction, for example. When in doubt, use parentheses to make the intended order explicit rather than relying on memorized precedence rules.

```js
const result1 = 2 + 3 * 4;     // 14, not 20 — multiplication runs first
const result2 = (2 + 3) * 4;   // 20 — parentheses force addition first
```

## The Ternary Operator

A compact way to write a simple if/else as a single expression. You'll cover full `if/else` statements in Lesson 06, but the ternary operator is introduced here because it's really just a compact *expression* form of a comparison.

```js
const age = 20;
const category = age >= 18 ? "adult" : "minor";
console.log(category); // "adult"
```

Read it as: `condition ? valueIfTrue : valueIfFalse`.

## Practical Example

```js
// cart-total.js

const price = 499;
const quantity = 3;
const discountThreshold = 1000;

const subtotal = price * quantity;                          // 1497
const qualifiesForDiscount = subtotal >= discountThreshold;   // true
const discount = qualifiesForDiscount ? 0.1 : 0;              // 0.1
const total = subtotal - subtotal * discount;                  // 1347.3

console.log(`Subtotal: ${subtotal}`);
console.log(`Qualifies for discount: ${qualifiesForDiscount}`);
console.log(`Total: ${total}`);
```

(Template literals with backticks and `${}` are covered fully in Module 03 — you'll see them used a few times before then, so it's worth recognizing the syntax early.)

## Revision Questions

<details>
<summary>1. What's the difference between `==` and `===`?</summary>

`==` (loose equality) converts operands to the same type before comparing, which can produce surprising results. `===` (strict equality) compares both value and type without conversion, and is the recommended default.
</details>

<details>
<summary>2. What does the `%` operator do?</summary>

It's the modulo operator — it returns the remainder after division. For example, `5 % 3` is `2`.
</details>

<details>
<summary>3. Why should parentheses be used even when you know operator precedence?</summary>

They make the intended evaluation order explicit for anyone reading the code, reducing ambiguity and the chance of bugs, even if the default precedence would produce the same result.
</details>

<details>
<summary>4. Rewrite this ternary as words: `const label = score >= 50 ? "Pass" : "Fail";`</summary>

If `score` is greater than or equal to `50`, `label` is `"Pass"`; otherwise, `label` is `"Fail"`.
</details>

<details>
<summary>5. What does the `&&` operator require to return `true`?</summary>

Both operands must be true — it's the logical AND operator.
</details>
