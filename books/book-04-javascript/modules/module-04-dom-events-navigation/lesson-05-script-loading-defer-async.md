# Lesson 05: Script Loading — defer & async

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain how the browser handles `<script>` tags by default
- Explain the difference between `defer` and `async`, and when to use each
- Use the `DOMContentLoaded` and `load` events correctly
- Choose the right script-loading strategy for a given situation

## Introduction

Module 01, Lesson 01 briefly introduced three script placement strategies — end of `<body>`, `<head>` with `defer`, and `<head>` with `async` — without fully explaining *why* they behave differently. Now that you understand the DOM (Lesson 01), traversal (Lesson 02), and events (Lesson 03), this lesson gives script loading its full, proper treatment — it directly affects whether your DOM-manipulating code will actually find the elements it's looking for.

## The Default Behavior: Parser-Blocking

Without any special attribute, a `<script>` tag **blocks** HTML parsing entirely at the point it appears — the browser stops building the DOM, downloads the script (if external), runs it immediately, and only then continues parsing the rest of the page.

```html
<head>
  <script src="script.js"></script> <!-- blocks parsing right here -->
</head>
<body>
  <h1>Hello</h1>
</body>
```

If `script.js` tries to select `<h1>` (Lesson 01) at this point, it will get `null` — the `<h1>` hasn't been parsed into the DOM yet, since the script ran before the browser ever reached it. This is exactly why the classic advice was "put your `<script>` tag at the very end of `<body>`" — by then, everything above it is guaranteed to already exist in the DOM.

## `defer`

```html
<head>
  <script src="script.js" defer></script>
</head>
```

`defer` tells the browser: download the script in the background **without blocking HTML parsing**, and only execute it once the entire document has finished parsing — but always *before* the `DOMContentLoaded` event fires (see below).

- Parsing is never blocked.
- Execution happens in document order, if there are multiple deferred scripts.
- The DOM is guaranteed to be fully parsed by the time the script runs.

This makes `defer` the standard, safe default for nearly all scripts that need to interact with the DOM — it combines the safety of "end of body" placement with the performance benefit of not blocking parsing, and it's why this book has recommended `<script src="..." defer></script>` in `<head>` since Module 01.

## `async`

```html
<head>
  <script src="analytics.js" async></script>
</head>
```

`async` also avoids blocking parsing while downloading, but executes the script **the instant it finishes downloading** — which could be *before* the HTML has finished parsing, interrupting it at whatever point it happens to be at.

- Parsing is not blocked during download.
- Execution order between multiple `async` scripts is **not guaranteed** — whichever finishes downloading first runs first.
- The DOM might not be fully parsed yet when the script runs.

`async` is appropriate only for scripts that are **independent** of the rest of the page and don't need to touch the DOM at all — the classic example is a third-party analytics or tracking script.

## Comparing All Three

| Attribute | Blocks parsing? | Executes when? | DOM guaranteed ready? |
|---|---|---|---|
| (none) | Yes, immediately | Immediately, at that point in parsing | No — only what's already been parsed |
| `defer` | No | After parsing completes, in document order | Yes |
| `async` | No | As soon as download finishes (any time) | No |

## `DOMContentLoaded` vs. `load`

Two events let you run code at specific points in the page's lifecycle, as an alternative (or supplement) to `defer`:

```js
document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM is fully parsed and ready — safe to select elements now");
});

window.addEventListener("load", () => {
  console.log("Everything has finished loading — including images, stylesheets, etc.");
});
```

- **`DOMContentLoaded`** fires as soon as the HTML is fully parsed into the DOM — it does **not** wait for images, stylesheets, or other resources.
- **`load`** fires later, once absolutely everything on the page (images included) has finished loading.

For code that only needs to select and manipulate elements (most of what you'll write), `DOMContentLoaded` (or simply using `defer`, which achieves the same safety) is sufficient — waiting for the full `load` event is usually unnecessary and slower.

## Practical Example

```html
<head>
  <script src="app.js" defer></script>
  <script src="third-party-widget.js" async></script>
</head>
<body>
  <h1 id="title">Welcome</h1>
</body>
```

```js
// app.js — interacts with the page, so it uses `defer`
document.addEventListener("DOMContentLoaded", () => {
  const title = document.getElementById("title"); // guaranteed to exist by now
  title.textContent = "Welcome back!";
});
```

```js
// third-party-widget.js — independent, doesn't touch this page's DOM, so `async` is fine
console.log("Widget loaded independently, whenever it finishes downloading");
```

## Revision Questions

<details>
<summary>1. What happens to HTML parsing when the browser reaches a plain `<script>` tag with no attributes?</summary>

Parsing stops completely — the browser downloads (if external) and executes the script immediately, and only resumes parsing the rest of the HTML afterward.
</details>

<details>
<summary>2. What's the key difference in *when* `defer` and `async` scripts execute?</summary>

`defer` scripts wait until the entire HTML document has finished parsing before running, in document order. `async` scripts run immediately as soon as they finish downloading, which could interrupt parsing at any point and in any order relative to other `async` scripts.
</details>

<details>
<summary>3. Why is `defer` generally the safer default for scripts that manipulate the DOM?</summary>

It guarantees the full DOM is already parsed and available by the time the script runs, avoiding the "element not found" bugs that can happen with a plain blocking script or with `async`.
</details>

<details>
<summary>4. When is `async` an appropriate choice?</summary>

For scripts that are independent of the rest of the page and don't need to interact with the DOM — such as third-party analytics or tracking scripts — since execution order and DOM readiness don't matter for them.
</details>

<details>
<summary>5. What's the difference between the `DOMContentLoaded` and `load` events?</summary>

`DOMContentLoaded` fires once the HTML has been fully parsed into the DOM, without waiting for other resources like images. `load` fires later, once everything on the page — including images and stylesheets — has fully finished loading.
</details>
