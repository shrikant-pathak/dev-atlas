# Lesson 03: Variables — let, const, var

## Learning Objectives
By the end of this lesson, you will be able to:
- Declare variables using `var`, `let`, and `const`
- Explain the scoping difference between `var` and `let`/`const`
- Explain why `const` prevents reassignment but not mutation
- Follow standard JavaScript variable naming conventions

## Introduction

In Lesson 02 you saw variables appear in code (`const firstName = "Ada";`) without a formal explanation. A **variable** is a named container for a value — the fundamental building block of any program, JavaScript included.

Just as CSS custom properties (Book 03) let you name and reuse a value (`--primary-color: #333;`), JavaScript variables let you name and reuse *any* kind of value.

## Declaring Variables

JavaScript has three keywords for declaring variables, introduced at different points in the language's history.

```js
var oldWay = "avoid this in modern code";
let mutable = "can be reassigned";
const constant = "cannot be reassigned";
```

- **`var`** — the original way to declare variables (1995). It's function-scoped, gets "hoisted" (accessible before its declaration line, as `undefined`), and can be re-declared in the same scope without error — all of which cause bugs.
- **`let`** — introduced in ES6 (2015; you'll cover ES6 formally in Module 06). Block-scoped, can be reassigned.
- **`const`** — also ES6. Block-scoped, **cannot** be reassigned after its initial value is set.

**Rule of thumb for this book and real projects**: default to `const`. Only use `let` when you know the value needs to change later. Never use `var`.

## Block Scope vs Function Scope

A **block** is anything inside `{ }` — an `if` statement, a loop, etc. (You'll write plenty of these starting in Lesson 06.) `let` and `const` only exist within the block they're declared in:

```js
if (true) {
  let blockScoped = "only exists in here";
  var functionScoped = "leaks out of the block";
}

console.log(functionScoped); // "leaks out of the block" — works, but this is exactly the problem
console.log(blockScoped);    // ReferenceError: blockScoped is not defined
```

`var` ignores block boundaries entirely and is only contained by the nearest function (or the global scope if there's no function) — which is the core reason it causes unpredictable bugs as programs grow. You'll revisit scope in much more depth in Module 02 once functions are introduced.

## Reassignment vs Mutation

`const` prevents **reassignment** — pointing the variable at a completely different value. It does **not** prevent **mutation** — changing the contents of an object or array the variable already points to. You'll work with objects and arrays properly starting in Module 02, but it's worth previewing this distinction now since it surprises many beginners:

```js
const pi = 3.14159;
pi = 3; // TypeError: Assignment to constant variable.

const scores = [10, 20, 30];
scores.push(40);          // fine — mutating the array's contents
console.log(scores);      // [10, 20, 30, 40]

scores = [1, 2, 3];        // TypeError — this IS a reassignment, and const forbids it
```

## Variable Naming Rules & Conventions

Rules (enforced by JavaScript itself):
- Must start with a letter, `$`, or `_` — not a digit
- Can contain letters, digits, `$`, and `_`
- Case-sensitive (Lesson 02)
- Cannot be a reserved word (`let`, `const`, `if`, `class`, etc.)

Conventions (not enforced, but expected in any professional codebase, including the React and Vue projects later in this path):
- **camelCase** for variables and functions: `firstName`, `totalScore`
- **UPPER_SNAKE_CASE** for values meant to be constant configuration: `MAX_RETRIES`
- Descriptive names over short ones: `userAge` rather than `a`

## Practical Example

```js
// user-session.js

const username = "shrikant_dev";     // won't change — const
const accountType = "free";           // won't change for now — const
let loginCount = 0;                   // will change — let

function recordLogin() {
  loginCount++; // fine — let allows reassignment
}

recordLogin();
recordLogin();

console.log(username, accountType, loginCount);
// "shrikant_dev" "free" 2
```

## Revision Questions

<details>
<summary>1. What's the practical difference between `let` and `const`?</summary>

`let` allows the variable to be reassigned later; `const` does not allow reassignment after its initial value is set. Both are block-scoped, unlike `var`.
</details>

<details>
<summary>2. What does "block-scoped" mean, and how does `var` differ?</summary>

A block-scoped variable (`let`/`const`) only exists within the nearest enclosing `{ }` (like an `if` statement or loop). `var` ignores block boundaries and is instead scoped to the nearest function (or the global scope), which is why it can "leak" out of blocks unexpectedly.
</details>

<details>
<summary>3. Can you change the contents of a `const` array or object? Can you reassign the variable itself?</summary>

Yes to the first — `const` doesn't prevent mutating the contents of an array or object (e.g. `.push()`). No to the second — pointing a `const` variable at a completely new value with `=` is not allowed and throws a `TypeError`.
</details>

<details>
<summary>4. Why should `var` generally be avoided in modern JavaScript?</summary>

It's function-scoped rather than block-scoped, gets hoisted, and allows re-declaration — all of which lead to subtle, hard-to-trace bugs that `let` and `const` were introduced specifically to prevent.
</details>

<details>
<summary>5. What naming convention does this book use for variables, and what would `MAX_RETRIES`-style naming typically indicate?</summary>

camelCase (e.g. `firstName`) for ordinary variables and functions. UPPER_SNAKE_CASE is a convention reserved for values meant to act as fixed configuration constants.
</details>
