# Lesson 05: Input Groups

## Learning Objectives
- Wrap inputs with `.input-group` and attach text or icons using `.input-group-text`
- Prepend and append content on either side of an input
- Combine input groups with buttons and dropdowns
- Apply size variants at the group level rather than the input level

## Introduction
Sometimes a field needs context glued directly to its edge — a currency symbol before a price, a domain suffix after a username, a "Go" button beside a search box. Bootstrap handles this with `.input-group`, which visually merges an input with adjacent text or controls into one seamless unit rather than leaving separate, disconnected pieces.

## Basic Prepend/Append
```html
<div class="input-group mb-3">
  <span class="input-group-text">$</span>
  <input type="text" class="form-control" placeholder="0.00">
</div>

<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="username">
  <span class="input-group-text">@example.com</span>
</div>
```

The order of elements inside `.input-group` determines prepend vs. append — put `.input-group-text` before the input to prepend it, after to append it. You can do both at once:

```html
<div class="input-group mb-3">
  <span class="input-group-text">$</span>
  <input type="text" class="form-control" placeholder="0.00">
  <span class="input-group-text">.00</span>
</div>
```

## Buttons Inside Input Groups
Buttons slot in exactly like `.input-group-text`, using their normal `.btn` classes:

```html
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Search...">
  <button class="btn btn-primary" type="button">Go</button>
</div>
```

This is the standard search-bar-with-button pattern, and it works because `.input-group` handles the border-radius joins automatically — the input's right corners and the button's left corners flatten so they read as one connected control, rather than two separate rounded pieces bumping into each other.

## Checkboxes and Radios in Input Groups
You can also prepend a checkbox or radio instead of text:

```html
<div class="input-group mb-3">
  <div class="input-group-text">
    <input class="form-check-input mt-0" type="checkbox" aria-label="Select item">
  </div>
  <input type="text" class="form-control" aria-label="Item name">
</div>
```

## Sizing
Size classes go on the `.input-group` wrapper itself, not on the individual input or button — this ensures every piece inside scales together consistently:

```html
<div class="input-group input-group-sm mb-3">
  <span class="input-group-text">Small</span>
  <input type="text" class="form-control">
</div>

<div class="input-group input-group-lg mb-3">
  <span class="input-group-text">Large</span>
  <input type="text" class="form-control">
</div>
```

Putting `.form-control-lg` on the input alone inside an unsized `.input-group` would break the visual alignment between the input and its attached text/button — always size at the group level.

## Practical Example
A checkout price field combining currency prefix, decimal suffix, and a size variant:

```html
<div class="input-group input-group-lg mb-3">
  <span class="input-group-text">$</span>
  <input type="text" class="form-control" aria-label="Amount" placeholder="0.00">
  <span class="input-group-text">USD</span>
</div>

<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Search products" aria-label="Search products">
  <button class="btn btn-outline-secondary" type="button">Search</button>
</div>
```

## Revision Questions

<details>
<summary>1. How do you control whether `.input-group-text` prepends or appends to an input?</summary>
By its position in the markup — placed before the `<input>` it prepends, placed after it appends. Both can be used at once for a two-sided attachment.
</details>

<details>
<summary>2. Why does `.input-group` handle border-radius automatically when a button is included?</summary>
It flattens the touching corners between adjacent elements (e.g. the input's right corners and the button's left corners) so the whole group reads as one visually connected control instead of separate rounded pieces.
</details>

<details>
<summary>3. Where should size classes like `.input-group-lg` be applied?</summary>
On the `.input-group` wrapper itself, not on individual children — sizing at the group level keeps every piece inside visually consistent.
</details>

<details>
<summary>4. What real-world UI pattern does an input + button input-group most commonly implement?</summary>
A search bar with an attached "Search"/"Go" button.
</details>
