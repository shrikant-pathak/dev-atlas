# Lesson 04: Fetch API

## Learning Objectives
By the end of this lesson, you will be able to:
- Make a GET request using `fetch()`
- Correctly handle the Response object, including reading JSON
- Explain why `fetch()` does NOT reject on HTTP error statuses, and how to handle that
- Send data with `fetch()` using different HTTP methods and headers

## Introduction

Every asynchronous concept so far in this module — callbacks (Lesson 01), Promises (Lesson 02), `async`/`await` (Lesson 03) — has used simulated `setTimeout`-based examples. This lesson finally connects them to something real: `fetch()`, the built-in browser API for making network requests, which returns a genuine Promise.

## A Basic GET Request

```js
fetch("https://api.example.com/users/1")
  .then(response => response.json()) // .json() itself returns a Promise (Lesson 02)
  .then(data => console.log(data))
  .catch(error => console.log("Network error:", error.message));
```

Or, using `async`/`await` (Lesson 03), which reads more clearly for multi-step flows:

```js
async function getUser(id) {
  try {
    const response = await fetch(`https://api.example.com/users/${id}`);
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.log("Network error:", error.message);
  }
}
```

## The Response Object

`fetch()`'s Promise resolves to a **Response** object — this is not the actual data yet, just metadata and methods for reading the body.

```js
const response = await fetch("https://api.example.com/users/1");

response.status;      // 200, 404, 500, etc. — the HTTP status code
response.ok;            // true if status is 200–299, false otherwise
response.headers.get("Content-Type"); // read a specific response header

const data = await response.json(); // parses the body as JSON — returns a Promise, so it needs await too
```

Other body-reading methods exist for non-JSON responses: `.text()` for plain text, `.blob()` for binary data like images.

## The Critical Gotcha: `fetch()` Doesn't Reject on HTTP Errors

This surprises almost everyone the first time: **`fetch()`'s Promise only rejects on a genuine network failure** (no internet connection, DNS failure, etc.) — **not** when the server responds with an error status like `404` or `500`. A `404 Not Found` is still a "successful" fetch from JavaScript's perspective — you got a response, it just wasn't what you wanted.

```js
async function getUser(id) {
  const response = await fetch(`https://api.example.com/users/${id}`);

  if (!response.ok) {
    // this is where YOU must check and handle HTTP error statuses manually
    throw new Error(`Request failed with status ${response.status}`);
  }

  return response.json();
}

getUser(999)
  .then(data => console.log(data))
  .catch(error => console.log("Error:", error.message)); // catches BOTH network errors and the manual throw above
```

**Always check `response.ok` (or `response.status`) explicitly** — relying on `.catch()` alone to catch a `404` will silently fail to do so, since `fetch()` never rejected in the first place.

## Sending Data: POST, PUT, DELETE

By default, `fetch()` makes a GET request. Other HTTP methods require an options object as the second argument:

```js
async function createUser(userData) {
  const response = await fetch("https://api.example.com/users", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(userData) // the request body must be a STRING — covered fully in Lesson 05
  });

  if (!response.ok) {
    throw new Error(`Failed to create user: ${response.status}`);
  }

  return response.json();
}

createUser({ name: "Ada", email: "ada@dev.io" });
```

```js
async function deleteUser(id) {
  const response = await fetch(`https://api.example.com/users/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error(`Failed to delete user: ${response.status}`);
  }
}
```

## A Reusable Fetch Wrapper

A very common real-world pattern — centralizing the "check `response.ok`" logic once, rather than repeating it in every function:

```js
async function apiRequest(url, options = {}) {
  const response = await fetch(url, options);

  if (!response.ok) {
    throw new Error(`Request to ${url} failed with status ${response.status}`);
  }

  return response.json();
}

// Now every call site is simpler:
const user = await apiRequest("https://api.example.com/users/1");
```

## Practical Example

```js
// search-users.js

async function searchUsers(query) {
  try {
    const response = await fetch(`https://api.example.com/users?q=${encodeURIComponent(query)}`);

    if (!response.ok) {
      if (response.status === 404) {
        return []; // treat "not found" as an empty result, not an error
      }
      throw new Error(`Search failed: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.log("Search error:", error.message);
    return [];
  }
}
```

## Revision Questions

<details>
<summary>1. What does `fetch()`'s returned Promise resolve to?</summary>

A `Response` object — metadata and methods for reading the response body, not the actual parsed data itself. Reading the body (e.g. via `.json()`) is a separate step that also returns a Promise.
</details>

<details>
<summary>2. Does `fetch()`'s Promise reject when the server responds with a `404` or `500` status?</summary>

No — it only rejects on a genuine network failure. A `404`/`500` still counts as a "successful" fetch from JavaScript's perspective; `response.ok` or `response.status` must be checked manually to detect and handle it.
</details>

<details>
<summary>3. What does `response.ok` tell you?</summary>

Whether the HTTP status code falls in the 200–299 range (success) — `true` if so, `false` otherwise.
</details>

<details>
<summary>4. What must you do to send a POST request with a JSON body using `fetch()`?</summary>

Pass an options object as the second argument specifying `method: "POST"`, a `"Content-Type": "application/json"` header, and a `body` set to the data converted to a string with `JSON.stringify()` (covered fully in Lesson 05) — `fetch()` requires the body to be a string, not a plain object.
</details>

<details>
<summary>5. Why is it common to write a small reusable wrapper function around `fetch()`?</summary>

To centralize repeated logic — like checking `response.ok` and throwing a consistent error — in one place, rather than duplicating that check in every individual function that makes a request.
</details>
