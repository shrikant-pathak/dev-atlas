# Lesson 06: Line Breaks, Horizontal Rules & Preformatted Text

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<br>` and `<hr>` correctly and sparingly.
- Understand why HTML collapses whitespace by default.
- Use `<pre>` to preserve formatting when it genuinely matters.

---

# Introduction

This final lesson of Module 02 covers three small but important elements — and, just as importantly, when *not* to reach for them, since all three are commonly misused by beginners as shortcuts around proper structure.

---

# Line Breaks: `<br>`

`<br>` inserts a single line break within content — genuinely useful for content where line breaks are part of the actual meaning, like a mailing address or a poem:

```html
<p>
  123 Developer Lane<br>
  Codeville, WEB 10101
</p>
```

**What NOT to use `<br>` for:** creating paragraph spacing (use multiple `<p>` elements instead) or achieving visual layout spacing (that's CSS's job, Book 03 — `margin`). Seeing `<br><br><br>` in HTML is almost always a sign proper structure or CSS should have been used instead.

---

# Horizontal Rules: `<hr>`

`<hr>` represents a **thematic break** — a shift in topic or a divider between distinct sections of content, not merely "a horizontal line for decoration":

```html
<section>
  <p>First topic discussion...</p>
</section>
<hr>
<section>
  <p>Completely different topic...</p>
</section>
```

Like `<br>`, `<hr>` is a void element (Module 01, Lesson 03) — no closing tag. If you just want a visual dividing line with no actual topic shift, that's a CSS border, not an `<hr>`.

---

# Why HTML Collapses Whitespace

By default, browsers collapse multiple spaces, tabs, and line breaks in your HTML source down to a single space when rendering:

```html
<p>This    has     lots


of    whitespace.</p>
```
Renders as: `This has lots of whitespace.`

This is deliberate — it lets you format your HTML source code readably (proper indentation, line breaks for clarity) without that formatting affecting the actual rendered output.

---

# Preserving Formatting: `<pre>`

Sometimes whitespace and line breaks genuinely matter — code snippets, ASCII art, poetry with specific line spacing. `<pre>` (preformatted text) preserves exactly what you type, whitespace and all:

```html
<pre>
function greet(name) {
  return "Hello, " + name;
}
</pre>
```

`<pre>` is almost always paired with `<code>` (from Lesson 04) for actual code blocks:

```html
<pre><code>function greet(name) {
  return "Hello, " + name;
}</code></pre>
```

This combination — `<pre><code>` — is the standard, semantically correct way to display a multi-line code block in HTML, and you'll use it constantly when writing technical documentation.

---

# Practical Example

```html
<address>
  Dev Atlas HQ<br>
  42 Learning Street<br>
  Codeville, WEB 10101
</address>

<hr>

<h3>Example Code</h3>
<pre><code>const sum = (a, b) => a + b;
console.log(sum(2, 3)); // 5</code></pre>
```

---

# Revision Questions

1. Why shouldn't `<br><br><br>` be used to create paragraph spacing?
2. What does `<hr>` semantically represent, beyond "a horizontal line"?
3. Why does `<pre>` exist, given that HTML collapses whitespace by default?

<details><summary>Answers</summary>

1. Because paragraph spacing is a structural/visual concern that should be handled with proper `<p>` elements and CSS margin, not by misusing a line-break element to fake spacing.
2. A thematic break — a genuine shift in topic between sections of content, not merely decoration.
3. Because some content (like code or ASCII art) genuinely depends on its exact whitespace and line breaks being preserved exactly as typed, which the default whitespace-collapsing behavior would otherwise destroy.

</details>

---

# 🏁 Module 02 Checkpoint

Before moving to Module 03, you should be able to:
- [ ] Structure content with a correct, unskipped heading hierarchy
- [ ] Distinguish semantic formatting (`<strong>`, `<em>`) from purely visual formatting (`<b>`, `<i>`)
- [ ] Choose the correct list type (`<ul>`, `<ol>`, `<dl>`) based on content meaning
- [ ] Use lesser-known semantic elements (`<abbr>`, `<code>`, `<time>`, `<cite>`) where appropriate
- [ ] Correctly mark up inline and block quotations with proper attribution
- [ ] Use `<br>`, `<hr>`, and `<pre>` for their genuine semantic purposes, not as layout shortcuts

**Next up:** Module 03 — Links, Images & Media
