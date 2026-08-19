# Lesson 06: Form Validation Attributes

## Learning Objectives
By the end of this lesson, you will be able to:
- Use built-in HTML5 validation attributes to catch invalid input before submission.
- Understand the limits of client-side validation and why server-side validation is still required.
- Use `pattern` for custom validation rules.

---

# Introduction

This final lesson of Module 04 covers HTML's surprisingly capable built-in form validation — genuinely useful, and something many beginners don't realize exists, instead reaching immediately for JavaScript to do work HTML can already handle natively.

---

# The `required` Attribute

```html
<input type="email" name="email" required>
```

Prevents form submission until the field has a value — the browser shows a native error message and prevents the request from being sent at all if left empty.

---

# Type-Based Validation

Recall from Lesson 02: `type="email"`, `type="url"`, `type="number"` etc. automatically validate their expected format:

```html
<input type="email" name="email" required>
<!-- Browser rejects "notanemail" but accepts "user@example.com" -->
```

---

# Length and Range Constraints

```html
<input type="text" name="username" minlength="3" maxlength="20" required>
<input type="number" name="age" min="13" max="120">
<input type="password" name="password" minlength="8" required>
```

- `minlength` / `maxlength` — character count bounds for text inputs.
- `min` / `max` — value bounds for number/date/range inputs.

---

# Custom Patterns: `pattern`

For validation rules beyond the built-in types, `pattern` accepts a regular expression the value must match:

```html
<input type="text" name="zipcode" pattern="[0-9]{5}" title="Enter a 5-digit zip code">
```

(Regular expressions are covered in depth in Book 04 — for now, just know that `pattern` exists and accepts this kind of matching rule.) The `title` attribute here doubles as the tooltip explaining the expected format when validation fails.

---

# Visual and Behavioral Validation Feedback

Browsers automatically apply CSS pseudo-classes (a preview of Book 03) based on validation state, which you can style once you reach CSS:
```css
input:invalid { border-color: red; }
input:valid { border-color: green; }
```

---

# The Critical Limitation: Client-Side Validation Is Not Security

This is genuinely one of the most important concepts in this entire module. HTML5 validation happens **in the browser**, which means:

- A technically savvy user can bypass it entirely (disabling JavaScript won't even be necessary — they can submit a raw HTTP request directly, skipping the browser's form UI altogether, connecting back to Book 01's understanding of HTTP requests).
- **Client-side validation is purely a UX convenience** — catching honest mistakes early, giving instant feedback, and reducing unnecessary server round-trips for obviously invalid data.
- **Server-side validation is always required** for actual security and data integrity — never trust that data arriving at your server has actually passed the HTML validation rules you wrote, since the request could have been crafted directly, bypassing your form entirely.

You'll build proper server-side validation once you reach the backend books (Node.js, Express) later in this roadmap — but internalizing this distinction now avoids a genuinely dangerous misconception.

---

# Disabling Validation (When Appropriate)

```html
<form novalidate>
```

`novalidate` disables the browser's built-in validation for the entire form — occasionally useful when you want full custom JavaScript-driven validation instead, but should be a deliberate choice, not an accident.

---

# Practical Example

```html
<form action="/signup" method="POST">
  <label for="username">Username</label>
  <input type="text" id="username" name="username" minlength="3" maxlength="20" required>

  <label for="email">Email</label>
  <input type="email" id="email" name="email" required>

  <label for="password">Password</label>
  <input type="password" id="password" name="password" minlength="8" required>

  <label for="zip">Zip Code</label>
  <input type="text" id="zip" name="zip" pattern="[0-9]{5}" title="5-digit zip code">

  <button type="submit">Sign Up</button>
</form>
```

---

# Revision Questions

1. What does the `required` attribute do?
2. Why is client-side (HTML/browser) validation not sufficient on its own for security?
3. What does the `pattern` attribute accept, and what does `title` do alongside it?

<details><summary>Answers</summary>

1. Prevents the form from being submitted until that field has a value.
2. Because a user can bypass browser validation entirely by submitting a raw HTTP request directly, meaning the server can never trust that incoming data has actually passed those rules — server-side validation is always required for real security.
3. `pattern` accepts a regular expression the field's value must match; `title` provides the tooltip text shown to explain the expected format when validation fails.

</details>

---

# 🏁 Module 04 Checkpoint

Before moving to Module 05, you should be able to:
- [ ] Build a `<form>` with correct `action` and `method`, choosing GET vs. POST appropriately
- [ ] Use the full range of HTML5 input types purposefully, not just `type="text"` everywhere
- [ ] Properly label every input, using `<fieldset>`/`<legend>` for grouped fields
- [ ] Use `<button>` with the correct `type`, avoiding the accidental-submit bug
- [ ] Build dropdowns, textareas, and autocomplete inputs
- [ ] Apply HTML5 validation attributes, while understanding they're not a substitute for server-side validation

**Next up:** Module 05 — Tables & Structured Data
