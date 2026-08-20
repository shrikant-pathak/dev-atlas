# Lesson 01: Introduction to CSS

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what CSS is and its role alongside HTML.
- Understand the basic idea of "selecting" elements to style.
- Write and view your first styled page.

---

# Introduction

Welcome to Book 03. Book 02 taught you to structure content correctly — HTML's entire job. Now you'll learn to make that content look the way you actually want it to. Recall the analogy from Book 02, Module 01: if HTML is the skeleton, **CSS is the skin, clothes, and appearance**.

---

# What Is CSS?

**CSS (Cascading Style Sheets)** is the language used to describe how HTML content should be presented — colors, fonts, spacing, layout, and more. Created in 1994 by Håkon Wium Lie, CSS works *alongside* HTML rather than replacing any of it: HTML still describes structure and meaning (Book 02); CSS describes appearance.

Without CSS, every page you built in Book 02 rendered in the browser's plain default styling — black text, blue underlined links, default spacing. CSS is what transforms that into an actual designed page.

---

# The Core Idea: Select, Then Style

Every piece of CSS follows the same fundamental pattern: **select which HTML element(s) you want to style, then declare how they should look.**

```css
p {
  color: blue;
}
```

This says: "Select every `<p>` element, and make its text color blue." That's genuinely the entire mental model CSS is built on — you'll spend Module 04 going deep on increasingly precise ways to select elements, but the core idea never changes.

---

# Your First Styled Page

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My First Styled Page</title>
  <style>
    h1 {
      color: darkblue;
    }
    p {
      color: gray;
      font-size: 18px;
    }
  </style>
</head>
<body>
  <h1>Hello, Styled World!</h1>
  <p>This paragraph is now gray and larger than default.</p>
</body>
</html>
```

Notice the `<style>` tag inside `<head>` — this is one way to add CSS to a page (Lesson 03 covers all three methods in depth). Save this as an `.html` file and open it in your browser to see real styling applied for the first time.

---

# The Meaning of "Cascading"

The "C" in CSS is genuinely important, not just decorative naming. **Cascading** refers to how CSS rules can come from multiple sources and combine, with specific, predictable rules determining which style ultimately "wins" when there's conflict. You'll go deep on this in Lesson 05 — for now, just know that "cascading" is describing a real mechanism you'll rely on constantly, not just a stylistic name.

---

# CSS's Relationship to HTML and JavaScript (Recap)

Recall the "three pillars" table from Book 02, Module 01:

| Technology | Responsibility |
|---|---|
| HTML | Structure & content |
| **CSS** | **Presentation & styling** |
| JavaScript | Behavior & interactivity |

This separation is deliberate and valuable — the same HTML content can look completely different with different CSS applied, without touching the HTML at all. You'll experience this directly in Module 13's capstone, applying entirely new styling to the exact HTML portfolio project you built in Book 02.

---

# Revision Questions

1. What is CSS's core responsibility, and what is it explicitly NOT responsible for?
2. What is the fundamental two-step pattern every piece of CSS follows?
3. What does "cascading" refer to in CSS's name?

<details><summary>Answers</summary>

1. CSS is responsible for presentation/styling; it is not responsible for content structure (HTML's job) or interactive behavior (JavaScript's job).
2. Select which HTML element(s) to target, then declare how they should look.
3. The mechanism by which CSS rules from multiple sources combine, with predictable rules determining which style wins when there's conflict — covered in depth in Lesson 05.

</details>
