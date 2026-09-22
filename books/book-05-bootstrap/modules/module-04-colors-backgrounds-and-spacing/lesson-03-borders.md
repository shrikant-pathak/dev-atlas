# Lesson 03: Borders

## Learning Objectives
- Add, remove, and direction-control borders using `.border`, `.border-{side}`, and `.border-0`
- Apply theme-colored borders with `.border-{color}` and subtle variants
- Control border width with `.border-{1-5}`
- Round corners using `.rounded`, `.rounded-{side}`, `.rounded-{size}`, and `.rounded-circle`/`.rounded-pill`

## Introduction
Borders are one of the simplest but most frequently used utility groups, and they compose naturally with everything from Lessons 01–02. You already know how to color an element's background and text — this lesson adds the third visual layer: the edge around it.

## Adding and Removing Borders
The base class adds a `1px solid` border on all four sides using the theme's default border color:

```html
<div class="border p-3">Bordered box</div>
```

To remove borders (useful when overriding a component default, like a card or table that includes borders you don't want):

```html
<div class="card border-0">
  <div class="card-body">No border on this card</div>
</div>
```

## Side-Specific Borders
Add or suppress a border on just one side using directional suffixes:

```html
<div class="border-top p-2">Top border only</div>
<div class="border-end p-2">End (right in LTR) border only</div>
<div class="border-bottom p-2">Bottom border only</div>
<div class="border-start p-2">Start (left in LTR) border only</div>
```

Notice `border-start` / `border-end` rather than `border-left` / `border-right`. Bootstrap uses logical, direction-aware naming so borders (and other directional utilities) flip correctly in right-to-left languages — this becomes directly relevant in Module 11 when you implement RTL support.

To remove one specific side while keeping the rest (e.g. an element that has `.border` applied by a parent pattern):

```html
<div class="border border-bottom-0 p-2">All sides except bottom</div>
```

## Border Color
Pair with any theme color:

```html
<div class="border border-primary p-3">Primary border</div>
<div class="border border-danger-subtle p-3">Subtle danger border</div>
```

The `-subtle` suffix works here too, giving you a softer-toned border that matches the subtle background/text pattern from Lesson 02.

## Border Width
Default border width is 1px. Scale it up with `.border-{1-5}`:

```html
<div class="border border-3 border-primary p-3">3px primary border</div>
```

Higher numbers = thicker borders (up to 5, which is the framework's built-in maximum — for anything thicker you'd write custom CSS).

## Rounded Corners
`.rounded` applies a moderate default border-radius to all four corners:

```html
<img src="avatar.jpg" class="rounded" alt="Rounded avatar">
```

Side- and corner-specific variants:

```html
<div class="rounded-top">Top corners only</div>
<div class="rounded-end">End-side corners only</div>
```

Size variants scale the radius itself:

```html
<div class="rounded-0">No rounding</div>
<div class="rounded-1">Small radius</div>
<div class="rounded-3">Larger radius</div>
```

Two special shapes matter a lot for real UI work:

```html
<img src="avatar.jpg" class="rounded-circle" alt="Circular avatar">
<button class="btn btn-primary rounded-pill">Pill-shaped button</button>
```

`.rounded-circle` requires the element to be square (equal width/height) to render as a true circle — this is why avatar images are almost always cropped to a 1:1 aspect ratio before applying it. `.rounded-pill` applies a very large radius that turns any rectangular element into a fully rounded "pill," commonly used for tags and toggle-style buttons.

## Practical Example
A user profile header combining border width, color, and rounding:

```html
<div class="d-flex align-items-center p-3 border border-2 border-primary-subtle rounded-3">
  <img src="avatar.jpg" class="rounded-circle border border-3 border-primary" 
       style="width: 64px; height: 64px;" alt="User avatar">
  <div class="ms-3">
    <h5 class="mb-0">Jordan Lee</h5>
    <span class="badge bg-success-subtle text-success-emphasis border border-success-subtle rounded-pill">
      Verified
    </span>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Why does Bootstrap use `.border-start` / `.border-end` instead of `.border-left` / `.border-right`?</summary>
So directional utilities are logical rather than physical — they automatically flip correctly when a page is rendered right-to-left, which matters for the RTL support built in Module 11.
</details>

<details>
<summary>2. What's required for `.rounded-circle` to actually render a circle?</summary>
The element must have equal width and height (a 1:1 aspect ratio) — otherwise the rounding produces an ellipse, not a circle.
</details>

<details>
<summary>3. How would you keep a card's border on every side except the bottom?</summary>
`class="border border-bottom-0"`.
</details>

<details>
<summary>4. What's the practical difference between `.rounded-3` and `.rounded-pill`?</summary>
`.rounded-3` applies a fixed, moderate corner radius, while `.rounded-pill` applies a radius large enough to fully round a rectangular element's ends into a stadium/pill shape regardless of its height.
</details>
