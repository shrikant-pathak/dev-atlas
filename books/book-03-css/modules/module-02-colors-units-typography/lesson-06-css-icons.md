# Lesson 06: CSS Icons

## Learning Objectives
By the end of this lesson, you will be able to:
- Understand the different approaches to adding icons to a webpage.
- Use an icon font library as a quick, practical solution.
- Recognize why SVG icons (Book 02) are the modern preferred approach.

---

# Introduction

This final lesson of Module 02 covers icons — small symbolic graphics (a search magnifying glass, a hamburger menu, a heart) that appear constantly throughout real web interfaces. This connects directly back to Book 02, Module 08's SVG lesson, revisited here from the CSS/practical-usage side.

---

# Approach 1: Icon Font Libraries

Historically, and still commonly seen, icons were implemented as a special **icon font** — a custom font file (Lesson 04's `@font-face`) where each "character" renders as a small icon graphic instead of a letter:

```html
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
  <i class="fa-solid fa-heart"></i>
  <i class="fa-solid fa-magnifying-glass"></i>
</body>
```

**Font Awesome** is the most widely-known icon font library. Using it is genuinely simple: link its stylesheet, then add specific classes to an (often empty) `<i>` or `<span>` element to render the desired icon.

**Styling icon fonts works exactly like styling text**, since technically that's what they are:
```css
.fa-heart {
  color: red;
  font-size: 24px;
}
```

---

# Approach 2: SVG Icons (The Modern Standard)

Recall Book 02, Module 08 in full — SVG produces genuine DOM elements, scales perfectly, and can be styled directly with CSS:

```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
</svg>
```

```css
svg {
  color: red;  /* "currentColor" in the fill picks up this color value */
  width: 24px;
  height: 24px;
}
svg:hover {
  color: darkred;
}
```

**Why SVG is now generally preferred over icon fonts:**
1. **Genuine accessibility** — real DOM elements, unlike font glyphs which can confuse screen readers (announcing a random character/ligature name instead of the icon's actual meaning).
2. **No extra HTTP request/font file** needed for simple cases — an SVG can be embedded directly inline.
3. **Full styling flexibility** — individual parts of a complex icon can be styled/animated independently, impossible with a single font glyph.
4. **No dependency on font-rendering quirks** across different browsers/OSes.

---

# Approach 3: Emoji as Icons (Casual Use)

Recall Book 02, Module 01's entities/emoji lesson — genuine Unicode emoji can work as extremely lightweight, zero-dependency "icons" for casual projects:

```html
<button>🔍 Search</button>
<button>❤️ Like</button>
```

Genuinely fine for informal projects or prototypes, but offers far less control over exact appearance (emoji rendering varies noticeably across operating systems) compared to SVG or icon fonts.

---

# Choosing an Approach

| Situation | Recommended Approach |
|---|---|
| Quick prototype, casual project | Emoji |
| Need a large, established icon set fast | Icon font library (Font Awesome, etc.) |
| Production project, care about accessibility/performance | SVG icons |

---

# Practical Example

```html
<nav>
  <a href="/"><i class="fa-solid fa-house"></i> Home</a>
  <a href="/search">
    <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
      <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
    </svg>
    Search
  </a>
</nav>
```

---

# Revision Questions

1. What is an "icon font," and how does styling it differ from styling any other text?
2. Name two reasons SVG icons are now generally preferred over icon fonts.
3. When might emoji be a reasonable choice for icons, and when would it fall short?

<details><summary>Answers</summary>

1. A custom font where each character glyph renders as a small icon graphic instead of a letter; it's styled exactly like regular text (`color`, `font-size`), since technically it is text.
2. Any two of: genuine accessibility (real DOM elements vs. potentially confusing font glyphs for screen readers), no extra font file needed for simple inline use, full styling/animation flexibility for individual icon parts, no font-rendering quirks across browsers/OSes.
3. Reasonable for quick prototypes or casual projects wanting zero setup; falls short for production work needing precise, consistent appearance across different operating systems, since emoji rendering varies noticeably between them.

</details>

---

# 🏁 Module 02 Checkpoint

Before moving to Module 03, you should be able to:
- [ ] Use named colors, hex, RGB, and HSL (with alpha variants) confidently
- [ ] Choose appropriate units (px, %, em, rem, vw/vh) for different situations
- [ ] Build correct font stacks with proper fallbacks
- [ ] Add a custom web font via Google Fonts or `@font-face`
- [ ] Apply core text styling properties, including line-height for readability
- [ ] Add icons to a page using at least one of the three approaches covered

**Next up:** Module 03 — The Box Model
