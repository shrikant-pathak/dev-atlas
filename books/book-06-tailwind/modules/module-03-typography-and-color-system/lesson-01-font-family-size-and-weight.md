# Lesson 01: Font Family, Size, and Weight

## Learning Objectives
- Apply Tailwind's built-in font family stacks
- Use the `text-*` size scale and understand its bundled default line-heights
- Apply `font-*` weight utilities across the full 100–900 range

## Introduction
Typography is where a design starts to feel intentional rather than generic. This lesson covers the three most fundamental text properties — family, size, and weight — building on Book 03's typography chapter, now expressed as composable utility classes.

## Font Family

Tailwind ships three default font-family stacks, each a sensible cross-platform fallback chain:

| Class | Stack |
|---|---|
| `font-sans` | System UI sans-serif stack (default on most elements via Preflight) |
| `font-serif` | System UI serif stack |
| `font-mono` | System UI monospace stack |

```html
<p class="font-sans">Default UI text</p>
<blockquote class="font-serif">An elegant, editorial quote</blockquote>
<code class="font-mono">const x = 1;</code>
```

Custom brand fonts (Google Fonts, self-hosted) replace these stacks via the `@theme` directive — covered fully in Module 06, and web-font loading specifically in Lesson 6 of this module.

## Font Size

The `text-*` scale runs from `text-xs` up to `text-9xl`:

| Class | Size | Default line-height |
|---|---|---|
| `text-xs` | 0.75rem | 1rem |
| `text-sm` | 0.875rem | 1.25rem |
| `text-base` | 1rem | 1.5rem |
| `text-lg` | 1.125rem | 1.75rem |
| `text-xl` | 1.25rem | 1.75rem |
| `text-2xl` | 1.5rem | 2rem |
| `text-3xl`…`text-9xl` | increasingly larger | proportionally larger |

A detail worth internalizing: each `text-*` size utility **bundles a sensible default line-height** alongside the font-size — you don't need to separately set `leading-*` (Lesson 2) for ordinary body text to look correctly spaced. You only need to override `leading-*` explicitly when you want something other than that default, like tighter leading on a large display heading.

```html
<h1 class="text-4xl">Large Heading</h1>
<p class="text-base">Regular paragraph text, with comfortable default spacing.</p>
```

For a precise, non-scale size, use an arbitrary value: `text-[15px]`, or even set a custom line-height alongside it in one bracket pair: `text-[15px]/[1.4]`.

## Font Weight

| Class | CSS value |
|---|---|
| `font-thin` | 100 |
| `font-extralight` | 200 |
| `font-light` | 300 |
| `font-normal` | 400 |
| `font-medium` | 500 |
| `font-semibold` | 600 |
| `font-bold` | 700 |
| `font-extrabold` | 800 |
| `font-black` | 900 |

```html
<h2 class="text-2xl font-bold">Section Heading</h2>
<p class="text-base font-normal text-gray-700">Body copy at normal weight.</p>
<span class="text-sm font-medium text-gray-500">A slightly emphasized label</span>
```

Note that a given weight only renders correctly if the loaded font actually includes that weight's file (relevant once you're using custom web fonts — Lesson 6). The system font stacks used by `font-sans`/`font-serif`/`font-mono` support the full range by default.

## Practical Example

A typical content hierarchy combining family, size, and weight:

```html
<article class="font-sans">
  <h1 class="text-3xl font-bold text-gray-900">Article Title</h1>
  <p class="text-sm font-medium text-gray-500">By Jane Doe · 5 min read</p>
  <p class="mt-4 text-base font-normal text-gray-700">
    The article body uses normal weight at a comfortable reading size...
  </p>
</article>
```

## Summary
`font-sans`/`font-serif`/`font-mono` set the font family stack. `text-*` sets font size on a named scale, bundling a sensible default line-height with each step. `font-*` weight utilities cover the full 100–900 range, though a weight only renders if the loaded font file includes it.

## Revision Questions

<details>
<summary>1. Why don't you usually need to set `leading-*` explicitly alongside a `text-*` size utility?</summary>

Each `text-*` size bundles a sensible default line-height matched to that size — you only override it with `leading-*` when you want something different from that default.
</details>

<details>
<summary>2. How would you set a precise 15px font size with a custom 1.4 line-height, outside the standard scale?</summary>

An arbitrary value combining both: `text-[15px]/[1.4]`.
</details>

<details>
<summary>3. Why might `font-black` have no visible effect on some text, even though the class is applied correctly?</summary>

The loaded font must actually include a 900-weight file for that weight to render — if the active font family doesn't ship a black/900 weight, the browser falls back to the closest weight it does have, making the utility appear to have no effect.
</details>
