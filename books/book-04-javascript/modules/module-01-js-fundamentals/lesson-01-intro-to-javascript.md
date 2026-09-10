# Lesson 01: Intro to JavaScript

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what JavaScript is and the role it plays alongside HTML and CSS
- Describe how JavaScript is loaded and executed in a browser
- Add JavaScript to a page three different ways (inline, internal, external)
- Use the browser console and `console.log()` to run and inspect code
- Write and run your first JavaScript statements
- Understand, at a high level, where JavaScript is headed in this book (and how it leads into React, React Native, and Vue)

## Introduction

In **Book 01 (Foundations)** you learned how the web works. In **Book 02 (HTML)** you learned how to structure a page's content. In **Book 03 (CSS)** you learned how to style that content — colors, layout, responsiveness, animation.

But none of that content or style can *react* to anything. HTML and CSS are static: a button styled beautifully in CSS still does nothing when clicked unless something tells the browser what to do. That "something" is JavaScript.

JavaScript is the **behavior** layer of the web. If HTML is the skeleton and CSS is the skin and clothing, JavaScript is the nervous system — it listens for events (clicks, key presses, page loads, timers, network responses) and makes decisions and changes in response.

JavaScript was created in 1995 and, despite the name, has no real relationship to Java — the name was a marketing decision. Today it is the only programming language that runs natively in every web browser, which is why it became the language of the web front end, and eventually (via Node.js) the back end too.

This entire book (Book 04) is dedicated to JavaScript because it's the foundation for everything that comes after in your path: React, React Native, and Vue are all JavaScript — they just add their own conventions and tooling on top of the language fundamentals you'll build here. Nothing in those frameworks will make sense if the underlying JavaScript doesn't make sense first, so this book is deliberately thorough.

## What JavaScript Actually Does

Recall from Book 01 how a browser builds a page: it parses HTML into the **DOM** (Document Object Model) and parses CSS into styling rules, then paints the result on screen. JavaScript is the third piece — it's a full programming language that can:

- **Read and change the DOM** — add, remove, or modify HTML elements after the page has loaded (you'll cover this in depth in Module 04)
- **Respond to events** — clicks, form submissions, key presses, scrolling, page load
- **Talk to servers** — fetch data without reloading the page (Module 05)
- **Store data** — remember things between visits (Module 07)
- **Run logic** — calculations, conditions, loops, data transformations — like any general-purpose programming language

Unlike HTML and CSS, which are declarative (you describe *what* you want), JavaScript is largely imperative — you describe *how* to do something, step by step.

## Adding JavaScript to a Page

Just as CSS can be inline, internal, or external (Book 03, Module 01), JavaScript has the same three placement options.

### 1. Inline JavaScript
Written directly on an HTML element as an attribute. This is the JS equivalent of an inline `style` attribute, and it's discouraged for the same reason: it mixes concerns and doesn't scale.

```html
<button onclick="alert('Hello!')">Click me</button>
```

### 2. Internal JavaScript
Written inside a `<script>` tag in the HTML document itself.

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
</head>
<body>
  <h1>Hello</h1>

  <script>
    console.log("This runs when the page loads.");
  </script>
</body>
</html>
```

### 3. External JavaScript (the standard approach)
Written in a separate `.js` file and linked with the `src` attribute — exactly parallel to linking an external CSS file with `<link>`.

```html
<script src="script.js"></script>
```

```js
// script.js
console.log("Loaded from an external file.");
```

External files are the default in real projects for the same reasons external CSS is: separation of concerns, caching, and reusability across pages.

### Where to Put the `<script>` Tag

The placement of `<script>` matters because the browser parses HTML top-to-bottom. If a script tries to interact with an element that hasn't been parsed yet, it will fail. There are three common approaches:

```html
<!-- 1. At the end of <body> — classic, safe approach -->
<body>
  <h1>Hello</h1>
  <script src="script.js"></script>
</body>

<!-- 2. In <head>, with "defer" — modern, recommended approach -->
<head>
  <script src="script.js" defer></script>
</head>

<!-- 3. In <head>, with "async" — for independent scripts (e.g. analytics) -->
<head>
  <script src="script.js" async></script>
</head>
```

`defer` tells the browser to keep parsing the HTML and only run the script once the whole document is ready — you'll use this constantly. `async` runs the script as soon as it's downloaded, which can be *before* the HTML is fully parsed, so it's reserved for scripts that don't touch the DOM.

## Running JavaScript: The Browser Console

Every browser ships with a JavaScript console, part of its Developer Tools. It's the fastest way to experiment with JavaScript without creating any files.

To open it:
- **Chrome/Edge**: Right-click → Inspect → Console tab (or `Cmd+Option+J` / `Ctrl+Shift+J`)
- **Firefox**: Right-click → Inspect → Console tab (or `Cmd+Option+K` / `Ctrl+Shift+K`)
- **Safari**: Enable the Develop menu in Preferences first, then Develop → Show JavaScript Console

Type directly into the console and press Enter to run it:

```js
2 + 2
// 4

"Hello".toUpperCase()
// "HELLO"
```

The console is also where `console.log()` output appears — this is the single most useful debugging tool you will use throughout this entire book and beyond.

```js
console.log("Hello, JavaScript!");
```

## Your First Script

Let's put this together. Create an HTML file and an external JavaScript file, exactly the way you would structure any real page.

**index.html**
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Intro to JavaScript</title>
</head>
<body>
  <h1>Intro to JavaScript</h1>
  <button id="greet-btn">Say Hello</button>

  <script src="script.js" defer></script>
</body>
</html>
```

**script.js**
```js
console.log("script.js has loaded!");

const button = document.getElementById("greet-btn");

button.addEventListener("click", function () {
  alert("Hello from JavaScript!");
});
```

Don't worry about understanding every line yet — `document.getElementById` and `addEventListener` belong to Module 04 (DOM, Events & Navigation). For now, notice the shape of it:
1. JavaScript can find an HTML element (`getElementById`)
2. JavaScript can listen for something happening to it (`addEventListener("click", ...)`)
3. JavaScript can react (`alert(...)`)

That loop — find something, listen for an event, react — is the heartbeat of almost all front-end JavaScript, and it's exactly what React, Vue, and React Native do under the hood, just with far more structure and convenience around it.


## Practical Example

Let's write a tiny standalone script that ties together everything from this lesson: external file, `console.log`, a comment, and a couple of statements.

```js
// greeting.js

// A simple variable holding a name (variables are covered fully in Lesson 02)
const name = "Ada";

// Log a greeting to the console
console.log("Hello, " + name + "!");

// Log the current date the script ran
console.log("Script executed at: " + new Date());
```

Try this yourself: paste it into your browser console, or link it from an HTML file with `<script src="greeting.js" defer></script>` and open the page's console to see the output.

## Revision Questions

<details>
<summary>1. What role does JavaScript play compared to HTML and CSS?</summary>

HTML provides structure/content, CSS provides presentation/style, and JavaScript provides behavior — it lets a page respond to events and change after it has loaded, rather than remaining static.
</details>

<details>
<summary>2. What are the three ways to add JavaScript to a page, and which is preferred in real projects?</summary>

Inline (as an HTML attribute like `onclick`), internal (inside a `<script>` tag in the HTML file), and external (a separate `.js` file linked via `<script src="...">`). External is preferred for the same reasons external CSS is preferred: separation of concerns, caching, and reusability.
</details>

<details>
<summary>3. Why does the placement of the `<script>` tag matter, and what does the `defer` attribute do?</summary>

The browser parses HTML top-to-bottom, so a script that tries to access an element before it's been parsed will fail. `defer` tells the browser to keep parsing the HTML and only execute the script after the document is fully parsed, which is why it's commonly placed in `<head>` with `defer` in modern projects.
</details>

<details>
<summary>4. What is the browser console used for, and how do you open it?</summary>

It's a built-in tool (part of browser Developer Tools) for running JavaScript directly and viewing `console.log()` output — the primary way to experiment with and debug JavaScript. It's opened via right-click → Inspect → Console, or a keyboard shortcut specific to each browser.
</details>

<details>
<summary>5. Is JavaScript case-sensitive?</summary>

Yes. `myVariable` and `myvariable` are treated as two completely different identifiers.
</details>
