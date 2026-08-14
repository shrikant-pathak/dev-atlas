cat > quiz.md << 'EOF'
# Quiz — HTML Fundamentals

## Multiple Choice
1. Which of these is a void (self-closing) element?
   a) `<div>`  b) `<p>`  c) `<img>`  d) `<span>`

2. Which attribute must be unique per page?
   a) class  b) id  c) title  d) data-*

3. Which of these is a block-level element?
   a) `<span>`  b) `<a>`  c) `<strong>`  d) `<div>`

4. What does `<meta name="viewport">` control?
   a) Page title  b) Character encoding  c) Mobile scaling behavior  d) SEO ranking

---

## True / False
1. An element can have multiple classes but only one id. (True/False)
2. `<div>` has semantic meaning that describes its content. (True/False)
3. Typing an emoji directly into HTML content works because of UTF-8 encoding. (True/False)

---

## Short Answer
1. Explain the difference between a tag and an element.
2. Why does HTML use entities like `&lt;` instead of typing `<` directly?
3. What's the purpose of the `lang` attribute on the `<html>` tag?

---

## Coding Questions
1. Write a `<div>` with class `"card"` and id `"card-1"`, containing an `<h2>` with the text "Hello".
2. Write the HTML entity for the copyright symbol (©).

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-b, 3-d, 4-c

**True/False:** 1-True, 2-False (div has no inherent semantic meaning), 3-True

**Coding Question 1:**
```html
<div class="card" id="card-1">
  <h2>Hello</h2>
</div>
```

**Coding Question 2:** `&copy;`

</details>
EOF