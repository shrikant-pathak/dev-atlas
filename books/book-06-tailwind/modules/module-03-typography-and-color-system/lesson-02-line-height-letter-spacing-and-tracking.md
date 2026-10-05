# Lesson 02: Line Height, Letter Spacing, and Tracking

## Learning Objectives
- Override default line-height with `leading-*` utilities
- Apply letter-spacing adjustments with `tracking-*`
- Recognize when tight leading/tracking improves large display text

## Introduction
Lesson 1 noted that `text-*` sizes bundle default line-heights automatically. This lesson covers overriding that default deliberately, plus letter-spacing — two properties that matter most at the extremes: very large display text, and very small UI labels.

## Line Height: `leading-*`

Two kinds of `leading-*` values exist: named, relative values, and absolute numeric values.

| Class | CSS |
|---|---|
| `leading-none` | `line-height: 1` |
| `leading-tight` | `line-height: 1.25` |
| `leading-snug` | `line-height: 1.375` |
| `leading-normal` | `line-height: 1.5` |
| `leading-relaxed` | `line-height: 1.625` |
| `leading-loose` | `line-height: 2` |
| `leading-3`…`leading-10` | absolute values on the spacing scale |

```html
<h1 class="text-6xl font-bold leading-none">
  Big Display Headline
</h1>
<p class="text-base leading-relaxed">
  Body copy that benefits from slightly looser line spacing for readability
  across multiple lines.
</p>
```

A large headline (`text-6xl`) with its *default* line-height often looks oddly spaced-out, since the default scales proportionally with size — `leading-none` or `leading-tight` is the standard fix for big display text, pulling lines close together for a punchy, compact look.

## Letter Spacing: `tracking-*`

| Class | CSS |
|---|---|
| `tracking-tighter` | `-0.05em` |
| `tracking-tight` | `-0.025em` |
| `tracking-normal` | `0em` (default) |
| `tracking-wide` | `0.025em` |
| `tracking-wider` | `0.05em` |
| `tracking-widest` | `0.1em` |

```html
<span class="text-xs font-semibold uppercase tracking-wide text-gray-500">
  Category Label
</span>
```

`tracking-wide` (or `wider`) combined with `uppercase` and a small size is an extremely common pattern for eyebrow labels, badges, and section overlines — the extra letter-spacing compensates for how cramped all-caps text looks at tight default tracking.

Conversely, `tracking-tight` or `tracking-tighter` is common on large, bold display headlines, where default spacing can look slightly loose at very large sizes.

## Practical Example

A hero section combining both techniques — tight leading and tracking on the headline, wide tracking on a small label above it:

```html
<section class="py-20 text-center">
  <span class="text-xs font-semibold uppercase tracking-widest text-indigo-600">
    New Release
  </span>
  <h1 class="mt-2 text-6xl font-extrabold leading-none tracking-tight text-gray-900">
    Build Faster
  </h1>
</section>
```

## Summary
`leading-*` overrides the default line-height bundled with a `text-*` size — large display text typically wants `leading-none`/`leading-tight` to avoid looking too loose. `tracking-*` adjusts letter spacing — `tracking-wide`/`wider` suits small uppercase labels, while `tracking-tight`/`tighter` suits large bold headlines.

## Revision Questions

<details>
<summary>1. Why does a `text-6xl` heading often look better with `leading-none` or `leading-tight` applied?</summary>

The default line-height scales proportionally with font size, which can look disproportionately loose at very large sizes — tightening it with `leading-none`/`leading-tight` produces a more compact, intentional-looking headline.
</details>

<details>
<summary>2. Why is `tracking-wide` so commonly paired with `uppercase` text?</summary>

All-caps text looks visually cramped at normal letter-spacing; the extra spacing from `tracking-wide`/`wider` compensates for this, which is why the combination is standard for small eyebrow labels and badges.
</details>

<details>
<summary>3. What's the difference between `leading-tight` and `leading-3`?</summary>

`leading-tight` is a relative value (`line-height: 1.25`, scaling with the element's font-size). `leading-3` is an absolute value from the spacing scale (a fixed length), not relative to font-size.
</details>
