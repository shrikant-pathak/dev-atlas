cat > lesson-03-main-section-article.md << 'EOF'
# Lesson 03: `<main>`, `<section>`, `<article>`

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<main>` correctly, including its accessibility significance.
- Distinguish between `<section>` and `<article>` — the most commonly confused pair in semantic HTML.
- Apply the "would this make sense on its own?" test to choose correctly.

---

# Introduction

This lesson covers the three elements that structure a page's actual primary content — and specifically tackles `<section>` vs. `<article>`, genuinely the most commonly confused pair in all of semantic HTML, even among experienced developers.

---

# `<main>`

Represents the dominant, unique content of the page — excluding repeated content like headers, footers, and sidebars:

```html
<body>
  <header>...</header>
  <main>
    <h1>Welcome to Dev Atlas</h1>
    <p>The actual unique content of this page goes here.</p>
  </main>
  <footer>...</footer>
</body>
```

**Critical rules:**
- **Exactly one `<main>` per page** — unlike `<header>`/`<footer>`, this one truly is singular.
- **Never nested inside `<article>`, `<aside>`, `<header>`, `<footer>`, or `<nav>`** — it represents the page's overall main content, not a subsection's.

Accessibility significance: `<main>` lets screen reader users "skip to main content" instantly — a genuinely common, real feature, bypassing repeated navigation/header content that would otherwise need to be tediously navigated through on every single page load.

---

# `<article>`

Represents **self-contained content that would make sense independently** — distributable and reusable on its own, even completely removed from the page's surrounding context:

```html
<article>
  <h2>Understanding Semantic HTML</h2>
  <p>Published August 2026 by Shrikant Pathak</p>
  <p>Full article content here...</p>
</article>
```

**The test:** would this content make sense as a standalone item in an RSS feed, syndicated to another site, or read completely out of context? A blog post, a news story, a forum post, a product card in a catalog — all pass this test.

---

# `<section>`

Represents a **thematic grouping of content**, generally with its own heading, but NOT necessarily meaningful entirely independent of the rest of the page:

```html
<section>
  <h2>Our Services</h2>
  <p>We offer web development, design, and consulting.</p>
</section>
```

**The test:** does this content only really make sense as *part of* a larger page, rather than standing entirely alone? A "Services" section on a company homepage, a "Reviews" section on a product page — these are meaningful groupings, but wouldn't make sense syndicated in isolation the way a full article would.

---

# `<section>` vs. `<article>`: The Decisive Test

| Question | If Yes → | If No → |
|---|---|---|
| Would this content make complete sense read entirely on its own, out of context? | `<article>` | `<section>` |

**A genuinely useful nuance:** an `<article>` can *contain* `<section>` elements (a long article broken into thematic sections), and a `<section>` can contain multiple `<article>` elements (a "Latest Posts" section containing several distinct blog post articles):

```html
<section>
  <h2>Latest Blog Posts</h2>
  <article>
    <h3>Post One</h3>
    <p>...</p>
  </article>
  <article>
    <h3>Post Two</h3>
    <p>...</p>
  </article>
</section>
```

---

# When Neither Fits: Back to `<div>`

Not every grouping of content is a `<section>` — recall Module 01's rule: `<div>` remains correct when you just need a generic container for styling/scripting purposes, with no genuine thematic or standalone meaning. Wrapping every small `<div>` in `<section>` "just to be semantic" is itself a misuse — a section should have a genuine heading and thematic identity.

---

# Practical Example

```html
<main>
  <section>
    <h2>Featured Articles</h2>
    <article>
      <h3>Getting Started with HTML</h3>
      <p>An introduction for beginners...</p>
    </article>
    <article>
      <h3>Semantic HTML Explained</h3>
      <p>Why structure matters...</p>
    </article>
  </section>

  <section>
    <h2>About This Site</h2>
    <p>Dev Atlas is a complete learning roadmap...</p>
  </section>
</main>
```

---

# Revision Questions

1. How many `<main>` elements should a page have, and where should it never be nested?
2. What's the decisive test for choosing between `<section>` and `<article>`?
3. Can an `<article>` contain `<section>` elements, or vice versa? Give an example of each.

<details><summary>Answers</summary>

1. Exactly one; it should never be nested inside `<article>`, `<aside>`, `<header>`, `<footer>`, or `<nav>`.
2. Whether the content would make complete, independent sense entirely on its own, out of context — if yes, `<article>`; if it only makes sense as part of a larger page, `<section>`.
3. Yes to both: a long article can be broken into thematic `<section>`s; a "Latest Posts" `<section>` can contain multiple standalone `<article>` elements.

</details>
EOF