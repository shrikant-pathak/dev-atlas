# Lesson 03: Common Mistakes & Anti-Patterns

## Learning Objectives
By the end of this lesson, you will be able to:
- Recognize the most common HTML mistakes across every module of this book.
- Understand why each mistake matters concretely, not just abstractly.
- Self-review your own code against this consolidated list.

---

# Introduction

This lesson is a deliberate, consolidated tour back through every module's most important "don't do this" moment — genuinely useful as a single reference to review before the capstone project, and periodically throughout your career.

---

# Structural Mistakes

**Skipping heading levels** (Module 02, Module 07):
```html
<!-- Wrong -->
<h1>Title</h1>
<h4>Subsection</h4>

<!-- Right -->
<h1>Title</h1>
<h2>Subsection</h2>
```

**"Div soup" instead of semantic elements** (Module 06):
```html
<!-- Wrong -->
<div class="header">...</div>

<!-- Right -->
<header>...</header>
```

**Multiple `<h1>` or multiple `<main>` elements** (Module 02, Module 06) — always exactly one of each per page.

---

# Accessibility Mistakes

**Missing or meaningless `alt` text** (Module 03):
```html
<!-- Wrong -->
<img src="dog.jpg" alt="image">

<!-- Right -->
<img src="dog.jpg" alt="A golden retriever running on a beach">
```

**Placeholder used as the only label** (Module 04):
```html
<!-- Wrong -->
<input type="email" placeholder="Email">

<!-- Right -->
<label for="email">Email</label>
<input type="email" id="email" placeholder="you@example.com">
```

**`<div>` reinventing a button instead of using `<button>`** (Module 07):
```html
<!-- Wrong -->
<div role="button" onclick="...">Submit</div>

<!-- Right -->
<button>Submit</button>
```

---

# Forms Mistakes

**Radio buttons with different `name` attributes** (Module 04) — breaks mutual exclusivity entirely.

**`<button>` with no `type` inside a form** (Module 04) — defaults to `type="submit"`, causing accidental form submission.

**Using GET for sensitive form data** (Module 04) — passwords/personal data must never appear in a URL.

---

# Tables Mistakes

**Using `<table>` for page layout** (Module 05) — destroys semantic meaning, breaks screen reader navigation.

**Styled `<td>` instead of `<th>`** (Module 05) — visually identical, semantically meaningless.

**Miscounted cells around `rowspan`** (Module 05) — a genuinely common source of misaligned tables.

---

# Links and Paths Mistakes

**`target="_blank"` without `rel="noopener noreferrer"`** (Module 03) — a real security vulnerability (tabnabbing).

**"Click here" as anchor text** (Module 07) — meaningless out of context for both SEO and screen reader link navigation.

**Broken relative paths after moving/copying files** (Module 03, Module 09 Lesson 02) — always verify paths after restructuring.

---

# Security and Validation Mistakes

**Trusting client-side validation alone** (Module 04) — `required`/`pattern` are UX conveniences, never a substitute for server-side validation.

**Reinventing native HTML with ARIA instead of using the native element** (Module 07) — violates the First Rule of ARIA.

---

# A Self-Review Habit

Before considering any page "done," walk through this list explicitly, or run the automated tools from earlier modules:
- W3C Validator (Module 08) — catches structural/syntax errors
- Lighthouse Accessibility audit (Module 07) — catches many accessibility issues automatically
- A manual read-through against this lesson's list — catches things automated tools can't (like meaningless alt text that's technically present but low-quality)

---

# Practical Example

A quick before/after applying this lesson's checklist:

```html
<!-- Before: multiple issues -->
<div class="header">
  <h4>My Site</h4>
</div>
<img src="photo.jpg" alt="image">
<a href="https://ex.com" target="_blank">Click here</a>

<!-- After: fixed -->
<header>
  <h1>My Site</h1>
</header>
<img src="photo.jpg" alt="Team photo at the 2026 conference">
<a href="https://ex.com" target="_blank" rel="noopener noreferrer">View our conference recap</a>
```

---

# Revision Questions

1. Why is `<button>` without an explicit `type` inside a form a genuine bug, not just a style issue?
2. What's the concrete security risk of `target="_blank"` without `rel="noopener noreferrer"`?
3. Name two automated tools covered earlier in this book that help catch these mistakes.

<details><summary>Answers</summary>

1. It defaults to `type="submit"`, meaning a button meant only for some unrelated action (like a JS toggle) will unexpectedly submit the form and potentially reload/navigate the page.
2. The newly opened page gains partial JavaScript access back to the original page via `window.opener` — a vulnerability called tabnabbing.
3. The W3C Markup Validator and Lighthouse's Accessibility audit (both from Module 07/08).

</details>
