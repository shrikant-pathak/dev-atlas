# Lesson 03: Closures

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a closure is
- Predict what value a closure will "remember" after its outer function has finished running
- Use closures to create private state
- Recognize closures in common patterns like counters and function factories

## Introduction

In Lesson 02 you saw that a function's access to outer variables is fixed by where it's defined (lexical scoping). A **closure** takes this one step further: a function keeps access to its outer scope's variables **even after the outer function has finished running**. This is one of JavaScript's most powerful — and most asked-about-in-interviews — features.

## A Closure in Action

```js
function makeCounter() {
  let count = 0; // this variable lives inside makeCounter's scope

  return function () {
    count++;
    return count;
  };
}

const counter = makeCounter(); // makeCounter() runs and finishes...

console.log(counter()); // 1
console.log(counter()); // 2
console.log(counter()); // 3
```

Normally, once `makeCounter()` finishes executing, you'd expect its local variable `count` to be gone. But the inner function returned from `makeCounter` **closes over** `count` — it keeps a live reference to it, so `count` persists in memory for as long as that inner function still exists.

This inner function, plus the variables it remembers from its birthplace, is what's called a **closure**.

## Each Call Creates a New, Independent Closure

```js
const counterA = makeCounter();
const counterB = makeCounter();

console.log(counterA()); // 1
console.log(counterA()); // 2
console.log(counterB()); // 1 — completely separate `count` from counterA's
```

Every call to `makeCounter()` creates a brand-new `count` variable and a brand-new closure around it — they don't share state.

## Using Closures for Private State

Before closures, there's no way in JavaScript to make a variable truly private the way some other languages allow. Closures are the standard way to achieve that: `count` in the example above cannot be accessed or modified directly from outside — only through the function that closes over it.

```js
function createBankAccount(initialBalance) {
  let balance = initialBalance; // private — no direct outside access

  return {
    deposit(amount) {
      balance += amount;
      return balance;
    },
    withdraw(amount) {
      if (amount > balance) {
        return "Insufficient funds";
      }
      balance -= amount;
      return balance;
    },
    getBalance() {
      return balance;
    }
  };
}

const account = createBankAccount(1000);
console.log(account.deposit(500));   // 1500
console.log(account.withdraw(200));  // 1300
console.log(account.balance);         // undefined — no direct access
```

(Object literal method shorthand like `deposit(amount) { ... }` is covered fully in Lesson 07 — for now, notice that each returned method still shares the same closed-over `balance`.)

## Function Factories

A **function factory** is a function that returns other functions, each customized by the arguments passed to the factory — a direct, practical use of closures.

```js
function makeMultiplier(factor) {
  return function (number) {
    return number * factor;
  };
}

const double = makeMultiplier(2);
const triple = makeMultiplier(3);

console.log(double(5)); // 10
console.log(triple(5)); // 15
```

`double` and `triple` are both closures — each one remembers its own `factor` from when it was created.

## Practical Example

```js
// rate-limiter.js
// A simple closure-based rate limiter: allows only N calls, then blocks.

function createRateLimiter(maxCalls) {
  let callsMade = 0;

  return function () {
    if (callsMade >= maxCalls) {
      return "Rate limit exceeded.";
    }
    callsMade++;
    return `Call allowed (${callsMade}/${maxCalls})`;
  };
}

const limiter = createRateLimiter(3);

console.log(limiter()); // "Call allowed (1/3)"
console.log(limiter()); // "Call allowed (2/3)"
console.log(limiter()); // "Call allowed (3/3)"
console.log(limiter()); // "Rate limit exceeded."
```

## Revision Questions

<details>
<summary>1. What is a closure, in your own words?</summary>

A function that retains access to variables from its outer (lexical) scope, even after the outer function has finished executing.
</details>

<details>
<summary>2. If you call `makeCounter()` twice to create `counterA` and `counterB`, do they share the same `count` variable?</summary>

No — each call to `makeCounter()` creates a brand-new, independent `count` variable and closure. Incrementing `counterA` has no effect on `counterB`.
</details>

<details>
<summary>3. How do closures allow "private" variables in JavaScript?</summary>

A variable declared inside an outer function is only reachable through functions defined within that same scope (the closure). There's no way to access or modify it directly from outside, since JavaScript has no built-in private-variable keyword at this stage of the language.
</details>

<details>
<summary>4. What is a "function factory"?</summary>

A function that returns other functions, each one customized by arguments passed to the factory — a common, practical application of closures (e.g. `makeMultiplier(2)` returning a "double" function).
</details>

<details>
<summary>5. In the bank account example, why does `account.balance` return `undefined`?</summary>

Because `balance` was never set as a property on the returned object — it only exists as a variable closed over by the `deposit`, `withdraw`, and `getBalance` methods. There is no `.balance` property to read directly.
</details>
