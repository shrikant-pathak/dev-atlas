# Lesson 02: Table Headers & Captions

## Learning Objectives
By the end of this lesson, you will be able to:
- Structure tables properly using `<thead>`, `<tbody>`, and `<tfoot>`.
- Add a table caption using `<caption>`.
- Understand how this structure improves both semantics and styling later.

---

# Introduction

Lesson 01 covered the raw building blocks. This lesson covers the structural grouping elements real-world tables should use — genuinely common in production code, and directly setting up styling capabilities you'll use in Book 03.

---

# Grouping Rows: `<thead>`, `<tbody>`, `<tfoot>`

```html
<table>
  <thead>
    <tr>
      <th>Product</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Widget</td>
      <td>$9.99</td>
    </tr>
    <tr>
      <td>Gadget</td>
      <td>$19.99</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Total</td>
      <td>$29.98</td>
    </tr>
  </tfoot>
</table>
```

- **`<thead>`** — groups the header row(s).
- **`<tbody>`** — groups the main data rows (a table can technically have multiple `<tbody>` sections, for grouping related chunks of rows).
- **`<tfoot>`** — groups footer rows, often for totals/summaries.

None of these are strictly required for a table to render — but they're the semantically correct, production-standard structure, and in Book 03 you'll use them to style headers/footers distinctly (e.g., a sticky header while scrolling long tables) far more easily than trying to target "the first row" positionally.

---

# The `<caption>` Element

```html
<table>
  <caption>Quarterly Sales Figures, 2026</caption>
  <thead>
    <tr>
      <th>Quarter</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Q1</td>
      <td>$50,000</td>
    </tr>
  </tbody>
</table>
```

`<caption>` must be the **first child** inside `<table>`, immediately after the opening tag. It provides a title/description for the entire table — genuinely important for accessibility, since screen readers announce it before reading the table's content, giving users context before diving into the data itself. This is the tabular-data equivalent of `<figcaption>` from Module 03.

---

# Why This Structure Matters

1. **Accessibility** — screen readers use `<thead>`/`<tbody>`/`<tfoot>` to let users navigate directly to headers or skip to data, and `<caption>` provides essential upfront context.
2. **Styling** — in Book 03, you'll target these sections with CSS far more reliably than relying on "nth row" positional selectors, which break the moment row counts change.
3. **Print behavior** — browsers can intelligently repeat `<thead>` content across printed pages for long tables, something impossible without this structure.

---

# Practical Example

```html
<table>
  <caption>Book 01 Module Completion Status</caption>
  <thead>
    <tr>
      <th>Module</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Computer Fundamentals</td>
      <td>Complete</td>
    </tr>
    <tr>
      <td>Number Systems</td>
      <td>Complete</td>
    </tr>
  </tbody>
</table>
```

---

# Revision Questions

1. What are `<thead>`, `<tbody>`, and `<tfoot>` used for?
2. Where must `<caption>` be placed within a `<table>`?
3. Name one accessibility and one styling benefit of using this structure over a flat list of `<tr>` elements.

<details><summary>Answers</summary>

1. They group a table's rows into header, body, and footer sections respectively, for semantic structure, styling, and accessibility purposes.
2. As the first child inside `<table>`, immediately after the opening tag.
3. Accessibility: screen readers can navigate directly to headers or announce the caption for context before the data. Styling: CSS can reliably target these sections without fragile "nth row" positional selectors.

</details>
