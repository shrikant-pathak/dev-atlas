# Lesson 03: Adding CSS (Inline, Internal, External)

## Learning Objectives
By the end of this lesson, you will be able to:
- Use all three methods of applying CSS to HTML.
- Explain why external CSS is the professional standard, not just a stylistic preference.
- Understand how these three methods interact when combined.

---

# Introduction

There are exactly three ways to connect CSS to an HTML document. This lesson covers all three, and — genuinely important — explains why one of them dominates real-world professional practice, tying directly back to lessons on file organization from Book 01 and Book 02.

---

# Method 1: Inline CSS

Applied directly to a single element via the `style` attribute (recall this attribute from Book 02, Module 01, Lesson 05 — global attributes):

```html
<p style="color: blue; font-size: 18px;">Styled directly on this element.</p>
```

**Why this is generally discouraged:** it mixes structure (HTML) and presentation (CSS) directly together, applies only to one single element (no reuse), and has the highest specificity of any method (Lesson 05), making it genuinely hard to override later. Reserve inline styles for rare, genuinely one-off cases or dynamic styles set by JavaScript (Book 04) — not as your default approach.

---

# Method 2: Internal (Embedded) CSS

Placed inside a `<style>` tag within the document's `<head>` — exactly what Lesson 01's example used:

```html
<head>
  <style>
    p {
      color: blue;
      font-size: 18px;
    }
  </style>
</head>
```

**When this is appropriate:** styles genuinely specific to a single page, quick prototyping/testing, or (as you'll see constantly) inline code examples in documentation and tutorials, exactly like this book's lessons. Still not the professional default for real projects, since styles can't be reused across multiple pages.

---

# Method 3: External CSS (The Professional Standard)

CSS written in its own separate `.css` file, linked into the HTML document:

```html
<head>
  <link rel="stylesheet" href="styles.css">
</head>
```

```css
/* styles.css */
p {
  color: blue;
  font-size: 18px;
}
```

**Why this is the standard for real projects:**
1. **Reusability** — one stylesheet can style every page of a multi-page site (recall Book 02, Module 09's multi-page structure lesson — this is the missing piece that makes shared styling actually practical).
2. **Separation of concerns** — HTML stays purely structural, CSS stays purely presentational, echoing the same principle behind semantic HTML (Book 02, Module 06).
3. **Caching** — recall Book 01, Module 05's caching lesson: a separate `.css` file gets cached by the browser once and reused across every page, rather than being re-downloaded as part of every single HTML page.
4. **Maintainability** — updating a color scheme means editing one file, not hunting through every page.

---

# How the Three Methods Combine: Specificity Preview

You can genuinely use all three methods on the same page simultaneously — when they conflict, a real, predictable priority order determines which wins:

Inline styles > Internal/External styles (specificity-dependent) > Browser defaults

This is a preview — the full, precise mechanism (specificity and the cascade) is Lesson 05's entire subject. For now, just know that combining methods isn't an error; it's normal, and CSS has clear rules for resolving conflicts between them.

---

# File Organization Recommendation

Recall Book 01, Module 06's project structure lesson, which included a `css/` (or similarly named) folder as part of a sensible project layout:

my-site/
├── index.html
├── about.html
├── css/
│ └── styles.css
└── images/

This is exactly the structure you'll use starting now — and precisely what Module 13's capstone project will formalize further.

---

# Practical Example

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>External CSS Example</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <h1>Styled entirely from an external file</h1>
</body>
</html>
```

---

# Revision Questions

1. What are the three ways to add CSS to an HTML page?
2. Why is external CSS considered the professional standard for real, multi-page projects?
3. Can inline, internal, and external CSS all be used on the same page at once?

<details><summary>Answers</summary>

1. Inline (via the `style` attribute), internal (via a `<style>` tag in `<head>`), and external (via a linked `.css` file).
2. It enables reusability across multiple pages, proper separation of structure and presentation, browser caching benefits, and easier long-term maintenance.
3. Yes — all three can coexist on the same page; CSS has predictable rules (covered fully in Lesson 05) for resolving conflicts between them.

</details>
