# Lesson 04: Overflow

## Learning Objectives
By the end of this lesson, you will be able to:
- Control what happens when content exceeds its container's size.
- Use `overflow-x`/`overflow-y` for axis-specific control.
- Recognize overflow's role in common real-world patterns.

---

# Introduction

This lesson covers what happens when content simply doesn't fit inside its box — a genuinely common, everyday layout situation with a dedicated property to control it precisely.

---

# The `overflow` Property

```css
.box {
  width: 300px;
  height: 150px;
  overflow: visible; /* default - content spills outside the box, unclipped */
}
```

- **`visible`** (default) — overflowing content simply spills outside the box's boundaries, fully visible but potentially overlapping surrounding content.
- **`hidden`** — overflowing content is clipped and completely hidden, with no way for the user to access it.
- **`scroll`** — always shows scrollbars (even if content doesn't actually overflow), letting users scroll to see clipped content.
- **`auto`** — shows scrollbars **only when actually needed** (content genuinely overflows) — generally the more user-friendly, commonly preferred choice over `scroll`.

---

# Axis-Specific Control

```css
.box {
  overflow-x: hidden;  /* clip horizontal overflow */
  overflow-y: auto;      /* scroll vertically only when needed */
}
```

Genuinely useful for a common real pattern: a fixed-height content area that should scroll vertically but never horizontally.

---

# Common Real-World Uses

**A scrollable comments/chat panel:**
```css
.comments-panel {
  height: 400px;
  overflow-y: auto;
}
```

**Clipping decorative content that overflows its container intentionally** (e.g., a large background shape peeking outside a card, deliberately clipped at the card's edge):
```css
.card {
  overflow: hidden;
  border-radius: 12px; /* combined with overflow: hidden, this also clips CHILD content to the rounded corners */
}
```

This last pattern is genuinely important and worth calling out explicitly: `overflow: hidden` combined with `border-radius` is exactly how you clip a child image or content block to match a parent's rounded corners — without `overflow: hidden`, a child element (like an `<img>`) would visually ignore the parent's `border-radius` and render with sharp corners poking out.

---

# The Classic Clearfix Connection (Preview)

Recall Module 04, Lesson 02's brief `::after` clearfix mention — `overflow: hidden` (or `auto`) is actually an alternative, simpler way some developers historically solved the same float-containment problem you'll learn about properly in Lesson 05. Filed here as a connection point, not a technique to actively use going forward (Lesson 05's dedicated clearfix approach, or better yet Flexbox/Grid, are the modern answers).

---

# Practical Example

```css
.scrollable-list {
  height: 300px;
  overflow-y: auto;
  overflow-x: hidden;
}

.avatar-container {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  overflow: hidden; /* clips the child image to the circular shape */
}

.avatar-container img {
  width: 100%;
  height: 100%;
  object-fit: cover; /* Module 03 preview, working together with overflow here */
}
```

---

# Revision Questions

1. What's the difference between `overflow: scroll` and `overflow: auto`?
2. Why does `overflow: hidden` matter when combined with `border-radius` on a parent containing a child image?
3. Give a real-world use case for `overflow-y: auto` combined with a fixed `height`.

<details><summary>Answers</summary>

1. `scroll` always shows scrollbars, even if content doesn't overflow; `auto` shows scrollbars only when content actually overflows, generally considered more user-friendly.
2. Without `overflow: hidden`, a child element (like an image) ignores the parent's rounded corners and renders with sharp corners poking outside the rounded shape; `overflow: hidden` clips the child to match the parent's rounded boundary.
3. A scrollable comments panel, chat window, or any fixed-height content area that should scroll vertically once its content exceeds the available space.

</details>
