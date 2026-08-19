# Quiz — Real-World Project & Best Practices

## Multiple Choice
1. What naming convention is standard for HTML classes and IDs?
   a) camelCase  b) PascalCase  c) kebab-case  d) snake_case

2. What does most server software do when a folder is requested without a specific filename?
   a) Shows a 404 error  b) Serves that folder's `index.html`  c) Lists all files  d) Redirects to the homepage

3. What tool checks an HTML page against the official specification?
   a) Prettier  b) The W3C Validator  c) ESLint  d) npm

4. What does plain HTML lack that leads to duplicated headers/footers across pages?
   a) CSS support  b) A native templating/include system  c) JavaScript support  d) Form validation

---

## True / False
1. There's a single objectively "correct" indentation size for HTML. (True/False)
2. Code review should happen after writing code, as a systematic final check. (True/False)
3. The Module 09 capstone project is meant to include CSS styling. (True/False)

---

## Short Answer
1. Why does consistency matter more than which specific style choice (e.g., 2 vs 4 spaces) is made?
2. What real-world limitation of plain HTML does Lesson 02 expose, and what later books solve it?
3. Name two tools from this book you'd use to verify a finished HTML page.

---

## Coding Questions
1. Rewrite this to follow correct naming conventions: `<div class="UserProfile" id="mainContent">`.
2. Write the correct fix for: `<button onclick="toggleMenu()">Menu</button>` inside a `<form>`, to prevent accidental form submission.

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-b, 3-b, 4-b

**True/False:** 1-False (no single objectively correct choice, only consistency matters), 2-True, 3-False (deliberately left unstyled — CSS comes in Book 03)

**Coding Question 1:** `<div class="user-profile" id="main-content">`

**Coding Question 2:** `<button type="button" onclick="toggleMenu()">Menu</button>`

</details>
