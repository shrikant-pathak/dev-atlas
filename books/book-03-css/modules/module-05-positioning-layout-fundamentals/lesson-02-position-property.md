# Lesson 02: Position Property

## Learning Objectives
By the end of this lesson, you will be able to:
- Use all five `position` values correctly.
- Understand the crucial concept of a "positioning context."
- Apply `position: sticky` for common real-world patterns.

---

# Introduction

`position` is genuinely one of the most powerful — and most commonly misunderstood — layout properties in CSS. This lesson builds a precise mental model for each of its five values.

---

# `position: static` (The Default)

Every element is `position: static` unless you say otherwise — elements simply flow in normal document order, and offset properties (`top`, `left`, etc.) have **no effect** at all on a static element.

---

# `position: relative`

```css
.box {
  position: relative;
  top: 10px;
  left: 20px;
}
```

The element shifts visually from where it *would have been*, by the specified offsets — but genuinely important: **its original space in the layout is preserved**, as if it never moved (other elements don't shift to fill the gap it visually left behind).

**The second, arguably more important use of `relative`:** it establishes a **positioning context** for any absolutely-positioned descendants (next section) — this is worth remembering as a rule, not just an offset tool.

---

# `position: absolute`

```css
.parent {
  position: relative; /* establishes the positioning context */
}
.child {
  position: absolute;
  top: 0;
  right: 0;
}
```

An absolutely positioned element is removed entirely from normal document flow (other elements behave as if it doesn't exist for layout purposes) and positioned relative to its **nearest positioned ancestor** — meaning the nearest ancestor with `position` set to anything other than `static`.

**If no ancestor is positioned**, the absolute element positions itself relative to the entire `<html>` document instead — a genuinely common source of "why did my absolutely positioned element jump to the top of the whole page" bugs. **The fix:** always set `position: relative` on the intended parent container.

**Common real use case:** a badge/notification icon positioned in the corner of a card, or a close button in the corner of a modal.

---

# `position: fixed`

```css
.header {
  position: fixed;
  top: 0;
  width: 100%;
}
```

Positioned relative to the browser's **viewport** — and stays fixed in that exact position even as the page scrolls. Genuinely common for persistent headers/navigation bars that remain visible while a user scrolls down a long page.

---

# `position: sticky`

```css
.section-header {
  position: sticky;
  top: 0;
}
```

A genuine hybrid: behaves like `relative` (normal document flow) *until* the element would scroll out of view past the specified offset (`top: 0` here), at which point it "sticks" in place — behaving like `fixed` — until its parent container scrolls out of view entirely.

**Common real use case:** a table's header row staying visible while scrolling through many rows of data, or a sidebar's navigation staying visible as a user scrolls through a long article.

---

# Positioning Context Summary

| Value | Removed from flow? | Positioned relative to |
|---|---|---|
| `static` (default) | No | N/A |
| `relative` | No | Its own original position |
| `absolute` | Yes | Nearest positioned ancestor (or `<html>`) |
| `fixed` | Yes | The browser viewport |
| `sticky` | No (until threshold) | Its own position, then the viewport |

---

# Practical Example

```css
.card {
  position: relative; /* positioning context for the badge below */
}
.card .badge {
  position: absolute;
  top: -8px;
  right: -8px;
}

.site-header {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 100; /* preview of Lesson 03 */
}

.table-header-row {
  position: sticky;
  top: 0;
}
```

---

# Revision Questions

1. What's the key difference between `position: relative` and `position: static` in terms of layout space?
2. If an absolutely positioned element seems to jump to the top-left of the entire page instead of its intended parent, what's the likely cause and fix?
3. How does `position: sticky` differ from both `relative` and `fixed`?

<details><summary>Answers</summary>

1. A relatively positioned element can be visually offset (via `top`/`left`/etc.) while its original space in the layout is preserved; a static element ignores offset properties entirely and simply flows normally.
2. The intended parent container doesn't have `position` set to anything other than `static`; the fix is adding `position: relative` to that parent, establishing it as the positioning context.
3. It behaves like `relative` (normal flow, preserving space) until scrolling reaches a specified threshold, at which point it behaves like `fixed` (sticking in place relative to the viewport) until its parent scrolls out of view.

</details>
