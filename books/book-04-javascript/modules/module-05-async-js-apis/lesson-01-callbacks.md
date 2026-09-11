# Lesson 01: Callbacks

## Learning Objectives
By the end of this lesson, you will be able to:
- Distinguish synchronous callbacks from asynchronous callbacks
- Explain why JavaScript needs asynchronous code at all
- Recognize the "callback hell" problem and why it motivated Promises
- Follow the error-first callback convention

## Introduction

Module 02, Lesson 04 introduced callbacks — functions passed as arguments to other functions — using entirely synchronous examples like `myForEach`. This module is about **asynchronous** JavaScript: code that doesn't finish immediately, and callbacks are where that story begins.

## Why Asynchronous Code Exists

JavaScript runs on a single thread — it can only do one thing at a time. But many real operations take time and shouldn't freeze everything else while waiting: fetching data from a server, reading a file, waiting for a timer. If JavaScript simply paused and did nothing else during these operations, a web page would become completely unresponsive every time it needed to load anything.

Instead, JavaScript hands these slow operations off (to the browser or Node.js runtime) and keeps running other code. When the slow operation finishes, a **callback** you provided gets called with the result.

## Synchronous vs. Asynchronous Callbacks

You already met a synchronous callback in Module 02:

```js
[1, 2, 3].forEach(num => console.log(num)); // callback runs immediately, in order, before forEach returns
```

An **asynchronous** callback, by contrast, doesn't run immediately — it runs later, once some operation finishes:

```js
console.log("1. Start");

setTimeout(() => {
  console.log("3. This runs later");
}, 1000);

console.log("2. This runs before the timeout, even though it's written after");

// Output:
// "1. Start"
// "2. This runs before the timeout, even though it's written after"
// "3. This runs later"   (after ~1 second)
```

`setTimeout`'s callback doesn't block anything — JavaScript keeps executing the rest of the script (`console.log("2. ...")`) immediately, and only calls the callback once the timer has actually elapsed.

## A Realistic Example: Simulated Data Fetching

```js
function fetchUser(id, callback) {
  console.log("Fetching user...");

  setTimeout(() => {
    const user = { id, name: "Ada" }; // pretend this came from a server
    callback(user);
  }, 1000);
}

fetchUser(1, user => {
  console.log("Got user:", user);
});

console.log("This logs before the user arrives");
```

This is exactly the shape of real network requests you'll work with using the Fetch API in Lesson 04 — code keeps running while the "network request" (simulated here with `setTimeout`) happens in the background.

## The Error-First Callback Convention

Before Promises existed, JavaScript (especially Node.js) settled on a widely-used convention: a callback's **first parameter is reserved for an error** (or `null` if there wasn't one), and the second parameter is the actual result.

```js
function fetchUser(id, callback) {
  setTimeout(() => {
    if (id <= 0) {
      callback(new Error("Invalid user ID"), null);
      return;
    }
    callback(null, { id, name: "Ada" });
  }, 1000);
}

fetchUser(1, (error, user) => {
  if (error) {
    console.log("Error:", error.message);
    return;
  }
  console.log("Got user:", user);
});
```

You'll still encounter this pattern in older libraries and some Node.js APIs, even though modern code (Lessons 02 and 03) has largely moved to Promises instead.

## Callback Hell

When multiple asynchronous steps each depend on the previous one's result, nesting callbacks inside callbacks quickly becomes difficult to read — commonly nicknamed **"callback hell"** or the **"pyramid of doom"**:

```js
fetchUser(1, (error, user) => {
  if (error) return console.log(error.message);

  fetchOrders(user.id, (error, orders) => {
    if (error) return console.log(error.message);

    fetchOrderDetails(orders[0].id, (error, details) => {
      if (error) return console.log(error.message);

      console.log(details);
      // ...and this keeps growing rightward with every additional step
    });
  });
});
```

Each new asynchronous step adds another level of nesting and another error check, and the code becomes progressively harder to follow. This exact problem is what directly motivated **Promises**, which get their full treatment in Lesson 02.

## Practical Example

```js
// retry-logic.js
// A pattern you'll see constantly in real async code: retrying a flaky operation.

function unreliableFetch(callback) {
  setTimeout(() => {
    const success = Math.random() > 0.5; // Module 03, Lesson 02
    if (success) {
      callback(null, "Data loaded!");
    } else {
      callback(new Error("Network error"), null);
    }
  }, 500);
}

function fetchWithRetry(attemptsLeft, callback) {
  unreliableFetch((error, data) => {
    if (error && attemptsLeft > 1) {
      console.log(`Retrying... (${attemptsLeft - 1} attempts left)`);
      fetchWithRetry(attemptsLeft - 1, callback);
      return;
    }
    callback(error, data);
  });
}

fetchWithRetry(3, (error, data) => {
  if (error) {
    console.log("Failed after all retries:", error.message);
  } else {
    console.log("Success:", data);
  }
});
```

## Revision Questions

<details>
<summary>1. Why does JavaScript need asynchronous code at all?</summary>

JavaScript runs on a single thread and can only do one thing at a time. Slow operations (network requests, timers, file reads) are handed off so the rest of the program can keep running, rather than freezing everything until each one finishes.
</details>

<details>
<summary>2. What's the difference between a synchronous and an asynchronous callback?</summary>

A synchronous callback (like the one passed to `.forEach()`) runs immediately, before the outer function even returns. An asynchronous callback runs later, once some operation (like a timer or network request) actually completes.
</details>

<details>
<summary>3. What is the "error-first callback" convention?</summary>

A widely-used pattern where a callback's first parameter is reserved for an error object (or `null` if there wasn't one), and the second parameter carries the actual successful result.
</details>

<details>
<summary>4. What is "callback hell," and why does it happen?</summary>

The deeply nested, right-drifting structure that results from chaining multiple dependent asynchronous steps together with nested callbacks — each step needs to wait for the previous one's result, so each is nested one level deeper inside the last.
</details>

<details>
<summary>5. Does `setTimeout`'s callback block the rest of the script from running while it waits?</summary>

No — the rest of the script continues executing immediately; the callback only runs later, once the specified delay has actually elapsed.
</details>
