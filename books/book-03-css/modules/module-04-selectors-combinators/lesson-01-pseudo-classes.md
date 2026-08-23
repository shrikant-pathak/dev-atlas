# Lesson 01: Pseudo-classes

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a pseudo-class is and how it differs from a regular class.
- Use common state-based and structural pseudo-classes.
- Apply `:nth-child()` with confidence, including formula patterns.

---

# Introduction

Module 01's basic selectors targeted elements based on what's in your HTML (tags, classes, IDs). **Pseudo-classes** let you target elements based on *state* or *position* — things not directly written in your HTML at all, but genuinely real conditions the browser tracks.

---

# What Is a Pseudo-class?

A pseudo-class is a special keyword added to a selector, prefixed with a single colon (`:`), that selects elements in a specific *state* or *position*:

```css
button:hover {
  background-color: darkblue;
}
```

This targets a `<button>` only while the user's mouse is actually hovering over it — a genuine, dynamic state that has nothing to do with any `class` attribute written in the HTML.

---

# State-Based Pseudo-classes

```css
button:hover { background-color: darkblue; }     /* mouse hovering */
button:active { background-color: navy; }          /* being clicked, mid-click */
input:focus { border-color: blue; }                  /* has keyboard focus (Module 03) */
input:disabled { opacity: 0.5; }                       /* disabled form field (Book 02, Module 04) */
input:checked { /* checkbox/radio currently checked */ }
```

These directly connect back to Book 02, Module 04's form elements — `:focus`, `:disabled`, and `:checked` are genuinely essential for styling real, interactive forms.

---

# Structural Pseudo-classes

These select elements based on their *position* among sibling elements:

```css
li:first-child { font-weight: bold; }
li:last-child { border-bottom: none; }
p:only-child { text-align: center; }
```

- **`:first-child`** — selects the element only if it's the *first* child of its parent.
- **`:last-child`** — selects the element only if it's the *last* child.
- **`:only-child`** — selects the element only if it's the *sole* child (no siblings at all).

---

# `:nth-child()`: The Powerful, Flexible One

Recall Module 03, Lesson 07's zebra-striping preview — `:nth-child()` accepts a formula, a keyword, or a specific number:

```css
li:nth-child(3) { color: red; }              /* exactly the 3rd child */
li:nth-child(odd) { background: #eee; }        /* 1st, 3rd, 5th... */
li:nth-child(even) { background: #f9f9f9; }     /* 2nd, 4th, 6th... - the zebra-stripe pattern */
li:nth-child(3n) { color: blue; }                /* every 3rd: 3rd, 6th, 9th... */
li:nth-child(3n+1) { color: green; }              /* 1st, 4th, 7th... */
```

**Reading the formula `3n+1`:** substitute `n = 0, 1, 2, 3...` — giving `1, 4, 7, 10...`. This genuinely takes practice to read fluently, but the pattern (`An+B`) is worth understanding rather than memorizing specific examples: `A` is the "step" between matches, `B` is the starting offset.

---

# `:not()`: Excluding Elements

```css
li:not(:last-child) {
  border-bottom: 1px solid #ddd; /* every item EXCEPT the last gets a divider */
}
```

`:not()` accepts another selector and excludes any element matching it — genuinely useful for "everything except..." patterns, like adding dividers between list items without an extra divider trailing the final one.

---

# Practical Example

```css
/* Zebra-striped table (Module 03 preview, now explained) */
tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Dividers between items, but not after the last one */
.menu-item:not(:last-child) {
  border-bottom: 1px solid #ddd;
}

/* Interactive button states */
button:hover { background-color: #2980b9; }
button:active { background-color: #1f618d; }
button:disabled { opacity: 0.5; cursor: not-allowed; }
```

---

# Revision Questions

1. What's the fundamental difference between a pseudo-class and a regular class selector?
2. What does `li:nth-child(2n+1)` select, and what keyword could you use instead?
3. What does `:not(:last-child)` accomplish, and give a real use case.

<details><summary>Answers</summary>

1. A pseudo-class targets elements based on a dynamic state or structural position (like being hovered or being the first child), not something written directly as an attribute in the HTML; a regular class targets elements with a specific `class` attribute value.
2. It selects odd-numbered children (1st, 3rd, 5th...); the keyword `odd` accomplishes the same thing.
3. It selects all matching elements except the last one — a real use case is adding divider borders between list items without adding a trailing divider after the final item.

</details>
