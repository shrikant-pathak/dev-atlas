# Lesson 04: Basic Selectors

## Learning Objectives
By the end of this lesson, you will be able to:
- Use element, class, ID, and universal selectors correctly.
- Choose the appropriate selector type based on what you're targeting.
- Understand how these connect directly to HTML concepts from Book 02.

---

# Introduction

Lesson 01 introduced the core "select, then style" pattern using a single element selector (`p`). This lesson expands your selector vocabulary to the fundamental set you'll use constantly — and directly builds on `class`/`id` concepts from Book 02, Module 01, Lesson 05.

---

# Element (Type) Selectors

Targets every instance of a given HTML tag:

```css
p {
  color: gray;
}

h1 {
  font-size: 32px;
}
```

Useful for broad, page-wide defaults — but genuinely limited, since it applies to *every* matching element with no way to target just some of them.

---

# Class Selectors

Recall Book 02: `class` can be applied to multiple elements, used for grouping similar things. In CSS, target a class using a leading dot (`.`):

```html
<p class="highlight">First</p>
<p class="highlight">Second</p>
<p>Not highlighted</p>
```

```css
.highlight {
  background-color: yellow;
}
```

This styles only the two paragraphs with `class="highlight"`, leaving the third untouched — genuinely the most commonly used selector type in real-world CSS, precisely because of this targeted reusability.

---

# ID Selectors

Recall Book 02: `id` must be unique per page. Target an ID using a leading hash (`#`):

```html
<header id="main-header">Site Header</header>
```

```css
#main-header {
  background-color: navy;
  color: white;
}
```

**Important nuance carried over from Book 02:** since an ID should only ever apply to one element, ID selectors are generally used sparingly in real CSS — reach for classes as your default, and use IDs mainly for genuinely unique, one-per-page elements, or as JavaScript hooks (Book 04) rather than primary styling targets. You'll understand exactly why once Lesson 05 covers specificity — ID selectors are much harder to override later.

---

# The Universal Selector

Targets literally every element on the page:

```css
* {
  margin: 0;
  padding: 0;
}
```

This specific pattern — zeroing out margin/padding on every element — is an extremely common "reset" technique you'll see constantly in real projects, addressed more fully once you reach Module 03's box model lessons.

---

# Combining Selectors: Class on a Specific Element

You can combine an element selector with a class for more precision:

```css
p.highlight {
  background-color: yellow;
}
```

This targets only `<p>` elements with `class="highlight"` — not a `<div class="highlight">`, for instance. Genuinely useful once a project has many different classes shared across different element types.

---

# Choosing the Right Selector

| Situation | Selector |
|---|---|
| Style every instance of an element type | Element selector |
| Style a reusable group of similar elements | Class selector |
| Style one genuinely unique element | ID selector (sparingly) |
| Reset/normalize styles across everything | Universal selector |

---

# Practical Example

```html
<h1 id="page-title">Dev Atlas</h1>
<p class="intro">Welcome to the roadmap.</p>
<p class="intro">Learn HTML, CSS, and more.</p>
<p>A regular, unstyled paragraph.</p>
```

```css
* {
  margin: 0;
  padding: 0;
}

#page-title {
  color: darkblue;
}

.intro {
  font-style: italic;
  color: gray;
}

p {
  line-height: 1.6;
}
```

---

# Revision Questions

1. What symbol prefixes a class selector, and what prefixes an ID selector?
2. Why are class selectors generally preferred over ID selectors for everyday styling?
3. What does `p.highlight` target, as opposed to just `.highlight`?

<details><summary>Answers</summary>

1. A class selector uses a leading dot (`.`); an ID selector uses a leading hash (`#`).
2. Because classes can be reused across multiple elements, while IDs should be unique per page — and ID selectors carry much higher specificity, making them harder to override later (full explanation in Lesson 05).
3. `p.highlight` targets only `<p>` elements that also have `class="highlight"`, while `.highlight` alone targets any element with that class, regardless of tag type.

</details>
