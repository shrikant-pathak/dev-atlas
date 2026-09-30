# Lesson 09: Alignment, Justify, and Gap

## Learning Objectives
- Distinguish the main axis (`justify-*`) from the cross axis (`items-*`) in a flex container
- Apply `gap-*` to add consistent spacing inside flex and grid containers
- Use `self-*` to override alignment for a single item

## Introduction
This lesson covers Flexbox and Grid's two alignment axes together, since the same class names (`items-*`, `justify-*`) apply to both display modes (Grid coverage begins in Lesson 10, but the alignment vocabulary is shared).

## Main Axis: `justify-*`

`justify-*` controls alignment along the main axis — horizontal in a `flex-row` container, vertical in `flex-col`.

| Class | CSS |
|---|---|
| `justify-start` | `justify-content: flex-start` (default) |
| `justify-center` | `justify-content: center` |
| `justify-end` | `justify-content: flex-end` |
| `justify-between` | `justify-content: space-between` |
| `justify-around` | `justify-content: space-around` |
| `justify-evenly` | `justify-content: space-evenly` |

```html
<div class="flex justify-between">
  <span>Logo</span>
  <span>Nav links</span>
  <span>Sign up</span>
</div>
```

## Cross Axis: `items-*`

`items-*` (`align-items`) controls alignment perpendicular to the main axis — vertical in `flex-row`, horizontal in `flex-col`.

| Class | CSS |
|---|---|
| `items-start` | `align-items: flex-start` |
| `items-center` | `align-items: center` |
| `items-end` | `align-items: flex-end` |
| `items-stretch` | `align-items: stretch` (default) |
| `items-baseline` | `align-items: baseline` |

```html
<div class="flex items-center gap-4">
  <img class="size-12 rounded-full" src="/avatar.jpg" alt="" />
  <div>
    <p class="font-semibold">Name</p>
    <p class="text-sm text-gray-500">Title</p>
  </div>
</div>
```

`items-center` here vertically centers the avatar next to two lines of text of differing heights — one of the most frequently used utilities in this entire framework.

## Per-Item Override: `self-*`

`self-*` (`align-self`) overrides the container's `items-*` value for one specific item:

```html
<div class="flex items-center gap-4">
  <div>Aligned with container (centered)</div>
  <div class="self-start">This one aligns to the top instead</div>
</div>
```

## Gap

`gap-*` adds space between flex or grid children, using the spacing scale from Lesson 2 — without adding margin to individual children (unlike `space-x-*`/`space-y-*` from Lesson 2, which use margins and work on any siblings; `gap` uses the native CSS `gap` property and requires a `flex` or `grid` container).

```html
<div class="flex gap-4">
  <div class="bg-blue-200 p-4">A</div>
  <div class="bg-blue-200 p-4">B</div>
</div>
```

`gap-x-*` and `gap-y-*` set horizontal and vertical gaps independently — particularly useful in Grid layouts (Lesson 10), where rows and columns often need different spacing.

## Practical Example

A card header combining every concept from this lesson: main-axis space-between, cross-axis centering, and a gap:

```html
<div class="flex items-center justify-between gap-4 border-b p-4">
  <div class="flex items-center gap-3">
    <img class="size-10 rounded-full" src="/avatar.jpg" alt="" />
    <span class="font-semibold">Team Update</span>
  </div>
  <button class="self-center rounded bg-gray-100 px-3 py-1 text-sm">Follow</button>
</div>
```

## Summary
`justify-*` aligns along the main axis; `items-*` aligns along the cross axis; `self-*` overrides alignment for a single item. `gap-*` (with `gap-x-*`/`gap-y-*`) adds spacing between flex or grid children using the native `gap` property, distinct from the margin-based `space-x-*`/`space-y-*` utilities from Lesson 2.

## Revision Questions

<details>
<summary>1. In a `flex-row` container, does `justify-center` center items horizontally or vertically? What about `items-center`?</summary>

`justify-center` centers along the main axis, which is horizontal in a `flex-row` container. `items-center` centers along the cross axis, which is vertical in a `flex-row` container.
</details>

<details>
<summary>2. How would you vertically align just one item differently from the rest of a flex row?</summary>

Apply a `self-*` utility (e.g., `self-start`) to that specific item, overriding the container's `items-*` value for that item only.
</details>

<details>
<summary>3. What's the key structural requirement for `gap-*` to have any effect, that `space-x-*`/`space-y-*` doesn't share?</summary>

`gap-*` only works inside a `flex` or `grid` container, since it uses the native CSS `gap` property. `space-x-*`/`space-y-*` work on any set of sibling elements regardless of display mode, since they're implemented via margins.
</details>
