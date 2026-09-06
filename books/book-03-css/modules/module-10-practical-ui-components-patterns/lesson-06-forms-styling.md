# Lesson 06: Forms Styling

## Learning Objectives
By the end of this lesson, you will be able to:
- Style text inputs, checkboxes, and radio buttons consistently across browsers.
- Use `:focus`, `:invalid`, and `:valid` for real-time form feedback.
- Build a custom-styled checkbox/radio using the "hide and replace" technique.

---

# Introduction

Forms are notoriously inconsistent in their default browser styling — a genuinely well-known pain point in CSS. This lesson covers both the straightforward parts (text inputs) and the trickier parts (checkboxes, radios) that require a specific, well-established technique to style reliably.

---

# Styling Text Inputs

```css
.input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 1rem;
  transition: border-color 0.15s, box-shadow 0.15s;
}

.input:focus {
  outline: none;
  border-color: #4a90d9;
  box-shadow: 0 0 0 3px rgba(74, 144, 217, 0.2);
}
```

Recall `box-shadow` from Module 09 — using it here (rather than the default browser `outline`) produces a soft, on-brand focus ring, though genuinely worth noting: removing `outline` entirely requires providing an equally visible replacement (as done here), never simply deleting it — recall the accessibility discussion of focus indicators from Lesson 03.

---

# Real-Time Validation Feedback

```css
.input:invalid {
  border-color: #e05252;
}

.input:valid {
  border-color: #4caf50;
}

.input:invalid:not(:placeholder-shown) {
  border-color: #e05252; /* only show red AFTER the user has typed something */
}
```

`:invalid`/`:valid` are pseudo-classes that reflect the browser's built-in HTML validation (recall `type="email"`, `required`, `pattern`, etc. from Module 02, HTML) — genuinely useful for instant visual feedback with zero JavaScript. The `:not(:placeholder-shown)` trick in the third rule avoids showing an alarming red border on an empty required field the instant the page loads, before the user has had any chance to type.

---

# The "Hide and Replace" Technique for Checkboxes/Radios

Native checkboxes and radio buttons are notoriously difficult to style directly and look wildly different across browsers. The standard, reliable workaround:

```html
<label class="checkbox">
  <input type="checkbox" class="checkbox-input">
  <span class="checkbox-box"></span>
  Subscribe to newsletter
</label>
```
```css
.checkbox-input {
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

.checkbox-box {
  display: inline-block;
  width: 20px;
  height: 20px;
  border: 2px solid #ccc;
  border-radius: 4px;
  vertical-align: middle;
  margin-right: 0.5rem;
}

.checkbox-input:checked + .checkbox-box {
  background: #4a90d9;
  border-color: #4a90d9;
}

.checkbox-input:focus-visible + .checkbox-box {
  outline: 2px solid #a3c9f1;
  outline-offset: 2px;
}
```

Recall the sibling combinator from Module 04 — `.checkbox-input:checked + .checkbox-box` targets the custom visual box immediately *because* it's adjacent in the HTML to the real (but visually hidden) checkbox. The actual `<input>` stays functionally present — hidden visually via `opacity: 0`, not `display: none` — so it remains keyboard-accessible and fires real `change` events; only its appearance is replaced by `.checkbox-box`.

---

# Practical Example: A Styled Form Field with Validation

```html
<label>
  Email
  <input type="email" class="input" placeholder="you@example.com" required>
</label>
```
```css
.input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.input:focus {
  outline: none;
  border-color: #4a90d9;
  box-shadow: 0 0 0 3px rgba(74, 144, 217, 0.2);
}

.input:invalid:not(:placeholder-shown) {
  border-color: #e05252;
}
```

An email field that shows a friendly focus ring while active, and only flags invalid input in red once the user has actually started typing something incorrect — not before.

---

# Revision Questions

1. Why is `opacity: 0` used instead of `display: none` to hide the real checkbox input in the "hide and replace" technique?
2. What does the `:not(:placeholder-shown)` trick prevent when combined with `:invalid`?
3. Which combinator makes `.checkbox-input:checked + .checkbox-box` work?

<details><summary>Answers</summary>

1. `opacity: 0` keeps the input visually hidden while remaining functionally present — still focusable/tabbable and firing real `change` events — whereas `display: none` would remove it from the accessibility tree and keyboard navigation entirely.
2. It prevents the invalid-state red border from showing on an empty required field the instant the page loads, only applying once the user has actually typed something (and it's still invalid).
3. The adjacent sibling combinator (`+`), which selects an element immediately following another sharing the same parent.

</details>
