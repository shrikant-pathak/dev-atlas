cat > quiz.md << 'EOF'
# Quiz — Semantic HTML & Document Structure

## Multiple Choice
1. How many `<main>` elements should a typical page have?
   a) As many as needed  b) Exactly one  c) One per section  d) Zero

2. Which element represents self-contained content that would make sense standalone?
   a) `<section>`  b) `<div>`  c) `<article>`  d) `<aside>`

3. Which element should NEVER contain `<main>`?
   a) `<body>`  b) `<html>`  c) `<article>`  d) None of these restrict it

4. What does `<details>`/`<summary>` provide without any JavaScript?
   a) Form validation  b) A collapsible disclosure widget  c) A navigation menu  d) A data table

---

## True / False
1. `<nav>` should wrap every small cluster of links on a page. (True/False)
2. A page can have both a page-level `<footer>` and an article-level `<footer>`. (True/False)
3. `<aside>` should be used based on visual position, not semantic relevance. (True/False)

---

## Short Answer
1. What is "div soup," and what problem does semantic HTML solve?
2. Give the decisive test for choosing between `<section>` and `<article>`.
3. Why can `<header>` and `<footer>` each appear more than once on a single page?

---

## Coding Questions
1. Write a minimal `<article>` with a `<header>` containing a title and a `<time>` element.
2. Write a `<section>` with a heading "Testimonials" containing one paragraph of placeholder text.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-c, 4-b

**True/False:** 1-False (only for genuinely major navigation), 2-True, 3-False (based on semantic relevance, not visual position)

**Coding Question 1:**
```html
<article>
  <header>
    <h2>Post Title</h2>
    <time datetime="2026-08-16">August 16, 2026</time>
  </header>
  <p>Content...</p>
</article>
```

**Coding Question 2:**
```html
<section>
  <h2>Testimonials</h2>
  <p>Placeholder testimonial text.</p>
</section>
```

</details>
EOF