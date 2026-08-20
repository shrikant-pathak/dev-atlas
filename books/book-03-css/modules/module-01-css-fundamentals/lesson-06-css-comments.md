# Lesson 06: CSS Comments

## Learning Objectives
By the end of this lesson, you will be able to:
- Write CSS comments correctly.
- Use comments purposefully to organize a stylesheet.
- Avoid common comment-related mistakes.

---

# Introduction

This final, short lesson of Module 01 covers CSS comments — genuinely simple syntax, but worth covering explicitly, exactly as Book 02's addendum did for HTML comments.

---

# CSS Comment Syntax

```css
/* This is a CSS comment */
p {
  color: blue; /* This styles paragraph text blue */
}
```

CSS comments use `/* ... */` — notably different from HTML's `<!-- ... -->` (Book 02 addendum) and different again from JavaScript's `//` (Book 04) — a small but genuine point of confusion when switching between languages, worth deliberately memorizing now.

**Unlike HTML comments, CSS comments can also span multiple lines naturally:**

```css
/*
  This is a longer comment
  explaining something about
  the rules below.
*/
```

---

# Practical Uses for Comments

**Organizing a large stylesheet into sections** (you'll formalize this fully in Module 13's architecture lesson):

```css
/* ===== Header Styles ===== */
header {
  background-color: navy;
}

/* ===== Navigation Styles ===== */
nav {
  display: flex;
}
```

**Explaining non-obvious decisions:**
```css
.modal {
  z-index: 9999; /* Must be higher than the navbar's z-index: 100 */
}
```

**Temporarily disabling a rule without deleting it** (similar to how you might comment out a block of HTML):
```css
p {
  color: blue;
  /* font-size: 20px; */  /* Disabled while testing default size */
}
```

---

# A Word of Caution

Same rule as HTML comments (Book 02 addendum): CSS comments remain fully visible to anyone who views your page's source or downloaded stylesheet — never include sensitive information, internal notes about vulnerabilities, or anything you wouldn't want a random visitor reading.

---

# Practical Example

```css
/* ============================
   Dev Atlas — Main Stylesheet
   ============================ */

/* Reset */
* {
  margin: 0;
  padding: 0;
}

/* Typography */
body {
  font-family: Arial, sans-serif; /* Fallback to sans-serif if Arial unavailable */
}

/* Header */
header {
  background-color: navy;
  color: white;
}
```

---

# Revision Questions

1. What syntax do CSS comments use, and how does it differ from HTML and JavaScript comment syntax?
2. Can CSS comments span multiple lines?
3. Why should you never put sensitive information in a CSS comment?

<details><summary>Answers</summary>

1. `/* ... */`; HTML uses `<!-- ... -->` and JavaScript uses `//` (or `/* ... */` for multi-line).
2. Yes, naturally, without needing any special syntax for multi-line comments.
3. Because comments remain fully visible in the page's downloaded CSS file, viewable by anyone.

</details>
