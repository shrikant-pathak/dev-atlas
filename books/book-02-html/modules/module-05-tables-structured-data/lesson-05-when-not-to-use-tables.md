cat > lesson-05-when-not-to-use-tables.md << 'EOF'
# Lesson 05: When (Not) to Use Tables

## Learning Objectives
By the end of this lesson, you will be able to:
- Recognize genuinely tabular data versus data that only superficially resembles it.
- Understand the historical "tables for layout" anti-pattern and why it was abandoned.
- Confidently decide when `<table>` is the semantically correct choice.

---

# Introduction

This final lesson of Module 05 addresses history and judgment rather than new syntax — genuinely important, since tables are one of HTML's most historically misused elements, and understanding *why* helps you avoid both directions of the mistake.

---

# The Historical Mistake: "Tables for Layout"

Before CSS layout techniques matured (which you'll learn properly in Book 03 — Flexbox, Grid), web developers commonly used HTML tables purely to achieve visual page layouts — a sidebar here, a main content area there, a footer below — with zero actual tabular data involved:

```html
<!-- The old, deprecated "tables for layout" anti-pattern -->
<table>
  <tr>
    <td>Sidebar content</td>
    <td>Main content</td>
  </tr>
</table>
```

This was a genuine, industry-wide practice for years — but it's now firmly considered an anti-pattern, for real, concrete reasons:

1. **Semantic meaning is destroyed** — screen readers announce this as an actual data table ("row 1 of 1, column 1 of 2..."), deeply confusing for content that isn't tabular data at all.
2. **Inflexible and hard to maintain** — reordering layout sections requires restructuring the entire table's markup.
3. **Poor responsive behavior** — tables don't reflow gracefully for different screen sizes, a genuine problem once mobile browsing became dominant.

Modern CSS (Flexbox and Grid, Book 03) does layout far better, more flexibly, and without corrupting a page's semantic meaning — this is exactly why "never use tables for layout" became, and remains, a firm, near-universal rule.

---

# The Reverse Mistake: Avoiding Tables When You Shouldn't

Some developers, having learned "tables are bad," now over-correct and avoid `<table>` even for genuinely tabular data — building a spreadsheet-like grid entirely out of `<div>`s (recall "div soup" from Module 01) instead. This is also a mistake: it throws away all the genuine accessibility and semantic benefits covered in Lessons 02 and 04, for no real benefit.

---

# The Actual Rule

**Use `<table>` when your content genuinely is tabular data** — information that's naturally organized into rows and columns, where each cell's meaning depends on both its row and column position:

**Genuinely tabular (use `<table>`):**
- A spreadsheet of financial data
- A comparison chart (features across different pricing plans)
- A sports league's standings
- A class schedule

**NOT tabular (do NOT use `<table>`):**
- Overall page layout (header/sidebar/main/footer)
- A list of blog post previews
- A navigation menu
- A photo gallery grid

---

# The Quick Test

Ask: "If I read this data aloud, row by row, column by column, would that make logical sense as a description of the content?" If yes, it's a table. If the content is really just "several separate blocks of unrelated stuff, arranged visually," it's a layout problem — solve it with CSS (Book 03), not `<table>`.

---

# Practical Example

```html
<!-- Correct use of <table>: genuinely tabular pricing comparison -->
<table>
  <caption>Pricing Plans</caption>
  <tr>
    <th scope="col">Plan</th>
    <th scope="col">Price</th>
    <th scope="col">Storage</th>
  </tr>
  <tr>
    <th scope="row">Free</th>
    <td>$0</td>
    <td>5GB</td>
  </tr>
  <tr>
    <th scope="row">Pro</th>
    <td>$9/mo</td>
    <td>100GB</td>
  </tr>
</table>

<!-- Incorrect: this should be semantic HTML (Module 06) + CSS, NOT a table -->
<!-- <table><tr><td>Sidebar</td><td>Main content</td></tr></table>  ❌ -->
```

---

# Revision Questions

1. Why was "tables for layout" considered a genuine anti-pattern, not just a style preference?
2. What's the "reverse mistake" some developers make after learning tables shouldn't be used for layout?
3. What's a quick test for deciding whether content genuinely belongs in a `<table>`?

<details><summary>Answers</summary>

1. It destroyed semantic meaning (confusing screen readers, which announced non-tabular content as if it were a data table), made layouts inflexible and hard to maintain, and handled responsive design poorly.
2. Avoiding `<table>` even for genuinely tabular data, instead building spreadsheet-like grids entirely out of generic `<div>`s, losing real accessibility and semantic benefits for no reason.
3. Ask whether reading the data aloud row by row, column by column, would logically make sense as a description of the content — if yes, it's tabular data; if the content is just visually arranged unrelated blocks, it's a layout problem for CSS instead.

</details>

---

# 🏁 Module 05 Checkpoint

Before moving to Module 06, you should be able to:
- [ ] Build a correctly structured table using `<table>`, `<tr>`, `<th>`, `<td>`
- [ ] Use `<thead>`, `<tbody>`, `<tfoot>`, and `<caption>` in production-quality tables
- [ ] Use `colspan`/`rowspan` correctly, debugging misaligned columns
- [ ] Apply `scope` (and `id`/`headers` where needed) for accessible tables
- [ ] Confidently judge when data is genuinely tabular versus a layout problem in disguise

**Next up:** Module 06 — Semantic HTML & Document Structure
EOF