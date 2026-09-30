# Lesson 08: Flex Sizing and Order

## Learning Objectives
- Control how flex items grow and shrink with `grow`, `shrink`, and `basis`
- Use the `flex-1`/`flex-auto`/`flex-initial`/`flex-none` shorthands
- Reorder flex items visually with `order-*`, independent of DOM order

## Introduction
Once items are inside a flex container (Lesson 7), you often need to control how they share available space — should one item take up all remaining room, or stay a fixed size? This lesson covers Flexbox's sizing properties (`flex-grow`, `flex-shrink`, `flex-basis`) and how Tailwind bundles them into convenient shorthand classes.

## The Three Sizing Properties

- **`flex-basis`** — an item's starting size before growing/shrinking is applied
- **`flex-grow`** — whether an item expands to consume available extra space
- **`flex-shrink`** — whether an item shrinks when space is too tight

Tailwind exposes these individually (`grow`, `grow-0`, `shrink`, `shrink-0`, `basis-*` using the spacing scale from Lesson 2), but you'll use the combined shorthand classes far more often in practice.

## Shorthand Classes

| Class | Equivalent | Behavior |
|---|---|---|
| `flex-1` | `flex: 1 1 0%` | Grows and shrinks freely, ignoring its content size |
| `flex-auto` | `flex: 1 1 auto` | Grows and shrinks, but starts from its content's natural size |
| `flex-initial` | `flex: 0 1 auto` | Shrinks if needed, but doesn't grow (default-ish behavior) |
| `flex-none` | `flex: none` | Never grows or shrinks — stays exactly its set size |

```html
<div class="flex gap-4">
  <div class="flex-none w-24 bg-gray-300 p-4">Sidebar (fixed)</div>
  <div class="flex-1 bg-blue-100 p-4">Main content (fills remaining space)</div>
</div>
```

This is the single most useful pattern in this lesson: a fixed-width sidebar (`flex-none w-24`) next to a main area that automatically fills whatever space is left (`flex-1`) — no manual percentage math required, and it adapts automatically if the sidebar's width ever changes.

## Order

`order-*` changes an item's visual position in the flex container without touching the DOM/HTML order — useful for reordering content differently across breakpoints without duplicating markup.

```html
<div class="flex flex-col md:flex-row">
  <div class="order-2 md:order-1">Sidebar</div>
  <div class="order-1 md:order-2">Main content (shown first on mobile)</div>
</div>
```

On mobile, the main content appears above the sidebar (`order-1` beats `order-2`); at `md` and up, they swap back to their natural reading order. This matters for accessibility and SEO too — screen readers and search engines generally follow DOM order, so `order-*` should be used for visual reordering, not as a substitute for writing your HTML in a logical reading order in the first place.

## Practical Example

A three-column layout: fixed sidebar, flexible main content, fixed right rail:

```html
<div class="flex min-h-screen gap-4 p-4">
  <aside class="flex-none w-48 bg-gray-100 p-4">Navigation</aside>
  <main class="flex-1 bg-white p-4">Main content grows to fill available space</main>
  <aside class="flex-none w-64 bg-gray-100 p-4">Widgets</aside>
</div>
```

## Summary
`flex-1`/`flex-auto`/`flex-initial`/`flex-none` are shorthand combinations of `flex-grow`, `flex-shrink`, and `flex-basis`, with `flex-1` (grow/shrink freely) and `flex-none` (fixed size) being the two most common in real layouts — often paired to build a fixed-sidebar-plus-flexible-content pattern. `order-*` reorders items visually without changing DOM order, which should be reserved for visual-only reordering rather than replacing a logical HTML structure.

## Revision Questions

<details>
<summary>1. What combination of classes creates a fixed-width sidebar next to a main content area that fills all remaining space?</summary>

`flex-none` with a fixed width (e.g., `w-64`) on the sidebar, and `flex-1` on the main content area.
</details>

<details>
<summary>2. What's the difference between `flex-1` and `flex-auto`?</summary>

`flex-1` (`flex: 1 1 0%`) ignores the item's natural content size when growing/shrinking, distributing space purely by ratio. `flex-auto` (`flex: 1 1 auto`) starts from the item's natural content size before growing or shrinking.
</details>

<details>
<summary>3. Why should `order-*` be used carefully with respect to accessibility?</summary>

Screen readers and search engines generally follow DOM order, not visual order — so `order-*` should only be used for visual-only reordering, not as a substitute for writing HTML in a logical reading sequence in the first place.
</details>
