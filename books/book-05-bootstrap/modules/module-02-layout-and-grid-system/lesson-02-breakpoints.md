# Breakpoints

## Learning Objectives
- List Bootstrap's default breakpoints and their pixel thresholds
- Understand the `min-width` (mobile-first) nature of Bootstrap's media queries
- Read and predict the behavior of breakpoint-suffixed classes
- Relate Bootstrap's breakpoints to the media queries you wrote by hand in Book 03

## Introduction

In Book 03's Responsive Design module, you wrote your own `@media` queries with custom pixel values you chose yourself. Bootstrap standardizes this with a fixed set of **breakpoints** that every responsive class in the framework is built around — the grid, display utilities, flex utilities, and more all share this same scale.

## The Default Breakpoints

| Breakpoint | Abbreviation | Min-width |
|---|---|---|
| Extra small | (none — the default) | `< 576px` |
| Small | `sm` | `≥ 576px` |
| Medium | `md` | `≥ 768px` |
| Large | `lg` | `≥ 992px` |
| Extra large | `xl` | `≥ 1200px` |
| Extra extra large | `xxl` | `≥ 1400px` |

Notice there's no `xs` suffix used in class names — the unprefixed version of a class (e.g. `col-6`) *is* the extra-small/default behavior.

## Mobile-First: min-width, Not max-width

This is the single most important thing to internalize: **Bootstrap's breakpoints use `min-width` media queries**, meaning a class like `col-md-6` applies its rule starting *at* the `md` breakpoint and **continues to apply at every breakpoint larger than `md`** too, unless overridden by a class targeting a bigger breakpoint.

```css
/* Roughly what Bootstrap generates behind the scenes */
.col-md-6 {
  /* applies at md and every breakpoint above it (lg, xl, xxl) */
}
```

This is exactly the mobile-first pattern from Book 03: you style the smallest case first (unprefixed classes), then progressively override for larger screens using breakpoint-suffixed classes.

## Reading Breakpoint Class Names

Almost every responsive utility and grid class in Bootstrap follows this same naming pattern:

{property}-{breakpoint}-{value}


Examples:
- `col-md-6` → at `md` and up, take 6 of 12 grid columns
- `d-none d-lg-block` → hidden by default, becomes `display: block` at `lg` and up
- `text-sm-center` → center-aligned text starting at `sm` and up

## Practical Example

A `<div>` that stacks full-width on mobile, becomes half-width at `md`, and one-third width at `lg`:

```html
<div class="container">
  <div class="row">
    <div class="col-12 col-md-6 col-lg-4 bg-light border p-3">
      Box 1
    </div>
    <div class="col-12 col-md-6 col-lg-4 bg-light border p-3">
      Box 2
    </div>
    <div class="col-12 col-md-6 col-lg-4 bg-light border p-3">
      Box 3
    </div>
  </div>
</div>
```

Reading it mobile-first: "full width by default, half width from md up, one-third width from lg up" — exactly matching Bootstrap's min-width cascading behavior.

## Revision Questions

<details>
<summary>1. Does class="col-md-6" apply only exactly at the md breakpoint, or also at larger breakpoints?</summary>
It applies at md AND at every breakpoint larger than md (lg, xl, xxl) too, since Bootstrap's breakpoints use min-width media queries — unless a more specific larger-breakpoint class overrides it.
</details>

<details>
<summary>2. Why is there no "xs-" prefix used in Bootstrap class names?</summary>
The unprefixed version of a class (e.g. col-6, not col-xs-6) already represents the extra-small/default behavior, since it's the base case before any min-width breakpoint kicks in.
</details>

<details>
<summary>3. What is the general naming pattern for Bootstrap's responsive utility classes?</summary>
{property}-{breakpoint}-{value}, e.g. col-md-6, d-lg-block, text-sm-center.
</details>
