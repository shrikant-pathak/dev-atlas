# Lesson 3: AJAX & XMLHttpRequest

## Learning Objectives
- Understand what AJAX means and why it was a turning point for the web
- Use `XMLHttpRequest` to make asynchronous HTTP requests
- Understand the readyState lifecycle and how it compares to `fetch()` and Promises
- Recognize why `fetch()` replaced `XMLHttpRequest` for most modern code, and when you might still encounter `XHR`

## Introduction

In Module 05, you learned `fetch()` and Promises as the standard way to make HTTP requests. Those are relatively recent additions to the web platform. Before `fetch()` existed, `XMLHttpRequest` (often shortened to **XHR**) was the *only* way to make an HTTP request from JavaScript without reloading the page — and understanding it matters for two reasons: a huge amount of existing production code still uses it, and it's the technology that made "AJAX" possible in the first place, a term you'll still hear in interviews and legacy codebases.

## What AJAX Actually Means

**AJAX** stands for **Asynchronous JavaScript and XML**. It's not a specific technology or API — it's a *technique*: using JavaScript to send and receive data from a server in the background, without a full page reload, and then updating the DOM (Module 04) with the result.

The "XML" in AJAX is largely historical — in practice, almost everyone uses **JSON** now (Module 05), not XML, for the data format. But the term stuck because `XMLHttpRequest` was the object that made this technique possible, and the name has remained even as the data format underneath it moved on.

Before AJAX became common in the mid-2000s, any interaction with a server meant a full page reload. AJAX is what made things like autocomplete search, infinite-scrolling feeds, and form validation-without-reload possible — the same category of behavior you now build with `fetch()`.

## XMLHttpRequest Basics

An XHR request is built by creating an `XMLHttpRequest` object, configuring it, and listening for events as it progresses.

```js
const xhr = new XMLHttpRequest();

xhr.open('GET', 'https://api.example.com/users');

xhr.onload = function () {
  if (xhr.status >= 200 && xhr.status < 300) {
    const data = JSON.parse(xhr.responseText);
    console.log(data);
  } else {
    console.error('Request failed with status', xhr.status);
  }
};

xhr.onerror = function () {
  console.error('Network error');
};

xhr.send();
```

Notice a few things right away that will feel unfamiliar coming from `fetch()`:

- You configure the request with `.open()` first, then send it separately with `.send()`.
- There's no automatic JSON parsing — the response arrives as a string in `.responseText`, and you call `JSON.parse()` yourself.
- A failed HTTP status (like a 404 or 500) does **not** trigger `.onerror` — `.onerror` only fires for network-level failures. You have to check `xhr.status` yourself inside `.onload`, unlike `fetch()`, which also doesn't reject on HTTP error status, but at least gives you a `response.ok` boolean directly.

## The readyState Lifecycle

Unlike a Promise (Module 05), which is either pending, fulfilled, or rejected, an `XMLHttpRequest` moves through five numbered states, exposed as `xhr.readyState`:

| Value | State | Meaning |
|---|---|---|
| 0 | `UNSENT` | `open()` hasn't been called yet |
| 1 | `OPENED` | `open()` has been called |
| 2 | `HEADERS_RECEIVED` | response headers have arrived |
| 3 | `LOADING` | response body is downloading |
| 4 | `DONE` | request complete |

You can listen for every state transition with `onreadystatechange`, which was the original way to handle XHR before the more convenient `onload`/`onerror` events existed:

```js
const xhr = new XMLHttpRequest();
xhr.open('GET', 'https://api.example.com/users');

xhr.onreadystatechange = function () {
  if (xhr.readyState === 4) { // DONE
    if (xhr.status === 200) {
      console.log(JSON.parse(xhr.responseText));
    }
  }
};

xhr.send();
```

You'll see this exact pattern — checking `readyState === 4` — in a huge amount of legacy code and interview questions, even though `onload` makes it unnecessary in modern browsers.

## Sending Data (POST Requests)

```js
const xhr = new XMLHttpRequest();
xhr.open('POST', 'https://api.example.com/users');
xhr.setRequestHeader('Content-Type', 'application/json');

xhr.onload = function () {
  console.log('Created:', xhr.responseText);
};

xhr.send(JSON.stringify({ name: 'Ada', role: 'Engineer' }));
```

Compare this to the equivalent `fetch()` call from Module 05:

```js
fetch('https://api.example.com/users', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ name: 'Ada', role: 'Engineer' })
})
  .then(response => response.json())
  .then(data => console.log('Created:', data));
```

The `fetch()` version is shorter, Promise-based (so it works naturally with `async`/`await` from Module 05), and handles JSON serialization of the response more conveniently. This is exactly why `fetch()` has replaced XHR for new code.

## Why fetch() Won, and Why XHR Still Matters

`fetch()` is built on Promises, composes cleanly with `async`/`await`, and has a simpler API surface. So why learn XHR at all in 2026?

- **Legacy codebases**: Plenty of production applications — especially older enterprise apps — still use XHR directly or through libraries built on top of it.
- **jQuery's `$.ajax()`** (next lesson) is a wrapper around XHR, and understanding what's underneath demystifies what that wrapper is actually doing.
- **Upload progress events**: `fetch()` historically had no built-in way to track upload progress, while XHR's `xhr.upload.onprogress` has supported this for years, so you may still encounter raw XHR in file-upload code even in modern projects.

```js
const xhr = new XMLHttpRequest();
xhr.open('POST', '/upload');

xhr.upload.onprogress = function (event) {
  if (event.lengthComputable) {
    const percent = (event.loaded / event.total) * 100;
    console.log(`Upload progress: ${percent.toFixed(1)}%`);
  }
};

xhr.send(formData);
```

## Practical Example

A small reusable helper that wraps `XMLHttpRequest` in a Promise — a good exercise for connecting this lesson back to Module 05's Promise material, and a pattern you'll actually find in real polyfills and older utility libraries:

```js
function xhrGet(url) {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', url);

    xhr.onload = () => {
      if (xhr.status >= 200 && xhr.status < 300) {
        resolve(JSON.parse(xhr.responseText));
      } else {
        reject(new Error(`Request failed: ${xhr.status}`));
      }
    };

    xhr.onerror = () => reject(new Error('Network error'));

    xhr.send();
  });
}

// Now usable with async/await, just like fetch()
async function loadUsers() {
  try {
    const users = await xhrGet('https://api.example.com/users');
    console.log(users);
  } catch (err) {
    console.error(err.message);
  }
}
```

This is a useful mental exercise: it shows that `fetch()` isn't magic — it's solving the exact same underlying problem as XHR, just with a Promise-shaped API baked in from the start instead of bolted on afterward.

## Revision Questions

<details>
<summary>1. What does AJAX actually stand for, and why is the "XML" part somewhat misleading today?</summary>

AJAX stands for Asynchronous JavaScript and XML. It's misleading because almost all modern AJAX-style requests exchange JSON, not XML — the name stuck from when `XMLHttpRequest` was created and XML was the expected data format, even though the technique it names is really just "make an async request without reloading the page."
</details>

<details>
<summary>2. Why doesn't xhr.onerror fire when a server responds with a 404 or 500 status?</summary>

`onerror` only fires for network-level failures (like the request never reaching the server). A 404 or 500 is still a complete, successful HTTP exchange from the browser's point of view — the server responded — so `onload` fires, and you have to check `xhr.status` yourself to detect the failure.
</details>

<details>
<summary>3. What does readyState === 4 mean, and what modern XHR event makes checking it directly unnecessary?</summary>

`readyState === 4` means `DONE` — the request has completed. The `onload` event fires automatically at that point, so modern code can use `onload` instead of manually checking `readyState` inside `onreadystatechange`.
</details>

<details>
<summary>4. Give one concrete reason you might still choose raw XMLHttpRequest over fetch() today.</summary>

Tracking upload progress — `xhr.upload.onprogress` gives you live progress events for outgoing data (like a file upload), which `fetch()` has historically not supported as directly.
</details>
