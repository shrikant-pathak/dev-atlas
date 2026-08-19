# Lesson 04: Buttons

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<button>` correctly with the appropriate `type` attribute.
- Explain the critical bug caused by an unspecified button type inside a form.
- Choose between `<button>` and `<input type="submit">`.

---

# Introduction

Buttons seem simple, but a single missing attribute causes one of the most common and confusing form bugs beginners encounter. This short but important lesson makes sure you never hit it.

---

# The `<button>` Element

```html
<button>Click Me</button>
```

Unlike most form inputs, `<button>` is a paired element (not void) and can contain other inline content — text, icons, even images — rather than being limited to a single `value` attribute.

---

# The Critical `type` Attribute

Every `<button>` should explicitly specify a `type`:

```html
<button type="submit">Submit</button>
<button type="reset">Reset</button>
<button type="button">Just a Button</button>
```

- **`type="submit"`** — submits the form (this is the default if `type` is omitted!).
- **`type="reset"`** — clears all form fields back to their default values.
- **`type="button"`** — does nothing on its own; used purely as a hook for JavaScript-driven behavior (Book 04) that isn't form submission.

**The bug this causes:** if you place a `<button>` inside a `<form>` without specifying `type`, it defaults to `type="submit"` — meaning a button meant purely for some JavaScript action (like "toggle dark mode") will unexpectedly submit the entire form and reload/navigate the page. This single missing attribute is a genuinely common source of confusing bugs.

```html
<!-- Bug: this button submits the form unintentionally -->
<form>
  <input type="text" name="search">
  <button>🌙</button>  <!-- meant for a JS dark-mode toggle, but defaults to submit! -->
</form>

<!-- Fixed -->
<form>
  <input type="text" name="search">
  <button type="button">🌙</button>
</form>
```

---

# `<button>` vs. `<input type="submit">`

```html
<input type="submit" value="Submit">
<button type="submit">Submit</button>
```

Both submit the form. The key difference: `<input>` is void and can only display plain text (via `value`); `<button>` can contain rich content — an icon plus text, for example:

```html
<button type="submit">
  <img src="check-icon.svg" alt="" width="16" height="16"> Submit
</button>
```

For this flexibility, `<button>` is generally the more common modern choice.

---

# Disabling a Button

```html
<button type="submit" disabled>Submit</button>
```

`disabled` (a boolean attribute, Module 01 Lesson 03) prevents interaction and visually greys out the button — commonly toggled dynamically with JavaScript (e.g., disabling submit until required fields are filled), a pattern you'll build in Book 04.

---

# Practical Example

```html
<form action="/search" method="GET">
  <input type="search" name="q" placeholder="Search...">
  <button type="submit">Search</button>
  <button type="reset">Clear</button>
</form>

<button type="button" onclick="alert('Not a form action!')">Just a Button</button>
```

---

# Revision Questions

1. What does `<button>` default to when `type` is not specified?
2. What real bug can occur from forgetting `type="button"` on a non-submit button inside a form?
3. What can `<button>` contain that `<input type="submit">` cannot?

<details><summary>Answers</summary>

1. `type="submit"`.
2. It will unexpectedly submit the form (and potentially reload/navigate the page) when clicked, even if it was only meant to trigger some unrelated JavaScript behavior.
3. Rich content — icons, images, nested elements — rather than being limited to plain text via a `value` attribute.

</details>
