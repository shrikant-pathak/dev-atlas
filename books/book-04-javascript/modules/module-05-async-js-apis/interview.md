# Module 05 Interview Questions — Asynchronous JavaScript & APIs

<details>
<summary>1. Why does JavaScript need asynchronous code, given it runs on a single thread?</summary>

Slow operations (network requests, timers, file I/O) would otherwise freeze the entire program while waiting. Handing them off asynchronously lets the rest of the code keep running, with a callback, Promise, or `await` resuming the flow once the operation actually completes.
</details>

<details>
<summary>2. What is "callback hell," and what problem does it illustrate?</summary>

The deeply nested, right-drifting code structure that results from chaining several dependent asynchronous steps using nested callbacks. It illustrates the readability problem that directly motivated the creation of Promises.
</details>

<details>
<summary>3. What are the three states of a Promise, and can a Promise change state after settling?</summary>

Pending, fulfilled, and rejected. No — once a Promise settles into fulfilled or rejected, it remains in that state permanently.
</details>

<details>
<summary>4. What's the difference between `Promise.all()` and `Promise.allSettled()`?</summary>

`Promise.all()` rejects immediately if any given Promise rejects, without waiting for the others. `Promise.allSettled()` always waits for every Promise to settle and reports each individual outcome, regardless of failures.
</details>

<details>
<summary>5. Is `async`/`await` a different mechanism from Promises, or built on top of them?</summary>

Built on top of them — it's syntax sugar. Every `async` function still returns a real Promise, and `await` still works with actual Promise objects underneath; the two can be freely mixed.
</details>

<details>
<summary>6. Why might awaiting two independent async operations one after another be a performance mistake?</summary>

Because each `await` pauses execution until that specific Promise resolves — if the two operations don't depend on each other, awaiting them sequentially wastes time waiting for the first to finish before even starting the second. Starting both with `Promise.all()` runs them concurrently instead.
</details>

<details>
<summary>7. What does `fetch()`'s returned Promise reject on, and what does it NOT reject on?</summary>

It rejects only on a genuine network-level failure (e.g. no connectivity, DNS failure). It does not reject on an HTTP error status like `404` or `500` — those must be detected manually by checking `response.ok` or `response.status`.
</details>

<details>
<summary>8. What is a common bug caused by forgetting the "fetch doesn't reject on HTTP errors" behavior?</summary>

Code that relies solely on `.catch()` (or a `try`/`catch` around `await fetch(...)`) to detect a failed request will silently treat a `404` or `500` response as "successful," since the Promise never actually rejected — leading to broken data being processed as if it were valid.
</details>

<details>
<summary>9. What does `JSON.stringify()` do to functions and `undefined` values in an object?</summary>

It silently drops them — JSON has no way to represent functions or `undefined`, so any such properties simply disappear from the resulting string.
</details>

<details>
<summary>10. What does REST stand for, and what is an API built around REST conventions organized by?</summary>

Representational State Transfer — it's organized around resources (like users or orders), each identified by a URL and manipulated using standard HTTP methods (GET, POST, PUT/PATCH, DELETE).
</details>

<details>
<summary>11. Map each CRUD operation to its conventional HTTP method.</summary>

Create → `POST`, Read → `GET`, Update → `PUT` (full replace) or `PATCH` (partial update), Delete → `DELETE`.
</details>

<details>
<summary>12. What's a practical reason to write a reusable wrapper function around `fetch()`?</summary>

To avoid repeating the same `response.ok` check (and consistent error-throwing) in every function that makes a request — centralizing that logic in one place instead.
</details>
