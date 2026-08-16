cat > lesson-01-table-structure.md << 'EOF'
# Lesson 01: Table Structure

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a basic table using `<table>`, `<tr>`, `<td>`, and `<th>`.
- Understand the row-by-row structure HTML tables follow.
- Distinguish between header cells and data cells.

---

# Introduction

Tables represent genuinely tabular data — rows and columns of related values, like a spreadsheet. This module covers building them correctly, and (in the final lesson) recognizing when a table is actually the wrong tool, since tables are among HTML's most historically misused elements.

---

# The Core Table Elements

```html
<table>
  <tr>
    <th>Name</th>
    <th>Role</th>
  </tr>
  <tr>
    <td>Shrikant</td>
    <td>Developer</td>
  </tr>
  <tr>
    <td>Alex</td>
    <td>Designer</td>
  </tr>
</table>
```

- **`<table>`** — the container for the entire table.
- **`<tr>`** (table row) — one row, containing cells.
- **`<th>`** (table header) — a header cell, describing what a column (or row) represents. Rendered bold and centered by default.
- **`<td>`** (table data) — a regular data cell.

---

# How Tables Are Built: Row by Row

A crucial mental model: HTML tables are defined **row by row**, not column by column. You don't declare "here's a column of names" — you declare each row, and cells align into columns purely based on their position within each row:

```html
<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
    <th>Role</th>
  </tr>
  <tr>
    <td>Shrikant</td>
    <td>28</td>
    <td>Developer</td>
  </tr>
</table>
```

The first `<td>` in each row lines up under the first `<th>`, the second under the second, and so on — purely by position, not by any explicit column declaration.

---

# `<th>` vs. `<td>`: Not Just Visual

Like `<strong>` vs. `<b>` (Module 02), the difference between `<th>` and `<td>` is semantic, not just "bold vs. not bold." `<th>` tells browsers and assistive technology "this cell describes/labels the data in this row or column" — genuinely important for screen readers navigating tabular data (covered fully in Lesson 04).

**Row headers, not just column headers:**
```html
<table>
  <tr>
    <th></th>
    <th>Q1</th>
    <th>Q2</th>
  </tr>
  <tr>
    <th>Revenue</th>
    <td>$50k</td>
    <td>$62k</td>
  </tr>
  <tr>
    <th>Expenses</th>
    <td>$30k</td>
    <td>$35k</td>
  </tr>
</table>
```
Here, "Revenue" and "Expenses" are also `<th>` — they label their entire row, just as "Q1"/"Q2" label their columns.

---

# A Common Beginner Mistake

Using `<td>` for everything, including what should be header cells:

```html
<!-- Semantically incorrect: headers styled as data cells -->
<tr>
  <td><strong>Name</strong></td>
  <td><strong>Role</strong></td>
</tr>
```

This might *look* identical with enough CSS styling, but loses all the semantic/accessibility benefits `<th>` provides — the same mistake pattern you learned to avoid with `<b>` vs `<strong>` back in Module 02.

---

# Practical Example

```html
<table>
  <tr>
    <th>Book</th>
    <th>Topic</th>
    <th>Status</th>
  </tr>
  <tr>
    <td>Book 01</td>
    <td>Foundations</td>
    <td>Complete</td>
  </tr>
  <tr>
    <td>Book 02</td>
    <td>HTML</td>
    <td>In Progress</td>
  </tr>
</table>
```

---

# Revision Questions

1. Are HTML tables defined row-by-row or column-by-column?
2. What's the semantic difference between `<th>` and `<td>`, beyond default bold styling?
3. Can `<th>` be used to label a row, not just a column? Give an example structure.

<details><summary>Answers</summary>

1. Row-by-row — cells align into columns purely based on their position within each row, not through any explicit column declaration.
2. `<th>` semantically marks a cell as a header/label for its row or column, which screen readers and other assistive technology use to provide context; `<td>` is a plain data cell with no such labeling meaning.
3. Yes — the first cell in a data row can be a `<th>` to label that entire row (e.g., "Revenue" labeling a row of quarterly figures), just as top-row `<th>` cells label columns.

</details>
EOF