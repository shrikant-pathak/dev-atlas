# Lesson 01: Selecting DOM Elements

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what the DOM is and how it relates to your HTML
- Select single and multiple elements using the standard selection methods
- Explain the difference between a `NodeList` and an `HTMLCollection`, and between "live" and "static" collections

## Introduction

Back in Module 01, Lesson 01, you got a first glimpse of this: `document.getElementById("greet-btn")` finding a button, and `addEventListener` reacting to a click. Every other lesson since then has been pure JavaScript — the language itself, with no connection to an actual web page. This module finally connects the two: everything you've learned about functions, objects, and arrays gets applied directly to a real, live page.

## What Is the DOM?

The **DOM** (Document Object Model) is the browser's in-memory representation of your HTML page — a tree of objects, where every HTML element becomes a JavaScript object you can read from and manipulate. When the browser parses your HTML (recall Book 02), it builds this tree; JavaScript's job, from here on, is to read and change it.

```html
<body>
  <h1>Hello</h1>
  <p>Welcome</p>
</body>
```

This becomes a tree: `document` → `body` → (`h1`, `p`), each one an object with its own properties and methods.

## Selecting a Single Element

### `getElementById`

The fastest, most specific selector — matches exactly one element by its unique `id`.

```html
<button id="submit-btn">Submit</button>
```

```js
const button = document.getElementById("submit-btn");
console.log(button); // the <button> element itself
```

### `querySelector`

Accepts any valid CSS selector (Book 03) and returns the **first** matching element.

```js
document.querySelector("#submit-btn");     // by ID
document.querySelector(".card");            // first element with class "card"
document.querySelector("button.primary");    // first <button> with class "primary"
document.querySelector("ul > li:first-child"); // combinators work too
```

`querySelector` is the most flexible single-element selector, since it reuses everything you already know about CSS selectors.

## Selecting Multiple Elements

### `querySelectorAll`

Returns **all** matching elements as a `NodeList`.

```js
const cards = document.querySelectorAll(".card");
console.log(cards.length); // however many elements match
```

A `NodeList` supports `.forEach()` directly (Module 03, Lesson 04), so you can iterate it just like an array:

```js
cards.forEach(card => {
  console.log(card.textContent);
});
```

### `getElementsByClassName` / `getElementsByTagName`

Older methods that return an `HTMLCollection` instead of a `NodeList`.

```js
document.getElementsByClassName("card"); // HTMLCollection
document.getElementsByTagName("li");      // HTMLCollection
```

## `NodeList` vs. `HTMLCollection`, and "Live" vs. "Static"

This distinction causes real bugs if you don't know it exists:

- **`querySelectorAll` returns a static `NodeList`** — a snapshot at the moment it was called. If elements are later added or removed from the page, this list does **not** update.
- **`getElementsByClassName`/`getElementsByTagName` return a live `HTMLCollection`** — it automatically updates if the underlying page changes.

```js
const liveCards = document.getElementsByClassName("card"); // live
const staticCards = document.querySelectorAll(".card");      // static

console.log(liveCards.length, staticCards.length); // e.g. 3, 3

// ...suppose a new .card element gets added to the page here...

console.log(liveCards.length, staticCards.length); // e.g. 4, 3 — only the live one updated
```

Also, `HTMLCollection` doesn't support `.forEach()` directly — convert it to a real array first if you want to use array methods (Module 03, Lesson 04):

```js
const cardsArray = Array.from(liveCards); // or: [...liveCards]
cardsArray.map(card => card.textContent);
```

## Practical Example

```js
// theme-toggle.js

const toggleButton = document.querySelector("#theme-toggle");
const allSections = document.querySelectorAll("section");

console.log(`Found ${allSections.length} sections on the page`);

allSections.forEach(section => {
  console.log(section.id || "(no id)");
});
```

## Revision Questions

<details>
<summary>1. What is the DOM?</summary>

The browser's in-memory, tree-structured representation of an HTML page, where every element is a JavaScript object that can be read and manipulated.
</details>

<details>
<summary>2. What's the difference between `querySelector` and `querySelectorAll`?</summary>

`querySelector` returns only the first element matching a CSS selector. `querySelectorAll` returns every matching element, as a `NodeList`.
</details>

<details>
<summary>3. What's the difference between a "live" and a "static" collection?</summary>

A live collection (like the result of `getElementsByClassName`) automatically updates if matching elements are added or removed from the page afterward. A static collection (like the result of `querySelectorAll`) is a fixed snapshot taken at the moment it was created, and does not update.
</details>

<details>
<summary>4. Can you call `.forEach()` directly on the result of `getElementsByClassName`?</summary>

No — it returns an `HTMLCollection`, which doesn't support array methods directly. It must first be converted to a real array, e.g. with `Array.from()` or the spread operator (`[...collection]`).
</details>

<details>
<summary>5. Why is `querySelector` often preferred over `getElementById` or `getElementsByClassName`?</summary>

It accepts any valid CSS selector, making it far more flexible — it can match by ID, class, tag, combinators, or any combination, reusing the same selector syntax already learned for CSS.
</details>
