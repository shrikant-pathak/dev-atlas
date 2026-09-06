# Lesson 04: :has() and Modern Selectors

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `:has()` to style an element based on its descendants.
- Use `:is()` and `:where()` to simplify complex selector lists.
- Understand the specificity difference between `:is()` and `:where()`.

---

# Introduction

Module 04 covered the foundational pseudo-classes and combinators. This lesson covers a newer generation of selectors that solve problems those original tools genuinely couldn't — most notably `:has()`, sometimes called the "parent selector," which lets CSS finally style an element based on what's *inside* it.

---

# `:has()` — Styling Based on Descendants

```css
.card:has(img) {
  padding: 0; /* cards containing an image get no padding */
}

.card:not(:has(img)) {
  padding: 1.5rem; /* cards without an image keep normal padding */
}
```

For the entire history of CSS before `:has()`, selectors could only look at an element and its *ancestors/siblings* — never its own descendants. `:has()` breaks that limitation: `.card:has(img)` matches a `.card` *only if* it contains an `<img>` somewhere inside it. This is a genuinely significant capability CSS lacked for decades.

---

# Practical `:has()` Patterns

```css
/* Style a form group differently if it contains an invalid input */
.form-group:has(:invalid) {
  border-left: 3px solid #e05252;
}

/* Style a label based on its checkbox's checked state */
label:has(input:checked) {
  background: #e8f4fd;
}

/* Style a list item only if the NEXT sibling exists (checking forward) */
li:has(+ li) {
  border-bottom: 1px solid #eee; /* every item except the last gets a divider */
}
```

Recall `:invalid` from Module 10's forms lesson, and the sibling combinator (`+`) from Module 04 — `:has()` can take any selector inside it, including combinators, making it genuinely flexible for conditional styling based on relationships CSS previously had no way to express.

---

# `:is()` — Simplifying Selector Lists

```css
/* Without :is() */
header a, main a, footer a {
  color: blue;
}

/* With :is() */
:is(header, main, footer) a {
  color: blue;
}
```

`:is()` takes a comma-separated list of selectors and matches any of them — genuinely useful for collapsing repetitive selector lists, especially once nested deeper:

```css
:is(section, article, aside) :is(h2, h3) {
  margin-top: 1.5rem;
}
```

---

# `:where()` — Same Matching, Zero Specificity

```css
:where(header, main, footer) a {
  color: blue; /* has ZERO specificity contribution */
}
```

`:where()` matches identically to `:is()`, but — critically — it always contributes **zero specificity**, regardless of what's inside it. Recall specificity from Module 01 — this makes `:where()` genuinely valuable for writing baseline/reset styles that are trivially easy to override later, since they won't out-specificity a more targeted rule the way an equivalent `:is()` or plain selector list would.

---

# `:is()` vs. `:where()` — The Specificity Difference

```css
:is(.card, .panel) h2 { color: red; }   /* specificity: highest of .card/.panel + h2 */
:where(.card, .panel) h2 { color: blue; } /* specificity: just h2 (0,0,1) */
```

**Rule of thumb:** use `:is()` when you want the convenience of a selector list but are fine with normal specificity rules applying; use `:where()` specifically when you want that convenience *without* affecting how easily the rule can be overridden later — commonly in reusable component libraries or CSS resets.

---

# Practical Example: A Smart Form Validation Indicator

```html
<div class="form-group">
  <label>Email</label>
  <input type="email" required>
</div>
```
```css
.form-group:has(input:invalid:not(:placeholder-shown)) {
  background: #fdf0f0;
  border-radius: 6px;
  padding: 0.5rem;
}
```

Recall `:not(:placeholder-shown)` from Module 10's forms lesson — combined with `:has()`, the *entire* form group (label included, not just the input) gets a visual treatment the moment its input becomes genuinely invalid, something that was structurally impossible to express in CSS before `:has()` existed.

---

# Revision Questions

1. What capability does `:has()` give CSS that it never had before?
2. What's the difference between what `:is()` and `:where()` each match?
3. Why would you specifically choose `:where()` over `:is()` in a shared component library?

<details><summary>Answers</summary>

1. The ability to style an element based on what's inside it (its descendants) — CSS selectors previously could only look at an element's ancestors or siblings, never its own descendants.
2. Nothing — they match identically, both taking a comma-separated selector list. The difference is specificity: `:is()` contributes the specificity of its highest-specificity argument, while `:where()` always contributes zero specificity.
3. Because `:where()`'s zero specificity means the rule is trivially easy to override later without specificity conflicts — valuable for baseline/reset styles or shared components meant to be customized by consuming code.

</details>
