# Lesson 04: Web Fonts & @font-face

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the limitation web fonts solve.
- Use Google Fonts to add a custom font to a project.
- Use `@font-face` to self-host a custom font file.

---

# Introduction

Lesson 03's font stacks only work with fonts already installed on the user's device — a genuine limitation, since you can't guarantee any specific font is actually present. This lesson covers **web fonts** — the solution that lets you use literally any font, downloaded and rendered directly by the browser.

---

# The Problem Web Fonts Solve

Without web fonts, your design is limited to whatever "web-safe" fonts happen to be commonly pre-installed across most operating systems (Arial, Georgia, Times New Roman, and a handful of others) — genuinely restrictive for real design work wanting a distinctive, specific typeface.

**Web fonts** solve this by having the browser *download the actual font file* as part of loading the page — exactly like it downloads images or CSS itself (recall the request/response cycle from Book 01, Module 05).

---

# Method 1: Google Fonts (The Easiest Path)

**Google Fonts** is a free, hosted library of hundreds of open-source fonts. Using one requires just two steps:

**Step 1 — Link the font in your HTML `<head>`:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
```

**Step 2 — Use it in your font-family, with a fallback:**
```css
body {
  font-family: "Roboto", sans-serif;
}
```

The `wght@400;700` in the URL specifies which weights to actually download (regular and bold) — only request the weights you genuinely use, since each additional weight is a separate file download, connecting back to Book 01's performance/caching concerns.

---

# Method 2: `@font-face` (Self-Hosting)

For fonts not available on Google Fonts, or when you want full control over hosting (avoiding a third-party request entirely — a genuine privacy/performance consideration), `@font-face` lets you load a font file directly:

```css
@font-face {
  font-family: "MyCustomFont";
  src: url("fonts/my-custom-font.woff2") format("woff2"),
       url("fonts/my-custom-font.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: "MyCustomFont", sans-serif;
}
```

- `font-family` here is a **name you choose** — it doesn't need to match the actual font file's name, but should be descriptive.
- Multiple `src` formats let the browser pick the first one it supports (mirroring the exact fallback pattern from Book 02's `<video>`/`<picture>` elements — this is a recurring theme across web technologies).
- **`.woff2`** is the modern, most compressed, widely-supported format; **`.woff`** is an older fallback for broader compatibility.

---

# Font Loading Performance: `font-display`

```css
@font-face {
  font-family: "MyCustomFont";
  src: url("fonts/my-custom-font.woff2") format("woff2");
  font-display: swap;
}
```

`font-display: swap` tells the browser to show fallback text immediately using a system font, then swap to the custom web font once it finishes downloading — avoiding invisible text while the font loads (a real, historically common UX problem called "flash of invisible text," or FOIT). This connects directly to Book 01's performance/loading concepts.

---

# Practical Example

```html
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
```
```css
body {
  font-family: "Poppins", sans-serif;
  font-weight: 400;
}
h1 {
  font-family: "Poppins", sans-serif;
  font-weight: 600;
}
```

---

# Revision Questions

1. What limitation do web fonts solve that plain font stacks (Lesson 03) cannot?
2. What are the two main ways to add a custom web font to a project?
3. What does `font-display: swap` accomplish, and what problem does it solve?

<details><summary>Answers</summary>

1. Plain font stacks are limited to fonts already installed on the user's device; web fonts let the browser download and render any font file, regardless of what's locally installed.
2. Using a hosted service like Google Fonts, or self-hosting a font file directly via `@font-face`.
3. It shows fallback text immediately using a system font while the custom font downloads, then swaps once ready — avoiding a "flash of invisible text" where content is hidden while the font loads.

</details>
