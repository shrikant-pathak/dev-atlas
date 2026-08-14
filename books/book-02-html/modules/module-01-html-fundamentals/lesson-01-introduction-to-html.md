cat > lesson-01-introduction-to-html.md << 'EOF'
# Lesson 01: Introduction to HTML

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what HTML is and its role in every website you've ever visited.
- Understand HTML's relationship with CSS and JavaScript.
- Write and view your very first HTML page.

---

# Introduction

Welcome to Book 02 — and to actually writing your first real web technology. Everything in Book 01 explained the *world* HTML lives in: computers, networks, browsers, the rendering pipeline. Now you build the thing that world actually renders.

---

# What Is HTML?

**HTML (HyperText Markup Language)** is the standard markup language used to structure content on the web. It's not a programming language — it has no logic, loops, or calculations (that's JavaScript's job, in Book 04). HTML's entire purpose is describing the *structure and meaning* of content: "this is a heading," "this is a paragraph," "this is a list of items," "this is a button."

Recall from Book 01, Module 05 (Rendering Engine): the browser parses HTML text into the **DOM** — a tree of objects representing your page's structure. HTML is the raw material that DOM is built from.

---

# The Three Pillars of the Web

You'll hear this analogy constantly, and it's genuinely useful:

| Technology | Responsibility | Analogy |
|---|---|---|
| **HTML** | Structure & content | The skeleton of a body |
| **CSS** | Presentation & styling | The skin, clothes, appearance |
| **JavaScript** | Behavior & interactivity | The muscles and nervous system |

A webpage with only HTML is fully readable and structurally sound — just visually plain (default browser styling, black text on white background) and non-interactive. This is deliberate: HTML should describe *what* something is, not *how it looks* or *what it does* — those are CSS's and JavaScript's jobs respectively, coming in Books 03 and 04.

---

# Your First HTML Page

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My First Page</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <p>This is my very first HTML page.</p>
  </body>
</html>
```

Every piece of this will be explained in depth in Lesson 02 — for now, just notice the pattern: content is wrapped in **tags** (`<h1>`, `<p>`) that describe what that content *is*.

---

# Creating and Viewing Your First File

1. Open VS Code (Book 01, Module 06).
2. Create a new file named `index.html`.
3. Paste the code above and save.
4. Right-click the file in VS Code's Explorer → "Open with Live Server" (the extension from Book 01, Module 06) — or simply double-click the file in Finder/File Explorer to open it directly in your browser.

You've just rendered your first webpage.

---

# A Brief History (Context, Not Trivia)

HTML was created by Tim Berners-Lee in 1991 alongside the World Wide Web itself (Book 01, Module 04). It has evolved through several major versions since — HTML 4.01, XHTML, and the current standard, **HTML5**, released in 2014, which added many of the semantic and API features you'll learn throughout this book.

---

# Revision Questions

1. What is HTML responsible for, and what is it explicitly *not* responsible for?
2. Complete the analogy: HTML is to a body's skeleton as CSS is to ___ and JavaScript is to ___.
3. What does a webpage with only HTML (no CSS or JS) look and behave like?

<details><summary>Answers</summary>

1. HTML is responsible for structuring and describing the meaning of content; it is not responsible for visual styling (CSS's job) or interactive behavior (JavaScript's job).
2. Skin/clothes/appearance (CSS); muscles/nervous system, i.e. behavior (JavaScript).
3. Structurally sound and fully readable, but visually plain (default browser styles) and non-interactive.

</details>
EOF