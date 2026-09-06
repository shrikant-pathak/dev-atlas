# Lesson 04: Sass/SCSS Preview

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a CSS preprocessor is and why they were widely adopted.
- Recognize Sass/SCSS syntax: variables, nesting, mixins, and partials.
- Identify which Sass features are now redundant given native CSS (covered in Module 12).

---

# Introduction

This is a deliberately brief preview, not a full Sass course — but it's genuinely worth knowing this exists, since a large number of real, existing codebases (including likely ones you'll work in professionally) still use Sass/SCSS, even though Module 12 covered several native CSS features that historically only Sass provided.

---

# What Is a Preprocessor?

Sass (and SCSS, its more CSS-like syntax variant) is a language that *compiles down* to plain CSS before it reaches the browser — the browser never actually sees `.scss` files directly; a build step transforms them into standard `.css` output first. This compilation step is the fundamental difference from the native CSS features in Module 12, which the browser understands natively with zero build step required.

---

# Sass Variables (Compare to Module 12's Custom Properties)

```scss
// Sass variable
$primary-color: #4a90d9;

.btn {
  background: $primary-color;
}
```

Recall custom properties from Module 12, Lesson 01 — genuinely the key difference worth understanding: `$primary-color` is substituted with its literal value at *compile time* and has no runtime presence at all; it cannot be scoped, overridden per-component, or read/changed via JavaScript the way a native `--custom-property` genuinely can. Sass variables were essential before custom properties existed; today, custom properties cover most of the same ground natively, with real runtime cascading behavior Sass variables never had.

---

# Sass Nesting (Compare to Module 12's Native Nesting)

```scss
.card {
  padding: 1.5rem;

  &:hover {
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  }

  h3 {
    margin-bottom: 0.5rem;
  }
}
```

Recall Module 12, Lesson 05 — this is genuinely nearly identical syntax to native CSS nesting, including the `&` symbol. This is one of the clearest examples of a feature that used to require Sass but is now natively available in plain CSS.

---

# Mixins — Reusable Style Blocks (No Native CSS Equivalent Yet)

```scss
@mixin button-base {
  padding: 0.75rem 1.5rem;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}

.btn-primary {
  @include button-base;
  background: #4a90d9;
}

.btn-secondary {
  @include button-base;
  background: #e5e7eb;
}
```

Unlike variables and nesting, **mixins genuinely have no direct native CSS equivalent** — this remains one of the more compelling reasons some projects still choose Sass. A mixin lets you define a reusable *block* of declarations (not just a single value) and insert it wherever needed, optionally with parameters:

```scss
@mixin flex-center($gap: 1rem) {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: $gap;
}

.toolbar {
  @include flex-center(0.5rem);
}
```

---

# Partials and `@use` — File Organization

```scss
// _variables.scss (the underscore marks it as a "partial" — not compiled to its own CSS file)
$primary-color: #4a90d9;

// main.scss
@use 'variables';

.btn {
  background: variables.$primary-color;
}
```

Recall Lesson 02's manual `@import`-based file organization — Sass's `@use` system genuinely predates and inspired some of that same thinking, with the build step resolving all partials into a single compiled CSS file, avoiding the runtime `@import` performance cost mentioned in Lesson 02 entirely.

---

# What Sass Still Offers Beyond Native CSS (as of this book)

- **Mixins** with parameters (shown above) — no native equivalent.
- **Functions** — genuinely custom computation logic beyond what `calc()`/`min()`/`max()` (Module 12) can express.
- **Loops and conditionals** (`@each`, `@for`, `@if`) — generating repetitive CSS programmatically.
- **A mature ecosystem** — many existing large codebases are already built on it, which is often the most practical reason to encounter Sass in a real job, independent of whether a fresh greenfield project would choose it today.

---

# Practical Example: A Button Mixin System

```scss
@mixin button-variant($bg, $color: white) {
  background: $bg;
  color: $color;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 6px;

  &:hover {
    background: darken($bg, 10%);
  }
}

.btn-primary { @include button-variant(#4a90d9); }
.btn-danger  { @include button-variant(#e05252); }
```

Recall the button variants from Module 10, Lesson 03 — this compiles to full, separate CSS rules for `.btn-primary` and `.btn-danger`, but the *source* stays genuinely DRY, with the shared logic (including a built-in `darken()` color function, another Sass-only feature) defined exactly once.

---

# Revision Questions

1. What is the fundamental mechanical difference between how a Sass variable and a native CSS custom property are resolved?
2. Which Sass feature covered here has essentially no native CSS equivalent, even after Module 12?
3. Why might a developer still encounter and need to work with Sass today, even knowing native CSS now covers variables and nesting?

<details><summary>Answers</summary>

1. A Sass variable is substituted with its literal value at compile time and has no presence in the browser at all; a native custom property exists at runtime, genuinely participates in the cascade, and can be scoped/overridden or read via JavaScript.
2. Mixins (reusable, parameterized blocks of declarations) — native CSS has no direct equivalent to this feature.
3. Because a large number of existing, real-world codebases are already built on Sass, and features like mixins, loops, and built-in functions still offer capabilities beyond what native CSS currently provides — independent of what a brand-new project might choose today.

</details>
