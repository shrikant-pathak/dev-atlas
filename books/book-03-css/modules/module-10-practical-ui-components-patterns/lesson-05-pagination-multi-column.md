# Lesson 05: Pagination & Multi-Column

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a pagination component using Flexbox.
- Style active and disabled pagination states.
- Use the CSS multi-column layout (`columns`) for text content.

---

# Introduction

This lesson covers two components that share a common thread: dividing content into discrete, navigable chunks — pagination for navigating between pages of results, and multi-column layout for splitting long text content the way a newspaper or magazine does.

---

# A Pagination Component

```html
<nav class="pagination">
  <a href="#" class="page-btn">‹ Prev</a>
  <a href="#" class="page-btn active">1</a>
  <a href="#" class="page-btn">2</a>
  <a href="#" class="page-btn">3</a>
  <a href="#" class="page-btn">Next ›</a>
</nav>
```
```css
.pagination {
  display: flex;
  gap: 0.5rem;
  justify-content: center;
}

.page-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 36px;
  height: 36px;
  padding: 0 0.5rem;
  border-radius: 4px;
  text-decoration: none;
  color: #333;
  transition: background 0.15s;
}

.page-btn:hover {
  background: #f0f0f0;
}

.page-btn.active {
  background: #4a90d9;
  color: white;
  font-weight: 600;
}
```

Recall Flexbox from Module 06 — `display: inline-flex` on each button centers its content both horizontally and vertically regardless of whether it holds a single digit or the word "Next", keeping every button visually consistent.

---

# Disabled Pagination States

```css
.page-btn.disabled {
  opacity: 0.4;
  pointer-events: none;
  cursor: not-allowed;
}
```

Recall `opacity` from Module 09 and `pointer-events: none` from Lesson 02's tooltip — this pairing is the standard way to fully disable a link-based (rather than `<button>`-based) element, since `<a>` tags don't support the native `disabled` HTML attribute that `<button>` does.

---

# CSS Multi-Column Layout

```css
.article {
  columns: 3 250px; /* up to 3 columns, each at least 250px wide */
  column-gap: 2rem;
  column-rule: 1px solid #ddd;
}
```

- **`columns: 3 250px`** — shorthand for `column-count: 3` and `column-width: 250px` together; the browser balances between the two, fitting as many 250px-minimum columns as available space allows, up to 3.
- **`column-gap`** — spacing between columns, conceptually identical to `gap` in Flexbox/Grid.
- **`column-rule`** — draws a visual dividing line between columns, styled exactly like a `border`.

---

# Controlling Breaks Within Multi-Column Text

```css
.article h2 {
  break-after: avoid; /* keep a heading with the text that follows it */
}

.article figure {
  break-inside: avoid; /* don't split an image/caption across two columns */
}
```

Recall `break-inside: avoid` from Lesson 04's masonry gallery — the same property prevents awkward mid-element splits here too, ensuring headings stay attached to their following paragraph and figures don't get sliced across a column boundary.

---

# Practical Example: A Paginated Article Layout

```html
<article class="article">
  <h2>Section Heading</h2>
  <p>Long article content that will flow naturally into multiple columns...</p>
</article>
<nav class="pagination">
  <a href="#" class="page-btn disabled">‹ Prev</a>
  <a href="#" class="page-btn active">1</a>
  <a href="#" class="page-btn">2</a>
  <a href="#" class="page-btn">Next ›</a>
</nav>
```
```css
.article {
  columns: 2 300px;
  column-gap: 2.5rem;
  column-rule: 1px solid #eee;
}

.pagination {
  display: flex;
  gap: 0.5rem;
  justify-content: center;
  margin-top: 2rem;
}
```

A magazine-style two-column article with pagination controls beneath it — the "Prev" button correctly disabled since we're on page 1.

---

# Revision Questions

1. Why is `pointer-events: none` needed to disable a pagination `<a>` link, unlike a `<button>`?
2. What does `columns: 3 250px` shorthand actually set?
3. What does `break-inside: avoid` prevent in a multi-column layout?

<details><summary>Answers</summary>

1. `<a>` tags don't support the native HTML `disabled` attribute that `<button>` elements do, so `pointer-events: none` (often paired with `opacity` for the visual cue) is used to prevent interaction instead.
2. It's shorthand for `column-count: 3` and `column-width: 250px` together — the browser fits as many 250px-minimum columns as space allows, up to a maximum of 3.
3. It prevents an element (like an image or figure) from being visually split across two adjacent columns.

</details>
