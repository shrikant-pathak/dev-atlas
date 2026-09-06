# Lesson 04: CSS Counters

## Learning Objectives
By the end of this lesson, you will be able to:
- Create and increment a counter with `counter-reset` and `counter-increment`.
- Display counter values using the `counter()` function in generated content.
- Build nested, multi-level numbering with counters.

---

# Introduction

CSS counters let you generate automatic, running numbers (or letters) purely through CSS — no manually typed "1.", "2.", "3." in your HTML, and no JavaScript required. They're the mechanism behind ordered lists under the hood, and they become genuinely powerful once you need custom numbering that plain `<ol>` can't provide (multi-level outlines, custom formats, numbering non-list elements).

---

# The Three Pieces

```css
.list {
  counter-reset: item; /* 1. create/reset a counter named "item" */
}

.list li {
  counter-increment: item; /* 2. increment it for each matching element */
}

.list li::before {
  content: counter(item) ". "; /* 3. display its current value */
}
```

- **`counter-reset`** — initializes a named counter (to 0 by default) on the element it's set on.
- **`counter-increment`** — increases that counter by 1 (by default) each time the rule matches an element.
- **`counter()`** — used inside a `content` value (recall `::before`/`::after` from Module 04) to output the counter's current numeric value as text.

---

# A Working Example

```html
<ul class="steps">
  <li>Preheat the oven</li>
  <li>Mix the ingredients</li>
  <li>Bake for 20 minutes</li>
</ul>
```
```css
.steps {
  counter-reset: step;
  list-style: none;
}

.steps li {
  counter-increment: step;
}

.steps li::before {
  content: counter(step) ". ";
  font-weight: bold;
}
```

Recall `list-style: none` from Module 03 — the browser's default numbering is removed, and the counter generates fully custom numbering in its place, styled however you like (here, bold).

---

# Custom Starting Values and Step Size

```css
.list {
  counter-reset: item 5; /* start counting from 5 */
}

.list li {
  counter-increment: item 2; /* increment by 2 each time: 5, 7, 9... */
}
```

Both `counter-reset` and `counter-increment` accept an optional number after the counter name to control the starting value and step size respectively.

---

# Nested Counters (Multi-Level Numbering)

```css
.outline {
  counter-reset: section;
}

.outline > li {
  counter-increment: section;
}

.outline > li::before {
  content: counter(section) ". ";
}

.outline ol {
  counter-reset: subsection;
}

.outline ol > li {
  counter-increment: subsection;
}

.outline ol > li::before {
  content: counter(section) "." counter(subsection) " ";
}
```

Nested lists each get their own counter scope, but a nested `::before` can reference *both* the outer and inner counters together (`counter(section) "." counter(subsection)`) to produce genuine multi-level numbering like "1.1", "1.2", "2.1" — the exact pattern behind legal documents and technical outlines.

---

# Practical Example: Custom Numbered Headings

```html
<article class="numbered-doc">
  <h2>Introduction</h2>
  <h2>Methodology</h2>
  <h2>Results</h2>
</article>
```
```css
.numbered-doc {
  counter-reset: heading;
}

.numbered-doc h2 {
  counter-increment: heading;
}

.numbered-doc h2::before {
  content: counter(heading) ". ";
  color: #888;
}
```

Every `<h2>` inside `.numbered-doc` gets automatically numbered — add, remove, or reorder headings in the HTML, and the numbers update themselves with zero manual maintenance.

---

# Revision Questions

1. What are the three CSS pieces needed to build a working counter, and what does each do?
2. How would you make a counter start at 10 instead of the default 0?
3. How can nested counters produce numbering like "1.1", "1.2", "2.1"?

<details><summary>Answers</summary>

1. `counter-reset` (initializes the named counter), `counter-increment` (increases it by 1 each time the rule matches), and `counter()` used inside `content` (displays its current value).
2. `counter-reset: item 10;` — the optional number after the counter name sets its starting value.
3. Each nesting level gets its own `counter-reset`/`counter-increment` pair (a new scope), and a `content` value on the innermost element references both counters together, e.g. `content: counter(section) "." counter(subsection);`.

</details>
