# Lesson 04: Text Wrap, Truncation, and Line Clamp

## Learning Objectives
- Control text wrapping behavior, including the v4 `text-balance` and `text-pretty` utilities
- Truncate single-line text with an ellipsis using `truncate`
- Limit text to a fixed number of lines with `line-clamp-*`

## Introduction
Real content is unpredictable in length — user-generated titles, article summaries, and dynamic labels all need rules for what happens when text is too long for its container. This lesson covers Tailwind's text-wrapping and truncation utilities, including two newer CSS features Tailwind exposes directly.

## Text Wrap Utilities

| Class | CSS | Effect |
|---|---|---|
| `text-wrap` | `text-wrap: wrap` | normal wrapping (default) |
| `text-nowrap` | `text-wrap: nowrap` | never wraps, stays on one line |
| `text-balance` | `text-wrap: balance` | balances line lengths evenly |
| `text-pretty` | `text-wrap: pretty` | avoids orphans (a lone short word on the last line) |

`text-balance` is particularly valuable on headlines: without it, a wrapped heading might leave one word awkwardly alone on its last line; `text-balance` redistributes words across lines to make them visually even in length.

```html
<h1 class="max-w-md text-4xl font-bold text-balance">
  This headline will wrap across two lines with balanced lengths
</h1>
```

`text-pretty` is a gentler alternative, intended for body paragraphs rather than headlines — it only tries to avoid a lone orphan word on the final line, without redistributing the whole block as aggressively as `text-balance`.

## Single-Line Truncation: `truncate`

```html
<p class="w-48 truncate">
  This is a long title that will be cut off with an ellipsis
</p>
```

`truncate` is a convenient shorthand bundling three CSS properties: `overflow: hidden`, `text-overflow: ellipsis`, and `white-space: nowrap`. It requires the element to have a constrained width (a fixed `w-*`, or a flex/grid item that's been constrained) — without a width limit, there's nothing for the text to overflow against.

## Multi-Line Truncation: `line-clamp-*`

For truncating after a specific number of lines rather than forcing everything onto one line, use `line-clamp-*`:

```html
<p class="line-clamp-3 w-64">
  A longer piece of body text that will be clamped to exactly three lines,
  with the remaining content hidden and an ellipsis shown at the cutoff point,
  regardless of how much more text actually exists beyond this point.
</p>
```

`line-clamp-1` through `line-clamp-6` are available, plus `line-clamp-none` to remove clamping. This is the standard pattern for article preview cards, comment previews, and search result snippets — anywhere you want a consistent, predictable card height regardless of how long the underlying content actually is.

## Practical Example

A card grid where every card maintains a consistent height despite varying title and description lengths:

```html
<div class="grid grid-cols-3 gap-6">
  <div class="rounded-lg border p-4">
    <h3 class="truncate font-semibold">A Title That Might Be Quite Long Indeed</h3>
    <p class="mt-2 line-clamp-3 text-sm text-gray-600">
      A description of varying length that gets clamped consistently across
      every card in the grid, keeping the overall layout visually even no
      matter how much content each individual card actually has.
    </p>
  </div>
  <!-- repeat for other cards -->
</div>
```

## Summary
`text-wrap`/`text-nowrap` control basic wrapping; `text-balance` evens out line lengths (best for headlines) and `text-pretty` avoids orphan words (best for body text) — both backed by relatively new native CSS properties. `truncate` clips single-line text with an ellipsis (requires a constrained width); `line-clamp-*` clips after a specific number of lines, the standard technique for keeping card layouts visually consistent.

## Revision Questions

<details>
<summary>1. What's the difference between `text-balance` and `text-pretty`, and which is better suited to a headline vs. a body paragraph?</summary>

`text-balance` redistributes words across all lines to make their lengths visually even — best for headlines. `text-pretty` only tries to avoid a lone orphan word on the final line, a gentler adjustment better suited to body paragraphs.
</details>

<details>
<summary>2. Why does `truncate` have no visible effect on an element with no width constraint?</summary>

`truncate` relies on `overflow: hidden` and `text-overflow: ellipsis`, both of which require the element to actually overflow its box — without a fixed or constrained width, there's nothing for the text to overflow against, so it just wraps or extends normally instead.
</details>

<details>
<summary>3. Why is `line-clamp-3` commonly used in card-based layouts specifically?</summary>

It keeps every card's height visually consistent regardless of how long each card's actual underlying content is, by clamping text to a fixed number of lines and showing an ellipsis at the cutoff — important for keeping a grid of cards visually even.
</details>
