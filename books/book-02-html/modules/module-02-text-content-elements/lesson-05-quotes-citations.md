# Lesson 05: Quotes & Citations

## Learning Objectives
By the end of this lesson, you will be able to:
- Correctly mark up both short inline quotes and longer block quotations.
- Use the `cite` attribute to reference a quote's source.
- Understand the distinction between `<q>`, `<blockquote>`, and ``.

---

# Introduction

This lesson builds directly on `<cite>` from Lesson 04, covering the full picture of how HTML handles quoted content — a genuinely common need across blogs, articles, and documentation (including this very roadmap you're building).

---

# Short Inline Quotes: `<q>`

Used for short quotations that flow within a sentence:

```html
<p>As the saying goes, <q>the best code is no code at all</q>.</p>
```

Browsers automatically add quotation marks around `<q>` content — you should **not** manually type quotation marks inside it, since that would result in doubled marks.

---

# Long Block Quotations: `<blockquote>`

Used for longer, standalone quoted passages — typically visually indented block-level content:

```html
<blockquote cite="https://example.com/article">
  <p>Programs must be written for people to read, and only incidentally
  for machines to execute.</p>
</blockquote>
```

The optional `cite` attribute holds a URL pointing to the quote's source — this is *not* the same as the `<cite>` element (next section), and it's not displayed to users at all; it exists purely as machine-readable metadata.

---

# Attributing the Source: `<cite>`

Recall from Lesson 04: `<cite>` represents the *title of a creative work*, often paired with a `<blockquote>` to visibly credit the source:

```html
<blockquote cite="https://example.com/clean-code">
  <p>Programs must be written for people to read, and only incidentally
  for machines to execute.</p>
</blockquote>
<p>— <cite>Structure and Interpretation of Computer Programs</p>
```

**Important distinction:** the `cite` *attribute* (on `<blockquote>` or `<q>`) is a URL for machines; the `` *element* is human-visible text naming the work — same word, genuinely different purposes.

---

# Practical Example

```html
<article>
  <h2>On Simplicity</h2>
  <p>Antoine de Saint-Exupéry once wrote that <q>perfection is achieved,
  not when there is nothing more to add, but when there is nothing left
  to take away</q> — a principle worth remembering in software design.</p>

  <blockquote cite="https://www.w3.org/TR/html52/">
    <p>The blockquote element represents content that is quoted from
    another source, optionally with a citation.</p>
  </blockquote>
  <p>— <cite>HTML 5.2 Specification</p>
</article>
```

---

# Revision Questions

1. When should you use `<q>` versus `<blockquote>`?
2. What does the `cite` attribute do, and why is it not visible to users?
3. What's the difference between the `cite` attribute and the `` element?

<details><summary>Answers</summary>

1. `<q>` for short quotations that flow inline within a sentence; `<blockquote>` for longer, standalone quoted passages typically displayed as an indented block.
2. It provides a URL referencing the source of the quote, purely as machine-readable metadata — not rendered visibly on the page.
3. The `cite` attribute is a URL, used on `<blockquote>`/`<q>`, invisible to users; the `<cite>` element is visible text naming the title of a creative work.

</details>
