cat > lesson-04-semantic-text-elements.md << 'EOF'
# Lesson 04: Semantic Text Elements

## Learning Objectives
By the end of this lesson, you will be able to:
- Use a range of lesser-known but genuinely useful semantic text elements.
- Correctly mark up abbreviations, code, keyboard input, and time.
- Recognize when a specific semantic element exists for content you might otherwise wrap in a generic `<span>`.

---

# Introduction

Lesson 02 covered the big, commonly-known semantic text elements (`<strong>`, `<em>`, `<mark>`). This lesson goes further into HTML's surprisingly rich vocabulary for specific kinds of text — elements many developers never learn, defaulting to generic `<span>` tags instead, and losing semantic meaning in the process.

---

# Abbreviations: `<abbr>`

```html
<p>The <abbr title="World Health Organization">WHO</abbr> issued new guidelines.</p>
```
The `title` attribute provides the full expansion, shown as a tooltip on hover — genuinely useful for accessibility and clarity, especially for acronyms that aren't universally recognized.

---

# Code and Technical Text

```html
<p>Use the <code>console.log()</code> function to print output.</p>

<pre><code>function greet() {
  return "Hello!";
}</code></pre>

<p>Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to copy.</p>

<p>Output: <samp>File saved successfully.</samp></p>
```

- `<code>` — inline code snippets.
- `<pre>` (paired with `<code>`) — preserves whitespace/formatting for code blocks (full depth in Lesson 06).
- `<kbd>` — represents keyboard input, specifically.
- `<samp>` — represents sample output from a program.

As a developer writing technical content (like this very roadmap!), these are genuinely practical, not just academic trivia.

---

# Time and Dates: `<time>`

```html
<p>Published on <time datetime="2026-08-15">August 15, 2026</time>.</p>
<p>The event starts at <time datetime="19:00">7:00 PM</time>.</p>
```

The `datetime` attribute provides a machine-readable format, while the visible text can be formatted however you like for humans. Search engines and browsers (e.g., "add to calendar" features) can parse the `datetime` attribute reliably, even when the displayed text is casual or localized.

---

# Citations and Sources: ``

```html
<p><cite>Clean Code by Robert C. Martin remains a foundational text.</p>
```
Represents the title of a creative work (book, article, film) — distinct from `<blockquote>`/`<q>`, which represent quoted *content* (covered fully in Lesson 05).

---

# Other Useful Semantic Elements

```html
<p>The variable <var>x</var> represents the total count.</p>
<p>Status: <strong class="text-green">Active</strong></p>
<address>
  Contact: <a href="mailto:hello@devatlas.com">hello@devatlas.com</a>
</address>
```

- `<var>` — represents a variable in a mathematical or programming context.
- `<address>` — represents contact information for the nearest `<article>` or page's author, not a generic postal address.

---

# Why This Level of Detail Matters

You will *not* use every one of these elements in every project — but knowing they exist means you'll reach for the semantically correct tag instead of defaulting to `<span>` for everything, keeping your HTML meaningful rather than just visually convenient. This pays off directly in Module 07 (Accessibility & SEO).

---

# Revision Questions

1. What does the `title` attribute do on an `<abbr>` element?
2. What's the difference between `<code>` and `<kbd>`?
3. Why is the `datetime` attribute on `<time>` useful, even if the visible text is written casually?

<details><summary>Answers</summary>

1. It provides the full expansion of the abbreviation, shown as a hover tooltip.
2. `<code>` represents a code snippet in general; `<kbd>` specifically represents keyboard input a user should type or press.
3. It provides a standardized, machine-readable date/time format that browsers and search engines can reliably parse, regardless of how casually or locally the visible text is formatted.

</details>
EOF