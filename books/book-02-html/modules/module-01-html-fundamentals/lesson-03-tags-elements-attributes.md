cat > lesson-03-tags-elements-attributes.md << 'EOF'
# Lesson 03: Tags, Elements & Attributes

## Learning Objectives
By the end of this lesson, you will be able to:
- Precisely distinguish between a tag, an element, and an attribute.
- Understand the difference between paired and self-closing (void) elements.
- Write correctly nested, well-formed HTML.

---

# Introduction

The words "tag," "element," and "attribute" get used loosely and interchangeably by beginners — but they mean genuinely different things, and being precise about this vocabulary will make every future lesson (and every technical conversation with other developers) clearer.

---

# Tags vs. Elements

- A **tag** is the markup itself — the angle-bracket syntax: `<p>` is an opening tag, `</p>` is a closing tag.
- An **element** is the *complete unit*: the opening tag, its content, and its closing tag, all together.

```html
<p>This is a paragraph.</p>
```

Here, `<p>` and `</p>` are tags; `<p>This is a paragraph.</p>` — the whole thing — is the **element**.

This distinction matters because "element" is also the term used constantly once you reach the DOM and JavaScript (Book 04) — `document.querySelector()` selects *elements*, not "tags."

---

# Attributes

**Attributes** provide additional information about an element, written inside the opening tag as `name="value"` pairs:

```html
<a href="https://example.com" target="_blank">Visit Example</a>
```

Here, `href` and `target` are attributes of the `<a>` element, providing the link's destination and specifying it should open in a new tab.

**Attribute rules:**
- Values are conventionally wrapped in double quotes (though single quotes also work).
- An element can have multiple attributes, separated by spaces.
- Some attributes are boolean (present = true, absent = false), like `disabled` or `checked` — no value needed:
```html
  <input type="checkbox" checked>
```

---

# Paired vs. Self-Closing (Void) Elements

Most elements are **paired** — they have both an opening and closing tag, wrapping content:
```html
<p>Content goes here</p>
```

Some elements are **void (self-closing)** — they never wrap content and have no closing tag, because they represent a single, standalone piece of content:
```html
<img src="photo.jpg" alt="A photo">
<br>
<hr>
<input type="text">
```

A common beginner mistake is trying to write `<img>...</img>` — void elements simply don't work that way; they're complete on their own.

---

# Nesting Rules

Elements can be nested inside other elements, but nesting must be properly closed in the reverse order it was opened — like matching parentheses:

```html
<!-- Correct -->
<p>This is <strong>important</strong> text.</p>

<!-- Incorrect - improperly nested -->
<p>This is <strong>important</p></strong> text.
```

Browsers are often forgiving and will try to fix malformed HTML automatically, but relying on this is fragile — always close tags in the correct order.

---

# Practical Example

```html
<div class="card" id="profile-card">
  <img src="avatar.jpg" alt="Profile picture">
  <h2>Shrikant Pathak</h2>
  <p>Building <em>dev-atlas</em>, a full-stack learning roadmap.</p>
  <a href="https://github.com/shrikant-pathak/dev-atlas" target="_blank">View on GitHub</a>
</div>
```

This single example contains: paired elements (`div`, `h2`, `p`, `em`, `a`), a void element (`img`), and multiple attributes (`class`, `id`, `src`, `alt`, `href`, `target`) — all concepts you'll now recognize by name.

---

# Revision Questions

1. What's the precise difference between a "tag" and an "element"?
2. What is a void (self-closing) element, and give two examples.
3. What's wrong with this HTML: `<p>Hello <strong>World</p></strong>`?

<details><summary>Answers</summary>

1. A tag is the angle-bracket markup itself (opening or closing); an element is the complete unit — opening tag, content, and closing tag together.
2. An element with no closing tag, representing standalone content with nothing to wrap. Examples: `<img>`, `<br>`, `<hr>`, `<input>`.
3. The tags are improperly nested — `<strong>` was opened after `<p>` but closed after `</p>`, instead of being closed before `</p>` in proper "last opened, first closed" order.

</details>
EOF