# Lesson 06: Inline-block & Align

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `display: inline-block` to combine inline flow with block-level sizing.
- Use `vertical-align` correctly, including its common pitfalls.
- Understand where inline-block still fits, even alongside Flexbox/Grid.

---

# Introduction

This lesson covers `inline-block` — genuinely a hybrid between the two `display` values from Lesson 01, and a technique that (like float) predates Flexbox/Grid but still has legitimate, real uses today.

---

# `display: inline-block`

```css
.button {
  display: inline-block;
  width: 120px;
  height: 40px;
  padding: 10px;
}
```

Combines the best of both worlds:
- **Like `inline`** — flows naturally alongside other inline/inline-block content, sitting side by side without forcing a new line.
- **Like `block`** — accepts `width`, `height`, and full padding/margin on all sides (recall Module 01: plain `inline` elements largely ignore top/bottom margin and explicit width/height).

---

# The Classic Use Case: Horizontal Button/Nav Layouts

Before Flexbox, this was a genuinely common way to lay out a row of same-sized buttons or nav items:

```css
nav a {
  display: inline-block;
  padding: 10px 20px;
  width: 100px;
  text-align: center;
}
```

This lets each `<a>` behave like a properly-sized block (fixed width, full padding) while still flowing horizontally next to its siblings, unlike plain `block` (which would force each onto its own line).

---

# The Genuine Gotcha: Whitespace Gaps

This is a real, historically confusing quirk worth knowing explicitly: `inline-block` elements written with whitespace (a line break or space) between them in the HTML render with a small, unwanted gap between them — because that whitespace is itself treated like a printable space character:

```html
<div class="inline-block">One</div>
<div class="inline-block">Two</div>
```

Genuine historical fixes (worth recognizing in legacy code, though Flexbox/Grid avoid this problem entirely):
```css
.container {
  font-size: 0; /* removes the whitespace gap, but requires resetting font-size on children */
}
```
or writing the HTML with no whitespace between tags at all (`<div>One</div><div>Two</div>` on a single line) — genuinely awkward to maintain, and exactly the kind of quirk that made Flexbox's arrival such a relief for real layout work.

---

# `vertical-align`

```css
img {
  vertical-align: middle;
}
```

Controls the vertical alignment of inline or inline-block elements *relative to their surrounding line of text* — genuinely only meaningful for inline-level elements, and a common point of confusion since it does **not** work on block-level elements or vertically center content within a container the way many beginners initially expect.

**Common values:** `baseline` (default), `top`, `middle`, `bottom`, `text-top`, `text-bottom`.

**The classic gotcha:** an inline image sitting slightly below where you'd expect within a line of text — this is `vertical-align: baseline` (the default), aligning the image's bottom edge with the surrounding text's baseline, not its true visual center. Setting `vertical-align: middle` is a common, simple fix for this specific misalignment.

---

# Where Inline-block Still Fits Today

Even with Flexbox/Grid available, `inline-block` remains genuinely useful for:
- Simple, small-scale horizontal layouts (like a row of tags/badges) where Flexbox would technically work but feels like overkill for something this simple.
- Situations where content should naturally wrap onto new lines when space runs out (Flexbox requires explicit wrap configuration, `flex-wrap`, covered in Module 06; inline-block wraps naturally, like text does).

---

# Practical Example

```css
.tag {
  display: inline-block;
  padding: 4px 10px;
  margin: 4px;
  background-color: #eee;
  border-radius: 4px;
  vertical-align: middle;
}
```
```html
<span class="tag">HTML</span><span class="tag">CSS</span><span class="tag">JavaScript</span>
```

---

# Revision Questions

1. What does `inline-block` combine from both `inline` and `block`?
2. Why do inline-block elements sometimes have an unwanted gap between them?
3. Does `vertical-align: middle` vertically center an element within its entire parent container?

<details><summary>Answers</summary>

1. It flows inline (side by side, no forced new line) like `inline`, while accepting width/height/full margin-padding like `block`.
2. Because whitespace (line breaks, spaces) between the elements in the HTML source is itself treated like a printable space character, rendering as a visible gap.
3. No — `vertical-align` only affects alignment relative to the surrounding line of inline content, not centering within a container's full height; true container centering is handled by Flexbox/Grid (Modules 06–07).

</details>
