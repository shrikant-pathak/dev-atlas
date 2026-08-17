cat > lesson-05-building-full-semantic-page-layout.md << 'EOF'
# Lesson 05: Building a Full Semantic Page Layout

## Learning Objectives
By the end of this lesson, you will be able to:
- Combine every semantic element from this module into one coherent, complete page.
- Explain the reasoning behind each structural choice in a real layout.
- Avoid the most common semantic structure mistakes when building a full page.

---

# Introduction

This final lesson of Module 06 pulls everything together — every element from Lessons 01–04, combined into one realistic, complete page structure, with reasoning for every choice made along the way.

---

# The Complete Semantic Skeleton

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dev Atlas — Learn Web Development</title>
</head>
<body>

  <header>
    <h1>Dev Atlas</h1>
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/books.html">Books</a></li>
        <li><a href="/about.html">About</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section>
      <h2>Latest from the Blog</h2>

      <article>
        <header>
          <h3>Semantic HTML Explained</h3>
          <p><time datetime="2026-08-16">August 16, 2026</time></p>
        </header>
        <p>Semantic HTML means choosing elements based on meaning...</p>
        <aside>
          <h4>Quick Tip</h4>
          <p>Ask: would this content make sense entirely on its own?</p>
        </aside>
        <footer>
          <p>Tags: HTML, Accessibility</p>
        </footer>
      </article>

      <article>
        <header>
          <h3>Understanding Forms</h3>
          <p><time datetime="2026-08-10">August 10, 2026</time></p>
        </header>
        <p>Forms are how the web collects information...</p>
      </article>
    </section>

    <section>
      <h2>Why Dev Atlas?</h2>
      <p>A complete, beginner-to-advanced web development roadmap.</p>
    </section>
  </main>

  <aside>
    <h2>Popular This Week</h2>
    <ul>
      <li><a href="#">Getting Started with HTML</a></li>
      <li><a href="#">CSS Flexbox Basics</a></li>
    </ul>
  </aside>

  <footer>
    <p>&copy; 2026 Dev Atlas. Built by Shrikant Pathak.</p>
    <nav>
      <a href="/privacy.html">Privacy</a>
      <a href="/terms.html">Terms</a>
    </nav>
  </footer>

</body>
</html>
```

---

# Reasoning Behind Every Choice

- **`<header>` (page-level)** — contains the site title and primary navigation, the introductory content for the entire page.
- **`<nav>` (inside header)** — the primary site navigation, genuinely major, correctly wrapped.
- **`<main>`** — exactly one, containing everything unique to this specific page.
- **`<section>` ("Latest from the Blog")** — a thematic grouping, not independently meaningful on its own as a standalone syndicated item.
- **`<article>` (each blog post)** — passes the "makes sense standalone" test; each could be syndicated independently.
- **`<header>`/`<footer>` (inside each article)** — introductory/closing content specific to *that article*, distinct from the page-level header/footer.
- **`<aside>` (inside an article)** — a tangential tip related to that specific article's content.
- **`<aside>` (page-level, outside main)** — tangential site-wide content ("Popular This Week"), not specific to any one article.
- **`<footer>` (page-level)** — copyright and legal links, genuinely closing content for the whole page.
- **`<nav>` (inside footer)** — a smaller, legitimately secondary navigation block (privacy/terms links) — still `<nav>`, since it's still a genuine navigation menu, just a secondary one.

---

# Common Structure Mistakes to Avoid

1. **Multiple `<main>` elements** — always exactly one per page.
2. **`<article>` for content that isn't standalone** — a "Testimonials" block that only makes sense in context of the surrounding page is a `<section>`, not `<article>`.
3. **`<aside>` used purely for visual sidebars containing primary content** — check semantic relevance, not visual position.
4. **Reaching for `<section>` with no heading** — a `<section>` without a genuine heading is often a sign a plain `<div>` was actually the right choice.
5. **Skipping semantic elements entirely, defaulting back to `<div>` everywhere** — the "div soup" problem from Lesson 01, still worth actively avoiding.

---

# Practical Example

The complete skeleton above IS the practical example for this lesson — build it yourself in a real `.html` file, view it in a browser, and inspect it in DevTools' Elements panel (Book 01, Module 06) to see the actual structure rendered.

---

# Revision Questions

1. In the complete example, why is "Latest from the Blog" a `<section>` while each blog post is an `<article>`?
2. Why can the page have both a page-level `<footer>` and an article-level `<footer>`?
3. Name two common mistakes to watch for when structuring a full semantic page.

<details><summary>Answers</summary>

1. "Latest from the Blog" is a thematic grouping that only makes sense as part of the page; each individual blog post would make complete sense read entirely on its own, passing the `<article>` test.
2. Because `<footer>` represents the closing content of its nearest containing sectioning element — the page-level `<footer>` closes the whole page, while an article's own `<footer>` closes just that article's content.
3. Any two of: multiple `<main>` elements, using `<article>` for non-standalone content, using `<aside>` purely for visual position rather than semantic relevance, using `<section>` with no genuine heading, defaulting back to `<div>` everywhere out of habit.

</details>

---

# 🏁 Module 06 Checkpoint

Before moving to Module 07, you should be able to:
- [ ] Explain precisely what "semantic HTML" means and why it matters concretely
- [ ] Use `<header>`, `<nav>`, `<footer>` correctly, including at multiple structural levels
- [ ] Confidently distinguish `<section>` from `<article>` using the standalone test
- [ ] Use `<aside>` for genuinely tangential content, not just visual sidebars
- [ ] Build a complete, correctly structured semantic page layout from scratch

**Next up:** Module 07 — Accessibility (a11y) & SEO Fundamentals
EOF