# Lesson 03: Lists (Ordered, Unordered, Description)

## Learning Objectives
By the end of this lesson, you will be able to:
- Use ordered, unordered, and description lists correctly.
- Nest lists properly.
- Choose the correct list type based on content meaning.

---

# Introduction

Lists are everywhere on the web — navigation menus, article steps, product features, FAQs. HTML provides three distinct list types, each with a specific semantic purpose, and choosing the right one matters just as much as choosing the right heading level.

---

# Unordered Lists

Used when item **order doesn't matter** — a collection of related items with no inherent sequence.

```html
<ul>
  <li>HTML</li>
  <li>CSS</li>
  <li>JavaScript</li>
</ul>
```
Renders with bullet points by default (removable/customizable in CSS, Book 03).

---

# Ordered Lists

Used when item **order matters** — sequential steps, rankings, or numbered instructions.

```html
<ol>
  <li>Preheat the oven</li>
  <li>Mix the ingredients</li>
  <li>Bake for 25 minutes</li>
</ol>
```
Renders with automatic numbering (1, 2, 3...) by default.

**Useful attributes:**
```html
<ol start="5">        <!-- start numbering at 5 -->
<ol reversed>            <!-- count down instead of up -->
<ol type="A">              <!-- use letters instead of numbers: A, B, C -->
```

---

# Description Lists

Used for **name/value pairs** — terms paired with their descriptions, like a glossary or key-value data.

```html
<dl>
  <dt>HTML</dt>
  <dd>HyperText Markup Language — structures web content.</dd>

  <dt>CSS</dt>
  <dd>Cascading Style Sheets — styles web content.</dd>
</dl>
```

- `<dl>` — description list (the container)
- `<dt>` — description term
- `<dd>` — description detail/definition

This list type is genuinely underused by beginners, but it's the semantically correct choice for FAQs, glossaries, and metadata — situations where `<ul>` or `<ol>` would technically work but wouldn't communicate the actual name/value relationship.

---

# Nesting Lists

Lists can be nested inside list items to represent hierarchical content:

```html
<ul>
  <li>Frontend
    <ul>
      <li>HTML</li>
      <li>CSS</li>
      <li>JavaScript</li>
    </ul>
  </li>
  <li>Backend
    <ul>
      <li>Node.js</li>
      <li>Express</li>
    </ul>
  </li>
</ul>
```

Note the nested `<ul>` sits *inside* the parent `<li>`, not as a sibling of it — this is a common structural mistake worth watching for.

---

# Choosing the Right List Type

| Content | List Type |
|---|---|
| Recipe ingredients (no strict order) | `<ul>` |
| Step-by-step instructions | `<ol>` |
| Navigation menu items | `<ul>` |
| Race results / rankings | `<ol>` |
| Glossary of terms | `<dl>` |
| FAQ (question/answer pairs) | `<dl>` |

---

# Practical Example

```html
<h2>Getting Started</h2>
<ol>
  <li>Clone the repository</li>
  <li>Run <code>npm install</code></li>
  <li>Run <code>npm start</code></li>
</ol>

<h2>Tech Stack</h2>
<ul>
  <li>React</li>
  <li>Node.js</li>
  <li>MongoDB</li>
</ul>

<h2>Glossary</h2>
<dl>
  <dt>API</dt>
  <dd>Application Programming Interface — a way for programs to communicate.</dd>
</dl>
```

---

# Revision Questions

1. What determines whether you should use `<ul>` or `<ol>`?
2. What are `<dt>` and `<dd>` used for, and inside which container?
3. When nesting a list, where should the nested `<ul>` be placed structurally?

<details><summary>Answers</summary>

1. Whether the order of items matters to the content's meaning — `<ol>` for sequential/ordered content, `<ul>` for unordered collections.
2. `<dt>` is the description term, `<dd>` is its description/definition, both inside a `<dl>` (description list) container.
3. Inside the parent `<li>` element it relates to, not as a sibling alongside it.

</details>
