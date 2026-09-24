# Lesson 01: npm and Sass Build Setup

## Learning Objectives
- Install Bootstrap's Sass source via npm rather than using the precompiled CSS
- Set up a Sass compiler to build custom CSS from source
- Understand the difference between the CDN/precompiled workflow used throughout this book and a source-based build
- Structure a project's custom Sass entry file

## Introduction
Every lesson in this book so far has used Bootstrap's precompiled CSS — either via CDN or a downloaded `bootstrap.min.css` file. This module marks a genuine shift: to customize Bootstrap at the level hinted at since Module 04 (truly comprehensive re-theming, beyond what CSS variable overrides in Module 10 could achieve), you need Bootstrap's original Sass SOURCE files, and a build step to compile them into your own custom CSS.

## Why Precompiled CSS Has a Ceiling
Recall from Module 10, Lesson 03: overriding `--bs-primary` as a CSS custom property re-themes most components, but some component internals reference derived variables calculated by Sass at build time, which a runtime CSS override can't reach. The only way to change those derived values is to recompile Bootstrap from source with different Sass variable inputs — which is exactly this module's subject.

## Installing Bootstrap via npm
```bash
npm init -y
npm install bootstrap @popperjs/core
npm install -D sass
```

Two important distinctions from anything installed so far in this curriculum:
- **`bootstrap`** — installs the full package, including `scss/` source files (not just the compiled `dist/css` and `dist/js` you'd get from a CDN link)
- **`sass`** (installed as a dev dependency, via `-D`) — the actual Sass-to-CSS compiler; Sass is a CSS preprocessor language, and browsers cannot run `.scss` files directly, so this compilation step is mandatory, not optional

## Project Structure
A typical custom Sass setup:

project/
├── scss/
│ └── custom.scss
├── css/
│ └── (compiled output goes here)
├── package.json


## The Custom Entry File
```scss
// scss/custom.scss

// Your variable overrides go here, BEFORE the Bootstrap import
$primary: #6f42c1;

// Import all of Bootstrap
@import "../node_modules/bootstrap/scss/bootstrap";
```

This ordering is the single most important concept in this entire module, previewed here and expanded fully in Lesson 02: Sass variables must be defined BEFORE Bootstrap's own source is imported, because Sass variables use a "first definition wins, unless marked `!default`" resolution rule — Bootstrap's internal variables are all declared with `!default`, meaning your own value, if set first, takes precedence over Bootstrap's built-in default.

## Compiling
```bash
npx sass scss/custom.scss css/custom.css
```

For continuous rebuilding during development (watching for file changes, similar in spirit to a dev server, though this is compile-only rather than live-reloading):

```bash
npx sass --watch scss/custom.scss css/custom.css
```

## Using the Compiled Output
The resulting `css/custom.css` replaces the CDN `<link>` you've used in every earlier module:

```html
<link rel="stylesheet" href="css/custom.css">
```

Bootstrap's JavaScript bundle (for components requiring it, per Module 08) is unaffected by any of this — you'd continue including it exactly as before, via CDN or an npm-managed bundle; this module's Sass workflow only concerns the CSS half of the framework.

## Practical Example
A minimal working custom build with one variable override, ready to compile:

```scss
// scss/custom.scss
$primary: #ff6b35;
$font-family-sans-serif: "Inter", sans-serif;

@import "../node_modules/bootstrap/scss/bootstrap";
```

```bash
npx sass scss/custom.scss css/custom.css
```

```html
<link rel="stylesheet" href="css/custom.css">
<div class="container py-4">
  <button class="btn btn-primary">This button is now orange, using Inter font</button>
</div>
```

## Revision Questions

<details>
<summary>1. Why can't a CSS-variable override alone (Module 10's approach) achieve everything a Sass-level customization can?</summary>
Some component internals reference variables that are derived from base values via Sass calculations at BUILD time; a runtime CSS override of the base variable doesn't recalculate those already-compiled derived values, which only a fresh Sass compilation can do.
</details>

<details>
<summary>2. Why is a Sass compiler (like the `sass` npm package) mandatory rather than optional?</summary>
Browsers cannot run `.scss` files directly — Sass is a preprocessor language that must be compiled into plain CSS before a browser can use it.
</details>

<details>
<summary>3. Where must your custom Sass variable overrides be placed relative to Bootstrap's own `@import`, and why?</summary>
Before the import — Sass resolves variables on a first-definition-wins basis when the later definition uses `!default` (which all of Bootstrap's internal variables do), so your value defined first takes precedence over Bootstrap's built-in default.
</details>

<details>
<summary>4. Does switching to a custom Sass build change how Bootstrap's JavaScript bundle is included?</summary>
No — this module's workflow only concerns the CSS half of the framework; the JS bundle continues to be included exactly as in every earlier module.
</details>
