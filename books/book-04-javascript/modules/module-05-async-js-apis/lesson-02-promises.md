# Lesson 02: Promises

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a Promise is and its three possible states
- Consume a Promise using `.then()`, `.catch()`, and `.finally()`
- Chain Promises to avoid the callback nesting problem from Lesson 01
- Use `Promise.all()`, `Promise.race()`, and `Promise.allSettled()` to coordinate multiple Promises

## Introduction

Lesson 01 ended with "callback hell" — deeply nested, hard-to-follow asynchronous code. A **Promise** is an object representing the eventual result of an asynchronous operation, designed specifically to let that code be written in a flatter, more readable way, while still describing the exact same kind of "this will finish later" behavior.

## The Three States of a Promise

Every Promise starts **pending**, and settles into exactly one of two final states:

- **Pending** — the operation hasn't finished yet
- **Fulfilled** — the operation succeeded, with a resulting value
- **Rejected** — the operation failed, with a reason (usually an error)

Once a Promise settles (fulfilled or rejected), it stays that way permanently — it can never change state again.

## Consuming a Promise

Many built-in and library functions already return Promises — you'll use `fetch()` this way constantly starting in Lesson 04. Consuming one uses `.then()` for success and `.catch()` for failure:

```js
fetchUserPromise(1)
  .then(user => {
    console.log("Got user:", user);
  })
  .catch(error => {
    console.log("Error:", error.message);
  });
```

`.then()` runs its callback if the Promise fulfills, receiving the fulfilled value. `.catch()` runs its callback if the Promise rejects, receiving the rejection reason. Unlike Lesson 01's error-first callbacks, success and failure are handled in two clearly separate places rather than one combined `(error, result)` parameter list.

### `.finally()`

Runs regardless of whether the Promise fulfilled or rejected — useful for cleanup code, like hiding a loading spinner:

```js
fetchUserPromise(1)
  .then(user => console.log("Got user:", user))
  .catch(error => console.log("Error:", error.message))
  .finally(() => console.log("Request finished (success or failure)"));
```

## Creating Your Own Promise

You'll rarely need to do this once you're using built-in Promise-returning functions like `fetch()`, but understanding how a Promise is built clarifies what's happening underneath:

```js
function fetchUserPromise(id) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id <= 0) {
        reject(new Error("Invalid user ID"));
        return;
      }
      resolve({ id, name: "Ada" });
    }, 1000);
  });
}
```

The function passed to `new Promise(...)` is called the **executor** — it receives two functions, `resolve` (call this on success) and `reject` (call this on failure), and runs immediately when the Promise is created.

## Chaining Promises

This is the feature that directly solves callback hell. Each `.then()` returns a **new** Promise, so multiple asynchronous steps can be chained in a flat sequence instead of nesting:

```js
fetchUserPromise(1)
  .then(user => fetchOrdersPromise(user.id))     // return a new Promise from inside .then()
  .then(orders => fetchOrderDetailsPromise(orders[0].id))
  .then(details => {
    console.log(details);
  })
  .catch(error => {
    // a SINGLE .catch() here handles a rejection from ANY step above
    console.log("Something went wrong:", error.message);
  });
```

Compare this directly to the nested pyramid from Lesson 01 — the logic is identical (fetch a user, then their orders, then order details), but the structure stays flat, and there's only one error handler for the entire chain instead of one per step.

## Coordinating Multiple Promises

### `Promise.all()` — wait for everything, fail if any one fails

```js
Promise.all([
  fetchUserPromise(1),
  fetchUserPromise(2),
  fetchUserPromise(3)
])
  .then(users => {
    console.log("All three users:", users); // an array of all three results, in order
  })
  .catch(error => {
    console.log("At least one failed:", error.message); // rejects immediately if ANY promise rejects
  });
```

### `Promise.allSettled()` — wait for everything, regardless of success/failure

```js
Promise.allSettled([
  fetchUserPromise(1),
  fetchUserPromise(-1) // this one will reject
])
  .then(results => {
    console.log(results);
    // [
    //   { status: "fulfilled", value: { id: 1, name: "Ada" } },
    //   { status: "rejected", reason: Error("Invalid user ID") }
    // ]
  });
```

Unlike `Promise.all()`, this never short-circuits on a single failure — it always waits for every Promise to settle and reports each individual outcome.

### `Promise.race()` — resolves/rejects as soon as the FIRST one settles

```js
Promise.race([
  fetchUserPromise(1),   // suppose this takes 1000ms
  timeoutPromise(500)     // a Promise that rejects after 500ms — a common "request timeout" pattern
])
  .then(result => console.log(result))
  .catch(error => console.log("Timed out or failed:", error.message));
```

## Practical Example

```js
// dashboard-loader.js

function fetchProfile(id) {
  return new Promise(resolve => {
    setTimeout(() => resolve({ id, name: "Ada" }), 800);
  });
}

function fetchNotifications(id) {
  return new Promise(resolve => {
    setTimeout(() => resolve(["New comment", "New like"]), 500);
  });
}

Promise.all([fetchProfile(1), fetchNotifications(1)])
  .then(([profile, notifications]) => { // array destructuring, Module 03 Lesson 05
    console.log(`Welcome, ${profile.name}!`);
    console.log(`You have ${notifications.length} notifications.`);
  })
  .catch(error => console.log("Dashboard failed to load:", error.message));
```

## Revision Questions

<details>
<summary>1. What are the three possible states of a Promise?</summary>

Pending (not yet finished), fulfilled (succeeded, with a value), and rejected (failed, with a reason). Once settled (fulfilled or rejected), a Promise never changes state again.
</details>

<details>
<summary>2. What do `resolve` and `reject` do inside a Promise's executor function?</summary>

`resolve(value)` transitions the Promise to fulfilled with that value. `reject(reason)` transitions it to rejected with that reason. Whichever is called first "wins" — a Promise can only settle once.
</details>

<details>
<summary>3. How does chaining `.then()` calls solve the callback hell problem from Lesson 01?</summary>

Each `.then()` returns a new Promise, allowing multiple dependent asynchronous steps to be written as a flat sequence rather than nested inside one another — and a single `.catch()` at the end can handle a rejection from any step in the chain.
</details>

<details>
<summary>4. What's the difference between `Promise.all()` and `Promise.allSettled()`?</summary>

`Promise.all()` rejects immediately as soon as any one of the given Promises rejects, without waiting for the rest. `Promise.allSettled()` always waits for every Promise to settle, returning the individual outcome (fulfilled or rejected) of each one.
</details>

<details>
<summary>5. What does `Promise.race()` do?</summary>

It settles (fulfills or rejects) as soon as the *first* Promise in the given list settles, ignoring the eventual outcome of the rest — commonly used to implement a "give up after X seconds" timeout pattern.
</details>
