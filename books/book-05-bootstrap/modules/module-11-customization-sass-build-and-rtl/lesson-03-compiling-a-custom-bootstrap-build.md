# Lesson 03: Compiling a Custom Bootstrap Build

## Learning Objectives
- Understand Bootstrap's modular Sass file structure and selective `@import`
- Import only the components/utilities actually used, to reduce build size
- Use npm scripts to standardize the build command
- Recognize the required-vs-optional import dependency chain

## Introduction
Lessons 01–02 imported the ENTIRE Bootstrap framework via `@import "bootstrap"`. This lesson opens up what that single import actually contains — a long chain of individual partial files — and how to selectively import only pieces you actually use, directly setting up Lesson 06's bundle-size optimization work.

## What `@import "bootstrap"` Actually Expands To
Bootstrap's own `scss/bootstrap.scss` file is itself just a list of individual `@import` statements:

```scss
// Simplified excerpt of Bootstrap's own bootstrap.scss
@import "functions";
@import "variables";
@import "maps";
@import "mixins";
@import "root";

@import "reboot";
@import "type";
@import "images";
@import "containers";
@import "grid";
@import "forms";
@import "buttons";
@import "card";
@import "alert";
// ... and so on, for every component covered across Modules 04-09
```

Importing the whole `bootstrap` file, as done in Lessons 01–02, is simplest and matches everything you've built throughout this book — but it compiles CSS for every component, including ones a specific project might never actually use.

## Selective Imports
Instead of the umbrella import, you can cherry-pick individual partials:

```scss
// scss/custom.scss
$primary: #6f42c1;

// Required foundational files — always needed, regardless of what else you import
@import "../node_modules/bootstrap/scss/functions";
@import "../node_modules/bootstrap/scss/variables";
@import "../node_modules/bootstrap/scss/maps";
@import "../node_modules/bootstrap/scss/mixins";
@import "../node_modules/bootstrap/scss/root";

// Only what this specific project actually uses
@import "../node_modules/bootstrap/scss/reboot";
@import "../node_modules/bootstrap/scss/type";
@import "../node_modules/bootstrap/scss/grid";
@import "../node_modules/bootstrap/scss/buttons";
@import "../node_modules/bootstrap/scss/card";

// Skip: accordion, carousel, offcanvas, toasts, etc. — if this project never uses them
```

## Why `functions`, `variables`, `maps`, `mixins`, and `root` Are Never Optional
These five files aren't components — they're the shared foundation every other partial depends on: `functions` provides Sass helper functions used throughout the codebase, `variables`/`maps` define the values from Lesson 02, `mixins` provides reusable Sass logic blocks (used internally to generate the responsive breakpoint variants from Module 02, for instance), and `root` generates the `:root { --bs-*: ...; }` CSS custom properties you've relied on since Module 04. Omitting any of these five breaks nearly everything imported after them.

## npm Scripts for a Standard Build Command
Rather than typing the full `npx sass ...` command from Lesson 01 repeatedly, standardize it in `package.json`:

```json
{
  "scripts": {
    "build:css": "sass scss/custom.scss css/custom.css",
    "watch:css": "sass --watch scss/custom.scss css/custom.css"
  }
}
```

```bash
npm run build:css
npm run watch:css
```

This `"scripts"` section is genuinely standard practice across nearly all npm-based JavaScript/frontend tooling, not a Bootstrap-specific convention — the same pattern you'll encounter constantly once you reach the React and Vue books later in this curriculum, where build scripts orchestrate far more complex compilation steps than this single Sass command.

## Practical Example
A lean custom build for a marketing page that only uses buttons, cards, and the grid — skipping every JS-driven component from Module 08:

```scss
// scss/custom.scss
$primary: #10b981;

@import "../node_modules/bootstrap/scss/functions";
@import "../node_modules/bootstrap/scss/variables";
@import "../node_modules/bootstrap/scss/maps";
@import "../node_modules/bootstrap/scss/mixins";
@import "../node_modules/bootstrap/scss/root";
@import "../node_modules/bootstrap/scss/reboot";
@import "../node_modules/bootstrap/scss/type";
@import "../node_modules/bootstrap/scss/grid";
@import "../node_modules/bootstrap/scss/buttons";
@import "../node_modules/bootstrap/scss/card";
@import "../node_modules/bootstrap/scss/utilities";
@import "../node_modules/bootstrap/scss/helpers";
```

## Revision Questions

<details>
<summary>1. What does the single `@import "bootstrap"` statement used in Lessons 01–02 actually expand into?</summary>
A long chain of individual `@import` statements for every partial file — foundational files plus one partial per component/feature — all bundled into one convenience import.
</details>

<details>
<summary>2. Why are `functions`, `variables`, `maps`, `mixins`, and `root` never safe to skip, even in a minimal selective build?</summary>
They're not components but shared foundational files every other partial depends on — helper functions, variable/map definitions, reusable Sass logic, and the generated `:root` CSS variables — omitting any of them breaks whatever is imported afterward.
</details>

<details>
<summary>3. What's the main benefit of selectively importing only the partials a project actually uses?</summary>
It reduces the compiled CSS bundle size by excluding component styles the project never references, directly setting up the bundle-size optimization covered in Lesson 06.
</details>

<details>
<summary>4. Is the `"scripts"` section in `package.json` a Bootstrap-specific convention?</summary>
No — it's standard, general-purpose npm/frontend tooling practice used across nearly all JavaScript projects, including the React and Vue projects covered later in this curriculum.
</details>
