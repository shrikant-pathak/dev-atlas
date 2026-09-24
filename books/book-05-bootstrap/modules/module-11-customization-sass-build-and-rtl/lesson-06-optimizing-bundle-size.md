# Lesson 06: Optimizing Bundle Size

## Learning Objectives
- Apply selective component imports (from Lesson 03) specifically to minimize file size
- Disable unused utility classes via the `$utilities` map
- Understand the tradeoff between convenience (importing everything) and performance (importing only what's used)
- Measure and compare compiled output size

## Introduction
Lesson 03 introduced selective imports primarily as a way to understand Bootstrap's structure. This lesson treats the same technique as a genuine performance optimization, and adds a second, finer-grained lever: trimming the utility CLASS GENERATION itself, not just whole components.

## Measuring the Baseline
Before optimizing anything, it's worth seeing the actual cost of the full-import approach used throughout Lessons 01–02 and this entire book:

```bash
npx sass scss/custom.scss css/custom.css
ls -lh css/custom.css
```

A full Bootstrap build (all components, all utilities) typically compiles to roughly 200+ KB of uncompressed CSS — most of it likely unused by any single specific project, since few real sites use every component from Modules 06–09 simultaneously.

## Component-Level Trimming (Recap and Extension of Lesson 03)
```scss
// Only import what a specific landing page actually needs
@import "../node_modules/bootstrap/scss/functions";
@import "../node_modules/bootstrap/scss/variables";
@import "../node_modules/bootstrap/scss/maps";
@import "../node_modules/bootstrap/scss/mixins";
@import "../node_modules/bootstrap/scss/root";
@import "../node_modules/bootstrap/scss/reboot";
@import "../node_modules/bootstrap/scss/type";
@import "../node_modules/bootstrap/scss/grid";
@import "../node_modules/bootstrap/scss/buttons";

// Explicitly skip: modal, carousel, offcanvas, toasts, tooltips, popovers,
// accordion, dropdown, navbar, pagination, breadcrumb — if genuinely unused
```

## Utility-Level Trimming with the `$utilities` Map
Beyond whole components, Bootstrap's utility CLASSES (everything from Module 04's spacing/colors and Module 09's flex/display utilities) are themselves generated from one large configurable Sass map, which can be selectively disabled:

```scss
$utilities: (
  "opacity": null,           // disables .opacity-* entirely
  "border-radius": null,     // disables .rounded-* entirely
);

@import "../node_modules/bootstrap/scss/bootstrap";
```

Setting a utility's map entry to `null` removes it from generation completely — if a project genuinely never uses `.rounded-*` classes (say, every component uses a fixed custom border style instead), disabling that entry removes every generated `.rounded-0` through `.rounded-pill` class from the compiled output, at zero visual cost to a project that never referenced them.

## The Real Tradeoff: Convenience vs. Bundle Size
It's worth being honest about this tradeoff rather than presenting selective imports as a free win: the full-import approach used throughout this entire curriculum is far more forgiving during development — you can freely use ANY component or utility from any earlier module without needing to remember to add an import for it first. Selective imports require you to know in advance exactly what you'll use, and add friction (a forgotten import for a utility class silently produces no CSS output, which can be a confusing bug to track down). For a learning curriculum like this book, or a smaller project where load time isn't yet a measured concern, the full import remains a completely reasonable default — this lesson's techniques become genuinely worth the added complexity specifically once bundle size is a measured, real performance problem, not a hypothetical one.

## Practical Example
A before/after comparison for a simple marketing page:

```scss
// BEFORE: full import (~200+ KB uncompressed)
@import "../node_modules/bootstrap/scss/bootstrap";
```

```scss
// AFTER: trimmed for a page using only grid, buttons, cards, and forms
@import "../node_modules/bootstrap/scss/functions";
@import "../node_modules/bootstrap/scss/variables";
@import "../node_modules/bootstrap/scss/maps";
@import "../node_modules/bootstrap/scss/mixins";
@import "../node_modules/bootstrap/scss/root";
@import "../node_modules/bootstrap/scss/reboot";
@import "../node_modules/bootstrap/scss/type";
@import "../node_modules/bootstrap/scss/grid";
@import "../node_modules/bootstrap/scss/forms";
@import "../node_modules/bootstrap/scss/buttons";
@import "../node_modules/bootstrap/scss/card";
@import "../node_modules/bootstrap/scss/utilities";
@import "../node_modules/bootstrap/scss/helpers";
// Compiles to a noticeably smaller file, with all used components fully functional
```

## Revision Questions

<details>
<summary>1. Roughly how large is a full, unoptimized Bootstrap Sass build, and why is most of it typically unused by any single project?</summary>
Roughly 200+ KB uncompressed — most projects use only a subset of the framework's many components and utilities, so a large portion of the full build compiles CSS that page never actually references.
</details>

<details>
<summary>2. What does setting a `$utilities` map entry to `null` do?</summary>
It removes that utility's class generation entirely from the compiled output — for example, setting the `"border-radius"` entry to `null` removes every `.rounded-*` class, at zero cost to a project that never uses them.
</details>

<details>
<summary>3. What's the real tradeoff of selective imports, beyond just the file-size benefit?</summary>
It requires knowing in advance exactly what components/utilities will be used and remembering to import each one, adding development friction — a forgotten import silently produces no CSS, which can be a confusing bug — versus the full import's forgiving "everything is always available" convenience.
</details>

<details>
<summary>4. For a learning curriculum or a small project without a measured performance problem, which approach does this lesson suggest is still reasonable?</summary>
The full import, used throughout the rest of this book — selective/trimmed builds become genuinely worth their added complexity specifically once bundle size is a measured, real problem, not a hypothetical concern.
</details>
