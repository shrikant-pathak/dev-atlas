# Lesson 04: CSS Custom Properties in Bootstrap

## Learning Objectives
- Understand the two-layer relationship between Sass variables (build-time) and CSS custom properties (runtime)
- Know which changes require Sass recompilation vs. which can be made at runtime
- Combine both layers correctly in one project
- Recognize `root.scss`'s role in generating the `--bs-*` variables from Module 04

## Introduction
This lesson directly answers a question that's been implicit since Module 10, Lesson 03's caution about "deeper variable overrides": Bootstrap actually has TWO distinct customization layers, not one, and understanding exactly where the line falls between them is the single most practically useful concept in this entire module.

## The Two Layers, Precisely
- **Sass variables** (`$primary`, `$spacer`, `$theme-colors`, covered in Lesson 02) exist only at BUILD TIME. They're used to calculate CSS output when you run the Sass compiler; once compilation finishes, they no longer exist in any form a browser can see.
- **CSS custom properties** (`--bs-primary`, `--bs-body-bg`, used throughout Module 04, 09, and 10) exist at RUNTIME, inside the actual compiled CSS delivered to the browser, and can be read or overridden by browser DevTools, inline styles, or JavaScript, live, without any recompilation step.

## Where They Connect: `root.scss`
The bridge between these two layers is a specific partial file, briefly mentioned in Lesson 03: `_root.scss` is the file that takes Sass variable VALUES and generates the actual `:root { --bs-*: ...; }` CSS custom property declarations you've been using since Module 04:

```scss
// Simplified concept of what _root.scss generates:
:root {
  --bs-primary: #{$primary};   // Sass variable value baked into a CSS custom property
  --bs-body-bg: #{$body-bg};
  // ... one line per themed variable
}
```

This is precisely why Module 10's `data-bs-theme="dark"` runtime override works at all — it's overriding the CSS custom property side of this equation, which is exposed and mutable at runtime BECAUSE `_root.scss` deliberately generates it that way during the build.

## Deciding Which Layer to Use for a Given Change
This is the practical decision this lesson is building toward:
- **Use a Sass variable override (Lessons 01–03)** when the change should apply universally, at build time, before any page ever loads — a brand's permanent primary color, a project-wide font choice, a modified spacing scale.
- **Use a CSS custom property override (Module 10's approach)** when the change needs to happen dynamically, per-user or per-session, without a rebuild — dark/light mode toggling, a user-selected accent color, a runtime A/B test.

Getting this backwards causes real problems: trying to implement dark mode via Sass variables alone would require compiling and shipping two entirely separate CSS files, then swapping which one loads (clumsy and duplicative); trying to implement a permanent brand color via `data-bs-theme` runtime overrides alone would mean every page load pays a brief style recalculation cost for something that never actually changes and could have been baked in at build time instead.

## Combining Both Layers in One Project
Most real projects use both simultaneously — this is not an either/or choice:

```scss
// scss/custom.scss — Sass-level: permanent brand identity
$primary: #6f42c1;
$font-family-sans-serif: "Inter", sans-serif;

@import "../node_modules/bootstrap/scss/bootstrap";
// This compiles --bs-primary: #6f42c1 into the CSS, permanently
```

```html
<!-- Runtime layer, from Module 10, still works exactly the same on top of this custom build -->
<html data-bs-theme="dark">
```

The compiled `--bs-primary` value becomes the new BASE for both light and dark mode — dark mode's own variable overrides (Module 10, Lesson 01) still apply on top of whatever your custom Sass build compiled as the starting point.

## Practical Example
A project with a permanent Sass-level brand color, combined with the fully functional Module 10 dark-mode toggler running on top of it — demonstrating both layers working together without conflict:

```scss
// scss/custom.scss
$primary: #7c3aed;

@import "../node_modules/bootstrap/scss/bootstrap";
```

```html
<link rel="stylesheet" href="css/custom.css">
<html data-bs-theme="light">
  <button class="btn btn-primary" data-theme-value="dark">Switch to dark</button>
  <!-- Button is purple in both modes; only the background/text/border variables 
       change between light and dark, exactly as in Module 10 -->
</html>
```

## Revision Questions

<details>
<summary>1. What's the fundamental difference between when Sass variables exist versus when CSS custom properties exist?</summary>
Sass variables exist only at build time, used to calculate compiled CSS output, and disappear once compilation finishes; CSS custom properties exist at runtime, inside the delivered CSS, and can be read or changed live in the browser without recompilation.
</details>

<details>
<summary>2. What role does `_root.scss` play in connecting these two layers?</summary>
It's the partial file that takes Sass variable values and generates the actual `:root { --bs-*: ...; }` CSS custom property declarations — the mechanism that makes Sass-defined values visible and overridable at runtime.
</details>

<details>
<summary>3. Why does Module 10's `data-bs-theme="dark"` runtime toggle work at all, given that Sass variables no longer exist after compilation?</summary>
It overrides the CSS custom property side of the relationship, which `_root.scss` deliberately exposes as runtime-mutable during the build — the toggle never needs to touch Sass variables at all, since it operates entirely on the already-compiled CSS variable layer.
</details>

<details>
<summary>4. Give one example of a change that should be a Sass override, and one that should be a CSS custom property override.</summary>
Sass override: a brand's permanent primary color or project-wide font choice, decided once at build time. CSS custom property override: dark/light mode toggling or a per-user runtime accent color, needing to change dynamically without a rebuild.
</details>
