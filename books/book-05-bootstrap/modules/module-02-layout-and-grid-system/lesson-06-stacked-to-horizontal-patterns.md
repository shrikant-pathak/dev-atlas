# Stacked-to-Horizontal Patterns

## Learning Objectives
- Build the extremely common "stacked on mobile, side-by-side on desktop" layout
- Apply this pattern to real components: navbars, forms, media objects, and card groups
- Recognize when NOT to use a stacked-to-horizontal pattern

## Introduction

You've now learned containers, breakpoints, the grid, column sizing, and gutters individually. This lesson is about combining them into the single most common real-world layout pattern in responsive web design: content that **stacks vertically on small screens and arranges horizontally on larger ones**.

## The Core Pattern

```html
<div class="row">
  <div class="col-12 col-md-6">Left content</div>
  <div class="col-12 col-md-6">Right content</div>
</div>
```

`col-12` (full width, stacked) is the mobile-first default; `col-md-6` (half width, side by side) kicks in once the viewport reaches the `md` breakpoint. This single pair of classes is responsible for an enormous share of real-world responsive layouts.

## Applied Pattern 1 — A "Media Object" (Image + Text)

```html
<div class="row g-3 align-items-center">
  <div class="col-12 col-sm-4">
    <img src="avatar.jpg" class="img-fluid rounded" alt="Author photo">
  </div>
  <div class="col-12 col-sm-8">
    <h5>Article Title</h5>
    <p>A short excerpt of the article goes here, next to the author's photo on larger screens, but stacked below it on mobile.</p>
  </div>
</div>
```

## Applied Pattern 2 — A Form with Label/Input Side-by-Side on Desktop

```html
<div class="row mb-3">
  <label class="col-12 col-md-3 col-form-label">Email address</label>
  <div class="col-12 col-md-9">
    <input type="email" class="form-control">
  </div>
</div>
```

On mobile, the label sits directly above its input (a familiar mobile form pattern); on `md` and up, the label and input sit side by side — a common desktop form convention. You'll build on this exact structure in Module 05 (Forms).

## Applied Pattern 3 — A Feature List

```html
<div class="row g-4">
  <div class="col-12 col-md-4">
    <h4>Fast</h4>
    <p>Optimized for performance out of the box.</p>
  </div>
  <div class="col-12 col-md-4">
    <h4>Reliable</h4>
    <p>Battle-tested across millions of production sites.</p>
  </div>
  <div class="col-12 col-md-4">
    <h4>Flexible</h4>
    <p>Customize everything with Sass, covered in Module 11.</p>
  </div>
</div>
```

## When NOT to Use This Pattern

Not everything should stack-then-horizontal. A primary navigation bar, for example, generally needs a different responsive strategy entirely (collapsing into a hamburger menu rather than stacking vertically) — you'll see this in Module 07's Navbar lesson, which uses Bootstrap's dedicated navbar collapse behavior instead of plain grid stacking.

## Practical Example — A Two-Column Blog Layout

```html
<div class="container py-4">
  <div class="row g-4">
    <div class="col-12 col-lg-8">
      <article>
        <h2>Main Article Title</h2>
        <p>Main article body content, taking the majority of the width on large screens.</p>
      </article>
    </div>
    <div class="col-12 col-lg-4">
      <aside class="bg-light p-3">
        <h5>Related Posts</h5>
        <p>Sidebar content, stacked below the article on mobile, beside it on large screens.</p>
      </aside>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What is the single most common column-class pairing for a "stack on mobile, side-by-side on desktop" layout?</summary>
col-12 paired with a breakpoint-sized class like col-md-6 — full width by default, half width from md up.
</details>

<details>
<summary>2. In the form label/input pattern from this lesson, what changes between mobile and desktop?</summary>
On mobile, the label sits stacked directly above the input; from md up, the label and input sit side by side in the same row.
</details>

<details>
<summary>3. Why isn't a primary navbar usually built with plain stacked-to-horizontal grid classes?</summary>
Navbars typically need to collapse into a hamburger menu on mobile rather than simply stack vertically, which requires Bootstrap's dedicated navbar collapse component rather than plain grid stacking.
</details>
