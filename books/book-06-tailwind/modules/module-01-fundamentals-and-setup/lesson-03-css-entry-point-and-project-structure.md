# Lesson 03: CSS Entry Point and Project Structure

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what the single `@import "tailwindcss";` line actually pulls in
- Organize a Tailwind project's CSS entry point, source files, and output
- Understand Preflight, Tailwind's base-style reset, and how it compares to a traditional CSS reset (Book 03)

## Introduction
In v3, your CSS entry point needed three separate directives:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

In v4, this collapsed into a single import:

```css
@import "tailwindcss";
```

This lesson unpacks what that one line actually does, and how to structure a real project's CSS around it.

## What `@import "tailwindcss"` Pulls In

That single import expands to three layers, in this order:

1. **Preflight** — a base-style reset (covered in detail below)
2. **Theme variables** — CSS custom properties for your entire design system (colors, spacing, fonts, breakpoints) generated from Tailwind's default theme, or your customizations (Module 06)
3. **Utilities** — every utility class Tailwind knows how to generate, produced on demand as you use them (Lesson 4 explains the "on demand" part in full)

You rarely need to think about these as separate pieces day-to-day, but understanding the layering matters once you start writing custom CSS alongside Tailwind (Module 06's `layer-apply-and-base-styles` lesson covers this precisely).

## Preflight: Tailwind's Base Reset

Recall from Book 03 that browsers ship inconsistent default styles — `<h1>` has different default margins across browsers, `<button>` inherits odd font styles, lists have default padding, and so on. A CSS reset (or normalize.css) is a common fix: a small stylesheet that zeroes out these inconsistencies before your own styles apply.

Preflight is Tailwind's built-in version of this. It's included automatically the moment you `@import "tailwindcss"` — you don't add it separately. Some of what it does:

- Removes default margins from every element (headings, paragraphs, lists, blockquotes)
- Resets `<h1>`–`<h6>` to inherit `font-size` and `font-weight` rather than having browser defaults, so every heading looks like plain text until you apply Tailwind's `text-*` and `font-*` utilities
- Removes default list bullets/numbers (`list-style: none`) on `<ul>` and `<ol>`
- Sets `border-style: solid` and `border-width: 0` by default on all elements, so `border` utilities behave predictably the moment you add a width

That last point matters in practice: because Preflight zeroes out default heading styles, a bare `<h1>Hello</h1>` will render as plain, unstyled text — this is expected, and you style it explicitly with utilities like `text-3xl font-bold`.

## Project Structure

A typical Vite + Tailwind project (following Lesson 2's Vite setup) looks like this:

my-app/
├── index.html
├── vite.config.ts
├── package.json
└── src/
├── main.tsx
├── index.css ← your Tailwind entry point
└── components/


`src/index.css` contains just the import (plus, later, your `@theme` customizations from Module 06):

```css
@import "tailwindcss";
```

For a CLI-based project (no bundler), the convention is an `input.css` → `output.css` pair:

my-site/
├── index.html
├── input.css ← @import "tailwindcss"; goes here
└── output.css ← generated, don't edit directly


`output.css` is a build artifact — never hand-edit it, since the next build overwrites it entirely. Link only `output.css` in your HTML.

## A Note on File Naming

There's no required naming convention — `index.css`, `style.css`, `app.css`, and `input.css` are all common. What matters structurally is:

- There's exactly one file where `@import "tailwindcss"` lives (your entry point)
- Any custom CSS or theme customization (Module 06) goes in that same file, or in files it imports
- The compiled output is never edited by hand

## Practical Example

A slightly more realistic entry point, once you start adding custom styles (a pattern Module 06 covers fully):

```css
/* src/index.css */
@import "tailwindcss";

/* Your own custom CSS can live here too */
@layer base {
  h1 {
    @apply text-3xl font-bold;
  }
}
```

Even here, notice the entry point is still a single file — you're not juggling three `@tailwind` directives, just adding to the one import.

## Summary
`@import "tailwindcss";` is the entire entry point v4 needs — it expands to Preflight (a base reset), your theme's CSS variables, and on-demand utility generation. Preflight removes browser default styling so every element starts from a predictable, unstyled baseline, which is why a bare `<h1>` looks like plain text until you apply utilities to it.

## Revision Questions

<details>
<summary>1. What three things does `@import "tailwindcss"` expand into?</summary>

Preflight (base reset), theme variables (CSS custom properties for your design system), and utilities (generated on demand).
</details>

<details>
<summary>2. Why does a bare `<h1>Hello</h1>` render as plain, unstyled text in a Tailwind project?</summary>

Because Preflight resets headings to inherit `font-size` and `font-weight` instead of using browser defaults — you're expected to style headings explicitly with utilities like `text-3xl font-bold`.
</details>

<details>
<summary>3. In a CLI-based project, which file should you never hand-edit, and why?</summary>

`output.css` (or whatever your generated file is named) — it's a build artifact that gets completely overwritten on the next build.
</details>

<details>
<summary>4. How does the v4 CSS entry point differ from v3's?</summary>

v3 required three separate directives (`@tailwind base; @tailwind components; @tailwind utilities;`); v4 collapses this into a single `@import "tailwindcss";`.
</details>
