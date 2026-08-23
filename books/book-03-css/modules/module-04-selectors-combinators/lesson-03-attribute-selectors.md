# Lesson 03: Attribute Selectors

## Learning Objectives
By the end of this lesson, you will be able to:
- Select elements based on the presence or value of an HTML attribute.
- Use partial-match attribute selectors for flexible targeting.
- Apply this to real Book 02 patterns like form inputs and file links.

---

# Introduction

Attribute selectors let you target elements based on their HTML attributes — not just `class`/`id` (which are technically attributes too, but with their own dedicated shorthand syntax from Module 01), but genuinely *any* attribute, including the `data-*` attributes from Book 02, Module 01.

---

# Presence Selector: `[attribute]`

Selects any element that has a given attribute at all, regardless of its value:

```css
input[required] {
  border-left: 3px solid red;
}
```

Recall Book 02, Module 04's `required` attribute — this rule visually flags every required form field, without needing any extra class added manually to each one.

---

# Exact Value Selector: `[attribute="value"]`

```css
input[type="email"] {
  background-image: url("email-icon.svg");
}
```

Recall Book 02, Module 04's input types — this targets *only* `<input>` elements with `type="email"` specifically, leaving `type="text"` or `type="password"` untouched.

---

# Partial Match Selectors

These four variants match *part* of an attribute's value, genuinely useful for flexible targeting:

```css
a[href^="https"] { /* starts with */
  padding-left: 20px;
}

a[href$=".pdf"] { /* ends with */
  background-image: url("pdf-icon.svg");
}

a[href*="example.com"] { /* contains anywhere */
  color: green;
}

[class~="badge"] { /* one word among space-separated words */
  font-weight: bold;
}
```

- **`^=`** ("begins with") — genuinely useful for styling all external links differently, e.g., `a[href^="http"]` catching every link starting with a full protocol.
- **`$=`** ("ends with") — perfect for file-type-specific styling, like adding a distinct icon next to every link ending in `.pdf`, `.zip`, or `.docx`.
- **`*=`** ("contains") — the most flexible, matching the substring anywhere within the value.
- **`~=`** ("contains word") — matches one whole word within a space-separated list (like `class`, though `.classname` shorthand is more common for this specific case).

---

# A Genuinely Practical Pattern: Styling External Links

```css
a[href^="http"]::after {
  content: " ↗";
  font-size: 0.8em;
}
```

This combines Lesson 02's `::after` pseudo-element with an attribute selector — automatically adding a small visual indicator to every link that points to an external URL (starting with `http`), without needing to manually mark each one in the HTML.

---

# Case-Insensitive Matching

```css
a[href$=".PDF" i] {
  /* the "i" flag makes this match .pdf, .PDF, .Pdf, etc. */
}
```

The optional `i` flag (placed just before the closing bracket) makes the value comparison case-insensitive — genuinely useful since file extensions and attribute values aren't always consistently cased across a real project.

---

# Practical Example

```css
/* Highlight required form fields */
input[required] {
  border-left: 3px solid #e74c3c;
}

/* Icon for PDF download links */
a[href$=".pdf"]::before {
  content: "📄 ";
}

/* Visual indicator for external links */
a[href^="http"]:not([href*="devatlas.com"])::after {
  content: " ↗";
}
```
(That last example also combines `:not()` from Lesson 01 — excluding your own domain from being marked "external.")

---

# Revision Questions

1. What does `input[required]` select, and how does it differ from needing a manually-added class?
2. What's the difference between `[href^="http"]` and `[href*="http"]`?
3. What does the `i` flag do in an attribute selector?

<details><summary>Answers</summary>

1. It selects every element with a `required` attribute present, regardless of value — no manual class needs to be added to each field individually, since it targets the existing HTML attribute directly.
2. `^=` matches values that *start with* the given string; `*=` matches the string appearing *anywhere* within the value.
3. It makes the value comparison case-insensitive, so the selector matches regardless of how the actual attribute value is capitalized.

</details>
