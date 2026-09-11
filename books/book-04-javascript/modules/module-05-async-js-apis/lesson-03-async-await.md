# Lesson 03: async/await

## Learning Objectives
By the end of this lesson, you will be able to:
- Write asynchronous code using `async`/`await` syntax
- Explain how `async`/`await` relates to Promises under the hood
- Handle errors in `async` functions using `try`/`catch`
- Run multiple asynchronous operations in parallel while still using `await`

## Introduction

Lesson 02's Promise chains are a huge improvement over callback hell, but they still read differently from ordinary, synchronous code. `async`/`await` — introduced in ES2017 — is syntax that lets you write asynchronous code that **looks and reads like normal, sequential, synchronous code**, while still being built entirely on Promises underneath.

## The `async` Keyword

Placing `async` before a function declaration makes it always return a Promise, regardless of what you `return` inside it.

```js
async function getGreeting() {
  return "Hello!";
}

getGreeting().then(value => console.log(value)); // "Hello!" — getGreeting() itself returns a Promise
```

Even though `getGreeting` just returns a plain string, calling it gives you back a Promise that resolves with that string — `async` handles the wrapping automatically.

## The `await` Keyword

`await` can only be used inside an `async` function. It pauses execution at that line until the given Promise settles, then "unwraps" it — returning the resolved value directly, as if it were synchronous.

```js
function fetchUserPromise(id) {
  return new Promise(resolve => {
    setTimeout(() => resolve({ id, name: "Ada" }), 1000);
  });
}

async function loadUser() {
  console.log("Fetching...");
  const user = await fetchUserPromise(1); // pauses here until the Promise resolves
  console.log("Got user:", user);          // this line only runs after the pause ends
}

loadUser();
```

Compare this directly to Lesson 02's `.then()` version — same underlying behavior, but `await` reads top-to-bottom exactly like ordinary synchronous code, with no callback or `.then()` needed at all.

## Rewriting a Promise Chain as async/await

Recall the chained example from Lesson 02:

```js
// Promise chain version (Lesson 02):
fetchUserPromise(1)
  .then(user => fetchOrdersPromise(user.id))
  .then(orders => fetchOrderDetailsPromise(orders[0].id))
  .then(details => console.log(details))
  .catch(error => console.log("Error:", error.message));
```

```js
// async/await version — same behavior, reads sequentially:
async function loadOrderDetails() {
  try {
    const user = await fetchUserPromise(1);
    const orders = await fetchOrdersPromise(user.id);
    const details = await fetchOrderDetailsPromise(orders[0].id);
    console.log(details);
  } catch (error) {
    console.log("Error:", error.message);
  }
}

loadOrderDetails();
```

## Error Handling With `try`/`catch`

Since `await` "unwraps" a Promise's resolved value, a **rejected** Promise instead throws inside the `async` function — which is exactly why ordinary `try`/`catch` works to handle it, rather than needing a separate `.catch()`.

```js
async function loadUser() {
  try {
    const user = await fetchUserPromise(-1); // this Promise rejects
    console.log(user); // never reached
  } catch (error) {
    console.log("Caught an error:", error.message);
  }
}
```

## Running Things in Parallel

A common mistake: `await`-ing several independent operations one after another makes them run sequentially, wasting time when they could run at the same time.

```js
// Slow — each await waits for the previous one to finish first, even though they're independent
async function loadDashboardSlow() {
  const profile = await fetchProfile(1);         // waits ~800ms
  const notifications = await fetchNotifications(1); // THEN waits another ~500ms
  return { profile, notifications }; // total: ~1300ms
}
```

```js
// Fast — start both immediately, then await them together (Lesson 02's Promise.all)
async function loadDashboardFast() {
  const [profile, notifications] = await Promise.all([
    fetchProfile(1),
    fetchNotifications(1)
  ]);
  return { profile, notifications }; // total: ~800ms — limited by the SLOWER of the two, not the sum
}
```

**Rule of thumb**: if two `await`-ed operations don't depend on each other's results, start them together with `Promise.all()` rather than `await`-ing them one after another.

## `async`/`await` Is Still Promises

It's worth remembering that `async`/`await` is purely syntax sugar — it doesn't replace or avoid Promises, it just provides a more readable way to work with them. You can freely mix the two:

```js
async function loadUser() {
  const user = await fetchUserPromise(1);
  return user;
}

loadUser().then(user => console.log("From outside:", user)); // still a Promise from the caller's perspective
```

## Practical Example

```js
// checkout-flow.js

async function processCheckout(cartId) {
  try {
    const cart = await fetchCart(cartId);
    const [inventoryCheck, paymentAuth] = await Promise.all([
      checkInventory(cart.items),
      authorizePayment(cart.total)
    ]);

    if (!inventoryCheck.available) {
      throw new Error("Some items are out of stock");
    }

    const order = await createOrder(cart, paymentAuth);
    console.log("Order placed:", order.id);
  } catch (error) {
    console.log("Checkout failed:", error.message);
  }
}
```

## Revision Questions

<details>
<summary>1. What does adding `async` to a function declaration change about its return value?</summary>

The function always returns a Promise, regardless of what value is returned inside it — a plain returned value is automatically wrapped in a resolved Promise.
</details>

<details>
<summary>2. Where can the `await` keyword be used?</summary>

Only inside an `async` function (with one modern exception — top-level `await` in certain module contexts, which is beyond this lesson's scope).
</details>

<details>
<summary>3. What happens when you `await` a Promise that rejects?</summary>

It throws an error at that line inside the `async` function, which can be caught with an ordinary `try`/`catch` block.
</details>

<details>
<summary>4. Why is it a mistake to `await` two independent operations one after another instead of using `Promise.all()`?</summary>

Awaiting them sequentially makes the second operation wait for the first to fully finish before even starting, even though they don't depend on each other — wasting time. Starting both together with `Promise.all()` lets them run concurrently, so the total wait is limited by the slower one rather than the sum of both.
</details>

<details>
<summary>5. Is `async`/`await` a replacement for Promises, or built on top of them?</summary>

Built on top of them — `async`/`await` is syntax sugar over Promises, not a separate mechanism; every `async` function still returns a Promise, and `await` still works with actual Promise objects underneath.
</details>
