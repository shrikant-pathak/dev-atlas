# Module 02 Exercises — Functions, Scope & Objects

## Exercise 1: Three Ways (Lesson 01)
Write the same function — one that takes two numbers and returns their average — three times: as a function declaration, a function expression, and an arrow function with an implicit return.

## Exercise 2: Hoisting Predictions (Lesson 02)
Without running the code, predict what each of these logs (or whether it throws), then verify:
```js
console.log(a);
var a = 5;

console.log(b);
let b = 5;

sayHi();
function sayHi() { console.log("hi"); }

sayBye();
var sayBye = function () { console.log("bye"); };
```

## Exercise 3: Closure Counter Bank (Lesson 03)
Write a `createAccount(startingBalance)` function (closure-based) with `deposit`, `withdraw`, and `getBalance` methods, where the balance itself cannot be accessed or changed except through those methods.

## Exercise 4: Build Your Own `myMap` (Lesson 04)
Write a `myMap(array, callback)` higher-order function that returns a new array with `callback` applied to each element — without using the built-in `.map()`.

## Exercise 5: Fix the `this` Bug (Lesson 05)
Given an object with a method that uses `setTimeout` and loses `this` (like the `timer` example from the lesson), fix it two different ways: once using an arrow function, and once using `.bind()`.

## Exercise 6: Private Counter Module (Lesson 06)
Write an IIFE-based module pattern that exposes only `increment()` and `getCount()`, keeping the internal count variable fully private.

## Exercise 7: Build a `Product` Object (Lesson 07)
Create a `createProduct(name, price, quantity)` factory function that returns an object with a `getTotal()` method, using property shorthand and method shorthand throughout.

## Exercise 8: Shape Prototype Chain (Lesson 08)
Build a `Shape` constructor function with a `describe()` method on its prototype, then a `Rectangle` constructor that inherits from `Shape` and adds its own `area()` method.

## Exercise 9: Validated Setter (Lesson 09)
Write an object representing a `Temperature` with a `celsius` getter/setter, where the setter refuses (logs a warning and doesn't update) any value below -273.15 (absolute zero).
