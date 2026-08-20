# Lesson 03: Typography & Fonts

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `font-family` correctly, including font stacks and fallbacks.
- Distinguish between font categories (serif, sans-serif, monospace).
- Control font weight and style.

---

# Introduction

Typography is one of the highest-leverage things you can get right in web design — genuinely more impactful on a page's perceived quality than most beginners initially expect. This lesson covers controlling *which* font renders and its basic weight/style properties.

---

# The `font-family` Property

```css
body {
  font-family: Arial, sans-serif;
}
```

Note this is a **list**, not a single value — this is called a **font stack**. The browser tries each font in order, using the first one actually available on the user's device, falling back to the next if unavailable:

```css
p {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
```

**Always end a font stack with a generic family name** (`sans-serif`, `serif`, `monospace`) as the final fallback — this guarantees *some* reasonable font renders even if every specific named font fails to load, rather than falling back to a completely unpredictable browser default.

**Font names with spaces need quotes:**
```css
font-family: "Times New Roman", serif;
```

---

# The Three Generic Font Categories

- **`serif`** — fonts with small decorative strokes at letter ends (Times New Roman, Georgia). Traditionally associated with print, formal/editorial contexts.
- **`sans-serif`** — fonts without those decorative strokes (Arial, Helvetica). The dominant choice for most modern web interfaces, generally considered more readable on screens.
- **`monospace`** — every character occupies exactly the same width (Courier, Consolas). Used almost exclusively for displaying code — recall Book 02, Module 02's `<code>`/`<pre>` elements, which browsers style with a monospace font by default for exactly this reason.

```css
code, pre {
  font-family: "Courier New", monospace;
}
```

---

# Font Weight

```css
p { font-weight: normal; }      /* equivalent to 400 */
h1 { font-weight: bold; }        /* equivalent to 700 */
.light-text { font-weight: 300; }
```

`font-weight` accepts both keywords (`normal`, `bold`) and numeric values (typically in steps of 100, from 100 to 900) — numeric control is genuinely useful once you're working with web fonts (Lesson 04) that provide multiple actual weight variants, rather than the browser just faking "bold" by algorithmically thickening a single font file.

---

# Font Style

```css
em { font-style: italic; }
.disclaimer { font-style: oblique; }
```

- **`italic`** — uses a font's actual, separately-designed italic version, if one exists.
- **`oblique`** — algorithmically slants the regular font, used as a fallback if a true italic variant isn't available.
- **`normal`** — resets to non-italic (useful for overriding inherited italics, e.g., inside an `<em>` you don't want slanted).

---

# Shorthand: The `font` Property

Multiple font properties can be combined into a single shorthand declaration:

```css
p {
  font: italic bold 16px/1.5 Arial, sans-serif;
}
```

This sets `font-style`, `font-weight`, `font-size`/`line-height` (separated by a slash), and `font-family` all at once. Genuinely convenient once you're comfortable with the individual properties, though writing them out separately is often clearer while learning.

---

# Practical Example

```css
body {
  font-family: "Segoe UI", Arial, sans-serif;
  font-weight: normal;
}

h1, h2, h3 {
  font-family: Georgia, serif;
  font-weight: bold;
}

code {
  font-family: "Fira Code", Consolas, monospace;
}

.quote {
  font-style: italic;
}
```

---

# Revision Questions

1. What is a "font stack," and why should it always end with a generic family name?
2. Name the three generic font categories and give one example real-world use for each.
3. What's the difference between `italic` and `oblique`?

<details><summary>Answers</summary>

1. A list of fonts tried in order, falling back to the next if unavailable; ending with a generic name (`serif`/`sans-serif`/`monospace`) guarantees a reasonable fallback renders even if every specific font fails.
2. `serif` (traditional/print-like text), `sans-serif` (modern UI text), `monospace` (displaying code).
3. `italic` uses a font's genuine, separately-designed italic variant if one exists; `oblique` algorithmically slants the regular font as a fallback when no true italic variant is available.

</details>
