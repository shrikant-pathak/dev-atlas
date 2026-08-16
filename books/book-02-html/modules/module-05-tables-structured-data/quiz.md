cat > quiz.md << 'EOF'
# Quiz — Tables & Structured Data

## Multiple Choice
1. Which element must be the first child inside `<table>`?
   a) `<thead>`  b) `<tr>`  c) `<caption>`  d) `<tbody>`

2. What does `colspan="3"` do?
   a) Spans 3 rows  b) Spans 3 columns  c) Creates 3 tables  d) Adds 3 borders

3. Which attribute declares a `<th>` applies to its entire column?
   a) `colspan`  b) `scope="col"`  c) `header`  d) `type="column"`

4. Which of these is a genuinely appropriate use of `<table>`?
   a) Page header/sidebar/footer layout  b) A pricing comparison chart  c) A navigation menu  d) A photo gallery grid

---

## True / False
1. HTML tables are built column-by-column, not row-by-row. (True/False)
2. A row below a `rowspan="2"` cell must still include a `<td>` for that spanned position. (True/False)
3. "Tables for layout" is considered an accessibility anti-pattern. (True/False)

---

## Short Answer
1. Explain the semantic difference between `<th>` and a bold-styled `<td>`.
2. Why does `<caption>` matter for accessibility specifically?
3. Give the "quick test" for deciding whether content belongs in a `<table>`.

---

## Coding Questions
1. Write a table row where "Total" is a header spanning 2 columns.
2. Write a `<th>` with `scope="row"` for a row labeled "Tuesday".

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-b, 3-b, 4-b

**True/False:** 1-False (row-by-row), 2-False (that space is already occupied by the spanning cell above), 3-True

**Coding Question 1:**
```html
<tr><th colspan="2">Total</th></tr>
```

**Coding Question 2:**
```html
<th scope="row">Tuesday</th>
```

</details>
EOF