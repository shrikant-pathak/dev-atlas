# Lesson 05: The `this` Keyword

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what `this` refers to in different calling contexts
- Explain why arrow functions handle `this` differently from regular functions
- Recognize the common "losing `this`" bug in callbacks
- Use `call`, `apply`, and `bind` to control what `this` refers to

## Introduction

`this` is one of the most notorious sources of confusion in JavaScript, because unlike variables (which follow the lexical scoping you learned in Lesson 02), **`this` is determined by *how* a function is called, not where it's defined** — with one deliberate exception, which is exactly why arrow functions exist for this purpose.

## `this` in a Regular Function Call

When called plainly, `this` refers to the global object (in browsers, `window`) — or is `undefined` in strict mode/modules, which is the default for the modern code you'll write from here on.

```js
function showThis() {
  console.log(this);
}

showThis(); // undefined (in strict mode / modules) or the global object otherwise
```

## `this` Inside an Object Method

When a function is called *as a method* — i.e., attached to an object and invoked via that object — `this` refers to the object it was called on.

```js
const user = {
  name: "Ada",
  greet: function () {
    console.log(`Hi, I'm ${this.name}`);
  }
};

user.greet(); // "Hi, I'm Ada" — `this` is `user`, because that's how it was called
```

Notice: the *same* function, called differently, would behave differently:

```js
const greetFn = user.greet;
greetFn(); // "Hi, I'm undefined" — called plainly now, so `this` is no longer `user`
```

This is the root of the classic "losing `this`" bug — the same function reference, detached from its original object, loses access to that object via `this`.

## Where This Bites: Callbacks

```js
const timer = {
  seconds: 0,
  start: function () {
    setTimeout(function () {
      this.seconds++; // `this` here is NOT `timer` — it's the plain-call default
      console.log(this.seconds); // NaN — this.seconds is undefined, undefined++ is NaN
    }, 1000);
  }
};

timer.start();
```

The callback passed to `setTimeout` is invoked by `setTimeout` itself, as a plain function call — so `this` inside it is not `timer`, even though the whole function is *written* inside a method of `timer`.

## Arrow Functions and `this`

Arrow functions (Lesson 01) deliberately do **not** have their own `this`. Instead, they use `this` from the surrounding lexical scope — exactly like a regular variable would work, per Lesson 02. This is the single most important practical reason arrow functions exist, beyond shorter syntax.

```js
const timer = {
  seconds: 0,
  start: function () {
    setTimeout(() => {
      this.seconds++; // arrow function — `this` is inherited from `start`, which is `timer`
      console.log(this.seconds); // 1
    }, 1000);
  }
};

timer.start();
```

Because `start` is a regular function called as `timer.start()`, `this` inside `start` correctly refers to `timer` — and the arrow function callback simply reuses that same `this`, rather than resetting it.

## `call`, `apply`, and `bind`

These let you explicitly control what `this` refers to when calling a function.

```js
function introduce() {
  console.log(`I'm ${this.name}`);
}

const person1 = { name: "Ada" };
const person2 = { name: "Grace" };

introduce.call(person1);   // "I'm Ada"  — calls immediately, this = person1
introduce.call(person2);   // "I'm Grace" — calls immediately, this = person2

const introduceAda = introduce.bind(person1); // does NOT call it — returns a new function
introduceAda(); // "I'm Ada" — this is now permanently locked to person1
```

`call` and `apply` both invoke the function immediately with a chosen `this` (they differ only in how extra arguments are passed — `call` takes them individually, `apply` takes them as an array). `bind` instead returns a brand-new function with `this` permanently locked, without calling it right away.

## Practical Example

```js
// button-handler.js
// A common real-world scenario — you'll see this exact pattern
// again once you reach event listeners in Module 04.

const counter = {
  count: 0,
  increment: function () {
    this.count++;
    console.log(this.count);
  }
};

// Simulating a callback-based API, like a real event listener would provide
function simulateClick(callback) {
  callback();
}

simulateClick(counter.increment.bind(counter)); // 1 — `this` explicitly locked to counter
simulateClick(() => counter.increment());        // 2 — arrow function reuses surrounding `this`
```

## Revision Questions

<details>
<summary>1. What determines what `this` refers to in a regular function?</summary>

How the function is called — not where it's defined. Calling it as a method (`obj.method()`) makes `this` the object; calling it plainly makes `this` `undefined` (in strict mode) or the global object otherwise.
</details>

<details>
<summary>2. Why do arrow functions behave differently with `this`?</summary>

Arrow functions don't have their own `this` at all — they use the `this` value from their surrounding lexical scope, the same way they'd access any other outer variable.
</details>

<details>
<summary>3. In the `timer.start()` example, why does a regular function callback passed to `setTimeout` lose access to `timer` via `this`?</summary>

Because `setTimeout` invokes the callback as a plain function call, not as a method call on `timer` — and `this` depends on how a function is called, so a plain call resets it away from `timer`.
</details>

<details>
<summary>4. What's the difference between `call`/`apply` and `bind`?</summary>

`call` and `apply` invoke the function immediately with a specified `this` value. `bind` does not invoke the function — it returns a new function with `this` permanently locked to the specified value, to be called later.
</details>

<details>
<summary>5. If `const greetFn = user.greet;` is called as `greetFn()`, what does `this` refer to inside it, and why?</summary>

It no longer refers to `user`. Assigning the method to a plain variable and calling it directly detaches it from the object it was originally called on — since `this` depends purely on the call itself, calling it plainly resets `this` to the plain-call default.
</details>
