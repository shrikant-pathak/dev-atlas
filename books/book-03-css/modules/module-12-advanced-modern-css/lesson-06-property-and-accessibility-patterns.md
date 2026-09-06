# Lesson 06: @property and Accessibility Patterns

## Learning Objectives
By the end of this lesson, you will be able to:
- Register a custom property's type using `@property` for animatable variables.
- Apply core accessibility patterns: visually-hidden text, focus management, and `prefers-reduced-motion`.
- Explain why some accessibility concerns are genuinely CSS's responsibility, not just HTML's.

---

# Introduction

This lesson pairs two topics that share a common thread: both are about writing CSS that respects constraints beyond pure visual appearance — `@property` extends what custom properties (Lesson 01) can actually do at the engine level, while the accessibility patterns here ensure your polished, animated, modern CSS (Module 11, and this module) doesn't leave real users behind.

---

# The Problem `@property` Solves

Recall from Lesson 01 that custom properties are just untyped text values by default — this has a genuine consequence: plain custom properties **cannot be smoothly animated or transitioned**, because the browser doesn't know they represent a color, a number, or a length; it just sees a string.

```css
/* This will NOT transition smoothly without @property: */
.box {
  --angle: 0deg;
  transition: --angle 0.3s;
  background: conic-gradient(red var(--angle), blue 0);
}
```

---

# Registering a Typed Custom Property

```css
@property --angle {
  syntax: '<angle>';
  inherits: false;
  initial-value: 0deg;
}

.box {
  --angle: 0deg;
  transition: --angle 0.3s;
  background: conic-gradient(red var(--angle), blue 0);
}

.box:hover {
  --angle: 180deg;
}
```

`@property` tells the browser exactly what *type* of value `--angle` holds (`<angle>`, `<color>`, `<length>`, `<number>`, and others are valid). Once registered with a proper type, the browser can genuinely interpolate between values smoothly — recall `conic-gradient()` from Module 09 — enabling animated gradient sweeps that were previously impossible with plain custom properties.

---

# `syntax`, `inherits`, and `initial-value`

- **`syntax`** — the value's type, written as a quoted string like `'<color>'`, `'<length>'`, or `'<percentage>'`.
- **`inherits`** — whether child elements inherit this property's value by default (`true`/`false`), mirroring the `inherits` concept from Module 01's cascade lesson, but now explicitly declared rather than following the default rule for the property type.
- **`initial-value`** — the value used before anything else sets it — required for most syntax types.

---

# Accessibility Pattern 1: Visually-Hidden Text

```css
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  overflow: hidden;
  clip-path: inset(50%);
  white-space: nowrap;
}
```

```html
<button>
  <svg><!-- icon only, no visible label --></svg>
  <span class="visually-hidden">Close dialog</span>
</button>
```

This is a deliberately specific combination of properties — recall `overflow: hidden` (Module 05), `position: absolute` — used to hide text *visually* while keeping it fully readable by screen readers. Critically, `display: none` or `visibility: hidden` would remove the text from the accessibility tree entirely (recall this exact distinction from Module 09's opacity lesson), defeating the purpose; this pattern shrinks the element to an imperceptible 1x1 pixel instead, keeping it present for assistive technology.

---

# Accessibility Pattern 2: `prefers-reduced-motion`

```css
.animated-element {
  animation: bounce-in 0.5s ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .animated-element {
    animation: none;
  }
}
```

Recall `@keyframes` animations from Module 11 — some users, often for vestibular or attention-related reasons, have a system-level setting requesting reduced motion. `prefers-reduced-motion: reduce` detects this and lets you genuinely disable or simplify animations for those users — a small addition that meaningfully affects real people's ability to comfortably use a page.

---

# Accessibility Pattern 3: A Visible Skip Link

```css
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: #1a1a2e;
  color: white;
  padding: 0.5rem 1rem;
  z-index: 1000;
  transition: top 0.2s;
}

.skip-link:focus {
  top: 0; /* becomes visible when focused via keyboard */
}
```

A "skip to main content" link, hidden off-screen by default but revealed the instant it receives keyboard focus — recall `:focus-visible` from Module 10's buttons lesson — letting keyboard users bypass repetitive navigation instead of tabbing through every nav link on every single page.

---

# Practical Example: A Motion-Respectful Animated Card

```css
.card {
  transition: transform 0.3s ease;
}

.card:hover {
  transform: translateY(-6px);
}

@media (prefers-reduced-motion: reduce) {
  .card {
    transition: none;
  }
  .card:hover {
    transform: none;
  }
}
```

Recall the hover-lift card from Module 11 — the same polished effect for most users, but genuinely disabled for anyone whose system indicates a preference for reduced motion, rather than assuming every user wants the same animated experience.

---

# Revision Questions

1. Why can't a plain (unregistered) custom property be smoothly animated?
2. Why does the visually-hidden pattern avoid `display: none` or `visibility: hidden`?
3. What does `prefers-reduced-motion: reduce` detect, and why does it matter?

<details><summary>Answers</summary>

1. Plain custom properties are untyped text values by default — the browser doesn't know they represent a color, angle, or number, so it can't interpolate between two values; `@property` registers an explicit type, enabling genuine smooth interpolation.
2. `display: none` and `visibility: hidden` remove an element from the accessibility tree entirely, making it invisible to screen readers too; the visually-hidden pattern shrinks the element to an imperceptible size instead, keeping it present for assistive technology while hiding it visually.
3. A system-level user setting requesting reduced motion (often for vestibular or attention-related reasons); detecting it lets you disable or simplify animations for users who've explicitly indicated they want less motion.

</details>
