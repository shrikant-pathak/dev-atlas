# Lesson 04: Higher-Order Functions

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what makes a function "higher-order"
- Pass functions as arguments to other functions
- Return a function from another function
- Recognize the callback pattern and why it's central to JavaScript

## Introduction

In Lesson 01 you learned that functions are values in JavaScript — they can be stored in variables just like a string or number. A **higher-order function** takes this idea to its logical conclusion: it's any function that either **takes another function as an argument**, **returns a function**, or both. You already met this in Lesson 03 without naming it — `makeCounter()` and `makeMultiplier()` are both higher-order functions, since they return functions.

This concept matters enormously going forward: array methods like `.map()`, `.filter()`, and `.reduce()` (covered fully in Module 03) are all higher-order functions, and so is nearly every event handler you'll write once you reach the DOM in Module 04.

## Functions as Arguments (Callbacks)

A function passed into another function to be called later is known as a **callback**.

```js
function processOrder(amount, onSuccess, onFailure) {
  if (amount > 0) {
    onSuccess(amount);
  } else {
    onFailure("Invalid amount");
  }
}

processOrder(
  500,
  amount => console.log(`Order processed for ₹${amount}`),
  error => console.log(`Error: ${error}`)
);
// "Order processed for ₹500"
```

`processOrder` doesn't know or care what `onSuccess`/`onFailure` actually do — it just calls whichever one applies at the right moment. This separation is what makes callbacks so flexible.

## A Built-In Example: `setTimeout`

You've likely not used this yet, but it's worth previewing since it's a perfect real-world higher-order function: `setTimeout` takes a callback and a delay, and calls the callback after that delay.

```js
setTimeout(() => {
  console.log("This runs after 1 second");
}, 1000);

console.log("This runs immediately");
```

You'll cover timing and asynchronous behavior properly in Module 05 — for now, just notice that `setTimeout` is a function that *accepts* a function as an argument, which is exactly the higher-order pattern.

## Writing Your Own Array Iterator

You'll get the full, proper versions of these in Module 03, but you can already build a simplified one yourself with what you know:

```js
function myForEach(array, callback) {
  for (let i = 0; i < array.length; i++) {
    callback(array[i], i);
  }
}

const fruits = ["apple", "banana", "cherry"];

myForEach(fruits, (fruit, index) => {
  console.log(`${index}: ${fruit}`);
});
// 0: apple
// 1: banana
// 2: cherry
```

`myForEach` is higher-order because it takes `callback` as an argument and calls it repeatedly with different values.

## Functions That Return Functions

Covered in depth via closures in Lesson 03, but worth restating simply here: a higher-order function can also **produce** a function as its result.

```js
function greaterThan(threshold) {
  return function (value) {
    return value > threshold;
  };
}

const isAdult = greaterThan(17);

console.log(isAdult(20)); // true
console.log(isAdult(10)); // false
```

## Practical Example

```js
// validation-pipeline.js

function validate(value, rules) {
  for (const rule of rules) { // for...of loops arrive formally in Module 03
    const result = rule(value);
    if (result !== true) {
      return result; // return the first failure message
    }
  }
  return "Valid";
}

const notEmpty = value => (value ? true : "Value cannot be empty");
const minLength = min => value => (value.length >= min ? true : `Must be at least ${min} characters`);

const rules = [notEmpty, minLength(5)];

console.log(validate("hi", rules));       // "Must be at least 5 characters"
console.log(validate("", rules));         // "Value cannot be empty"
console.log(validate("hello!", rules));   // "Valid"
```

## Revision Questions

<details>
<summary>1. What makes a function "higher-order"?</summary>

A function that either takes another function as an argument, returns a function, or both.
</details>

<details>
<summary>2. What is a "callback"?</summary>

A function passed as an argument to another function, to be called (invoked) at some point during that function's execution.
</details>

<details>
<summary>3. Is `setTimeout` a higher-order function? Why or why not?</summary>

Yes — it accepts a callback function as one of its arguments and invokes it later, which is exactly the definition of a higher-order function.
</details>

<details>
<summary>4. In `myForEach(array, callback)`, what role does `callback` play?</summary>

It's the function invoked once for each element in the array, receiving the element (and its index) as arguments — the caller decides what actually happens on each iteration.
</details>

<details>
<summary>5. In the `minLength` example, why does `minLength(5)` need to return another function rather than directly returning `true`/`false`?</summary>

Because `minLength` needs to first capture the threshold (`5`) via a closure (Lesson 03), and then produce a function that takes the actual `value` to check against that threshold — this two-step shape lets it be used interchangeably with single-argument rules like `notEmpty` inside the `rules` array.
</details>
