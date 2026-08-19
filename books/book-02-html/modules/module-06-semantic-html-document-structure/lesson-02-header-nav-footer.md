# Lesson 02: `<header>`, `<nav>`, `<footer>`

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<header>`, `<nav>`, and `<footer>` correctly.
- Understand that `<header>`/`<footer>` can appear multiple times per page, at different structural levels.
- Combine these elements with concepts from earlier modules (like the `<nav>` you built in Module 03).

---

# Introduction

This lesson covers three of the most common semantic landmarks — likely familiar in concept already, since you built a `<nav>` back in Module 03, Lesson 02, before this module formally introduced it. Now you'll see it in its proper structural context.

---

# `<header>`

Represents introductory content for its nearest containing sectioning element — typically containing a heading, logo, and/or navigation:

```html
<header>
  <h1>Dev Atlas</h1>
  <p>A complete web development roadmap</p>
</header>
```

**Important nuance:** `<header>` is not limited to one per page. It represents the *introductory content of whatever section it's inside* — meaning an `<article>` (Lesson 03) can have its own `<header>` distinct from the page's overall `<header>`:

```html
<body>
  <header>
    <h1>Dev Atlas Blog</h1>
  </header>

  <article>
    <header>
      <h2>Understanding Semantic HTML</h2>
      <p>Published August 2026</p>
    </header>
    <p>Article content...</p>
  </article>
</body>
```

---

# `<nav>`

Represents a section containing primary navigation links — recall from Module 03, this is exactly the element that should wrap your navigation menu:

```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about.html">About</a></li>
    <li><a href="/contact.html">Contact</a></li>
  </ul>
</nav>
```

**Important nuance:** not every group of links needs `<nav>` — it's meant for genuinely major navigation blocks (primary site navigation, a table of contents), not every small cluster of links on a page (like links within an article's body text, or a simple list of related-post links in a footer).

---

# `<footer>`

Represents footer content for its nearest containing sectioning element — typically containing copyright info, related links, or contact details:

```html
<footer>
  <p>&copy; 2026 Dev Atlas. All rights reserved.</p>
  <nav>
    <a href="/privacy.html">Privacy Policy</a>
    <a href="/terms.html">Terms of Service</a>
  </nav>
</footer>
```

Like `<header>`, `<footer>` can appear multiple times — a page-level footer, and separately, an `<article>` might have its own `<footer>` containing author bio or tags related just to that article.

---

# Multiple Headers/Footers on One Page

```html
<body>
  <header>
    <h1>Dev Atlas</h1>
    <nav>...</nav>
  </header>

  <main>
    <article>
      <header>
        <h2>Post Title</h2>
      </header>
      <p>Post content...</p>
      <footer>
        <p>Tags: HTML, Semantic Markup</p>
      </footer>
    </article>
  </main>

  <footer>
    <p>&copy; 2026 Dev Atlas</p>
  </footer>
</body>
```

This nesting is entirely valid and, in fact, the correct semantic pattern — each `<header>`/`<footer>` describes the introductory/closing content of *its own* containing section, not necessarily the whole page.

---

# Practical Example

```html
<header>
  <h1>Dev Atlas</h1>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/books.html">Books</a></li>
    </ul>
  </nav>
</header>

<footer>
  <p>&copy; 2026 Dev Atlas — Built by Shrikant Pathak</p>
</footer>
```

---

# Revision Questions

1. Can a page have more than one `<header>`? Explain why or why not.
2. Should every small cluster of links on a page be wrapped in `<nav>`? Why or why not?
3. What kind of content typically belongs in a `<footer>`?

<details><summary>Answers</summary>

1. Yes — `<header>` represents the introductory content of its *nearest containing sectioning element*, so a page's overall `<header>` and an individual `<article>`'s own `<header>` can both validly exist.
2. No — `<nav>` should be reserved for genuinely major navigation blocks (primary site nav, a table of contents), not every small group of links, like links within body text.
3. Copyright/legal info, related links, contact details, or (for an `<article>`'s own footer) author bio or tags related specifically to that content.

</details>
