# Lesson 5: JSONP

## Learning Objectives
- Understand the same-origin policy and why cross-domain requests were historically blocked
- Understand how JSONP worked as a workaround, and trace through its mechanics
- Recognize the security risks of JSONP
- Understand why CORS made JSONP obsolete, and identify JSONP when you see it in old code

## Introduction

This lesson covers a technique you should recognize but never write: **JSONP** (JSON with Padding). It was a clever, slightly hacky workaround for a limitation that no longer exists in the same way today — but you'll still find it in older third-party APIs, legacy code, and technical interview questions about "how would you make a cross-domain request before CORS existed?" Understanding JSONP also deepens your understanding of *why* the same-origin policy and CORS exist at all.

## The Same-Origin Policy

Browsers enforce a security rule called the **same-origin policy**: a script running on `https://siteA.com` cannot, by default, make an AJAX request (via `XMLHttpRequest` from Lesson 3, or `fetch()` from Module 05) to `https://siteB.com` and read the response. Two URLs share an "origin" only if their protocol, domain, and port all match exactly.

This exists to prevent a malicious site from silently reading your data from another site you're logged into — imagine visiting a malicious page that quietly uses your logged-in session to read your email or bank data from a background request. The same-origin policy blocks that by default.

The modern, standard solution to *legitimately* allow cross-origin requests is **CORS** (Cross-Origin Resource Sharing) — the target server explicitly opts in by sending back headers like `Access-Control-Allow-Origin`, telling the browser "requests from this other origin are allowed." This is why some `fetch()` calls to third-party APIs work fine, and others fail with a CORS error in the console — it depends entirely on whether the server has opted in.

CORS wasn't standardized and widely supported until years after AJAX became common, which left a gap: how do you make a cross-domain request *before* CORS existed? JSONP is the answer developers came up with.

## The Loophole JSONP Exploits

The same-origin policy restricts requests made through `XMLHttpRequest`. But it does **not** restrict loading a `<script>` tag from another domain — that's how CDNs have always worked, loading a shared JavaScript library from a different domain than the site using it.

```html
<!-- This has always been allowed, regardless of same-origin policy -->
<script src="https://cdn.example.com/library.js"></script>
```

JSONP exploits this loophole: instead of fetching JSON data via `XMLHttpRequest`, it dynamically loads a `<script>` tag pointing at the data endpoint. But a `<script>` tag runs the response as JavaScript code, not as inert data — so the server doesn't send back plain JSON. It sends back JSON *wrapped* in a function call. That's the "Padding" in JSON**P**.

## How JSONP Actually Works, Step by Step

**1.** The client defines a global callback function that will handle the data once it arrives:

```js
function handleUserData(data) {
  console.log('Got data:', data);
}
```

**2.** The client dynamically creates a `<script>` tag whose `src` points at the API, passing the callback's name as a query parameter:

```js
const script = document.createElement('script');
script.src = 'https://api.example.com/users?callback=handleUserData';
document.body.appendChild(script);
```

**3.** The server, instead of returning plain JSON like `{"name": "Ada"}`, sees the `callback` parameter and wraps the JSON in a function call matching that name:

```js
handleUserData({"name": "Ada", "role": "Engineer"});
```

**4.** The browser downloads and executes this as if it were any other script. Since `handleUserData` already exists in the global scope, it runs immediately with the data as its argument — completing the round trip, without ever going through `XMLHttpRequest` or triggering the same-origin policy at all.

## A Complete, Runnable-Shape Example

```js
function fetchJSONP(url, callbackName) {
  return new Promise((resolve, reject) => {
    // Register a temporary global callback
    window[callbackName] = function (data) {
      resolve(data);
      delete window[callbackName];   // clean up
      script.remove();               // clean up
    };

    const script = document.createElement('script');
    script.src = `${url}?callback=${callbackName}`;
    script.onerror = () => reject(new Error('JSONP request failed'));
    document.body.appendChild(script);
  });
}

// Usage
fetchJSONP('https://api.example.com/users', 'handleUsers')
  .then(data => console.log(data))
  .catch(err => console.error(err));
```

Notice this wraps the whole thing in a Promise, exactly like the XHR-wrapping example from Lesson 3 — the same pattern of "take an old callback-based technique and give it a modern Promise-based interface" shows up again and again in JavaScript's history.

## Why JSONP Is Dangerous

JSONP has a serious downside that's worth understanding even though you'll never write it: **it requires you to execute arbitrary code from a third-party server, with no way to inspect it first.**

Unlike `fetch()`, where the response is just data you parse yourself with `JSON.parse()` (Module 05), a JSONP response is *executable JavaScript* that runs immediately and automatically, with full access to your page. If the API you're calling is ever compromised, or was malicious to begin with, it can run **anything** — not just deliver data, but steal cookies, redirect the page, or inject more scripts. There's no sandboxing at all.

This is precisely the kind of risk the same-origin policy exists to prevent in the first place, and JSONP essentially opts back out of that protection on purpose, trading security for functionality.

## Why JSONP Is Obsolete

Once CORS became a stable, widely supported browser standard, it solved the exact same problem JSONP was working around — legitimate cross-origin requests — without any of the security downsides:

| | JSONP | CORS |
|---|---|---|
| Mechanism | `<script>` tag loophole | Explicit server opt-in via headers |
| HTTP methods | GET only | GET, POST, PUT, DELETE, etc. |
| Error handling | Very limited (no real status codes) | Full HTTP status codes |
| Security | Executes arbitrary remote code | Data-only; no code execution |
| Works with fetch()/XHR | No | Yes |

There is essentially no reason to write new JSONP code today. If you find it in a codebase, it's almost always either: (a) extremely old code that predates CORS, or (b) an older third-party API that's never modernized its own endpoints — some public APIs, especially older ones, still offer a `?callback=` parameter as their only cross-domain option.

## Practical Example

Here's how the *exact same task* — fetching user data from a cross-origin API — looks across all three lessons in this cluster, to make the historical progression concrete:

```js
// 1. Raw XMLHttpRequest (Lesson 3) — same-origin only, no CORS handling shown
const xhr = new XMLHttpRequest();
xhr.open('GET', '/api/users'); // same-origin
xhr.onload = () => console.log(JSON.parse(xhr.responseText));
xhr.send();

// 2. JSONP (this lesson) — works cross-origin, but executes remote code
function handleData(data) { console.log(data); }
const script = document.createElement('script');
script.src = 'https://other-domain.com/api/users?callback=handleData';
document.body.appendChild(script);

// 3. Modern fetch() with CORS (Module 05) — cross-origin, safe, if server allows it
fetch('https://other-domain.com/api/users')
  .then(res => res.json())
  .then(data => console.log(data));
```

Each one solves a version of the same problem, with the constraints of its era. Recognizing that progression is the real goal of this module.

## Revision Questions

<details>
<summary>1. What is the same-origin policy, and what problem is it designed to prevent?</summary>

The same-origin policy blocks a script running on one origin (protocol + domain + port) from reading the response of an AJAX request made to a different origin. It exists to prevent a malicious site from silently using a visitor's logged-in session to read private data from another site in the background.
</details>

<details>
<summary>2. What loophole does JSONP exploit to get around the same-origin policy?</summary>

The same-origin policy doesn't restrict loading `<script>` tags from other domains — that's how CDN-hosted libraries have always worked. JSONP loads a `<script>` tag pointing at an API endpoint instead of using `XMLHttpRequest`, sidestepping the restriction entirely.
</details>

<details>
<summary>3. Why does JSONP require defining a global callback function before making the request?</summary>

The server wraps the JSON response in a function call matching the name you provide, and the browser executes that response as a script the moment it loads. That function has to already exist in the global scope, or the call will fail — there's no other channel for the response's data to reach your code.
</details>

<details>
<summary>4. Why is JSONP considered a security risk compared to fetch() with CORS?</summary>

A JSONP response is executable JavaScript that runs immediately and automatically with full access to the page, rather than inert data you parse yourself. If the third-party server is compromised or malicious, it can run arbitrary code — steal cookies, redirect the page, inject scripts — with no sandboxing, whereas `fetch()` only ever gives you data to parse.
</details>
