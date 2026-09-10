# Lesson 02: DOM Traversal

## Learning Objectives
By the end of this lesson, you will be able to:
- Navigate from an element to its parent, children, and siblings
- Explain the difference between "Node" and "Element" traversal properties
- Use `closest()` to find the nearest matching ancestor
- Use `contains()` to check whether one element is inside another

## Introduction

Lesson 01 covered finding elements from scratch, directly from `document`. Once you already have one element, **traversal** lets you move around the DOM tree relative to it — to its parent, its children, or its siblings — without writing a brand-new selector each time.

## Parent Traversal

```html
<div id="card">
  <h2>Title</h2>
</div>
```

```js
const heading = document.querySelector("h2");

heading.parentElement; // the <div id="card"> element
heading.parentNode;     // usually identical to parentElement in practice
```

## Child Traversal

```html
<ul id="list">
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
```

```js
const list = document.getElementById("list");

list.children;             // HTMLCollection of the 3 <li> elements (elements only)
list.children.length;       // 3
list.firstElementChild;     // the first <li>
list.lastElementChild;       // the last <li>
```

## `Node` vs. `Element` Properties: A Crucial Distinction

The DOM has two closely related sets of traversal properties — one includes **all** node types (including whitespace and comments), the other includes only actual **elements**:

```js
list.childNodes;    // includes text nodes (e.g. whitespace between tags!) and elements
list.children;        // includes ONLY element nodes — almost always what you want
```

This distinction exists because whitespace in your HTML source (like the line breaks between `<li>` tags) actually becomes text nodes in the DOM tree. **Prefer the `Element`-suffixed / `children`-style properties** (`children`, `firstElementChild`, `nextElementSibling`, etc.) in almost all real code, since they skip this noise automatically.

## Sibling Traversal

```html
<li id="item-2">Item 2</li>
```

```js
const item2 = document.getElementById("item-2");

item2.nextElementSibling;    // the <li> right after it
item2.previousElementSibling; // the <li> right before it
```

## `closest()` — Searching Upward for a Matching Ancestor

`closest()` starts at an element and walks **up** the tree, checking the element itself and then each ancestor, until it finds one matching a given CSS selector (or reaches the top with no match, returning `null`).

```html
<div class="card">
  <div class="card-body">
    <button id="delete-btn">Delete</button>
  </div>
</div>
```

```js
const button = document.getElementById("delete-btn");
const card = button.closest(".card");

console.log(card); // the outer <div class="card">, even though it's two levels up
```

This is extremely useful once you cover event delegation in Lesson 03 — it's the standard way to figure out "which card was this button inside of?" without hardcoding a fixed number of `.parentElement` calls.

## `contains()` — Checking Ancestry Downward

The reverse check: does a given element exist *inside* another one?

```js
const card = document.querySelector(".card");
const button = document.getElementById("delete-btn");

card.contains(button); // true — button is somewhere inside card
```

A common real use case: checking whether a click happened inside a specific menu or modal, to decide whether to close it.

## Practical Example

```js
// list-highlighter.js

const list = document.getElementById("list");

Array.from(list.children).forEach((item, index) => {
  if (index % 2 === 0) {
    item.classList.add("highlighted"); // classList covered fully in Module 06's DOM styling context
  }
});

const firstItem = list.firstElementChild;
console.log(firstItem.nextElementSibling.textContent); // "Item 2"
```

## Revision Questions

<details>
<summary>1. What's the practical difference between `.childNodes` and `.children`?</summary>

`.childNodes` includes every node type — text nodes (like whitespace between tags) and comments included. `.children` includes only actual element nodes, which is what real code almost always wants.
</details>

<details>
<summary>2. What does `element.closest(".card")` do?</summary>

It searches upward from `element`, checking the element itself and then each ancestor in turn, and returns the first one matching the `.card` selector — or `null` if none is found.
</details>

<details>
<summary>3. What does `parentEl.contains(childEl)` check?</summary>

Whether `childEl` exists anywhere inside `parentEl`'s subtree — a downward containment check, the opposite direction of `closest()`.
</details>

<details>
<summary>4. Why might `list.children.length` and `list.childNodes.length` return different numbers for the same list?</summary>

Because `childNodes` also counts non-element nodes like whitespace text nodes between tags, while `children` counts only actual elements — so `childNodes.length` is often larger.
</details>

<details>
<summary>5. Which traversal properties are generally preferred in real code: the `Node`-style ones or the `Element`-style ones?</summary>

The `Element`-style ones (`children`, `firstElementChild`, `nextElementSibling`, etc.) — they skip whitespace text nodes and other non-element noise automatically, matching what you almost always actually want.
</details>
