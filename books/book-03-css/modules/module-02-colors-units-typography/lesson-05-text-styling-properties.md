# Lesson 05: Text Styling Properties

## Learning Objectives
By the end of this lesson, you will be able to:
- Use the full range of common text styling properties.
- Control text alignment, spacing, decoration, and transformation.
- Understand `line-height` and its impact on readability.

---

# Introduction

This lesson rounds out Module 02's typography coverage with the remaining everyday text properties you'll use in nearly every stylesheet you ever write.

---

# Text Alignment

```css
h1 { text-align: center; }
p { text-align: justify; }
```

- `left` (default for left-to-right languages), `right`, `center`, `justify` (stretches text to fill the full line width, aligning both edges — commonly used in print, less common on the web due to uneven word spacing it can create).

---

# Text Decoration

```css
a { text-decoration: none; }        /* removes default underline from links */
.strikethrough { text-decoration: line-through; }
.important { text-decoration: underline; }
```

Recall Book 02's discussion of default browser styling — links are underlined by default specifically via this property, and `text-decoration: none` is genuinely one of the most common CSS declarations in real-world stylesheets, since custom-designed navigation/links rarely want the default underline.

---

# Text Transform

```css
h1 { text-transform: uppercase; }
.subtitle { text-transform: capitalize; }
```

- `uppercase` — ALL CAPS, regardless of how it's actually written in the HTML.
- `lowercase` — all lowercase.
- `capitalize` — Capitalizes The First Letter Of Each Word.

Genuinely useful for maintaining a consistent visual style (e.g., all headings in uppercase) without needing to actually type your HTML content in that exact case — the underlying text content stays normally-cased and readable in your HTML source.

---

# Line Height

```css
p {
  line-height: 1.6;
}
```

`line-height` controls the vertical spacing between lines of text — genuinely one of the highest-impact readability properties in all of CSS. A value like `1.6` (unitless, meaning 1.6× the element's font-size) is a common, comfortable default for body text; tightly-packed default line-height (often close to `1.2`) can feel cramped and harder to read for longer passages.

**Unitless values are generally preferred** over fixed units (like `24px`) here specifically, since unitless `line-height` scales proportionally if `font-size` changes, while a fixed pixel value would not.

---

# Letter and Word Spacing

```css
h1 { letter-spacing: 2px; }
.wide-text { word-spacing: 5px; }
```

- `letter-spacing` — space between individual characters.
- `word-spacing` — space between whole words.

Used sparingly for specific design effects (like widely-tracked uppercase headings) rather than everyday body text, where default spacing is almost always more readable.

---

# Text Shadow (Brief Preview)

```css
h1 {
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}
```

A quick preview — full depth (including `box-shadow` for entire elements) comes in Module 09. The four values are: horizontal offset, vertical offset, blur radius, and color.

---

# Practical Example

```css
body {
  line-height: 1.6;
}

h1 {
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 1px;
}

a {
  text-decoration: none;
  color: teal;
}
a:hover {
  text-decoration: underline;
}

p {
  text-align: left;
}
```

---

# Revision Questions

1. Why is `text-decoration: none` so commonly used on links in real-world CSS?
2. What's the difference between `text-transform: uppercase` and actually typing text in all caps in your HTML?
3. Why are unitless `line-height` values generally preferred over fixed pixel values?

<details><summary>Answers</summary>

1. Because links are underlined by default, and most custom-designed navigation/link styling doesn't want that default underline, requiring this override.
2. `text-transform: uppercase` displays the text visually in all caps while the underlying HTML content stays normally-cased (more readable in source, and screen readers may announce it differently than truly all-caps text).
3. Unitless values scale proportionally with the element's own `font-size`, while a fixed pixel value would not adjust if the font-size changes.

</details>
