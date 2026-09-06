# Lesson 01: Custom Properties (CSS Variables)

## Learning Objectives
By the end of this lesson, you will be able to:
- Define and use custom properties with `--name` and `var()`.
- Scope custom properties to `:root` vs. specific selectors.
- Override custom properties responsively and per-component.

---

# Introduction

Every value you've written across this entire book so far — colors, spacing, font sizes — has been a literal, hardcoded value repeated wherever it's needed. Custom properties (informally "CSS variables") let you define a value once and reuse it everywhere, with genuine cascading and inheritance behavior — something preprocessor variables (like Sass's) never actually had, since those are resolved at compile time, not in the live browser.

---

# Defining and Using a Custom Property

```css
:root {
  --primary-color: #4a90d9;
  --spacing-unit: 1rem;
}

.btn {
  background: var(--primary-color);
  padding: var(--spacing-unit);
}
```

- Custom property names always start with two dashes (`--`).
- `:root` targets the document's root element — conventionally where global, site-wide variables are defined, since it sits at the very top of the cascade and inheritance chain.
- `var(--name)` reads the property's value anywhere a normal CSS value is expected.

---

# Fallback Values

```css
.box {
  color: var(--text-color, #333); /* uses #333 if --text-color isn't defined */
}
```

`var()` accepts an optional second argument — a fallback used if the referenced custom property hasn't been defined (or is invalid) anywhere in the current cascade. Genuinely useful for components meant to work standalone, with or without a surrounding theme defining that variable.

---

# Real Cascading — The Key Difference From Preprocessor Variables

```css
:root {
  --accent: blue;
}

.card {
  --accent: green; /* overrides --accent, but ONLY within .card and its descendants */
  border-color: var(--accent);
}
```

Because custom properties are genuinely part of the live cascade (recall specificity/cascade from Module 01), a value defined on `.card` overrides the `:root` value *only within that scope* — descendants of `.card` inherit `green`, while everything else on the page still sees `blue`. A Sass variable, by contrast, is substituted once at compile time and has no equivalent concept of runtime, scoped overriding.

---

# Overriding Responsively

```css
:root {
  --container-padding: 1rem;
}

@media (min-width: 768px) {
  :root {
    --container-padding: 2rem;
  }
}

.container {
  padding: var(--container-padding);
}
```

Recall media queries from Module 08 — redefining a custom property inside a media query lets you adjust a value responsively in exactly one place, and every component referencing `var(--container-padding)` updates automatically, rather than needing its own separate media query.

---

# Per-Component Theming

```css
.btn {
  background: var(--btn-color, #4a90d9);
}

.btn-danger {
  --btn-color: #e05252;
}
```

A genuinely powerful pattern: the base `.btn` component reads from a variable with a sensible default, and specific variants simply redefine that one variable rather than rewriting the whole rule — the actual background/color logic stays defined in exactly one place.

---

# Practical Example: A Themeable Card Component

```html
<div class="card">Default card</div>
<div class="card card-dark">Dark card</div>
```
```css
.card {
  --card-bg: white;
  --card-text: #1a1a2e;
  background: var(--card-bg);
  color: var(--card-text);
  padding: 1.5rem;
  border-radius: 8px;
}

.card-dark {
  --card-bg: #1a1a2e;
  --card-text: white;
}
```

Recall `border-radius` and `padding` values themselves could also be extracted into variables (`--card-radius`, `--card-padding`) for a fully themeable component — this is genuinely the foundation of most real-world CSS design systems and dark-mode implementations.

---

# Revision Questions

1. How do custom property names differ syntactically from regular CSS properties?
2. What's the key behavioral difference between a CSS custom property and a Sass/preprocessor variable?
3. What does the second argument in `var(--name, fallback)` do?

<details><summary>Answers</summary>

1. Custom property names always begin with two dashes (`--name`), unlike standard CSS properties.
2. Custom properties are genuinely part of the live CSS cascade and can be scoped/overridden at runtime for specific selectors and their descendants; preprocessor variables are substituted once at compile time and have no equivalent concept of cascading, scoped overrides.
3. It provides a fallback value used if the referenced custom property hasn't been defined (or is invalid) anywhere in the current cascade.

</details>
