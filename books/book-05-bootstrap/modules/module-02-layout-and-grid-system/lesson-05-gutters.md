# Gutters

## Learning Objectives
- Explain what gutters are and how Bootstrap implements them with padding and negative margins
- Control horizontal and vertical gutter spacing with `.g-*`, `.gx-*`, and `.gy-*`
- Apply responsive, breakpoint-specific gutter sizes
- Remove gutters entirely when needed

## Introduction

**Gutters** are the consistent spacing between grid columns — you saw a version of this concept in Book 03 with Flexbox's `gap` property. Bootstrap's grid predates widespread `gap` support in older browsers, so it implements gutters using a combination of column **padding** and row **negative margins**, though modern Bootstrap also has `gap`-based utilities available.

## How Gutters Work by Default

Every `.row` has a small negative left/right margin, and every `.col-*` has matching left/right padding. This combination creates even visual spacing between columns while keeping the row's total width aligned with its container. You don't need to think about this mechanism day-to-day — but understanding it explains why a `.row` should never be placed directly without a surrounding container (from Lesson 1): the negative margins need something to offset against.

## The Gutter Utility Classes

Bootstrap exposes a gutter scale from `0` to `5`, following the same spacing scale used throughout the framework (covered fully in Module 04):

| Class | Effect |
|---|---|
| `.g-0` | No gutters at all |
| `.g-1` through `.g-5` | Increasing gutter size, both directions |
| `.gx-*` | Horizontal gutters only |
| `.gy-*` | Vertical gutters only (matters when columns wrap to multiple lines) |

```html
<div class="row g-4">
  <div class="col-6"><div class="bg-light border p-3">A</div></div>
  <div class="col-6"><div class="bg-light border p-3">B</div></div>
</div>
```

## Vertical Gutters When Wrapping

When a row's columns wrap onto multiple lines (as covered in Lesson 3), `.gy-*` controls the spacing *between those wrapped rows* — without it, wrapped items would touch with no vertical breathing room:

```html
<div class="row gy-4 gx-2">
  <div class="col-6"><div class="bg-light border p-3">A</div></div>
  <div class="col-6"><div class="bg-light border p-3">B</div></div>
  <div class="col-6"><div class="bg-light border p-3">C (wraps to new line)</div></div>
  <div class="col-6"><div class="bg-light border p-3">D (wraps to new line)</div></div>
</div>
```

Here, `gy-4` gives generous vertical space between the two wrapped rows, while `gx-2` keeps horizontal spacing tighter.

## Responsive Gutters

Like most Bootstrap utilities, gutter classes accept a breakpoint segment: `.g-md-4`, `.gy-lg-5`, etc. — tighter gutters on mobile, more generous ones on larger screens is a common real-world pattern.

```html
<div class="row g-2 g-md-4 g-lg-5">
  <!-- gutters grow as the screen gets larger -->
</div>
```

## Practical Example — A Responsive Image Gallery

```html
<div class="container">
  <div class="row g-2 g-md-3 gy-4">
    <div class="col-6 col-md-4 col-lg-3"><img src="img1.jpg" class="img-fluid" alt=""></div>
    <div class="col-6 col-md-4 col-lg-3"><img src="img2.jpg" class="img-fluid" alt=""></div>
    <div class="col-6 col-md-4 col-lg-3"><img src="img3.jpg" class="img-fluid" alt=""></div>
    <div class="col-6 col-md-4 col-lg-3"><img src="img4.jpg" class="img-fluid" alt=""></div>
  </div>
</div>
```

Tight gutters on mobile keep the gallery dense; generous vertical gutters (`gy-4`) prevent wrapped rows from feeling cramped.

## Revision Questions

<details>
<summary>1. What two CSS mechanisms combine to create Bootstrap's default gutters?</summary>
Negative left/right margins on the .row combined with matching left/right padding on each .col.
</details>

<details>
<summary>2. What's the difference between .gx-* and .gy-*?</summary>
.gx-* controls horizontal gutter spacing between columns; .gy-* controls vertical gutter spacing, which matters when columns wrap onto multiple lines.
</details>

<details>
<summary>3. How would you apply small gutters on mobile that grow larger on bigger screens?</summary>
Stack breakpoint-prefixed gutter classes, e.g. class="g-2 g-md-4 g-lg-5" — gutters increase in size as the viewport crosses each breakpoint.
</details>
