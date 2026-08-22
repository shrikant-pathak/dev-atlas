# Lesson 07: Table Styling

## Learning Objectives
By the end of this lesson, you will be able to:
- Style tables built in Book 02, Module 05 using CSS.
- Control border collapsing and cell spacing.
- Apply common patterns like zebra-striping and hover highlighting.

---

# Introduction

Recall Book 02, Module 05's HTML tables — `<table>`, `<th>`, `<td>`, `<thead>`, `<tbody>`. This lesson brings those genuinely tabular data structures fully to life visually.

---

# `border-collapse`

By default, each table cell has its own separate border, with visible gaps between them:

```css
table {
  border-collapse: collapse; /* merges adjacent borders into a single line */
}
```

**Without `border-collapse: collapse`** (the default, `separate`), adjacent cell borders render as doubled lines with gaps between them — visually messy for most real table designs. Setting it to `collapse` is genuinely a near-universal first step for styling any table.

```css
table, th, td {
  border: 1px solid #ddd;
  border-collapse: collapse;
}
```

---

# Cell Padding

Recall the box model (Lesson 01/02) — table cells need explicit padding for readable spacing, since the default is minimal:

```css
th, td {
  padding: 12px 15px;
  text-align: left;
}
```

---

# Zebra-Striping: Alternating Row Colors

A genuinely common, highly readable pattern using the `:nth-child()` pseudo-class (a preview — full depth in Module 04):

```css
tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}
```

This selects every even-numbered `<tr>` within `<tbody>` and applies a subtle background color — dramatically improving readability for tables with many rows, letting a reader's eye track across a row without losing their place.

---

# Row Hover Highlighting

```css
tbody tr:hover {
  background-color: #e8f4fc;
}
```

A small but genuinely useful UX touch — highlighting whichever row the user's mouse is currently over, especially helpful for wide tables with many columns.

---

# Styling `<thead>` Distinctly

Recall Book 02, Module 05's semantic table structure — `<thead>` genuinely benefits from being visually distinct from the data rows:

```css
thead {
  background-color: #2c3e50;
  color: white;
}

thead th {
  font-weight: bold;
  text-transform: uppercase;
  font-size: 0.85em;
}
```

---

# Responsive Consideration (Preview)

Tables are notoriously difficult to make genuinely responsive on small screens — a wide table with many columns simply doesn't fit a narrow phone screen gracefully. This is a real, unsolved-by-this-lesson challenge you'll revisit properly once you reach Module 08's responsive design module, where techniques like horizontal scrolling containers or restructuring for mobile are covered.

---

# Practical Example

```css
table {
  width: 100%;
  border-collapse: collapse;
  font-family: Arial, sans-serif;
}

thead {
  background-color: #2c3e50;
  color: white;
}

th, td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tbody tr:nth-child(even) {
  background-color: #f9f9f9;
}

tbody tr:hover {
  background-color: #e8f4fc;
}
```

---

# Revision Questions

1. What does `border-collapse: collapse` fix about a table's default border appearance?
2. What is "zebra-striping," and what CSS pattern commonly implements it?
3. Why are tables genuinely difficult to make responsive on small screens?

<details><summary>Answers</summary>

1. It merges adjacent cell borders into single lines, avoiding the default's doubled-border, gapped appearance between cells.
2. Alternating background colors on table rows for readability, commonly implemented with `tbody tr:nth-child(even) { background-color: ...; }`.
3. Because a wide table with many columns doesn't naturally fit a narrow screen — unlike text or images, table structure is inherently tied to horizontal space for its columns, requiring dedicated techniques (covered in Module 08) rather than simple reflow.

</details>
