# Lesson 01: HTML Style Guide & Coding Conventions

## Learning Objectives
By the end of this lesson, you will be able to:
- Apply consistent naming, indentation, and formatting conventions.
- Understand why consistency matters more than any single "correct" style.
- Adopt a genuine, industry-common HTML style guide.

---

# Introduction

This final module shifts from *what HTML can do* to *how professionals actually write it day to day*. This lesson covers style and conventions — the small, consistent choices that separate genuinely professional code from a pile of technically-working tags.

---

# Indentation and Nesting

Recall Book 01, Module 09's rule about consistent project file structure — the same principle applies within a single file. Pick 2 or 4 spaces (never tabs mixed with spaces, per Book 01, Module 06's editor discussion) and apply it consistently:

```html
<!-- Consistent 2-space indentation -->
<div class="card">
  <h2>Title</h2>
  <p>Content</p>
</div>
```

VS Code's Prettier extension (Book 01, Module 06) automates this entirely — genuinely worth configuring now, rather than manually maintaining consistency by hand.

---

# Naming Conventions: `kebab-case`

Recall Book 01, Module 06's brief mention — HTML class names, IDs, and file names conventionally use **kebab-case** (lowercase, hyphen-separated):

```html
<!-- Good -->
<div class="user-profile-card" id="main-nav"></div>

<!-- Avoid -->
<div class="UserProfileCard" id="mainNav"></div>
```

This differs from JavaScript's `camelCase` convention (Book 04) — a genuinely common point of confusion for beginners moving between HTML/CSS and JavaScript, worth internalizing now: **HTML/CSS = kebab-case, JavaScript = camelCase**.

---

# Attribute Ordering (A Common Convention)

While not enforced by any tool automatically, many style guides recommend a consistent attribute order for readability:

```html
<img
  class="hero-image"
  id="main-hero"
  src="hero.jpg"
  alt="A mountain landscape at sunset"
  width="800"
  height="600"
>
```

A common pattern: `class`/`id` first, then core functional attributes (`src`, `href`), then everything else. The exact order matters less than picking one and applying it consistently across a project.

---

# Lowercase Tags and Attributes

```html
<!-- Correct, modern convention -->
<div class="card"></div>

<!-- Avoid - valid but non-standard style -->
<DIV CLASS="card"></DIV>
```

Older HTML (and XHTML) sometimes used uppercase tags — modern convention is exclusively lowercase for both tags and attribute names.

---

# Quote Style: Double Quotes

```html
<!-- Convention -->
<div class="card"></div>

<!-- Avoid -->
<div class='card'></div>
```

Both single and double quotes are technically valid HTML, but double quotes are the overwhelming industry convention — genuinely just pick one and stay consistent, but default to double quotes to match what you'll see in nearly every codebase and tutorial.

---

# A Real, Adoptable Style Guide

Rather than inventing your own from scratch, adopt an established one — **Google's HTML/CSS Style Guide** is widely referenced and genuinely worth reading in full once you're comfortable with this module's basics (a quick web search for "Google HTML CSS Style Guide" will find it).

---

# Why Consistency Matters More Than "Correctness"

This is worth stating explicitly: for most of these choices (2 vs. 4 spaces, exact attribute order), there is no single objectively "correct" answer — what matters is **picking one and applying it consistently** across an entire project. Inconsistency (mixing tabs and spaces, mixing quote styles) creates real friction for anyone reading or maintaining the code, including future you.

---

# Practical Example

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Consistent Style Example</title>
</head>
<body>
  <header class="site-header" id="top">
    <h1 class="site-title">Dev Atlas</h1>
    <nav class="main-nav">
      <a href="/" class="nav-link">Home</a>
      <a href="/about.html" class="nav-link">About</a>
    </nav>
  </header>
</body>
</html>
```

---

# Revision Questions

1. What naming convention do HTML class names and IDs conventionally use, and how does it differ from JavaScript's convention?
2. Why does the exact indentation size (2 vs. 4 spaces) matter less than the fact that it's applied consistently?
3. What tool from Book 01 can automate consistent formatting rather than relying on manual discipline?

<details><summary>Answers</summary>

1. kebab-case (lowercase, hyphen-separated); JavaScript conventionally uses camelCase instead.
2. Because there's no single objectively "correct" choice — what actually matters for readability and maintainability is consistency across the entire project, not which specific number was chosen.
3. Prettier (a VS Code extension covered in Book 01, Module 06).

</details>
