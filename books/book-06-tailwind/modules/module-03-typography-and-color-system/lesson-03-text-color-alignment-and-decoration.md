# Lesson 03: Text Color, Alignment, and Decoration

## Learning Objectives
- Apply text color utilities using Tailwind's color palette
- Control text alignment, including logical `text-start`/`text-end`
- Apply and customize text decoration (underline, strikethrough) and its styling

## Introduction
This lesson covers the remaining everyday text utilities: color, alignment, and decoration. Full color system depth (the palette itself, OKLCH, opacity) is covered in Lessons 7–8 — this lesson focuses on applying color to text specifically, alongside alignment and decoration.

## Text Color

```html
<p class="text-gray-700">Standard body text</p>
<p class="text-red-600">Error message</p>
<p class="text-green-600">Success message</p>
```

`text-{color}-{shade}` follows the same palette as every other color utility in Tailwind — covered fully in Lesson 7.

## Text Alignment

| Class | CSS |
|---|---|
| `text-left` | `text-align: left` |
| `text-center` | `text-align: center` |
| `text-right` | `text-align: right` |
| `text-justify` | `text-align: justify` |
| `text-start` | `text-align: start` (logical, RTL-aware) |
| `text-end` | `text-align: end` (logical, RTL-aware) |

`text-start`/`text-end` are logical-property equivalents of `text-left`/`text-right` — like `start-*`/`end-*` from Module 02, they automatically flip for right-to-left languages. Prefer them over the physical `left`/`right` versions in any app that might support RTL content.

## Text Decoration

```html
<a class="underline decoration-blue-500 decoration-2 underline-offset-4" href="#">
  A styled link
</a>
<p class="line-through text-gray-400">Discontinued item</p>
```

| Class | Effect |
|---|---|
| `underline` | adds an underline |
| `overline` | adds a line above the text |
| `line-through` | strikethrough |
| `no-underline` | removes decoration |

Beyond the base decoration, Tailwind lets you style the decoration line itself, independent of the text color:

- `decoration-{color}` — colors just the underline/strikethrough line, not the text
- `decoration-{width}` (`decoration-1`, `decoration-2`, `decoration-4`, etc.) — line thickness
- `decoration-{style}` (`decoration-solid`, `decoration-dashed`, `decoration-wavy`, etc.) — line style
- `underline-offset-{n}` — gap between text and the underline

This separation (text color vs. decoration color) matters for things like a colored link where you want a subtler-colored underline than the link text itself — a common refined-UI pattern.

## Practical Example

A pricing card using alignment, color, and decoration together:

```html
<div class="rounded-lg border p-6 text-center">
  <p class="text-sm font-semibold uppercase tracking-wide text-gray-500">Pro Plan</p>
  <p class="mt-2 text-4xl font-bold text-gray-900">
    $29 <span class="text-base font-normal text-gray-500">/month</span>
  </p>
  <p class="mt-1 text-sm text-gray-400 line-through">$49/month</p>
  <a class="mt-4 inline-block text-indigo-600 underline decoration-indigo-300 underline-offset-2" href="#">
    See all features
  </a>
</div>
```

## Summary
Text color follows Tailwind's shared palette (`text-{color}-{shade}`). Alignment includes both physical (`text-left`/`right`) and logical, RTL-aware (`text-start`/`text-end`) options. Decoration utilities (`underline`, `line-through`) can be styled independently via `decoration-{color}`, `decoration-{width}`, `decoration-{style}`, and `underline-offset-*`.

## Revision Questions

<details>
<summary>1. Why might you prefer `text-start` over `text-left` in an internationalized application?</summary>

`text-start` is a logical property that automatically flips alignment direction for right-to-left languages, while `text-left` is a fixed physical direction regardless of text direction.
</details>

<details>
<summary>2. How would you underline a link in blue text, but make the underline itself a lighter shade than the text?</summary>

Apply `text-blue-600` for the text color and a separate, lighter `decoration-blue-300` for the underline's color — decoration color is independent of text color.
</details>

<details>
<summary>3. What's the difference in effect between `underline-offset-4` and `decoration-2`?</summary>

`underline-offset-4` controls the gap between the text baseline and the underline. `decoration-2` controls the thickness of the decoration line itself — they're independent properties that can be combined.
</details>
