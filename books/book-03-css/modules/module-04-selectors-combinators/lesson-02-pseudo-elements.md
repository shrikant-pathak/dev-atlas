# Lesson 02: Pseudo-elements

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a pseudo-element is and how it differs from a pseudo-class.
- Use `::before` and `::after` to insert generated content.
- Use `::first-line` and `::selection` for text-specific styling.

---

# Introduction

Pseudo-elements look syntactically similar to pseudo-classes (Lesson 01) but do something genuinely different: rather than targeting an element's *state*, they let you target — or even create — a specific *part* of an element that doesn't otherwise exist as its own tag in your HTML.

---

# Syntax: Double Colon

Modern CSS distinguishes pseudo-elements with a **double colon** (`::`), versus a pseudo-class's single colon (`:`) — though older code and even some current browsers still accept a single colon for backward compatibility. Using `::` explicitly is the modern, recommended convention, and worth adopting now for clarity.

```css
p::first-line { font-weight: bold; }   /* pseudo-element */
p:hover { color: red; }                  /* pseudo-class */
```

---

# `::before` and `::after`: Generated Content

These insert content *before* or *after* an element's actual content, without needing any extra HTML element at all:

```css
.required-label::after {
  content: " *";
  color: red;
}
```

```html
<label class="required-label">Email</label>
```
Renders as: **Email \*** — the asterisk exists purely in CSS, not in the HTML at all.

**The `content` property is required** — `::before`/`::after` do absolutely nothing without it, even if set to an empty string:
```css
.icon-box::before {
  content: "";
  display: inline-block;
  width: 16px;
  height: 16px;
  background-image: url("icon.svg");
}
```
This pattern — an empty `content: ""` purely to create a styleable box — is genuinely common for decorative elements (like small icon squares or decorative lines) that don't need actual text content.

---

# Common Real-World Uses

**Tooltips (a preview of Module 10):**
```css
.tooltip::after {
  content: attr(data-tooltip); /* pulls text from a data-* attribute, Book 02 Module 01 */
  /* additional positioning styles would go here */
}
```

**Decorative quote marks:**
```css
blockquote::before {
  content: "\201C"; /* opening curly quote character */
  font-size: 2em;
}
```

**Clearfix (a classic older technique, still occasionally seen):**
```css
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```
(This specific pattern relates to `float`, covered fully in Module 05 — filed away here as a preview of where `::after` shows up in real legacy code.)

---

# `::first-line` and `::first-letter`

```css
p::first-line {
  font-weight: bold;
}
p::first-letter {
  font-size: 2em;
  float: left; /* the classic "drop cap" effect seen in print/editorial design */
}
```

Genuinely useful for editorial-style text effects — `::first-letter` combined with `float` is exactly how the classic large "drop cap" beginning of a chapter/article is typically implemented.

---

# `::selection`

```css
::selection {
  background-color: yellow;
  color: black;
}
```

Styles the appearance of text a user has actively highlighted/selected with their mouse — a small, often-overlooked detail, but genuinely noticeable when a site's selected-text color clashes badly with its background (e.g., default blue selection on a dark navy background).

---

# Practical Example

```css
h2::before {
  content: "§ ";
  color: #999;
}

.badge::after {
  content: "NEW";
  background-color: red;
  color: white;
  font-size: 0.7em;
  padding: 2px 6px;
  border-radius: 4px;
  margin-left: 8px;
}

::selection {
  background-color: #3498db;
  color: white;
}
```

---

# Revision Questions

1. What's the syntactic difference between a pseudo-class and a pseudo-element in modern CSS?
2. What CSS property is absolutely required for `::before`/`::after` to have any visible effect?
3. What does `::first-letter` combined with `float: left` typically create?

<details><summary>Answers</summary>

1. Pseudo-classes use a single colon (`:`); pseudo-elements use a double colon (`::`) in modern convention.
2. The `content` property — without it, `::before`/`::after` produce no visible output at all, even if other styles are set.
3. The classic "drop cap" effect — an enlarged first letter that the surrounding text wraps around, common in editorial/print-style design.

</details>
