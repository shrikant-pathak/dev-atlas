# Lesson 05: Classes, IDs & Global Attributes

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `class` and `id` correctly, understanding their key difference.
- Identify and use common global attributes.
- Understand the `data-*` attribute pattern for custom data.

---

# Introduction

`class` and `id` are two of the most-used attributes in all of HTML — they don't change what an element *is*, but they let you specifically target elements for styling (CSS, Book 03) and behavior (JavaScript, Book 04). Getting the distinction between them right now will prevent confusion for the rest of your development career.

---

# The `class` Attribute

`class` assigns one or more labels to an element, and **the same class can be reused across many elements** on a page.

```html
<p class="highlight">First highlighted paragraph.</p>
<p class="highlight">Second highlighted paragraph.</p>
<div class="highlight important">This div has TWO classes.</div>
```

Multiple classes are space-separated within the same attribute. Classes are the primary way CSS targets groups of elements that should share the same styling.

---

# The `id` Attribute

`id` assigns a **unique identifier** to a single element — no two elements on the same page should share the same `id`.

```html
<div id="main-header">Site Header</div>
```

Because IDs are unique, they're commonly used for:
- Linking directly to a specific section of a page (`<a href="#main-header">`)
- Targeting one specific element in JavaScript (`document.getElementById('main-header')`)
- Form labels associating with a specific input (Module 04)

---

# `class` vs. `id`: The Core Rule

| | `class` | `id` |
|---|---|---|
| Reusable? | Yes — many elements can share it | No — must be unique per page |
| Typical use | Styling groups of similar elements | Targeting one specific, unique element |
| Multiple per element? | Yes (space-separated) | No — only one `id` per element |

A common beginner mistake: using `id` the way `class` should be used (giving the same `id` to multiple elements) — this is invalid HTML and will cause bugs later when JavaScript tries to select "the" element with that ID and only finds the first one.

---

# Global Attributes

**Global attributes** can be applied to *any* HTML element, regardless of what it is:

- **`id`** and **`class`** — covered above.
- **`title`** — adds a tooltip shown on hover.
- **`hidden`** — hides the element entirely (boolean attribute, no value needed).
- **`tabindex`** — controls keyboard navigation order (important for accessibility, Module 07).
- **`contenteditable`** — makes the element's content directly editable by the user in the browser.
- **`style`** — applies inline CSS directly (generally discouraged in favor of proper CSS files, covered in Book 03).
- **`lang`** — overrides the document's language for just this element.

```html
<p title="This appears on hover">Hover over me</p>
<div hidden>You won't see this</div>
<div contenteditable="true">Click and type here!</div>
```

---

# The `data-*` Attribute Pattern

**Custom data attributes** let you attach your own arbitrary data to an element, prefixed with `data-`, without violating HTML standards or interfering with any built-in attribute:

```html
<button data-user-id="482" data-role="admin">Delete User</button>
```

This is genuinely one of the most useful patterns you'll carry forward into Book 04 (JavaScript) — `data-*` attributes are commonly read via JavaScript's `dataset` property to pass information from HTML into your application's logic, without needing a database lookup just to know which button was clicked.

---

# Practical Example

```html
<div class="card featured" id="product-42" data-category="electronics" data-in-stock="true">
  <h2 class="card-title">Wireless Headphones</h2>
  <p class="price" title="Price excludes tax">$79.99</p>
</div>
```

---

# Revision Questions

1. What's the fundamental difference between `class` and `id`?
2. Name three global attributes and what each does.
3. What is the `data-*` attribute pattern used for?

<details><summary>Answers</summary>

1. `class` can be applied to many elements and elements can have multiple classes; `id` must be unique to a single element per page, and an element can only have one.
2. Any three of: `title` (hover tooltip), `hidden` (hides the element), `tabindex` (keyboard navigation order), `contenteditable` (makes content editable), `style` (inline CSS), `lang` (overrides language).
3. Attaching custom, arbitrary data directly to an HTML element, commonly read later via JavaScript, without violating HTML standards.

</details>
