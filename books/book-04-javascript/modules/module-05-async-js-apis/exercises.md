# Module 05 Exercises — Asynchronous JavaScript & APIs

## Exercise 1: Simulated Login (Lesson 01)
Write a `login(username, password, callback)` function using `setTimeout` to simulate a 1-second delay, following the error-first convention: call back with an error if the password is shorter than 6 characters, otherwise call back with a fake user object.

## Exercise 2: Convert to Promises (Lesson 02)
Rewrite your `login` function from Exercise 1 to return a Promise instead of taking a callback. Chain it with `.then()`/`.catch()` to log the result, and add a `.finally()` that logs "Login attempt finished" no matter what.

## Exercise 3: Convert to async/await (Lesson 03)
Rewrite the `.then()` chain from Exercise 2 as an `async` function using `await` and `try`/`catch`. Then write a second function that logs in two different users in parallel using `Promise.all()`, and log the total time each approach takes using `Date.now()` (Module 03, Lesson 03).

## Exercise 4: Fetch a Public API (Lesson 04)
Using `fetch()`, request data from any free public API of your choice (e.g. a joke API, a countries API). Handle both a successful response and a deliberately broken URL (to trigger a genuine network error) as well as a valid URL with an invalid path (to trigger a 404 you must catch manually).

## Exercise 5: Build a Mini CRUD Client (Lesson 05)
Using a mock/test API (many free ones exist for practice), write four functions — `getPosts()`, `createPost(data)`, `updatePost(id, data)`, `deletePost(id)` — each using `fetch()` with the correct HTTP method, checking `response.ok`, and returning parsed JSON where applicable.

## Challenge: Retry-with-Backoff Fetch Wrapper
Write a `fetchWithRetry(url, maxAttempts)` function that retries a failed `fetch()` call (network error or non-2xx response) up to `maxAttempts` times, waiting slightly longer between each attempt (e.g. 500ms, then 1000ms, then 1500ms), before finally rejecting if all attempts fail.
