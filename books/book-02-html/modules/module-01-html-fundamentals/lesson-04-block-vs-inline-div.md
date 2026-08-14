cat > lesson-04-block-vs-inline-div.md << 'EOF'
# Lesson 04: Block vs. Inline Elements & the `<div>`

## Learning Objectives
By the end of this lesson, you will be able to:
- Distinguish between block-level and inline elements.
- Explain the purpose of the `<div>` and `<span>` generic containers.
- Predict how an element will affect page layout based on its display type.

---

# Introduction

Every HTML element falls into one of two fundamental layout categories: **block** or **inline**. Understanding this distinction now will make CSS layout (Book 03) far more intuitive, since it's the default behavior CSS builds on top of.

---

# Block-Level Elements

A **block-level element**:
- Always starts on a new line, pushing surrounding content above and below it.
- Takes up the full available width by default, regardless of its content's actual size.
- Can contain other block-level and inline elements.

Common block-level elements: `<div>`, `<p>`, `<h1>`–`<h6>`, `<ul>`, `<li>`, `<section>`, `<article>`, `<form>`.

```html
<div>First block</div>
<div>Second block</div>
```
Renders as two separate lines, each spanning the full width — even though the text is short.

---

# Inline Elements

An **inline element**:
- Does *not* start on a new line — it flows within surrounding text, like a word in a sentence.
- Only takes up as much width as its content needs.
- Generally cannot contain block-level elements.

Common inline elements: `<span>`, `<a>`, `<strong>`, `<em>`, `<img>`, `<button>` (technically inline-block, behaving as a hybrid).

```html
<p>This is <strong>bold</strong> and this is <em>italic</em>, all in one line.</p>
```
`<strong>` and `<em>` sit *within* the flow of the paragraph's text, not on their own lines.

---

# The `<div>`: A Generic Block Container

`<div>` (division) is a block-level element with **no inherent semantic meaning** — it doesn't tell the browser or assistive technology anything about what the content *is*, only that it's a generic grouping/container. It exists purely to group content together, typically for styling (CSS) or scripting (JavaScript) purposes.

```html
<div class="card">
  <h2>Card Title</h2>
  <p>Card content goes here.</p>
</div>
```

Before HTML5 introduced true semantic elements (Module 06 of this book — `<header>`, `<nav>`, `<article>`, etc.), `<div>` was used for *everything*, resulting in what's often called "div soup." Modern best practice: use a semantic element when one accurately describes your content's meaning; reach for `<div>` only when no semantic element fits, purely as a generic structural or styling container.

---

# The `<span>`: A Generic Inline Container

`<span>` is the inline equivalent of `<div>` — a generic container with no semantic meaning, used to group or target a small piece of inline content, usually for styling or scripting:

```html
<p>The price is <span class="highlight">$49.99</span> today only.</p>
```

---

# Practical Example

```html
<div>
  <h2>Product Name</h2>
  <p>This product is <span>on sale</span> — <strong>limited time only</strong>.</p>
</div>
```

Here, `<div>` and `<h2>` and `<p>` are block-level (each on their own line/full width); `<span>` and `<strong>` are inline (flowing within the paragraph's text).

---

# Revision Questions

1. What are the two defining behaviors of a block-level element?
2. Why does `<div>` have "no inherent semantic meaning," and why does that matter?
3. Is `<span>` block or inline? What's it typically used for?

<details><summary>Answers</summary>

1. It starts on a new line, and takes up the full available width by default.
2. It doesn't describe what the content actually *is* (unlike `<p>` for a paragraph or `<h1>` for a heading) — it's purely a generic container, which matters because overusing it instead of semantic elements makes a page's structure meaningless to search engines and assistive technology.
3. Inline; typically used to group or target a small piece of text for styling or scripting purposes, without breaking the surrounding text flow.

</details>
EOF