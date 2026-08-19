# Quiz — Text & Content Elements

## Multiple Choice
1. How many `<h1>` elements should a typical page have?
   a) As many as needed  b) Exactly one  c) At least two  d) Zero

2. Which element is semantically appropriate for a glossary?
   a) `<ul>`  b) `<ol>`  c) `<dl>`  d) `<blockquote>`

3. Which pair of tags renders identically by default but differs in semantic meaning?
   a) `<p>` and `<div>`  b) `<b>` and `<strong>`  c) `<ul>` and `<ol>`  d) `<span>` and `<div>`

4. What does `<pre>` do?
   a) Adds a horizontal line  b) Preserves whitespace/formatting exactly  c) Makes text bold  d) Creates a new paragraph

---

## True / False
1. `<br><br><br>` is the correct way to add spacing between paragraphs. (True/False)
2. `<hr>` represents a thematic break, not just a decorative line. (True/False)
3. The `cite` attribute on `<blockquote>` is visible to users by default. (True/False)

---

## Short Answer
1. Explain why choosing headings based on visual size instead of document structure is a problem.
2. What's the difference between `<q>` and `<blockquote>`?
3. Why is `<dl>` often underused, and what content is it best suited for?

---

## Coding Questions
1. Write a `<blockquote>` with a `cite` attribute pointing to `"https://example.com"`, containing the text "Simplicity is the ultimate sophistication."
2. Write an ordered list starting at 5, containing three list items.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-b

**True/False:** 1-False (use `<p>` elements and CSS instead), 2-True, 3-False (it's machine-readable metadata, not visible)

**Coding Question 1:**
```html
<blockquote cite="https://example.com">
  <p>Simplicity is the ultimate sophistication.</p>
</blockquote>
```

**Coding Question 2:**
```html
<ol start="5">
  <li>Item one</li>
  <li>Item two</li>
  <li>Item three</li>
</ol>
```

</details>
