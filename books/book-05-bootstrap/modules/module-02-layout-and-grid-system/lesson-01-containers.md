# Containers

## Learning Objectives
- Explain what a container does in Bootstrap's layout system
- Differentiate `.container`, `.container-fluid`, and breakpoint-specific containers (`.container-md`, etc.)
- Understand how containers interact with Bootstrap's grid and gutters
- Choose the right container type for a given layout goal

## Introduction

Every Bootstrap layout starts with a **container**. A container is a `<div>` that centers your content horizontally and applies consistent left/right padding — the same padding concept you learned in Book 03's Box Model module, but with responsive max-widths baked in by the framework.

## The Three Container Types

### `.container` — Fixed, Responsive Max-Width

```html
<div class="container">
  <p>This content is centered with a max-width that changes per breakpoint.</p>
</div>
```

`.container` has a different `max-width` at each breakpoint (small, medium, large, etc. — covered in depth in Lesson 2). Below the smallest breakpoint, it behaves like `width: 100%`.

### `.container-fluid` — Always Full Width

```html
<div class="container-fluid">
  <p>This content always spans 100% of the viewport width, at every screen size.</p>
</div>
```

Use `.container-fluid` when you want edge-to-edge content — full-width heroes, dashboards, or app-like layouts.

### Breakpoint-Specific Containers — `.container-{breakpoint}`

```html
<div class="container-md">
  <p>Full-width until the "md" breakpoint, then becomes a fixed-width container.</p>
</div>
```

Available variants: `.container-sm`, `.container-md`, `.container-lg`, `.container-xl`, `.container-xxl`. Each is full-width (`100%`) *below* its named breakpoint, and switches to a fixed max-width at and above it. This is useful when you want fluid behavior on mobile but a constrained, centered layout on larger screens.

## How Containers Relate to the Grid

Containers exist specifically to wrap Bootstrap's row/column grid system (covered fully in Lesson 3). A `.row` should always live inside a container (or another element behaving like one) — this is what gives rows their negative margins that cancel out column gutters correctly.

```html
<div class="container">
  <div class="row">
    <div class="col">Column content lives here</div>
  </div>
</div>
```

## Practical Example

A page with a full-width hero banner, followed by constrained body content — a very common real-world pattern:

```html
<!-- Full-width hero -->
<div class="container-fluid bg-primary text-white p-5">
  <h1>Welcome to Our Site</h1>
  <p>This banner spans the entire viewport width.</p>
</div>

<!-- Constrained body content -->
<div class="container py-4">
  <h2>About Us</h2>
  <p>This paragraph is centered and constrained to a comfortable reading width, unlike the hero above.</p>
</div>
```

## Revision Questions

<details>
<summary>1. What is the core visual difference between .container and .container-fluid?</summary>
.container has a fixed, responsive max-width that changes per breakpoint and centers content; .container-fluid is always 100% of the viewport width at every screen size.
</details>

<details>
<summary>2. What does .container-md do differently from a plain .container?</summary>
.container-md is full-width (100%) below the "md" breakpoint, then switches to a fixed max-width at and above "md" — giving fluid behavior on small screens and constrained behavior on larger ones.
</details>

<details>
<summary>3. Why should a .row typically live inside a container?</summary>
Containers provide the padding and centering context that correctly offsets the row's negative margins, which is what makes column gutters line up properly.
</details>
