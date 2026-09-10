# Lesson 01: Function Declarations, Expressions, and Arrow Functions

## Learning Objectives
By the end of this lesson, you will be able to:
- Write functions using function declarations, function expressions, and arrow functions
- Use parameters, default parameter values, and return values
- Explain the key differences between the three function syntaxes
- Choose the appropriate function syntax for a given situation

## Introduction

Throughout Module 01 you wrote statements that ran once, top to bottom. A **function** lets you package a block of code so it can be run — and re-run — whenever you need it, with different input values each time. This is the single biggest shift in how you write JavaScript from here on: instead of one long script, you'll build programs out of small, reusable, named pieces.

## Function Declarations

The most familiar form — declared with the `function` keyword and a name.

```js
function greet(name) {
  return "Hello, " + name + "!";
}

console.log(greet("Ada")); // "Hello, Ada!"
```

- `name` here is a **parameter** — a placeholder for a value the function expects.
- `"Ada"` in the call is the **argument** — the actual value supplied.
- `return` sends a value back out of the function and immediately ends its execution. A function with no `return` statement returns `undefined` (recall Lesson 04 of Module 01).

## Default Parameters

A parameter can have a fallback value, used only if no argument (or `undefined`) is passed for it:

```js
function greet(name = "there") {
  return "Hello, " + name + "!";
}

console.log(greet());        // "Hello, there!"
console.log(greet("Ada"));   // "Hello, Ada!"
```

## Function Expressions

A function can also be stored in a variable, as a value — recall from Module 01 that variables can hold any kind of value, and functions are values too.

```js
const greet = function (name) {
  return "Hello, " + name + "!";
};

console.log(greet("Ada")); // "Hello, Ada!"
```

This is called an **anonymous function expression** (the function itself has no name — only the variable `greet` does). Function expressions are not hoisted the way function declarations are — a distinction covered fully in Lesson 02.

## Arrow Functions

Introduced in ES6 (2015; formal ES6 coverage comes in Module 06), arrow functions are a shorter syntax for writing function expressions.

```js
const greet = (name) => {
  return "Hello, " + name + "!";
};
```

For a single-parameter function, the parentheses are optional:

```js
const greet = name => {
  return "Hello, " + name + "!";
};
```

For a function whose entire body is a single `return` expression, you can drop the braces and the `return` keyword entirely — an **implicit return**:

```js
const greet = name => "Hello, " + name + "!";
```

With zero or multiple parameters, parentheses are required:

```js
const sayHi = () => "Hi!";
const add = (a, b) => a + b;
```

Arrow functions have one crucial behavioral difference beyond syntax — how they handle the `this` keyword — which is important enough to get its own dedicated lesson (Lesson 05).

## Choosing a Syntax

| Situation | Common choice |
|---|---|
| A named, reusable utility function | Function declaration |
| A function assigned to a variable/property, especially a short one | Arrow function |
| You specifically need your own `this` binding inside the function | Function declaration or expression (see Lesson 05) |

Modern JavaScript codebases (including the React and Vue projects later in this path) lean heavily on arrow functions for short, inline functions, while still using regular functions where `this` behavior matters.

## Practical Example

```js
// discount-calculator.js

function calculateDiscount(price, percent = 10) {
  return price - price * (percent / 100);
}

const formatCurrency = amount => `₹${amount.toFixed(2)}`;

const original = 1500;
const discounted = calculateDiscount(original);       // uses default 10%
const discountedCustom = calculateDiscount(original, 25);

console.log(formatCurrency(discounted));        // "₹1350.00"
console.log(formatCurrency(discountedCustom));   // "₹1125.00"
```

## Revision Questions

<details>
<summary>1. What's the difference between a parameter and an argument?</summary>

A parameter is the placeholder name in the function's definition (e.g. `name` in `function greet(name)`). An argument is the actual value passed in when the function is called (e.g. `"Ada"` in `greet("Ada")`).
</details>

<details>
<summary>2. What does a function return if it has no explicit `return` statement?</summary>

`undefined`.
</details>

<details>
<summary>3. What is a default parameter, and when does its fallback value get used?</summary>

A default parameter provides a fallback value used automatically when no argument (or `undefined`) is passed for that parameter — e.g. `function greet(name = "there")`.
</details>

<details>
<summary>4. Rewrite `function add(a, b) { return a + b; }` as an arrow function with an implicit return.</summary>

`const add = (a, b) => a + b;`
</details>

<details>
<summary>5. Are function declarations and function expressions hoisted the same way?</summary>

No — function declarations are fully hoisted (usable before their line in the code), while function expressions are not, since they behave like variable assignments. This is covered fully in Lesson 02.
</details>
