# Lesson 02: HTML Document Structure & Boilerplate

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the purpose of every line in a standard HTML boilerplate.
- Understand the difference between the `<head>` and `<body>` sections.
- Write a correct, complete HTML document from memory.

---

# Introduction

Every HTML file you'll ever write starts with a nearly identical skeleton — the "boilerplate." This lesson breaks down exactly what each line does, so it stops being something you copy-paste blindly and becomes something you genuinely understand.

---

# The Standard Boilerplate

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Title</title>
  </head>
  <body>

  </body>
</html>
```

---

# Line by Line

**`<!DOCTYPE html>`**
Tells the browser which version of HTML this document uses. This exact declaration means "HTML5" — earlier HTML versions had longer, more complex DOCTYPE declarations. Without it, browsers can fall back into "quirks mode," an older, inconsistent rendering behavior — always include it.

**`<html lang="en">`**
The root element containing the entire document. The `lang` attribute declares the page's primary language, which matters for accessibility (screen readers use it to select correct pronunciation) and SEO (Book 02, Module 07).

**`<head>`**
Contains metadata *about* the page — information for the browser and search engines, not visible content itself. Nothing inside `<head>` is directly rendered on the page (with a couple of narrow exceptions, like `<title>`).

**`<meta charset="UTF-8">`**
Declares the character encoding, connecting directly back to Book 01, Module 02 (Number Systems & Data Representation) — UTF-8 ensures special characters, emoji, and non-English text render correctly rather than as garbled symbols.

**`<meta name="viewport" content="width=device-width, initial-scale=1.0">`**
Controls how the page scales on mobile devices, telling the browser to match the page's width to the device's screen width rather than rendering a "desktop-sized" page and zooming out. Without this, mobile responsiveness (which you'll build extensively in Book 03, CSS) simply won't work correctly.

**`<title>`**
Sets the text shown in the browser tab and used as the default heading in search engine results and bookmarks. This *is* visible, just not within the page's body — it renders in the browser's UI itself.

**`<body>`**
Contains all the actual visible content of the page — everything you can see and interact with. Every lesson from here through the rest of this book focuses almost entirely on what goes inside `<body>`.

---

# Nesting and Indentation

HTML elements can contain other elements, forming a nested tree structure (recall the DOM concept from Book 01, Module 05):

```html
<body>
  <div>
    <h1>Title</h1>
    <p>Some text.</p>
  </div>
</body>
```

Consistent indentation (2 or 4 spaces per nesting level) isn't required for the browser to render correctly, but it's essential for humans to read and maintain the structure — you'll set this convention explicitly in Module 09 (Best Practices).

---

# Practical Example

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shrikant's Portfolio</title>
  </head>
  <body>
    <h1>Welcome to my portfolio</h1>
  </body>
</html>
```

---

# Revision Questions

1. What does `<!DOCTYPE html>` do, and what happens if you omit it?
2. What's the difference between what goes in `<head>` versus `<body>`?
3. Why does the viewport meta tag matter for mobile devices?

<details><summary>Answers</summary>

1. It declares the document as HTML5, ensuring the browser renders it in standard mode rather than falling back to inconsistent "quirks mode."
2. `<head>` contains metadata about the page (not directly visible content, aside from the title); `<body>` contains all the actual visible, renderable content of the page.
3. Without it, the browser renders the page at a fixed "desktop" width and then zooms out to fit the screen, rather than actually matching the page's width to the device — breaking responsive design.

</details>
