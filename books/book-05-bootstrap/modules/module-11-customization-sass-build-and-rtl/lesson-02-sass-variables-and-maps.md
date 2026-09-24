# Lesson 02: Sass Variables and Maps

## Learning Objectives
- Understand Sass's `!default` flag and why it enables safe variable overriding
- Override individual Bootstrap variables (colors, spacing, fonts, breakpoints)
- Modify Sass maps to add/remove/change entire groups of related values at once
- Recognize which variables control which parts of the framework

## Introduction
Lesson 01 previewed the "define before import, thanks to `!default`" mechanism. This lesson goes deep on exactly how that works and what's actually overridable — which turns out to be nearly every design decision baked into Bootstrap, since almost all of it flows from a few hundred Sass variables.

## How `!default` Actually Works
In Sass, a variable declared with `!default` only takes its stated value if that variable hasn't ALREADY been assigned a value earlier in the compilation:

```scss
// Simplified version of what's inside Bootstrap's own source:
$primary: #0d6efd !default;
```

If your `custom.scss` sets `$primary: #6f42c1;` BEFORE importing Bootstrap (as shown in Lesson 01), then by the time Sass reaches Bootstrap's own `$primary: #0d6efd !default;` line, the variable already has a value — so the `!default` assignment is skipped entirely, and your value wins. This is precisely why override order matters, and it's a deliberate design choice by Bootstrap's authors specifically to make this kind of safe overriding possible without editing Bootstrap's own source files at all.

## Overriding Individual Variables
```scss
// scss/custom.scss
$primary: #6f42c1;
$secondary: #6c757d;
$border-radius: 0.75rem;
$font-family-sans-serif: "Poppins", sans-serif;
$spacer: 1.25rem;  // changes the base unit for the ENTIRE spacing scale from Module 04

@import "../node_modules/bootstrap/scss/bootstrap";
```

Notice `$spacer` here — recall from Module 04, Lesson 04 that the entire `.p-1` through `.p-5` spacing scale is calculated as multiples of this single base variable. Overriding it here reshapes the whole spacing rhythm of every component you've built throughout this entire book, from a single line.

## Sass Maps: Overriding Groups at Once
Many related Bootstrap values aren't separate variables — they're stored together in a Sass "map," a key-value data structure. The theme colors from Module 04, Lesson 01 are a prime example:

```scss
$theme-colors: (
  "primary": #6f42c1,
  "secondary": #6c757d,
  "success": #198754,
  "danger": #dc3545,
  "warning": #ffc107,
  "info": #0dcaf0,
  "light": #f8f9fa,
  "dark": #212529,
  "brand": #ff6b35  // adding an entirely new, custom theme color
);
```

Adding `"brand"` to this map, then recompiling, automatically generates an entire new set of utility classes and component variants across the framework — `.btn-brand`, `.text-brand`, `.bg-brand`, `.badge` variants, and so on — for every component covered since Module 06, without writing a single one of those classes by hand. This is the single most powerful technique in this lesson: modifying one Sass map can generate dozens of consistent, framework-wide classes.

## Breakpoint Customization
The grid breakpoints from Module 02 are also a Sass map, fully overridable:

```scss
$grid-breakpoints: (
  xs: 0,
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1200px,
  xxl: 1400px,
  xxxl: 1600px  // adding a new breakpoint tier
);
```

Adding a new tier here would make `.col-xxxl-*`, `.d-xxxl-*`, and every other responsive utility from Modules 02, 04, and 09 automatically generate an `xxxl` variant too — the responsive-infix system you've used dozens of times throughout this book is itself generated from this one map.

## Practical Example
A themed build adding a custom brand color and a tighter spacing scale:

```scss
// scss/custom.scss
$spacer: 1rem;

$theme-colors: (
  "primary": #2563eb,
  "secondary": #6c757d,
  "success": #198754,
  "danger": #dc3545,
  "warning": #ffc107,
  "info": #0dcaf0,
  "light": #f8f9fa,
  "dark": #212529,
  "brand": #f97316
);

@import "../node_modules/bootstrap/scss/bootstrap";
```

```html
<button class="btn btn-brand">Custom brand button</button>
<span class="badge bg-brand">New</span>
```

## Revision Questions

<details>
<summary>1. What does the `!default` flag mean for a Sass variable, and why does it make overriding safe?</summary>
A variable marked `!default` only takes its stated value if it hasn't already been assigned one earlier in compilation — so defining your own value BEFORE Bootstrap's `@import` causes Bootstrap's own `!default` assignment to be skipped, letting you override defaults without touching Bootstrap's source files.
</details>

<details>
<summary>2. What does overriding `$spacer` affect, and where has that variable's role already been covered in this book?</summary>
It reshapes the base unit multiplied to generate the ENTIRE spacing scale (`.p-1` through `.p-5`) from Module 04, Lesson 04 — one override cascades through every spacing utility used across the whole book.
</details>

<details>
<summary>3. What happens if you add a new key like `"brand"` to the `$theme-colors` Sass map before recompiling?</summary>
An entire new set of utility classes and component variants (`.btn-brand`, `.text-brand`, `.bg-brand`, and more) gets automatically generated across the framework, without writing any of those classes by hand.
</details>

<details>
<summary>4. What Module 02 concept is directly generated from the `$grid-breakpoints` Sass map?</summary>
The entire responsive breakpoint/infix system — `.col-md-*`, `.d-lg-none`, and every other breakpoint-suffixed utility used throughout the book are all generated from this one map's keys.
</details>
