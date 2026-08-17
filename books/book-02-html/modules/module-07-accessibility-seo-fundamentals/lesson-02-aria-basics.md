cat > lesson-02-aria-basics.md << 'EOF'
# Lesson 02: ARIA Basics

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what ARIA is and the problem it solves.
- Use common ARIA attributes correctly.
- Understand and apply the "First Rule of ARIA."

---

# Introduction

Semantic HTML (Module 06) handles most accessibility needs automatically. But sometimes — especially once you build custom interactive components in Book 04 (JavaScript) — you need to communicate additional information to assistive technology that HTML alone doesn't express. That's what **ARIA** is for.

---

# What Is ARIA?

**ARIA (Accessible Rich Internet Applications)** is a set of attributes you can add to HTML elements to provide additional accessibility information — particularly useful for custom, JavaScript-driven UI components that don't have a natural native HTML equivalent.

---

# The First Rule of ARIA

This is genuinely the single most important thing to know about ARIA, often called "The First Rule of ARIA":

> **If a native HTML element or attribute already has the semantics/behavior you need, use it instead of re-purposing an element and adding ARIA.**

```html
<!-- Wrong: reinventing a button with ARIA -->
<div role="button" tabindex="0" onclick="...">Submit</div>

<!-- Right: just use the native element -->
<button onclick="...">Submit</button>
```

The native `<button>` already comes with correct keyboard behavior (Enter/Space activates it), focus handling, and screen reader announcement, entirely for free. The ARIA version requires you to manually reimplement all of that correctly — genuinely easy to get subtly wrong. ARIA should fill gaps, not replace what HTML already does natively.

---

# Common ARIA Attributes

**`aria-label`** — provides an accessible name when there's no visible text (common on icon-only buttons):
```html
<button aria-label="Close dialog">✕</button>
```

**`aria-labelledby`** — points to another element's `id` to use as the accessible name:
```html
<h2 id="settings-heading">Settings</h2>
<div role="region" aria-labelledby="settings-heading">...</div>
```

**`aria-hidden`** — hides purely decorative content from assistive technology (while it remains visually visible):
```html
<span aria-hidden="true">🎉</span> Congratulations!
```
Genuinely useful for decorative icons that would otherwise be announced with no meaningful context.

**`aria-describedby`** — points to additional descriptive text (often used for form field hints/errors):
```html
<input type="password" aria-describedby="pwd-hint">
<p id="pwd-hint">Must be at least 8 characters.</p>
```

**`aria-live`** — announces dynamically updated content to screen readers (crucial for content that changes without a page reload, a preview of concepts you'll use constantly once you reach JavaScript):
```html
<div aria-live="polite" id="cart-status">Item added to cart.</div>
```

---

# ARIA Roles

The `role` attribute can describe an element's purpose when no native equivalent exists:
```html
<div role="alert">Your session is about to expire.</div>
```
`role="alert"` causes screen readers to announce this content immediately, interrupting whatever they were doing — appropriate for genuinely urgent, time-sensitive messages, but easily misused if applied too broadly (constant interruptions are just as bad as silence).

---

# Practical Example

```html
<button aria-label="Search" onclick="performSearch()">
  <svg aria-hidden="true">...</svg>
</button>

<input type="email" id="email" aria-describedby="email-hint" required>
<p id="email-hint">We'll never share your email.</p>

<div aria-live="polite">
  <!-- Updated dynamically via JavaScript later in this roadmap -->
</div>
```

---

# Revision Questions

1. What is the "First Rule of ARIA"?
2. What's the difference between `aria-label` and `aria-labelledby`?
3. When is `aria-hidden="true"` appropriate to use?

<details><summary>Answers</summary>

1. If a native HTML element or attribute already provides the needed semantics/behavior, use it instead of reinventing it with ARIA and a generic element like `<div>`.
2. `aria-label` provides the accessible name directly as a string value; `aria-labelledby` points to the `id` of another element on the page whose text content should be used as the accessible name.
3. For purely decorative content (like a decorative icon) that would otherwise be announced by a screen reader with no meaningful context, adding noise rather than value.

</details>
EOF