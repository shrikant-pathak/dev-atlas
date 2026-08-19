# Lesson 04: Table Accessibility

## Learning Objectives
By the end of this lesson, you will be able to:
- Use the `scope` attribute to explicitly associate headers with data.
- Understand how screen readers navigate complex tables.
- Apply accessibility best practices to tables with spanning cells.

---

# Introduction

For simple tables, `<th>` alone often provides enough structure for screen readers to understand the data. But as tables grow more complex — especially with the spanning cells from Lesson 03 — explicit accessibility attributes become genuinely necessary, not optional polish.

---

# How Screen Readers Navigate Tables

A sighted user scans a table visually — glancing at a column header, then tracing down to find a specific data cell, holding that context effortlessly. A screen reader user experiences the table linearly, one cell at a time, with no natural visual "glance back up" — which is exactly why explicit header associations matter so much more here than they might seem to at first glance.

---

# The `scope` Attribute

`scope` explicitly declares whether a `<th>` is a header for its column or its row:

```html
<table>
  <tr>
    <th scope="col">Name</th>
    <th scope="col">Role</th>
  </tr>
  <tr>
    <th scope="row">Shrikant</th>
    <td>Developer</td>
  </tr>
</table>
```

- **`scope="col"`** — this header applies to the entire column beneath it.
- **`scope="row"`** — this header applies to the entire row beside it.

With `scope` explicitly set, a screen reader can announce "Developer, Role, Shrikant" when a user navigates to that cell — reconstructing the full context automatically, rather than requiring the user to remember which column they were in several cells ago.

---

# `id` and `headers` for Complex Tables

For genuinely complex tables — especially ones using `colspan`/`rowspan` where a data cell might relate to *multiple* headers — `scope` alone isn't always sufficient. The more explicit (if verbose) solution pairs `id` on headers with a `headers` attribute on data cells:

```html
<table>
  <tr>
    <th id="header-name">Name</th>
    <th id="header-q1">Q1 Sales</th>
    <th id="header-q2">Q2 Sales</th>
  </tr>
  <tr>
    <th id="row-shrikant">Shrikant</th>
    <td headers="row-shrikant header-q1">$5,000</td>
    <td headers="row-shrikant header-q2">$6,200</td>
  </tr>
</table>
```

Each `<td>`'s `headers` attribute lists every header `id` that applies to it — genuinely explicit, and appropriate for financial reports, scientific data tables, or anything with multi-level, spanning headers where `scope` alone would leave ambiguity.

---

# When Each Approach Is Appropriate

| Table Complexity | Recommended Approach |
|---|---|
| Simple, single-level headers | `<th>` alone is often sufficient |
| Standard tables, no spanning | `scope="col"` / `scope="row"` |
| Complex tables with spanning, multi-level headers | `id` + `headers` |

---

# Practical Example

```html
<table>
  <caption>Team Availability This Week</caption>
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Monday</th>
      <th scope="col">Tuesday</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Shrikant</th>
      <td>Available</td>
      <td>Busy</td>
    </tr>
    <tr>
      <th scope="row">Alex</th>
      <td>Busy</td>
      <td>Available</td>
    </tr>
  </tbody>
</table>
```

---

# Revision Questions

1. Why do tables need more explicit accessibility structure than a sighted user might assume?
2. What's the difference between `scope="col"` and `scope="row"`?
3. When would `id`/`headers` be preferred over `scope` alone?

<details><summary>Answers</summary>

1. Because screen reader users navigate tables linearly, one cell at a time, without the natural visual "glance back up to the header" a sighted user does effortlessly — explicit associations reconstruct that context for them.
2. `scope="col"` declares a header applies to its entire column; `scope="row"` declares it applies to its entire row.
3. For genuinely complex tables with spanning headers or cells that relate to multiple different headers, where `scope` alone can't unambiguously express all the necessary relationships.

</details>
