# Lesson 06: Web Fonts and Font Features

## Learning Objectives
- Load and apply a custom web font, replacing Tailwind's default stacks
- Apply font-variant-numeric utilities for tabular and stylistic number formatting
- Apply antialiasing utilities for crisper text rendering

## Introduction
Lesson 1 covered Tailwind's three default font stacks. Most real brands want a custom typeface. This lesson covers loading a web font and wiring it into Tailwind's theme, plus a few specialized utilities for number formatting and rendering quality.

## Loading a Custom Font

The most common approach is linking a hosted font service (Google Fonts) in your HTML, then registering it as a theme variable so it becomes available as a `font-*` utility (full `@theme` customization is covered in Module 06, previewed here for this specific use case):

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
```

```css
/* your CSS entry point */
@import "tailwindcss";

@theme {
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
}
```

Now `font-sans` (and since it's typically the default body font, plain unstyled text) uses Inter instead of the system font stack, with the original system stack kept as a fallback chain for any device where Inter hasn't loaded yet.

For self-hosted fonts (often preferred for performance and privacy over a third-party font service), the same `@theme` registration applies, but you additionally declare the font file via a standard `@font-face` rule in your CSS before referencing it in `--font-sans`.

## Font Variant Numeric Utilities

Fonts often support multiple numeral styles, and Tailwind exposes them directly:

| Class | Effect |
|---|---|
| `tabular-nums` | fixed-width digits, so numbers align in columns (tables, timers, financial figures) |
| `lining-nums` | uniform-height digits (default in most UI contexts) |
| `oldstyle-nums` | digits with varying heights, blending into body text (editorial contexts) |
| `diagonal-fractions` | formats fractions like `1/2` as a stacked diagonal glyph |

```html
<table class="tabular-nums">
  <tr><td>Revenue</td><td>$1,204.50</td></tr>
  <tr><td>Expenses</td><td>$832.10</td></tr>
</table>
```

`tabular-nums` is the one you'll reach for most often — without it, proportionally-spaced digits (where a `1` is narrower than an `8`) cause misaligned columns in any table of numbers, which looks sloppy in financial or data-heavy UIs.

## Antialiasing

```html
<body class="antialiased">
```

`antialiased` applies `-webkit-font-smoothing: antialiased` and `-moz-osx-font-smoothing: grayscale`, producing thinner, crisper text rendering on macOS/iOS WebKit browsers — a very common default applied to the `<body>` in Tailwind projects, since many designers feel it more closely matches how text renders in native design tools.

## Practical Example

A dashboard applying a custom font, tabular numbers for a data table, and body-wide antialiasing:

```html
<body class="antialiased">
  <main class="font-sans">
    <h1 class="text-2xl font-bold">Monthly Report</h1>
    <table class="mt-4 tabular-nums">
      <tr><td class="pr-4">Total Sales</td><td>$48,210.00</td></tr>
      <tr><td class="pr-4">Refunds</td><td>$1,340.25</td></tr>
    </table>
  </main>
</body>
```

## Summary
Custom web fonts are loaded via a `<link>` tag (or self-hosted `@font-face`) and registered as a `--font-*` theme variable, making them available through the normal `font-*` utilities with the original system stack preserved as fallback. `tabular-nums` fixes misaligned digit columns in tables of numbers, and `antialiased` produces crisper text rendering on WebKit platforms.

## Revision Questions

<details>
<summary>1. After registering a custom font as `--font-sans` in `@theme`, why is it good practice to keep `ui-sans-serif, system-ui, sans-serif` listed after it?</summary>

They act as a fallback chain — if the custom font hasn't finished loading yet, or fails to load at all, the browser falls back to a reasonable system font instead of showing completely unstyled serif text.
</details>

<details>
<summary>2. Why would a table of financial figures look misaligned without `tabular-nums`?</summary>

Most fonts use proportional-width digits by default (a `1` is narrower than an `8`), so columns of numbers don't align vertically. `tabular-nums` forces every digit to the same fixed width, keeping columns aligned.
</details>

<details>
<summary>3. What does the `antialiased` utility actually change, technically?</summary>

It sets `-webkit-font-smoothing: antialiased` and `-moz-osx-font-smoothing: grayscale`, producing thinner, crisper text rendering specifically on WebKit/Gecko-based browsers on macOS/iOS.
</details>
