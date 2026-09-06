# Lesson 06: CSS @supports

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what feature queries are and when you need them.
- Write `@supports` rules to conditionally apply CSS.
- Build a Grid-with-Flexbox-fallback pattern.

---

# Introduction

This module closes with a tool that isn't specific to Grid at all, but earns its place here because Grid is the most common reason developers reach for it: `@supports`, CSS's built-in feature-detection mechanism. It answers a genuinely practical question — "what if a user's browser doesn't support the CSS I just wrote?"

---

# Why This Matters Less Than It Used To

Worth saying plainly: as noted in Lesson 01, Grid support has been universal in modern browsers since 2017, so in most current projects you won't strictly need `@supports` for Grid itself. It remains valuable for genuinely newer or less-universal features (container queries, `:has()`, certain color functions) and for codebases that must support unusually old browsers. Think of this lesson as "the tool," not "a tool you'll need for Grid specifically."

---

# Basic Syntax

```css
@supports (display: grid) {
  .layout {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
  }
}
```

The browser checks whether it supports the declaration inside the parentheses. If yes, everything inside the block applies; if no, the block is ignored entirely — as if it were never written.

---

# Providing a Fallback

The real power comes from pairing `@supports` with a base style that works everywhere, then enhancing it:

```css
.layout {
  display: flex;         /* fallback: works everywhere */
  flex-wrap: wrap;
}

.layout > * {
  flex: 1 1 300px;       /* fallback sizing */
}

@supports (display: grid) {
  .layout {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  }

  .layout > * {
    flex: initial;        /* reset the fallback property */
  }
}
```

Browsers without Grid support get a perfectly reasonable Flexbox-based layout; browsers with Grid support get the more precise Grid version. This "base styles, then enhance" pattern is called **progressive enhancement**, and it's the standard approach for any CSS feature with incomplete support.

---

# `not` and `and` / `or`

```css
@supports not (display: grid) {
  .layout { display: block; }
}

@supports (display: grid) and (gap: 1rem) {
  .layout { display: grid; gap: 1rem; }
}

@supports (display: grid) or (display: flex) {
  .layout { /* applies if either is supported */ }
}
```

These combinators work exactly like `@media` query logic (recall combining conditions from Module 05's `@media` previews) — `not` inverts a check, `and` requires both, `or` requires either.

---

# `@supports` vs. `@media`

Easy to confuse since both use similar syntax, but they test fundamentally different things:

- **`@media`** asks about the **environment** — screen size, orientation, color scheme.
- **`@supports`** asks about the **browser's CSS capabilities** — does it understand this property/value at all.

They're often combined: a layout might use `@supports` to pick Grid vs. Flexbox, and `@media` within that to adjust column counts per screen size.

---

# Practical Example: Safe Adoption of a Newer Feature

```css
.card {
  padding: 1rem;
}

@supports (aspect-ratio: 1 / 1) {
  .card-image {
    aspect-ratio: 16 / 9;
  }
}

@supports not (aspect-ratio: 1 / 1) {
  .card-image {
    height: 200px; /* fixed-height fallback for older browsers */
  }
}
```

This is the realistic, everyday use case for `@supports` in 2026-era projects — not Grid itself, but newer properties still gaining full support, adopted safely alongside a sensible fallback.

---

# Revision Questions

1. What does `@supports (display: grid)` actually test?
2. What happens to the CSS inside an `@supports` block if the condition is false?
3. What's the key difference between `@supports` and `@media`?

<details><summary>Answers</summary>

1. Whether the current browser understands and can apply the `display: grid` declaration.
2. It's ignored entirely, as if the block didn't exist.
3. `@media` tests environmental conditions (screen size, orientation, etc.); `@supports` tests whether the browser supports a given CSS property/value pair.

</details>
