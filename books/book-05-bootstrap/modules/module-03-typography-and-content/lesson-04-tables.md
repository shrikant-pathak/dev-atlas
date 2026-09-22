# Tables

## Learning Objectives
- Style a semantic HTML table using Bootstrap's table classes
- Apply striped rows, borders, hover states, and contextual row/cell coloring
- Build a responsive table that scrolls horizontally on small screens
- Understand how these classes build on the semantic table structure from Book 02

## Introduction

Book 02 taught you the semantic structure of HTML tables — `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>`, `<td>` — and Book 03 taught you to style them by hand with borders and spacing. Bootstrap's table classes apply consistent, accessible styling to that same semantic structure without you writing custom CSS.

## The Basic `.table` Class

```html
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Role</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Jane Doe</td>
      <td>Designer</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>John Smith</td>
      <td>Developer</td>
    </tr>
  </tbody>
</table>
```

Note the `scope="col"` and `scope="row"` attributes carried over from Book 02 — Bootstrap's styling doesn't replace the need for correct semantic/accessibility markup underneath it.

## Striping, Borders, and Hover

```html
<table class="table table-striped">          <!-- Alternating row backgrounds -->
<table class="table table-bordered">          <!-- Borders on all sides -->
<table class="table table-borderless">        <!-- No borders at all -->
<table class="table table-hover">              <!-- Highlights row on mouse hover -->
<table class="table table-striped table-hover table-bordered"> <!-- Combine freely -->
```

## Dark Tables and Small Tables

```html
<table class="table table-dark table-striped">...</table>
<table class="table table-sm">...</table>  <!-- More compact cell padding -->
```

## Contextual Row and Cell Colors

Just as Book 03 taught you semantic use of color, Bootstrap tables support contextual classes on individual rows or cells to convey meaning (success, danger, warning, etc.) — a concept covered in full in Module 04's Colors lesson:

```html
<tr class="table-success"><td>Task Completed</td></tr>
<tr class="table-danger"><td>Task Failed</td></tr>
<tr>
  <td>Normal</td>
  <td class="table-warning">Just this one cell is highlighted</td>
</tr>
```

## Responsive Tables

A wide table with many columns will overflow a narrow mobile screen. Wrapping the table in `.table-responsive` (or a breakpoint-specific variant like `.table-responsive-md`) makes it horizontally scrollable instead of breaking the page layout:

```html
<div class="table-responsive">
  <table class="table">
    <!-- a table with many columns -->
  </table>
</div>
```

`.table-responsive-md` makes the table scroll *only* below the `md` breakpoint, and displays normally (no scroll container) at `md` and above — useful when a table only becomes cramped on small screens.

## Practical Example — A Responsive Pricing Comparison Table

```html
<div class="table-responsive">
  <table class="table table-striped table-hover align-middle">
    <thead class="table-dark">
      <tr>
        <th scope="col">Plan</th>
        <th scope="col">Price</th>
        <th scope="col">Users</th>
        <th scope="col">Support</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">Basic</th>
        <td>$9/mo</td>
        <td>1</td>
        <td>Email only</td>
      </tr>
      <tr class="table-success">
        <th scope="row">Pro (Recommended)</th>
        <td>$29/mo</td>
        <td>5</td>
        <td>Priority</td>
      </tr>
      <tr>
        <th scope="row">Enterprise</th>
        <td>Contact us</td>
        <td>Unlimited</td>
        <td>Dedicated</td>
      </tr>
    </tbody>
  </table>
</div>
```

## Revision Questions

<details>
<summary>1. Why is .table-responsive typically wrapped AROUND a table rather than applied directly to it?</summary>
Because it needs to create a scrollable container (a block-level wrapper with overflow behavior) around the table, whereas the table element itself is styled with classes like .table, .table-striped, etc.
</details>

<details>
<summary>2. What is the difference between .table-responsive and .table-responsive-md?</summary>
.table-responsive always makes the table horizontally scrollable regardless of screen size; .table-responsive-md only applies that scrollable behavior below the md breakpoint, displaying normally at md and above.
</details>

<details>
<summary>3. Does Bootstrap's table styling remove the need for scope="col"/scope="row" attributes from Book 02?</summary>
No — those semantic/accessibility attributes are still needed underneath Bootstrap's visual styling; Bootstrap only handles the visual presentation layer, not the underlying document semantics.
</details>
