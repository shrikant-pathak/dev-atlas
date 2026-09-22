# The Grid System

## Learning Objectives
- Explain Bootstrap's 12-column grid model
- Build layouts using `.row` and `.col` correctly
- Understand how Bootstrap's grid is implemented with Flexbox under the hood
- Use auto-layout columns vs explicitly-sized columns

## Introduction

Bootstrap's grid is built on the same **Flexbox** concepts you mastered in Book 03's Flexbox module — `.row` is a flex container, and each `.col` is a flex item. Bootstrap adds one major idea on top: a **12-column system**, where every row is conceptually divided into 12 equal units, and columns claim some number of those units.

## Row and Column Basics

```html
<div class="container">
  <div class="row">
    <div class="col">Column 1</div>
    <div class="col">Column 2</div>
    <div class="col">Column 3</div>
  </div>
</div>
```

With no explicit sizing, `.col` divides available space **equally** among however many columns are present — three `.col` elements each take exactly one-third of the row's width. This is Bootstrap's version of `flex: 1 1 0%` from Book 03.

## Explicitly-Sized Columns (the 12-Unit System)

```html
<div class="row">
  <div class="col-4">Takes 4 of 12 units (1/3 width)</div>
  <div class="col-8">Takes 8 of 12 units (2/3 width)</div>
</div>
```

Numbers from `col-1` through `col-12` set how many of the row's 12 units that column occupies. `4 + 8 = 12`, so these two columns exactly fill one row.

## Mixing Auto and Sized Columns

```html
<div class="row">
  <div class="col-3">Fixed at 3 units</div>
  <div class="col">Takes whatever space remains</div>
</div>
```

An unsized `.col` alongside sized siblings will automatically consume whatever width is left over — useful for sidebar + main-content layouts.

## Rows Can Wrap

If column sizes in a single row add up to more than 12, the excess columns wrap onto a new line automatically — the same `flex-wrap` behavior from Book 03's Flexbox module.

```html
<div class="row">
  <div class="col-8">8 units</div>
  <div class="col-8">This wraps to a new line since 8 + 8 = 16 > 12</div>
</div>
```

## Nesting Grids

You can nest an entire new `.row`/`.col` structure inside any column — each nested row restarts its own 12-unit count relative to its parent column's width, not the whole page.

```html
<div class="row">
  <div class="col-8">
    <div class="row">
      <div class="col-6">Nested column A</div>
      <div class="col-6">Nested column B</div>
    </div>
  </div>
  <div class="col-4">Sidebar</div>
</div>
```

## Practical Example — A Classic Holy Grail Layout

```html
<div class="container">
  <div class="row">
    <div class="col-12 col-md-2 bg-light p-3">Sidebar (nav)</div>
    <div class="col-12 col-md-8 p-3">Main content area</div>
    <div class="col-12 col-md-2 bg-light p-3">Sidebar (widgets)</div>
  </div>
</div>
```

On mobile, all three sections stack full-width, in source order. From `md` up, they become a three-column layout: `2 + 8 + 2 = 12`.

## Revision Questions

<details>
<summary>1. How many units does Bootstrap's grid divide a row into?</summary>
12 units — every column class expresses how many of those 12 units it should claim.
</details>

<details>
<summary>2. What happens when column sizes in a row add up to more than 12?</summary>
The excess columns wrap onto a new line, the same way flex items wrap when flex-wrap is enabled.
</details>

<details>
<summary>3. If you place an unsized .col next to a col-3, how much width does the unsized column take?</summary>
It automatically consumes whatever width remains in the row after the col-3's fixed width is accounted for.
</details>
