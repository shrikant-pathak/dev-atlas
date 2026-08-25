# Lesson 01: Display Property

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain and control the `display` property's core values.
- Understand `display: none` versus visibility alternatives.
- Recognize `display` as the gateway to Flexbox and Grid.

---

# Introduction

Recall Book 02, Module 01, Lesson 04's block-vs-inline distinction — that was actually CSS's `display` property at work all along, just via each element's browser-default value. This module makes that control explicit and complete.

---

# The Core Display Values

```css
div { display: block; }    /* full width, new line — the default for div, p, etc. */
span { display: inline; }    /* flows within text, no new line — the default for span, a, etc. */
```

Every element has a default `display` value set by the browser's own stylesheet — but you can override it for any element:

```css
li {
  display: inline; /* turns list items into a horizontal row instead of stacked */
}
```

This single override is genuinely how many horizontal navigation menus were built before Flexbox became standard — turning naturally block-level `<li>` elements inline so they sit side by side.

---

# `display: inline-block`

A genuine hybrid, covered fully in Lesson 06 — flows inline like text, but accepts width/height/margin/padding like a block element. Filed here as a preview since it's directly part of this same property.

---

# `display: none`

```css
.hidden {
  display: none;
}
```

Completely removes the element from the page's layout — it's not just invisible, it takes up **zero space**, as if it never existed in the HTML at all. This differs meaningfully from `visibility: hidden` (below).

---

# `display: none` vs. `visibility: hidden`

```css
.a { display: none; }        /* removed entirely — no space reserved */
.b { visibility: hidden; }     /* invisible, but STILL occupies its layout space */
```

```html
<p>Before</p>
<p class="a">Hidden A</p>
<p>After A</p>

<p>Before</p>
<p class="b">Hidden B</p>
<p>After B</p>
```

In the first case, "After A" moves up to fill the gap. In the second, "After B" stays exactly where it would be if "Hidden B" were still visible — an empty gap remains. Choosing correctly between these two matters for real layouts, and this distinction connects directly to accessibility too: `display: none` content is also removed from the accessibility tree (Book 02, Module 07), while `visibility: hidden` content generally still isn't announced but behaves slightly differently across some assistive technologies — worth testing deliberately if accessibility of hidden/shown content matters for your specific use case.

---

# `display: flex` and `display: grid` — A Preview

```css
.container {
  display: flex; /* full depth: Module 06 */
}
.grid-container {
  display: grid; /* full depth: Module 07 */
}
```

Setting `display: flex` or `display: grid` on a container fundamentally changes how *its direct children* are laid out — this single property is genuinely the entry point into the two most important modern layout systems, covered in full in the next two modules.

---

# Practical Example

```css
/* Classic horizontal nav, pre-Flexbox technique */
nav li {
  display: inline;
  margin-right: 15px;
}

/* Hide a modal until JavaScript (Book 04) shows it */
.modal {
  display: none;
}
.modal.is-open {
  display: block;
}
```

---

# Revision Questions

1. What's the fundamental difference between `display: block` and `display: inline`?
2. What's the key difference between `display: none` and `visibility: hidden`?
3. What two `display` values open the door to Flexbox and Grid layout systems?

<details><summary>Answers</summary>

1. `block` elements start on a new line and take full available width; `inline` elements flow within surrounding text and only take up as much width as their content needs.
2. `display: none` removes the element entirely from the layout, taking up zero space; `visibility: hidden` makes it invisible but still reserves its layout space, leaving a visible gap.
3. `display: flex` and `display: grid`.

</details>
