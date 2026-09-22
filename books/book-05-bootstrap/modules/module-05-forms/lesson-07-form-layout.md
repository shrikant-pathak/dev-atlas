# Lesson 07: Form Layout

## Learning Objectives
- Build multi-column form layouts using the grid system from Module 02
- Apply `.row` and `.g-*` gutter utilities inside forms
- Use `.col-auto` for compact, content-sized fields
- Build a horizontal form layout with grid-aligned labels
- Understand `.form-check` behavior inside grid columns

## Introduction
Every lesson so far in this module has looked at individual controls in isolation, stacked vertically with `.mb-3`. Real forms are rarely a single column — billing forms need city/state/zip side by side, search bars need a field and button on one line. This lesson connects the form controls you now know to the grid system you learned back in Module 02.

## Multi-Column Forms with Grid
Since form controls are just regular block elements, they drop directly into grid columns:

```html
<form>
  <div class="row g-3">
    <div class="col-md-6">
      <label for="firstName" class="form-label">First name</label>
      <input type="text" class="form-control" id="firstName">
    </div>
    <div class="col-md-6">
      <label for="lastName" class="form-label">Last name</label>
      <input type="text" class="form-control" id="lastName">
    </div>
  </div>
</form>
```

`.g-3` (the gap utility from Module 02's grid coverage) sets consistent spacing between both rows and columns in the grid, replacing the need for individual `.mb-3` classes on each field wrapper.

## Three-Column Address Row
A classic pattern — city, state, zip on one line at wider viewports, stacking on mobile since no explicit column classes are given below `md`:

```html
<div class="row g-3">
  <div class="col-md-6">
    <label for="city" class="form-label">City</label>
    <input type="text" class="form-control" id="city">
  </div>
  <div class="col-md-4">
    <label for="state" class="form-label">State</label>
    <select class="form-select" id="state">
      <option selected>Choose...</option>
      <option>CA</option>
      <option>NY</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="zip" class="form-label">Zip</label>
    <input type="text" class="form-control" id="zip">
  </div>
</div>
```

## Compact Fields with `.col-auto`
When you want a field to size to its content rather than a fraction of the grid — a small quantity input beside a longer label, for instance — `.col-auto` (also from Module 02) does the job:

```html
<form class="row row-cols-lg-auto g-3 align-items-center">
  <div class="col-12">
    <label class="visually-hidden" for="qty">Quantity</label>
    <input type="text" class="form-control" id="qty" placeholder="Quantity">
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Add to cart</button>
  </div>
</form>
```

`.visually-hidden` here hides the label visually while keeping it available to screen readers — appropriate when the placeholder text alone makes the field's purpose visually obvious to sighted users, but a label is still required for accessibility.

## Horizontal Form Layout
For label-beside-field (rather than label-above-field) layouts, combine `.row`, `.col-form-label` on the label, and a column class on the input:

```html
<form>
  <div class="row mb-3 align-items-center">
    <label for="horizName" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="horizName">
    </div>
  </div>
  <div class="row mb-3 align-items-center">
    <label for="horizEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="horizEmail">
    </div>
  </div>
</form>
```

`.col-form-label` adjusts the label's vertical padding so its text lines up correctly with the height of `.form-control`, rather than sitting slightly off-center the way a plain `.form-label` would in a horizontal row.

## Checkboxes in Grid Columns
`.form-check` works inside grid columns without any special handling — but remember from Lesson 03 that it's a block-level pattern, so it takes the full width of whatever column it's placed in:

```html
<div class="row">
  <div class="col-sm-6">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">Remember me</label>
    </div>
  </div>
</div>
```

## Practical Example
A complete horizontal-and-grid hybrid registration form:

```html
<form>
  <div class="row g-3 mb-3">
    <div class="col-md-6">
      <label for="regFirst" class="form-label">First name</label>
      <input type="text" class="form-control" id="regFirst">
    </div>
    <div class="col-md-6">
      <label for="regLast" class="form-label">Last name</label>
      <input type="text" class="form-control" id="regLast">
    </div>
  </div>

  <div class="row mb-3 align-items-center">
    <label for="regEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="regEmail">
    </div>
  </div>

  <div class="form-check mb-3">
    <input class="form-check-input" type="checkbox" id="regTerms">
    <label class="form-check-label" for="regTerms">I agree to the terms</label>
  </div>

  <button type="submit" class="btn btn-primary">Create account</button>
</form>
```

## Revision Questions

<details>
<summary>1. What does `.g-3` do inside a form's `.row`, and what does it replace the need for?</summary>
It applies a consistent gap between both rows and columns of the grid, replacing the need to manually add `.mb-3` to each individual field wrapper.
</details>

<details>
<summary>2. What is `.col-form-label` for, and why is it needed in horizontal layouts?</summary>
It adjusts a label's vertical padding so its text aligns correctly with the height of an adjacent `.form-control`, since a plain `.form-label` isn't vertically balanced for side-by-side layouts.
</details>

<details>
<summary>3. When would you use `.visually-hidden` on a form label?</summary>
When the field's purpose is already visually obvious (e.g. via placeholder text) for sighted users, but a `<label>` is still required for screen reader accessibility — it hides the label visually while keeping it in the accessibility tree.
</details>

<details>
<summary>4. Does `.form-check` need any special class to work inside a grid column?</summary>
No — it works as-is, but since it's a block-level element it will take up the full width of whatever column contains it.
</details>
