# Lesson 03: Text Effects

## Learning Objectives
By the end of this lesson, you will be able to:
- Apply `text-overflow`, `white-space`, and `word-break` for text truncation and wrapping control.
- Use `background-clip: text` to fill text with a gradient.
- Apply `filter` and `backdrop-filter` for advanced visual effects.

---

# Introduction

Module 02 covered typography fundamentals — fonts, sizing, basic text styling. This lesson goes further into *effects*: truncating text gracefully, filling letters with a gradient, and blurring or adjusting what sits behind an element.

---

# Truncating Text: The Three-Property Combo

```css
.truncate {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
```

This exact three-property combination is one of the most copy-pasted snippets in all of CSS, and it's worth understanding why all three are required together:

- **`white-space: nowrap`** — prevents the text from wrapping onto a new line.
- **`overflow: hidden`** — recall this from Module 05; clips any text that doesn't fit within the box.
- **`text-overflow: ellipsis`** — replaces the clipped-off end with `…`, rather than just abruptly cutting the text off.

Remove any one of the three and the effect breaks — `text-overflow: ellipsis` alone does nothing without `overflow: hidden`, which itself does nothing useful for a single line of text without `white-space: nowrap` forcing it to overflow horizontally in the first place.

---

# Wrapping Long Words: `word-break` and `overflow-wrap`

```css
.wrap-long-words {
  overflow-wrap: break-word; /* breaks only when a word is too long to fit */
}

.break-anywhere {
  word-break: break-all; /* breaks at any character, even mid-word unnecessarily */
}
```

Useful for genuinely long, unbreakable strings — URLs, long email addresses, or user-generated content — that would otherwise overflow their container instead of wrapping like normal text.

---

# Gradient Text with `background-clip`

```css
.gradient-text {
  background: linear-gradient(to right, #ff7e5f, #feb47b);
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
}
```

This is a genuinely clever repurposing of a property: `background-clip: text` restricts a background (here, a gradient from Lesson 01) to be visible *only* within the shape of the text itself. Setting `color: transparent` then hides the actual text color, leaving only the gradient showing through the letterforms. The `-webkit-` prefixed version is still commonly included for broader compatibility.

---

# `filter` — Visual Effects on an Element

```css
.photo {
  filter: grayscale(100%);
  filter: blur(4px);
  filter: brightness(1.2);
  filter: contrast(1.1);
}

/* Multiple filters combine: */
.stylized {
  filter: grayscale(50%) contrast(1.2) brightness(0.9);
}
```

`filter` applies image-processing-style effects directly to any element, not just images — commonly used for hover effects (e.g., a grayscale photo that becomes full-color on `:hover`), loading placeholders, or stylistic treatments.

---

# `backdrop-filter` — Effects on What's Behind an Element

```css
.glass-panel {
  background: rgba(255, 255, 255, 0.2);
  backdrop-filter: blur(10px);
}
```

Where `filter` affects the element itself, `backdrop-filter` affects whatever is *visible through or behind* the element — this is the CSS technique behind the popular "frosted glass" UI effect, where content behind a semi-transparent panel appears blurred while the panel's own content stays sharp.

---

# Practical Example: A Frosted Navigation Bar

```html
<nav class="glass-nav">Dev Atlas</nav>
```
```css
.glass-nav {
  position: fixed;
  top: 0; left: 0; right: 0;
  background: rgba(255, 255, 255, 0.6);
  backdrop-filter: blur(12px);
  padding: 1rem 2rem;
}
```

Recall `position: fixed` from Module 05 — as the page scrolls beneath this navbar, content passing underneath appears softly blurred through the semi-transparent background, a genuinely common effect in modern interface design.

---

# Revision Questions

1. Why does `text-overflow: ellipsis` require both `overflow: hidden` and `white-space: nowrap` to work?
2. How do you create text filled with a gradient instead of a solid color?
3. What's the difference between `filter` and `backdrop-filter`?

<details><summary>Answers</summary>

1. `white-space: nowrap` forces the text onto one line so it can overflow horizontally; `overflow: hidden` clips that overflow; only then does `text-overflow: ellipsis` have clipped content to replace with `…` — without the first two, there's nothing for it to act on.
2. Apply a `background` gradient, set `background-clip: text` (plus the `-webkit-` prefix) to restrict it to the text shape, and set `color: transparent` to hide the underlying text color.
3. `filter` applies visual effects to the element itself; `backdrop-filter` applies effects to whatever is visible behind/through the element, commonly used for frosted-glass style panels.

</details>
