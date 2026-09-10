# Lesson 02: Scope and Hoisting

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the difference between global scope, function scope, and block scope
- Explain lexical scoping and how nested functions access outer variables
- Explain hoisting for `var`, `let`/`const`, and function declarations
- Explain the "Temporal Dead Zone" and why it exists

## Introduction

In Module 01, Lesson 03, you learned that `let`/`const` are block-scoped while `var` is function-scoped, and got a first look at how this affects variable access. Now that you can write functions (Lesson 01), scope needs a full treatment — it determines exactly which variables a piece of code can "see," and it's one of the most important mental models in JavaScript.

## The Three Levels of Scope

```js
const globalVar = "I'm global"; // global scope — visible everywhere in this file

function outer() {
  const functionVar = "I'm function-scoped"; // only visible inside outer()

  if (true) {
    const blockVar = "I'm block-scoped"; // only visible inside this if-block
    console.log(globalVar);   // ✅ visible
    console.log(functionVar); // ✅ visible
    console.log(blockVar);    // ✅ visible
  }

  console.log(blockVar); // ❌ ReferenceError — blockVar doesn't exist here
}

console.log(functionVar); // ❌ ReferenceError — functionVar doesn't exist here
```

**Global scope** — declared outside any function or block; visible everywhere in the file.
**Function scope** — declared inside a function; visible only inside that function (and anything nested within it).
**Block scope** — declared inside `{ }` with `let`/`const`; visible only inside that block (Module 01, Lesson 03).

## Lexical Scoping

JavaScript uses **lexical scoping**, meaning a function's access to outer variables is determined by *where the function is written in the code*, not by where or how it's called.

```js
const city = "Pune";

function printCity() {
  console.log(city); // can access `city` because printCity is physically
                      // written within the same scope where `city` exists
}

function outer() {
  const city = "Mumbai";
  printCity(); // still logs "Pune" — printCity was defined in the outer/global
               // scope, and that's fixed regardless of where it's called from
}

outer(); // "Pune"
```

This "remembering where it was defined" behavior is also the foundation of **closures**, which get a full lesson next (Lesson 03).

## Hoisting

**Hoisting** is JavaScript's behavior of processing certain declarations before running the code line by line — effectively "lifting" them to the top of their scope during a preparation phase.

### Function Declarations Are Fully Hoisted

```js
sayHi(); // "Hi!" — works even though sayHi is called before its definition

function sayHi() {
  console.log("Hi!");
}
```

The entire function — name and body — is available from the top of its scope, which is why this works.

### `var` Is Hoisted, But Only the Declaration

```js
console.log(count); // undefined — NOT an error, but not "5" either
var count = 5;
```

JavaScript hoists the *declaration* (`var count`) but not the *assignment* (`= 5`). This is exactly the kind of confusing, bug-prone behavior that Module 01, Lesson 03 warned about with `var`.

### Function Expressions and Arrow Functions Are NOT Hoisted the Same Way

```js
sayBye(); // TypeError: sayBye is not a function

var sayBye = function () {
  console.log("Bye!");
};
```

Here, `sayBye` (the variable) is hoisted as `undefined` — same as any `var` — but the function assigned to it is not available until that line actually runs. This is one of the clearest practical differences between function declarations and function expressions from Lesson 01.

### `let` and `const`: The Temporal Dead Zone

```js
console.log(score); // ReferenceError: Cannot access 'score' before initialization
let score = 10;
```

`let` and `const` are technically hoisted too, but they remain in a **Temporal Dead Zone (TDZ)** — unusable — from the start of their block until their declaration line actually executes. This is considered a *feature*, not a bug: it forces you to declare variables before using them, catching a whole class of mistakes that `var`'s looser hoisting allows to slip through silently.

## Practical Example

```js
// scope-demo.js

const appName = "Dev Atlas"; // global

function logStartup() {
  console.log(`Starting ${appName}...`); // lexical scoping — reads the global appName

  if (true) {
    const buildMode = "production"; // block-scoped
    console.log(`Build mode: ${buildMode}`);
  }

  // console.log(buildMode); // would throw — buildMode doesn't exist out here
}

logStartup();
// "Starting Dev Atlas..."
// "Build mode: production"
```

## Revision Questions

<details>
<summary>1. What are the three levels of scope in JavaScript, from broadest to narrowest?</summary>

Global scope (visible everywhere), function scope (visible only within a function), and block scope (visible only within a `{ }` block, for `let`/`const`).
</details>

<details>
<summary>2. What does "lexical scoping" mean?</summary>

A function's access to outer variables depends on where the function is physically written in the code (its defining scope), not on where or how it is later called.
</details>

<details>
<summary>3. What's the practical difference between hoisting a function declaration and hoisting a `var`?</summary>

A function declaration is hoisted with its entire body, so it can be called before its line in the code. A `var` is hoisted only as a declaration (initialized to `undefined`) — its assigned value isn't available until the assignment line actually runs.
</details>

<details>
<summary>4. What is the Temporal Dead Zone?</summary>

The period from the start of a block until a `let`/`const` variable's declaration line executes, during which the variable exists but cannot be accessed — attempting to do so throws a `ReferenceError`. It exists to catch use-before-declaration mistakes.
</details>

<details>
<summary>5. Why does calling a function expression before its declaration line throw an error, while calling a function declaration before its line does not?</summary>

A function expression is assigned to a variable, so only the variable name is hoisted (as `undefined`, if declared with `var`) — the function itself isn't available yet. A function declaration is hoisted in full, name and body together, so it's callable from anywhere in its scope.
</details>
