# Lesson 08: Text and Background Colors with Opacity

## Learning Objectives
- Apply background color utilities alongside the text color utilities from Lesson 3
- Use the slash opacity syntax to set per-utility color transparency
- Understand why v4 removed the separate `bg-opacity-*`/`text-opacity-*` utilities

## Introduction
This lesson covers background colors and a detail that affects every color utility in Tailwind: controlling transparency. v4 changed how this works in a way that's simpler but worth understanding explicitly, especially if you're referencing older v3 tutorials.

## Background Color

```html
<div class="bg-white"></div>
<div class="bg-gray-100"></div>
<div class="bg-indigo-600"></div>
```

`bg-{color}-{shade}` follows the identical palette and shade scale from Lesson 7 — any color/shade combination that works for `text-*` also works for `bg-*`, `border-*`, and every other color-accepting utility category.

## The Opacity Slash Syntax

To apply a color at partial transparency, append a slash and a percentage directly to the color utility:

```html
<div class="bg-black/50"></div>       <!-- black at 50% opacity -->
<p class="text-blue-600/75">...</p>   <!-- blue text at 75% opacity -->
<div class="border-gray-900/20"></div> <!-- subtle border -->
```

This single, consistent syntax works identically across every color utility category — background, text, border, ring, and more — and accepts any value from 0 to 100, including arbitrary values like `bg-black/[0.37]` for a precise, non-standard percentage.

## Why This Replaced Separate Opacity Utilities (v3 → v4)

In v3, achieving the same result required a **separate** utility class alongside the color:

```html
<!-- v3 style — no longer the recommended approach -->
<div class="bg-black bg-opacity-50"></div>
```

This had a real limitation: `bg-opacity-50` set the opacity for *any* background color applied to that element, via a shared CSS custom property — meaning you couldn't easily have two differently-opaque background-related effects on the same element without extra workarounds. v4's slash syntax instead generates the exact RGBA/OKLCH-with-alpha value directly as part of the single utility, making each color+opacity combination its own independent, self-contained value with no shared state to conflict.

If you're following an older tutorial or inherited codebase using `bg-opacity-*`/`text-opacity-*`, know that these are legacy v3 patterns — the slash syntax is the current, recommended approach, and is what you should write in new code.

## Practical Example

A frosted-glass overlay effect combining a semi-transparent background with a semi-transparent border, a common modern UI pattern:

```html
<div class="fixed inset-0 flex items-center justify-center bg-black/40">
  <div class="rounded-xl border border-white/20 bg-white/80 p-8 backdrop-blur-sm">
    <p class="text-gray-900/90">Modal content with a frosted glass effect</p>
  </div>
</div>
```

Here, `bg-black/40` dims the backdrop, `bg-white/80` gives the modal itself a translucent white panel, `border-white/20` adds a subtle light border, and `backdrop-blur-sm` (a related effect covered fully in Module 04) blurs whatever's behind the panel — all composed from independent slash-opacity values with no shared opacity state between them.

## Summary
Background colors (`bg-{color}-{shade}`) share the same palette and shade scale as text colors. Opacity is controlled via a slash suffix (`bg-black/50`) directly on the color utility — a single syntax that works across every color category and replaced v3's separate `bg-opacity-*`/`text-opacity-*` utilities, which shared opacity state across a whole element in a way the slash syntax avoids.

## Revision Questions

<details>
<summary>1. How would you apply a border color of gray-900 at 20% opacity using the current recommended syntax?</summary>

`border-gray-900/20`
</details>

<details>
<summary>2. What limitation did the v3 `bg-opacity-*` utility have that the v4 slash syntax avoids?</summary>

`bg-opacity-*` set opacity via a shared CSS custom property that applied to the element's background generally, making it awkward to combine multiple independently-opaque color effects on one element. The slash syntax bakes opacity directly into each individual color value, so each utility is self-contained with no shared state.
</details>

<details>
<summary>3. How would you set a precise, non-standard opacity value like 37% using the slash syntax?</summary>

An arbitrary value: `bg-black/[0.37]`
</details>
