# Lesson 04: Combinators

## Learning Objectives
By the end of this lesson, you will be able to:
- Use descendant, child, adjacent sibling, and general sibling combinators.
- Understand the precise difference between descendant and child relationships.
- Combine combinators for genuinely precise, real-world targeting.

---

# Introduction

**Combinators** describe *relationships between* selectors — targeting an element based on its position relative to another element in the HTML structure, rather than the element's own attributes or state.

---

# Descendant Combinator: (space)

```css
nav a {
  color: white;
}
```

Selects any `<a>` that's a descendant of `<nav>` — at *any* nesting depth, however deeply nested:

```html
<nav>
  <ul>
    <li><a href="#">Link</a></li>  <!-- matched, even though nested 2 levels deep -->
  </ul>
</nav>
```

This is genuinely the most commonly used combinator, and the one you've been implicitly using throughout this book already, every time you wrote something like `nav a` or `tbody tr`.

---

# Child Combinator: `>`

```css
nav > ul {
  list-style: none;
}
```

Selects only *direct* children — one level deep, no further:

```html
<nav>
  <ul>       <!-- matched: direct child of nav -->
    <li>
      <ul></ul>  <!-- NOT matched: this is a grandchild of nav, not a direct child -->
    </li>
  </ul>
</nav>
```

**Why this precision matters:** in a nested list (like a multi-level dropdown navigation menu), `nav ul` (descendant) would style *every* nested `<ul>` at every level identically, while `nav > ul` targets only the outermost, top-level list — genuinely important for correctly styling multi-level menus differently at each depth.

---

# Adjacent Sibling Combinator: `+`

```css
h2 + p {
  font-weight: bold;
}
```

Selects an element that is the **immediately next sibling** of another — same parent, directly adjacent:

```html
<h2>Heading</h2>
<p>This paragraph IS matched — immediately follows the h2.</p>
<p>This paragraph is NOT matched — it's the second sibling after h2, not immediately adjacent.</p>
```

Genuinely useful for styling "the first paragraph right after a heading" differently from subsequent paragraphs — a common, subtle editorial design detail.

---

# General Sibling Combinator: `~`

```css
h2 ~ p {
  color: gray;
}
```

Selects **all** siblings that come after the reference element (not just the immediately adjacent one), as long as they share the same parent:

```html
<h2>Heading</h2>
<p>Matched — comes after h2.</p>
<p>Also matched — still comes after h2, even though not immediately adjacent.</p>
```

---

# Combining Combinators for Precision

Real-world CSS frequently chains combinators together:

```css
article > header + p {
  font-size: 1.2em; /* the paragraph immediately after a direct-child header, inside an article */
}
```

This reads right-to-left, conceptually: "a `<p>` that immediately follows a `<header>`, where that `<header>` is a direct child of `<article>`."

---

# Quick Reference Comparison

| Combinator | Symbol | Selects |
|---|---|---|
| Descendant | (space) | Any nested descendant, any depth |
| Child | `>` | Only direct children |
| Adjacent sibling | `+` | Only the immediately next sibling |
| General sibling | `~` | All following siblings |

---

# Practical Example

```css
/* Style only the direct-child list of a nav, not nested sub-menus */
nav > ul {
  display: flex;
}

/* Style a nested sub-menu differently */
nav > ul > li > ul {
  display: none; /* hidden by default, e.g., shown on hover via JS/CSS later */
}

/* Add spacing before any paragraph following a heading */
h2 + p {
  margin-top: 0; /* tighter spacing right after a heading */
}

/* Gray out all paragraphs after the first one in a section */
h2 ~ p {
  color: #555;
}
```

---

# Revision Questions

1. What's the difference between the descendant combinator (space) and the child combinator (`>`)?
2. What does `h2 + p` select, versus `h2 ~ p`?
3. Give a real-world reason you might need `nav > ul` instead of just `nav ul`.

<details><summary>Answers</summary>

1. The descendant combinator selects any nested descendant at any depth; the child combinator selects only direct children, one level deep.
2. `h2 + p` selects only the single paragraph immediately following the `h2`; `h2 ~ p` selects every paragraph sibling that comes after the `h2`, not just the immediately adjacent one.
3. When building a multi-level dropdown navigation menu, `nav > ul` targets only the top-level menu list, letting you style nested sub-menu `<ul>` elements differently without the outer rule accidentally applying to them too.

</details>
