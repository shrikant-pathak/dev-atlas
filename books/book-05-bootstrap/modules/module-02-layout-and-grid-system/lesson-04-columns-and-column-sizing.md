# Columns & Column Sizing

## Learning Objectives
- Combine breakpoint prefixes with column sizes for fully responsive layouts
- Use column ordering, offsetting, and alignment utilities
- Control column vertical alignment within a row
- Build layouts that change column count across breakpoints

## Introduction

Lesson 3 introduced the 12-unit grid; this lesson combines it with breakpoints (Lesson 2) to build genuinely responsive layouts, plus covers the extra column-level controls Bootstrap provides: ordering, offsetting, and alignment.

## Responsive Column Sizing

Combine a breakpoint prefix directly into the column class:

```html
<div class="row">
  <div class="col-12 col-sm-6 col-lg-3">Responsive column</div>
</div>
```

Read mobile-first: full width by default, half width from `sm` up, one-quarter width from `lg` up. A four-item product grid commonly uses exactly this pattern (`col-lg-3` four times = 12 units at large screens).

## Column Offsetting

`.offset-{breakpoint}-{n}` pushes a column to the right by `n` units, without needing an empty column to fill the gap:

```html
<div class="row">
  <div class="col-md-4 offset-md-4">Centered 4-unit column</div>
</div>
```

This centers a 4-unit column: 4 (offset) + 4 (column) + 4 (remaining) = 12.

## Reordering Columns

`.order-{breakpoint}-{n}` changes the *visual* order of columns without changing their order in the HTML source — useful for changing which content appears first on mobile vs desktop, without duplicating markup or hurting accessibility/document order for screen readers.

```html
<div class="row">
  <div class="col-md-6 order-md-2">Appears second on md+, but first in HTML</div>
  <div class="col-md-6 order-md-1">Appears first on md+, but second in HTML</div>
</div>
```

## Vertical Alignment Within a Row

Since `.row` is a flex container, standard Flexbox alignment utilities from Book 03 apply directly:

```html
<div class="row align-items-center" style="height: 200px;">
  <div class="col">Vertically centered within the row</div>
</div>
```

Bootstrap also provides per-column alignment with `.align-self-*` classes, exactly mirroring the `align-self` property from Book 03's Flexbox module.

## Practical Example — A Responsive Card Grid with a Featured Item

```html
<div class="container">
  <div class="row g-3">
    <div class="col-12 col-md-8 order-md-1">
      <div class="p-4 bg-primary text-white">Featured Article (larger, appears first on desktop)</div>
    </div>
    <div class="col-6 col-md-4 order-md-2">
      <div class="p-3 bg-light border">Secondary item A</div>
    </div>
    <div class="col-6 col-md-4 order-md-3">
      <div class="p-3 bg-light border">Secondary item B</div>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What does offset-md-4 do to a column?</summary>
It pushes the column 4 grid units to the right, starting at the md breakpoint, without requiring an extra empty column to create that gap.
</details>

<details>
<summary>2. Why would you use .order-md-2 instead of physically reordering your HTML?</summary>
It changes the visual/rendered order of columns at a given breakpoint while keeping the HTML source order intact — important for accessibility and screen reader document order, which should stay logical regardless of visual layout.
</details>

<details>
<summary>3. Why do standard Flexbox alignment classes like align-items-center work directly on a .row?</summary>
Because .row is implemented as a flex container under the hood, so all the Flexbox alignment utilities from Book 03 apply to it exactly as they would to any other flex container.
</details>
