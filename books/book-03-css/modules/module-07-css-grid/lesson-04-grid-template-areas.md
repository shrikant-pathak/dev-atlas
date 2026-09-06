# Lesson 04: Grid Template Areas

## Learning Objectives
By the end of this lesson, you will be able to:
- Name grid areas and assign items to them.
- Read and write `grid-template-areas` as a visual ASCII layout.
- Recognize when named areas are a better tool than line-based placement.

---

# Introduction

Lesson 03 ended on a fair complaint: `grid-area: 1 / 1 / 3 / 4` is functional but unreadable — nothing about those four numbers tells you what the layout actually looks like. Named template areas fix this by letting you write your page layout as literal ASCII art in your CSS.

---

# Naming Areas

```css
.layout {
  display: grid;
  grid-template-columns: 200px 1fr;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "sidebar header"
    "sidebar main"
    "sidebar footer";
}

.sidebar { grid-area: sidebar; }
.header  { grid-area: header; }
.main    { grid-area: main; }
.footer  { grid-area: footer; }
```

Each quoted string in `grid-template-areas` is one row; each word within it is one column's area name for that row. Repeating a name across multiple cells (like `sidebar` across all three rows here) makes that item span all of them — the CSS literally looks like the page it produces.

```html
<div class="layout">
  <div class="sidebar">Sidebar</div>
  <div class="header">Header</div>
  <div class="main">Main Content</div>
  <div class="footer">Footer</div>
</div>
```

---

# Rules Worth Knowing

- Every row string must have the **same number of columns** — mismatched columns are a syntax error.
- Use a period (`.`) to leave a cell intentionally empty:

```css
grid-template-areas:
  "header header"
  "sidebar main"
  ". footer";
```

Here, the bottom-left cell is deliberately blank — nothing is placed there.

---

# Named Areas vs. Line-Based Placement

Recall Lesson 03's `grid-area: 1 / 1 / 3 / 4` shorthand — both approaches exist for a reason:

- **Line-based placement** is more precise and better suited to dynamic or irregular layouts (a card gallery with a floating "featured" item, for instance).
- **Named template areas** are more readable and better suited to fixed, structural layouts — page skeletons, dashboards, form layouts — where the shape is stable and self-documenting matters more than flexibility.

In practice, most full-page layouts (header/sidebar/main/footer) use named areas; smaller, dynamic components tend to use line-based placement.

---

# Combining With Responsive Design (Preview)

Named areas make responsive rework dramatically easier — you redefine the *shape* in one place rather than juggling numbered lines:

```css
.layout {
  grid-template-columns: 200px 1fr;
  grid-template-areas:
    "sidebar header"
    "sidebar main"
    "sidebar footer";
}

@media (max-width: 600px) {
  .layout {
    grid-template-columns: 1fr;
    grid-template-areas:
      "header"
      "main"
      "sidebar"
      "footer";
  }
}
```

Same item names, same `grid-area` declarations on the children — only the container's `grid-template-areas` string changes for mobile. Module 08 builds on this pattern extensively.

---

# Practical Example: Classic Holy Grail Layout

```html
<div class="page">
  <header>Header</header>
  <nav>Nav</nav>
  <main>Main</main>
  <aside>Aside</aside>
  <footer>Footer</footer>
</div>
```
```css
.page {
  display: grid;
  grid-template-columns: 150px 1fr 150px;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header header"
    "nav    main   aside"
    "footer footer footer";
  min-height: 100vh;
  gap: 1rem;
}

header { grid-area: header; }
nav    { grid-area: nav; }
main   { grid-area: main; }
aside  { grid-area: aside; }
footer { grid-area: footer; }
```

This is the famous "Holy Grail" layout — full-width header and footer, three-column middle row — that used to require elaborate float or table hacks. Here it's ten readable lines.

---

# Revision Questions

1. What character marks an intentionally empty cell in `grid-template-areas`?
2. What rule must every row string in `grid-template-areas` follow?
3. When would you prefer named areas over line-based placement, and vice versa?

<details><summary>Answers</summary>

1. A period (`.`).
2. Every row string must declare the same number of columns as every other row string.
3. Named areas suit fixed, structural layouts where readability matters (page skeletons, dashboards); line-based placement suits dynamic or irregular layouts where items need precise or flexible positioning.

</details>
