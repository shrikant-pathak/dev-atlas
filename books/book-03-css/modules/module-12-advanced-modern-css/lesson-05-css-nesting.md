# Lesson 05: CSS Nesting

## Learning Objectives
By the end of this lesson, you will be able to:
- Write nested selectors natively in CSS, without a preprocessor.
- Use the `&` symbol to reference the parent selector explicitly.
- Nest media queries and pseudo-classes inside a rule.

---

# Introduction

For years, nesting selectors — writing a child rule visually inside its parent rule — required a preprocessor like Sass or Less; it wasn't valid plain CSS. Native CSS nesting changes that, and it's worth learning properly since it changes how you'll structure stylesheets from here on, including revisiting patterns from earlier modules.

---

# Basic Nesting

```css
.card {
  padding: 1.5rem;
  border-radius: 8px;

  h3 {
    margin-bottom: 0.5rem;
  }

  p {
    color: #555;
  }
}
```

This compiles conceptually to `.card h3 { ... }` and `.card p { ... }` — the descendant combinator (Module 04) is applied automatically. Nesting keeps visually related rules grouped together in the source, mirroring the actual HTML structure they target.

---

# The `&` Symbol — Referencing the Parent Explicitly

```css
.btn {
  background: #4a90d9;

  &:hover {
    background: #3a7bc8;
  }

  &.btn-large {
    padding: 1rem 2rem;
  }
}
```

Plain nesting (as in the first example) implies a *descendant* relationship. `&` is needed whenever you want to attach directly to the parent selector itself — for pseudo-classes (`&:hover`), for a compound class on the same element (`&.btn-large`), or anywhere the relationship isn't "an element inside this one."

---

# Nesting Media Queries

```css
.container {
  width: 100%;

  @media (min-width: 768px) {
    width: 750px;
  }

  @media (min-width: 1024px) {
    width: 960px;
  }
}
```

Recall mobile-first media queries from Module 08 — nesting them directly inside the relevant rule keeps all of `.container`'s responsive behavior visible in one place, rather than scattered across separate `@media` blocks elsewhere in the file.

---

# Nesting With Combinators

```css
.list {
  li {
    padding: 0.5rem 0;

    & + li {
      border-top: 1px solid #eee;
    }
  }
}
```

Recall the adjacent sibling combinator (`+`) from Module 04 — combinators work identically inside nested rules, with `&` standing in for "the current nested selector" (here, `li`) wherever it's needed.

---

# A Genuine Caution: Don't Nest Too Deeply

```css
/* Technically valid, but genuinely hard to read and maintain */
.page {
  .container {
    .card {
      .card-header {
        h3 {
          span {
            color: red;
          }
        }
      }
    }
  }
}
```

Worth stating directly: just because nesting is now natively possible doesn't mean nesting everything as deeply as it will go is good practice. Deep nesting produces increasingly specific selectors (recall specificity from Module 01) that become genuinely difficult to override later, and mirrors a well-known anti-pattern from the Sass era. A reasonable practical limit is 2–3 levels deep; beyond that, a flatter set of purpose-named classes is usually more maintainable.

---

# Practical Example: A Nested Card Component

```html
<div class="card">
  <h3>Title</h3>
  <p>Description text.</p>
  <button class="card-btn">Learn More</button>
</div>
```
```css
.card {
  padding: 1.5rem;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);

  h3 {
    margin-bottom: 0.5rem;
  }

  p {
    color: #555;
    margin-bottom: 1rem;
  }

  .card-btn {
    background: #4a90d9;
    color: white;
    border: none;
    padding: 0.5rem 1rem;

    &:hover {
      background: #3a7bc8;
    }
  }

  @media (min-width: 600px) {
    padding: 2rem;
  }
}
```

Recall `box-shadow` from Module 09 — every rule related to `.card`, including its responsive behavior and its button's hover state, now lives in one clearly grouped block, rather than scattered across the stylesheet as separate top-level rules.

---

# Revision Questions

1. What does plain nesting (without `&`) imply about the relationship between parent and child rules?
2. When is the `&` symbol required rather than optional?
3. Why is deeply nesting selectors (4+ levels) generally discouraged, even though it's now valid CSS?

<details><summary>Answers</summary>

1. A descendant relationship — the nested selector is automatically combined with the parent using the descendant combinator (a space).
2. Whenever you need to attach directly to the parent selector itself rather than a descendant — for pseudo-classes (`&:hover`), compound classes on the same element (`&.variant`), or combinators referencing the current selector (`& + li`).
3. It produces increasingly high-specificity selectors that become difficult to override later, mirroring a well-known anti-pattern from Sass-based codebases — a flatter structure with purpose-named classes is usually more maintainable beyond 2–3 levels.

</details>
