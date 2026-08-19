# Lesson 02: Paragraphs & Text Formatting

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<p>` correctly for body text.
- Distinguish between semantic and purely visual text formatting tags.
- Understand why `<b>`/`<i>` differ from `<strong>`/`<em>`, despite looking identical by default.

---

# Introduction

Paragraphs are the workhorse of web content — the vast majority of readable text on any page lives inside `<p>` tags. This lesson also tackles one of HTML's most common points of confusion: several pairs of tags render *visually identical* by default, yet mean something completely different.

---

# The Paragraph Element

```html
<p>This is a paragraph of text. It can contain multiple sentences, and the browser will automatically wrap the text based on the available width.</p>
```

`<p>` is block-level (Module 01, Lesson 04) — each paragraph starts on its own line with default spacing above and below. Never use multiple `<br>` tags to fake paragraph spacing (covered properly in Lesson 06) — use actual `<p>` elements, one per paragraph.

---

# Semantic vs. Visual Formatting: The Core Distinction

This is the most important concept in this lesson. Several HTML tags produce the *same default visual appearance* but carry *completely different meaning*:

| Visual-only | Semantic equivalent | Meaning |
|---|---|---|
| `<b>` | `<strong>` | Bold text vs. text of strong importance |
| `<i>` | `<em>` | Italic text vs. emphasized text |

```html
<p>This is <b>bold</b> and this is <strong>strong</strong>.</p>
```
Both render bold by default — but a screen reader will announce `<strong>` with vocal emphasis, while `<b>` is read completely flat, with no indication anything is special about it. Search engines and assistive technology treat `<strong>`/`<em>` as meaningful signals; `<b>`/`<i>` are purely cosmetic instructions with zero semantic weight.

**Rule of thumb:** if the emphasis matters to the *meaning* of the sentence, use `<strong>`/`<em>`. If you just want something to visually look bold/italic for stylistic reasons with no semantic importance (like a book title), `<b>`/`<i>` are still valid — just make sure you're choosing intentionally, not just picking whichever tag you remember first.

---

# Other Common Text Formatting Elements

```html
<p><mark>Highlighted text</mark>, like a highlighter marker.</p>
<p>Water is <sub>H<sub>2</sub></sub>O.</p>          <!-- subscript -->
<p>10<sup>2</sup> = 100</p>                          <!-- superscript -->
<p><small>Fine print or disclaimers.</small></p>
<p><del>Old price: $50</del> <ins>New price: $35</ins></p>  <!-- deleted/inserted -->
```

- `<mark>` — semantically highlighted/relevant text (e.g., search result matches).
- `<sub>` / `<sup>` — subscript/superscript, genuinely semantic for chemistry formulas, footnotes, exponents.
- `<small>` — semantically "fine print" (legal disclaimers, side comments), not just smaller text for styling.
- `<del>` / `<ins>` — marks deleted/inserted content, often used to show edits or price changes.

---

# Practical Example

```html
<article>
  <p>The recipe requires <strong>exactly</strong> 2 cups of flour — too little and the bread <em>will not</em> rise properly.</p>
  <p>Original price: <del>$45.00</del> <ins>Now: $29.99</ins> <mark>Limited time!</mark></p>
  <p><small>Prices subject to change without notice.</small></p>
</article>
```

---

# Revision Questions

1. What's the fundamental difference between `<b>` and `<strong>`, even though they look the same by default?
2. When would `<i>` still be an appropriate, valid choice over `<em>`?
3. What is `<mark>` semantically meant to represent, beyond "yellow highlight"?

<details><summary>Answers</summary>

1. `<strong>` carries semantic meaning (importance), which screen readers and search engines recognize; `<b>` is purely visual styling with no semantic weight, even though both render bold by default.
2. When text should visually stand out (e.g., italicized) but carries no actual emphasis or importance to the sentence's meaning — like a book or movie title mentioned in passing.
3. Text that's semantically relevant or highlighted for reference purposes (e.g., matching a search query), not simply text someone wants to visually color yellow.

</details>
