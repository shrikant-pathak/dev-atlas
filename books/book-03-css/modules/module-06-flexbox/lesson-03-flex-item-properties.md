# Lesson 03: Flex Item Properties

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `flex-grow`, `flex-shrink`, and `flex-basis` correctly.
- Understand the `flex` shorthand and its common presets.
- Override individual item alignment with `align-self` and reorder items with `order`.

---

# Introduction

Lesson 02 covered properties on the *container*; this lesson covers properties applied to the **individual flex items themselves** — controlling how each one grows, shrinks, and behaves independently within the flex layout.

---

# `flex-grow`

```css
.item {
  flex-grow: 1;
}
```

Controls how much an item **grows** to fill available extra space, relative to its siblings. `flex-grow: 0` (the default) means an item won't grow beyond its natural size, even if extra space is available.

```css
.item-a { flex-grow: 1; }
.item-b { flex-grow: 2; }
```
If extra space is available, `.item-b` grows **twice as much** as `.item-a` — the numbers represent a *proportion*, not an absolute value.

---

# `flex-shrink`

```css
.item {
  flex-shrink: 1; /* default — items shrink proportionally if space runs out */
}
.item-protected {
  flex-shrink: 0; /* this item will NEVER shrink, even if others must */
}
```

The inverse of `flex-grow` — controls how much an item shrinks when there isn't enough space for all items at their natural size. `flex-shrink: 0` is genuinely useful for elements that must never be compressed (like a fixed-width logo or icon that would look broken if squeezed).

---

# `flex-basis`

```css
.item {
  flex-basis: 200px; /* the item's "ideal" starting size before growing/shrinking is calculated */
}
```

Sets the item's initial main-axis size, before `flex-grow`/`flex-shrink` are applied — genuinely similar to `width` (in a row layout), but specifically respected by the flex layout algorithm as the starting point for grow/shrink calculations. `flex-basis: auto` (the default) uses the item's own content size or explicit `width` if set.

---

# The `flex` Shorthand

```css
.item {
  flex: 1; /* shorthand for: flex-grow: 1; flex-shrink: 1; flex-basis: 0; */
}
```

**`flex: 1` is genuinely one of the most-used single declarations in all of real-world Flexbox code** — it makes an item grow to fill available space, shrink if needed, and ignore its natural content size as a starting point (starting from `0` instead) — the standard way to make flex items share space equally:

```css
.item-a, .item-b, .item-c {
  flex: 1; /* all three items split the available space equally */
}
```

**Common shorthand presets:**
```css
flex: 1;          /* grow, shrink, basis 0 — equal sharing */
flex: auto;         /* grow, shrink, basis auto — respects content size first */
flex: none;           /* grow: 0, shrink: 0 — completely rigid, never resizes */
flex: 0 0 200px;        /* explicit: no grow, no shrink, fixed 200px basis */
```

---

# `align-self`: Overriding One Item's Alignment

```css
.container {
  display: flex;
  align-items: center; /* applies to all items by default */
}
.special-item {
  align-self: flex-end; /* this ONE item overrides the container's align-items */
}
```

`align-self` lets a single flex item break from the container's overall `align-items` rule — genuinely useful for one particular item needing different cross-axis alignment from its siblings.

---

# `order`: Visually Reordering Items

```css
.item-a { order: 2; }
.item-b { order: 1; }
.item-c { order: 3; }
```

By default, all items have `order: 0` and display in their natural HTML source order. Setting explicit `order` values visually reorders them — `.item-b` (order: 1) would display first, then `.item-a` (order: 2), then `.item-c` (order: 3), regardless of their actual order in the HTML.

**A genuine accessibility caution:** `order` only changes *visual* order — screen readers and keyboard tab order still follow the original HTML source order, which can create a confusing mismatch between what's seen and what's announced/navigated. Use `order` for minor visual adjustments, not to fundamentally restructure content in ways that would confuse non-visual users.

---

# Practical Example

```css
.sidebar {
  flex: 0 0 250px; /* fixed 250px, never grows or shrinks */
}
.main-content {
  flex: 1; /* takes up all remaining space */
}

.card {
  flex-shrink: 0; /* cards in a horizontal scrolling row never compress */
}

.featured-item {
  order: -1; /* visually moved to the front, regardless of HTML position */
}
```

---

# Revision Questions

1. What does `flex: 1` actually set, as shorthand?
2. What's the difference between `flex-grow` and `flex-shrink`?
3. What accessibility caution applies to the `order` property?

<details><summary>Answers</summary>

1. `flex-grow: 1; flex-shrink: 1; flex-basis: 0;` — making the item grow/shrink to share available space equally with siblings using the same value.
2. `flex-grow` controls how much an item expands to fill extra available space; `flex-shrink` controls how much it compresses when there isn't enough space for all items at their natural size.
3. `order` only changes visual order — screen readers and keyboard tab order still follow the original HTML source order, potentially creating a confusing mismatch for non-visual users if used to drastically restructure content.

</details>