# Quiz — Selectors & Combinators

## Multiple Choice
1. Which symbol is used for pseudo-elements in modern CSS?
   a) Single colon `:`  b) Double colon `::`  c) Hash `#`  d) Asterisk `*`

2. What does `nav > ul` select?
   a) Any nested `<ul>` inside `<nav>`  b) Only direct-child `<ul>` of `<nav>`  c) The sibling after `<nav>`  d) All `<ul>` on the page

3. What is the correct order for link pseudo-classes?
   a) hover, active, link, visited  b) link, visited, hover, active  c) active, hover, visited, link  d) visited, link, active, hover

4. What specificity does `:not(.active)` contribute in total (including its argument)?
   a) 0  b) 1  c) 10  d) 100

---

## True / False
1. Combinators (space, `>`, `+`, `~`) add their own specificity weight. (True/False)
2. `::before` and `::after` require the `content` property to render anything. (True/False)
3. `!important` can be overridden by a higher-specificity rule without `!important`. (True/False)

---

## Short Answer
1. Explain the difference between `+` and `~` combinators.
2. Why is `!important` generally discouraged in real projects?
3. What does `[href$=".pdf"]` select?

---

## Coding Questions
1. Write a rule using `:nth-child()` to select every odd-numbered table row.
2. Write a rule adding a small icon before every link whose `href` starts with `mailto:`.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-b, 3-b, 4-c

**True/False:** 1-False (combinators add zero specificity), 2-True, 3-False (only another `!important` rule, or higher source order among equal `!important` rules, can override it)

**Coding Question 1:**
```css
tr:nth-child(odd) {
  background-color: #f2f2f2;
}
```

**Coding Question 2:**
```css
a[href^="mailto:"]::before {
  content: "✉ ";
}
```

</details>
