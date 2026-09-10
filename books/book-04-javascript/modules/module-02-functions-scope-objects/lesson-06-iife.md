# Lesson 06: IIFE (Immediately Invoked Function Expressions)

## Learning Objectives
By the end of this lesson, you will be able to:
- Write an IIFE and explain its syntax
- Explain why IIFEs were historically used to avoid polluting the global scope
- Recognize the module pattern built on top of an IIFE
- Understand why IIFEs are less common in modern JavaScript, and why

## Introduction

An **IIFE** (Immediately Invoked Function Expression, pronounced "iffy") is a function expression (Lesson 01) that runs the instant it's defined, without being called separately elsewhere. It was, for years, the standard way JavaScript developers solved a specific problem: keeping variables out of the global scope.

## Basic Syntax

```js
(function () {
  console.log("This runs immediately!");
})();
```

Breaking this down:
1. `function () { ... }` — a normal anonymous function expression
2. Wrapping it in `( )` — this is required so JavaScript parses it as an expression rather than trying to read it as a function declaration
3. `()` at the end — immediately calls the function, exactly like calling any other function

An arrow function version works the same way:

```js
(() => {
  console.log("This also runs immediately!");
})();
```

## Why IIFEs Exist: Avoiding Global Scope Pollution

Recall from Lesson 02 that anything declared at the top level of a script lives in global scope, visible everywhere — including to other scripts loaded on the same page. Before JavaScript had proper modules (covered in Module 06), this was a real problem: two separate `<script>` files could accidentally declare the same variable name and silently overwrite each other.

```js
// Without an IIFE — pollutes global scope
var count = 0;
function increment() {
  count++;
}
```

```js
// With an IIFE — count and increment are trapped inside the function's own scope
(function () {
  var count = 0;
  function increment() {
    count++;
  }
  // nothing here is visible outside this IIFE
})();

console.log(typeof count); // "undefined" — completely inaccessible from outside
```

## Passing Arguments to an IIFE

An IIFE can take parameters just like any function, called with arguments right where it's invoked:

```js
(function (name) {
  console.log(`Hello, ${name}!`);
})("Ada");
// "Hello, Ada!"
```

## The Module Pattern

Combining an IIFE with a `return` statement lets you expose only a deliberate, chosen public interface — while keeping everything else private via closures (Lesson 03). This was the standard way to build a "module" in JavaScript before real modules existed.

```js
const counterModule = (function () {
  let count = 0; // private — trapped inside the IIFE's scope

  return {
    increment: function () {
      count++;
      return count;
    },
    reset: function () {
      count = 0;
    }
  };
})();

console.log(counterModule.increment()); // 1
console.log(counterModule.increment()); // 2
counterModule.reset();
console.log(counterModule.increment()); // 1
console.log(counterModule.count);        // undefined — still private
```

Notice how similar this is to the closure-based bank account from Lesson 03 — the IIFE is simply run immediately instead of being called later by name.

## Why IIFEs Are Less Common Today

Modern JavaScript has proper **modules** (ES6 `import`/`export`, covered in Module 06) that solve the global-scope problem directly and more clearly. You'll still encounter IIFEs in older codebases, certain library patterns, and interviews — which is exactly why this lesson exists — but new code you write in this book from Module 06 onward will typically use real modules instead.

## Practical Example

```js
// config-loader.js

const appConfig = (function () {
  const secretKey = "hidden-from-outside"; // private
  const version = "1.0.0";

  return {
    getVersion: function () {
      return version;
    }
    // note: no method exposes secretKey — it's permanently private
  };
})();

console.log(appConfig.getVersion()); // "1.0.0"
console.log(appConfig.secretKey);     // undefined
```

## Revision Questions

<details>
<summary>1. What does IIFE stand for, and what does it do?</summary>

Immediately Invoked Function Expression — a function expression that is defined and called in the same statement, running instantly rather than being invoked separately later.
</details>

<details>
<summary>2. Why is the function wrapped in parentheses, e.g. `(function () { ... })()`?</summary>

Wrapping it in parentheses forces JavaScript to parse it as a function *expression* rather than attempting to read it as a function *declaration*, which requires a name and cannot be immediately invoked in that form.
</details>

<details>
<summary>3. What problem did IIFEs historically solve?</summary>

They kept variables and functions out of the global scope, preventing naming collisions between separate scripts loaded on the same page — before JavaScript had a proper module system.
</details>

<details>
<summary>4. What is the "module pattern," and what does it rely on?</summary>

A pattern combining an IIFE with a `return` statement that exposes only a chosen public interface, while keeping everything else private. It relies on closures (Lesson 03) to keep the private variables accessible only to the returned functions.
</details>

<details>
<summary>5. Why are IIFEs less commonly written in new JavaScript code today?</summary>

Modern JavaScript has ES6 modules (`import`/`export`), which solve the global-scope pollution problem more directly and clearly than the IIFE workaround.
</details>
