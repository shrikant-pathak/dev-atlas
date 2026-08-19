# Lesson 03: Spanning Rows & Columns

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `colspan` to merge cells horizontally.
- Use `rowspan` to merge cells vertically.
- Build more complex table layouts, like grouped headers.

---

# Introduction

Real-world tables often need cells that span multiple columns or rows — a header covering several sub-columns, or a category label spanning several rows of related data. This lesson covers the two attributes that make this possible.

---

# `colspan`: Merging Columns

`colspan` makes a single cell span multiple columns horizontally:

```html
<table>
  <tr>
    <th colspan="2">Contact Info</th>
  </tr>
  <tr>
    <th>Email</th>
    <th>Phone</th>
  </tr>
  <tr>
    <td>shrikant@example.com</td>
    <td>555-1234</td>
  </tr>
</table>
```

The `<th>` with `colspan="2"` visually stretches across both columns beneath it, acting as a grouped header. **Important:** when a cell spans multiple columns, subsequent cells in that same row must account for it — the row's cell *count* effectively shrinks by however many columns were merged.

---

# `rowspan`: Merging Rows

`rowspan` makes a single cell span multiple rows vertically:

```html
<table>
  <tr>
    <th>Category</th>
    <th>Item</th>
    <th>Price</th>
  </tr>
  <tr>
    <td rowspan="2">Fruit</td>
    <td>Apple</td>
    <td>$1.00</td>
  </tr>
  <tr>
    <td>Banana</td>
    <td>$0.50</td>
  </tr>
</table>
```

"Fruit" spans both the Apple and Banana rows — and critically, the **second row does NOT include a cell for "Category"** at all, since the spanning cell from the row above already occupies that space. This is the single most common source of confusion when building spanning tables: miscounting how many `<td>`/`<th>` elements belong in a row that has cells "borrowed" by rowspan from above.

---

# Combining `colspan` and `rowspan`

```html
<table>
  <caption>Q1 Sales by Region and Product</caption>
  <tr>
    <th rowspan="2">Region</th>
    <th colspan="2">Products</th>
  </tr>
  <tr>
    <th>Widgets</th>
    <th>Gadgets</th>
  </tr>
  <tr>
    <td>North</td>
    <td>120</td>
    <td>80</td>
  </tr>
  <tr>
    <td>South</td>
    <td>95</td>
    <td>110</td>
  </tr>
</table>
```

"Region" spans two rows (both header rows), while "Products" spans two columns above "Widgets" and "Gadgets" — a genuinely common real-world grouped-header pattern.

---

# Debugging Spanning Tables

If your table renders with misaligned columns, the almost-always culprit is a row that has too many or too few `<td>`/`<th>` elements relative to what spanning cells from above have already claimed. When debugging, mentally (or on paper) trace through each row, subtracting cells already occupied by `rowspan` from rows above.

---

# Practical Example

```html
<table>
  <caption>Module 05 Lesson Breakdown</caption>
  <tr>
    <th rowspan="2">Lesson</th>
    <th colspan="2">Estimated Time</th>
  </tr>
  <tr>
    <th>Reading</th>
    <th>Exercises</th>
  </tr>
  <tr>
    <td>Table Structure</td>
    <td>20 min</td>
    <td>15 min</td>
  </tr>
</table>
```

---

# Revision Questions

1. What does `colspan="3"` do to a table cell?
2. When a cell has `rowspan="2"`, what must the row directly below it NOT include?
3. What's the most common cause of misaligned columns in a spanning table?

<details><summary>Answers</summary>

1. It makes that cell span/merge across 3 columns horizontally.
2. A cell in the same column position — that space is already occupied by the spanning cell from the row above.
3. A row having too many or too few `<td>`/`<th>` elements relative to what's already been claimed by `rowspan` cells from rows above it.

</details>
