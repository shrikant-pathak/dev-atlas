# Lesson 02: Outline and Ring

## Learning Objectives
- Apply `outline-*` utilities for accessible focus indicators
- Apply `ring-*` utilities as a box-shadow-based alternative to outlines
- Understand the v4 change to `ring`'s default width, and why it matters for migration

## Introduction
Both `outline-*` and `ring-*` draw a visible line around an element, and both are used heavily for focus states — but they're built on different CSS mechanisms with different trade-offs. This lesson covers both, plus a specific v3-to-v4 breaking change worth knowing if you're maintaining or migrating an existing project.

## Outline

`outline-*` maps to the native CSS `outline` property — the same mechanism browsers use for their default focus rings:

```html
<button class="outline outline-2 outline-offset-2 outline-blue-500">
  Focusable button
</button>
```

| Class | Effect |
|---|---|
| `outline` | `outline-style: solid` |
| `outline-0`, `outline-1`, `outline-2`, `outline-4`, `outline-8` | width |
| `outline-{color}-{shade}` | color, from the shared palette |
| `outline-offset-*` | gap between the element's edge and the outline |
| `outline-none` | removes outline entirely |
| `outline-dashed`/`outline-dotted` | style variants |

A key property of native outlines: they're drawn outside the element's box and **don't affect layout** — they never push neighboring elements, and (unlike borders) don't consume any of the element's own box space.

## Ring

`ring-*` achieves a visually similar effect using `box-shadow` instead of the native `outline` property:

```html
<button class="ring-2 ring-blue-500 ring-offset-2">
  Focusable button
</button>
```

| Class | Effect |
|---|---|
| `ring` / `ring-1` / `ring-2` / `ring-4` / `ring-8` | width |
| `ring-{color}-{shade}` | color |
| `ring-offset-{width}` | gap between the element and the ring (uses a second box-shadow layer) |
| `ring-inset` | draws the ring inside the element's edge instead of outside |

Because rings are implemented via `box-shadow`, they stack cleanly with actual `shadow-*` utilities (Lesson 3) on the same element — useful for combining a drop shadow with a focus ring without one overriding the other, which is harder to achieve cleanly with the native `outline` property layered alongside a shadow.

## The v4 Default Width Change (Migration Note)

In v3, the bare `ring` class (with no explicit width number) defaulted to a 3px-wide ring — a deliberately prominent default, chosen to make focus states very visible. In **v4, bare `ring` now defaults to 1px**, aligning more closely with typical native browser outline widths and most modern design systems' expectations.

This is a genuine breaking change if you're migrating a v3 project: any component relying on bare `ring` (without an explicit width like `ring-2`) will render a visibly thinner ring after upgrading. The fix is straightforward — explicitly specify the width you want (`ring-2` for the old default-equivalent look) rather than relying on the bare `ring` class's default.

## Choosing Between Outline and Ring

| | Outline | Ring |
|---|---|---|
| CSS mechanism | `outline` | `box-shadow` |
| Layout impact | None | None |
| Stacks with `shadow-*`? | Can conflict | Stacks cleanly |
| Common use | Default focus states, native-feeling | Custom focus rings, decorative borders needing shadow-layering |

For straightforward accessible focus states, `outline-*` is the more semantically correct, native-feeling choice. Reach for `ring-*` specifically when you need it to coexist with a `shadow-*` on the same element, or want the `ring-offset-*` effect (a visible gap matching the background color between the element and the ring, often used for a more polished, "floating ring" look).

## Practical Example

An input field styled with a default outline-based focus state, and a button using a ring combined with a shadow:

```html
<input
  type="text"
  class="rounded-md border border-gray-300 px-3 py-2 outline-none focus:outline-2 focus:outline-blue-500"
/>

<button class="rounded-md bg-white px-4 py-2 shadow-md ring-2 ring-indigo-500 ring-offset-2">
  Save Changes
</button>
```

## Summary
`outline-*` uses the native CSS `outline` property — no layout impact, the more semantically standard choice for focus states. `ring-*` uses `box-shadow`, stacking cleanly with `shadow-*` utilities and supporting `ring-offset-*` for a gapped look. v4 changed bare `ring`'s default width from 3px to 1px — explicitly specify a width (`ring-2`) when migrating a v3 project that relied on the old default.

## Revision Questions

<details>
<summary>1. What CSS property does `ring-*` actually use under the hood, and why does this matter for combining it with shadows?</summary>

`box-shadow`. Because both `ring-*` and `shadow-*` use `box-shadow`, Tailwind generates them as layered, independent `box-shadow` values on the same property, letting a ring and a drop shadow coexist cleanly on one element — something harder to achieve with the native `outline` property.
</details>

<details>
<summary>2. What's the v4 breaking change affecting the bare `ring` class, and how do you fix an affected component when migrating?</summary>

In v3, bare `ring` defaulted to a 3px width; in v4 it defaults to 1px. The fix is to explicitly specify the desired width (e.g., `ring-2`) rather than relying on the bare class's default.
</details>

<details>
<summary>3. Why doesn't an `outline` or `ring` push neighboring elements out of position, unlike a `border`?</summary>

Both `outline` and `box-shadow` (which `ring` uses) are drawn without consuming space in the normal document flow — they render visually outside the element's box without affecting its size or the position of its siblings, unlike `border`, which is part of the box model and does take up space.
</details>
