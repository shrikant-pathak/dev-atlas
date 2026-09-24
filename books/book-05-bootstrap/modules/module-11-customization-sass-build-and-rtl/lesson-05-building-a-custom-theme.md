# Lesson 05: Building a Custom Theme

## Learning Objectives
- Assemble a complete, cohesive custom theme combining variables, maps, and typography
- Structure a multi-file Sass project for maintainability
- Apply the theme across components from every earlier module in this book
- Verify a custom theme's contrast and consistency

## Introduction
This lesson is a synthesis point rather than a source of new mechanics — it combines Lessons 01–04's individual techniques (variable overrides, map modifications, selective imports, the Sass/CSS-variable relationship) into one complete, realistic custom theme, applied across representative components spanning this entire book.

## Structuring a Multi-File Custom Theme
For anything beyond a handful of variable overrides, splitting your customizations into separate partial files keeps the project maintainable as it grows:

```
scss/
├── custom.scss          (main entry point)
├── _variables.scss      (all variable overrides)
├── _maps.scss           (theme-colors and other map overrides)
```

```scss
// scss/_variables.scss
$primary: #0f766e;
$secondary: #64748b;
$font-family-sans-serif: "Inter", sans-serif;
$border-radius: 0.5rem;
$spacer: 1rem;

// scss/_maps.scss
$theme-colors: (
  "primary": #0f766e,
  "secondary": #64748b,
  "success": #16a34a,
  "danger": #dc2626,
  "warning": #d97706,
  "info": #0891b2,
  "light": #f8fafc,
  "dark": #0f172a,
  "brand": #ea580c
);

// scss/custom.scss
@import "variables";
@import "maps";
@import "../node_modules/bootstrap/scss/bootstrap";
```

This structure directly parallels how you'd organize a genuinely large custom Sass build in professional practice — one file per concern, all imported in the correct dependency order into a single entry point, rather than one enormous flat file.

## Applying the Theme Across the Book's Components
Because every component since Module 06 consumes the `$theme-colors` map and shared variables rather than hardcoded values, this single build touches all of them consistently — with zero markup changes required:

```html
<!-- Module 06 button, unmodified markup, new theme colors -->
<button class="btn btn-primary">Primary Action</button>
<button class="btn btn-brand">Custom Brand</button>

<!-- Module 07 navbar, unmodified markup -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">...</nav>

<!-- Module 08 alert, unmodified markup -->
<div class="alert alert-success" role="alert">Themed success alert</div>

<!-- Module 06 badge with the new custom "brand" color -->
<span class="badge bg-brand">New</span>
```

Every one of these components was written identically to how it appeared in its original module — the only thing that changed is which Sass build compiled the CSS being served.

## Verifying Contrast and Consistency
A custom theme is only as good as its accessibility — recall the contrast-pairing responsibility from Module 04, Lesson 01 (`.bg-info` needing `.text-dark`, for instance). When defining custom theme colors, deliberately check computed contrast ratios (a browser DevTools color picker typically shows this directly) between each new color and both light and dark text, since a custom brand color chosen purely for aesthetics might fail basic contrast requirements when used as a button or alert background.

## Practical Example
A condensed but complete themed page pulling components from across the book, all restyled consistently by one custom build:

```html
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <span class="navbar-brand">Custom Theme Demo</span>
  </div>
</nav>

<div class="container py-4">
  <div class="alert alert-info" role="alert">This alert uses the custom theme's info color.</div>

  <div class="card mb-3">
    <div class="card-body">
      <h5 class="card-title">Themed Card</h5>
      <button class="btn btn-primary me-2">Primary</button>
      <button class="btn btn-brand">Brand</button>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Why split a large custom theme into separate `_variables.scss` and `_maps.scss` partial files rather than one flat file?</summary>
It keeps the project maintainable and organized by concern as it grows, mirroring how a genuinely large custom Sass build is structured in professional practice, with one entry point importing each concern in the correct order.
</details>

<details>
<summary>2. Why does a custom theme apply consistently across components from Modules 06-09 without any markup changes?</summary>
Every component since Module 06 consumes the shared `$theme-colors` map and variables rather than hardcoded values, so recompiling with new variable inputs restyles all of them consistently — the markup itself never needs to change.
</details>

<details>
<summary>3. What accessibility concern from Module 04 becomes especially important when choosing custom theme colors?</summary>
Contrast pairing — a custom brand color chosen purely for aesthetics might fail basic contrast requirements against light or dark text when used as a button or alert background, so contrast should be deliberately verified, not assumed.
</details>

<details>
<summary>4. What determines the correct import order across multiple custom partial files?</summary>
Variable and map definitions must be imported before Bootstrap's own source, following the same `!default` override principle from Lesson 02 — the order established in this lesson's `custom.scss` example (`variables`, then `maps`, then Bootstrap) is not arbitrary.
</details>
