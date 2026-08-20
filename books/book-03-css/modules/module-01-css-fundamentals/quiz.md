# Quiz — CSS Fundamentals

## Multiple Choice
1. Which CSS method is considered the professional standard for real projects?
   a) Inline  b) Internal  c) External  d) They're all equally preferred

2. What is the specificity weight of a class selector?
   a) 1  b) 10  c) 100  d) 1000

3. Which of these properties inherits by default?
   a) margin  b) border  c) color  d) width

4. When two rules have identical specificity, which one wins?
   a) The shorter one  b) The one written first  c) The one written last  d) Neither applies

---

## True / False
1. HTML comments and CSS comments use the same syntax. (True/False)
2. Inline styles have the highest specificity of any CSS method. (True/False)
3. The universal selector (`*`) has a specificity weight of 0. (True/False)

---

## Short Answer
1. Explain the difference between a class selector and an ID selector, including when to use each.
2. What are the three factors of the cascade, in priority order?
3. Why is external CSS preferred over internal CSS for multi-page projects?

---

## Coding Questions
1. Write a CSS rule targeting a class called `alert-box` and setting its background color to red.
2. Given `<p id="main" class="text">Hello</p>` and rules `.text { color: blue; }` and `#main { color: green; }`, which color applies, and why?

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-b, 3-c, 4-c

**True/False:** 1-False (HTML uses `<!-- -->`, CSS uses `/* */`), 2-True, 3-True

**Coding Question 1:**
```css
.alert-box {
  background-color: red;
}
```

**Coding Question 2:** Green applies — `#main` (ID selector, specificity 100) beats `.text` (class selector, specificity 10).

</details>
