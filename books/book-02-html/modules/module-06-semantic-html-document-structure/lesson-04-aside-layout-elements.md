cat > lesson-04-aside-layout-elements.md << 'EOF'
# Lesson 04: `<aside>` & Other Layout Elements

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<aside>` correctly for tangentially related content.
- Recognize a handful of additional semantic elements that round out HTML5's structural vocabulary.
- Avoid common misuses of `<aside>`.

---

# Introduction

This lesson covers `<aside>` — genuinely useful but frequently misused — along with a few smaller semantic elements worth knowing before you build a complete page layout in Lesson 05.

---

# `<aside>`

Represents content that's **tangentially related** to the surrounding content — meaningful as supplementary material, but not essential to understanding the main content:

```html
<article>
  <h2>Understanding Semantic HTML</h2>
  <p>Main article content...</p>

  <aside>
    <h3>Related Reading</h3>
    <ul>
      <li><a href="#">Why Accessibility Matters</a></li>
      <li><a href="#">SEO Fundamentals</a></li>
    </ul>
  </aside>
</article>
```

**Common valid uses:** a sidebar with related links, a pull quote highlighting a key excerpt from the main text, biographical info about the author, an advertisement block.

---

# The Common Misuse: `<aside>` for "Anything on the Side"

A frequent beginner mistake is using `<aside>` purely based on *visual position* (literally, anything placed to the side, styled with CSS later) rather than *semantic relationship* to the content. A navigation sidebar containing your site's primary navigation menu is NOT an `<aside>` — that's still `<nav>`, regardless of where it's visually positioned on the page. Layout position and semantic meaning are two entirely separate concerns — recall this same principle from Module 05, Lesson 05's tables-for-layout discussion.

```html
<!-- Wrong: primary nav is not "tangential" content -->
<aside>
  <nav>Primary site navigation...</nav>
</aside>

<!-- Right: nav stays nav, regardless of visual position -->
<nav>Primary site navigation...</nav>
```

---

# `<aside>` Can Apply at the Page Level Too

Just like `<header>`/`<footer>`, `<aside>` isn't limited to living inside an `<article>` — a page-level `<aside>` (a sidebar of site-wide related links, unrelated to any single specific article) is equally valid:

```html
<main>
  <article>...</article>
</main>
<aside>
  <h2>Popular This Week</h2>
  <ul>...</ul>
</aside>
```

---

# A Few More Useful Semantic Elements

```html
<details>
  <summary>What is semantic HTML?</summary>
  <p>Semantic HTML means choosing elements based on meaning, not appearance.</p>
</details>
```
`<details>`/`<summary>` create a native, collapsible disclosure widget — genuinely useful for FAQs, with zero JavaScript required for the basic expand/collapse behavior.

```html
<dialog open>
  <p>This is a native dialog box.</p>
</dialog>
```
`<dialog>` represents a dialog box or modal window (its full interactive behavior, like opening/closing programmatically, is controlled via JavaScript in Book 04 — but the semantic element itself exists natively in HTML).

---

# Practical Example

```html
<main>
  <article>
    <h2>Getting Started with Semantic HTML</h2>
    <p>Main content here...</p>

    <aside>
      <h3>Quick Tip</h3>
      <p>Always ask: does this content make sense standalone?</p>
    </aside>
  </article>

  <details>
    <summary>Frequently Asked Question</summary>
    <p>Answer text here.</p>
  </details>
</main>

<aside>
  <h2>Related Articles</h2>
  <ul>
    <li><a href="#">Article Title 1</a></li>
  </ul>
</aside>
```

---

# Revision Questions

1. What does `<aside>` semantically represent?
2. Why is it wrong to wrap primary site navigation in `<aside>` just because it's visually positioned on the side?
3. What does `<details>`/`<summary>` provide natively, without any JavaScript?

<details><summary>Answers</summary>

1. Content tangentially related to the surrounding content — meaningful as supplementary material, but not essential to understanding the main content.
2. Because semantic meaning is about the content's actual relationship to the page, not its visual position — primary navigation remains `<nav>` regardless of where it's placed on screen.
3. A native, collapsible disclosure widget (expand/collapse behavior) with zero JavaScript required for the basic interaction.

</details>
EOF