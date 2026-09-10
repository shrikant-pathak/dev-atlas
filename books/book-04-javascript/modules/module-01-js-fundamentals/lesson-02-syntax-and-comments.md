# Lesson 02: Syntax and Comments

## Learning Objectives
By the end of this lesson, you will be able to:
- Write correctly structured JavaScript statements
- Explain how automatic semicolon insertion (ASI) works and why relying on it is discouraged
- Write single-line and multi-line comments
- Follow JavaScript's whitespace and case-sensitivity rules

## Introduction

In Lesson 01 you wrote your first working script. Before going further into variables, operators, and logic, it's worth pausing on the basic grammar rules of the language itself — the same way Book 02 (HTML) started with tags and attributes before building full pages, and Book 03 (CSS) started with selectors and declarations before building full stylesheets.

## Statements

A **statement** is a single instruction that JavaScript executes. A script is just a sequence of statements, executed top to bottom (with control flow — covered in Lesson 06 and Lesson 07 — changing that order).

```js
console.log("This is one statement.");
console.log("This is another statement.");
```

## Semicolons and Automatic Semicolon Insertion (ASI)

Statements are conventionally ended with a semicolon `;`. JavaScript has a feature called **Automatic Semicolon Insertion (ASI)** that will insert missing semicolons for you in most cases:

```js
console.log("Works fine")
console.log("Even without semicolons")
```

However, ASI has edge cases that can silently break your code — for example, a `return` statement followed by a value on the next line:

```js
function getValue() {
  return
  {
    value: 42
  };
}
// ASI inserts a semicolon right after "return", so this function
// actually returns `undefined`, not the object below it — a classic gotcha.
```

**This book uses semicolons consistently on every statement**, and you should too. It removes this entire category of bugs and matches the convention used in virtually every professional codebase, including the React, Vue, and React Native projects later in your path.

## Whitespace

JavaScript largely ignores extra whitespace (spaces, tabs, blank lines) between tokens — it exists purely to make code readable to humans.

```js
const x=1;const y=2;
// is functionally identical to:
const x = 1;
const y = 2;
```

Despite whitespace being optional, consistent indentation (2 spaces is the convention used throughout this book) is essential for readability, especially once code gets nested inside functions, conditionals, and loops in the coming lessons.

## Comments

Comments are text the JavaScript engine ignores entirely — they exist only for the humans reading the code.

**Single-line comments** start with `//` and run to the end of the line:

```js
// This explains what the next line does
const total = price * quantity;
```

**Multi-line comments** are wrapped in `/* */` and can span several lines:

```js
/*
  This function calculates the final price
  after applying tax and discount.
*/
function calculateTotal(price, tax, discount) {
  // implementation comes in Module 02
}
```

Good comments explain **why**, not **what** — the code itself already shows *what* it does; a comment is most useful when it explains a reason that isn't obvious from the code alone.

```js
// Bad comment — just restates the code
let count = 0; // set count to 0

// Good comment — explains the reasoning
let count = 0; // reset on each page load per the analytics spec
```

## Case Sensitivity

JavaScript is case-sensitive in every part of its syntax — variable names, function names, and keywords all must match exactly.

```js
let username = "shrikant";
console.log(Username); // ReferenceError: Username is not defined
```

## Practical Example

```js
// profile-card.js

/*
  Renders a short summary line for a user profile.
  Kept intentionally simple — Module 02 will turn this
  into a reusable function.
*/

const firstName = "Ada";      // first name, capitalized per convention
const lastName = "Lovelace";  // last name

// Concatenate into a single display name
const displayName = firstName + " " + lastName;

console.log(displayName); // "Ada Lovelace"
```

## Revision Questions

<details>
<summary>1. What is Automatic Semicolon Insertion (ASI), and why does this book avoid relying on it?</summary>

ASI is JavaScript's behavior of inserting missing semicolons automatically in most cases. It's avoided because it has edge cases (like a bare `return` on its own line) that can silently change what your code does, so writing semicolons explicitly removes an entire category of bugs.
</details>

<details>
<summary>2. What's the difference between a single-line and a multi-line comment?</summary>

A single-line comment starts with `//` and ends at the line break. A multi-line comment is wrapped in `/* */` and can span multiple lines.
</details>

<details>
<summary>3. Does extra whitespace change how JavaScript executes code?</summary>

No — JavaScript ignores extra whitespace between tokens. It exists purely for human readability, though consistent indentation is still a strong convention.
</details>

<details>
<summary>4. Why should comments generally explain "why" rather than "what"?</summary>

The code itself already shows what it does; a comment restating that adds no value. A comment is most useful when it explains reasoning that isn't obvious just from reading the code — like a business rule or an edge case being handled.
</details>

<details>
<summary>5. Is `myVariable` the same as `MyVariable` in JavaScript?</summary>

No — JavaScript is case-sensitive, so these are two entirely different identifiers.
</details>
