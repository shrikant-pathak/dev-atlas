cat > lesson-06-entities-symbols-emojis.md << 'EOF'
# Lesson 06: HTML Entities, Symbols & Emojis

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain why certain characters need special handling in HTML.
- Use common HTML entities correctly.
- Understand how emojis and Unicode symbols work in HTML.

---

# Introduction

This final lesson of Module 01 covers a subtle but important detail: some characters can't just be typed directly into your HTML content, because HTML itself uses them as syntax. This connects directly back to Book 01, Module 02 (character encoding) and Lesson 02 of this module (UTF-8).

---

# Why Entities Exist

Characters like `<`, `>`, and `&` have special meaning in HTML — they're literally how tags and entities themselves are written. If you typed `<` directly into your visible content, the browser would try to interpret it as the start of a tag, breaking your page.

```html
<!-- This breaks -->
<p>5 < 10 and 10 > 5</p>

<!-- This works -->
<p>5 &lt; 10 and 10 &gt; 5</p>
```

**HTML entities** are special codes representing these reserved (and other special) characters safely.

---

# Common HTML Entities

| Character | Entity Name | Entity Number |
|---|---|---|
| `<` | `&lt;` | `&#60;` |
| `>` | `&gt;` | `&#62;` |
| `&` | `&amp;` | `&#38;` |
| `"` | `&quot;` | `&#34;` |
| `'` | `&apos;` | `&#39;` |
| (non-breaking space) | `&nbsp;` | `&#160;` |
| © | `&copy;` | `&#169;` |
| € | `&euro;` | `&#8364;` |
| — | `&mdash;` | `&#8212;` |

Every entity has two forms: a **named entity** (`&copy;`) and a **numeric entity** (`&#169;`) — both produce the same result; named entities are generally more readable.

---

# The Non-Breaking Space: `&nbsp;`

This one deserves special mention because it's genuinely useful and commonly misunderstood. Regular spaces in HTML collapse — multiple consecutive spaces render as just one:

```html
<p>Too      many      spaces</p>
<!-- Renders as: Too many spaces -->
```

`&nbsp;` prevents this collapsing and also prevents a line break at that specific space — useful for keeping related short pieces of text together (like "10 &nbsp;km" so "10" and "km" never get split across lines).

---

# Symbols and Emojis

Since HTML documents are UTF-8 encoded by default (Lesson 02), you can actually type emojis and most Unicode symbols directly into your content — no entity needed:

```html
<p>I love coding! 🚀 Let's build something great. 🎉</p>
```

This works because emojis are just Unicode characters like any other letter, and UTF-8 can represent the full Unicode range (connecting directly back to Book 01, Module 02's character encoding lesson).

For symbols without an easy keyboard shortcut, entities are still the most reliable, explicit way to guarantee correct rendering across all environments:

```html
<p>Temperature: 25&deg;C</p>       <!-- 25°C -->
<p>Price: &pound;49.99</p>          <!-- £49.99 -->
<p>Math: 5 &times; 3 = 15</p>        <!-- 5 × 3 = 15 -->
```

---

# Practical Example

```html
<p>&copy; 2026 dev-atlas. All rights reserved.</p>
<p>To use a less-than sign, write &lt;p&gt; not &lt;p&gt;.</p>
<p>Status: <strong>Active</strong> &mdash; last updated today. ✅</p>
```

---

# Revision Questions

1. Why can't you type `<` or `&` directly into visible HTML content?
2. What's the difference between a named entity and a numeric entity?
3. Why can emojis be typed directly into HTML without needing an entity?

<details><summary>Answers</summary>

1. Because HTML itself uses those characters as syntax (for tags and entities); typing them directly would confuse the browser's parser and break the page.
2. Both represent the same special character; a named entity uses a readable name (`&copy;`), while a numeric entity uses a numeric code (`&#169;`) — functionally identical.
3. Because HTML documents are UTF-8 encoded by default, and UTF-8 can represent the full range of Unicode characters, which includes emojis.

</details>

---

# 🏁 Module 01 Checkpoint

Before moving to Module 02, you should be able to:
- [ ] Explain HTML's role relative to CSS and JavaScript
- [ ] Write a complete, correct HTML boilerplate from memory
- [ ] Correctly use tags, elements, and attributes, including void elements
- [ ] Distinguish block vs. inline elements and know when to use `<div>`/`<span>`
- [ ] Use `class` and `id` correctly, and understand global and `data-*` attributes
- [ ] Use HTML entities for reserved characters

**Next up:** Module 02 — Text & Content Elements
EOF