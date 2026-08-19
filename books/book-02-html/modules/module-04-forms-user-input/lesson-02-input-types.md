# Lesson 02: Input Types

## Learning Objectives
By the end of this lesson, you will be able to:
- Use the full range of HTML5 input types correctly.
- Understand why choosing the right input type improves both UX and data quality.
- Use common input attributes (`placeholder`, `required`, `name`, `value`).

---

# Introduction

The `<input>` element is genuinely one of the most versatile elements in HTML — a single tag whose behavior changes dramatically based on its `type` attribute. This lesson goes through the full practical range, since choosing the *correct* type (not just always defaulting to `type="text"`) genuinely matters for usability and data validity.

---

# The `name` Attribute: Critical, Often Forgotten

Every input intended to actually submit data needs a `name` attribute — this is the key used to identify that field's value when the form data is sent:

```html
<input type="text" name="username">
```

Without `name`, the field's value is simply not included in the submitted data at all — a genuinely common beginner bug.

---

# Common Input Types

```html
<input type="text" name="username" placeholder="Enter username">
<input type="email" name="email" placeholder="you@example.com">
<input type="password" name="password">
<input type="number" name="age" min="0" max="120">
<input type="tel" name="phone" placeholder="+1 555 123 4567">
<input type="url" name="website" placeholder="https://example.com">
<input type="search" name="query" placeholder="Search...">
```

Why type matters beyond visual appearance:
- **`type="email"`** — mobile devices show an email-optimized keyboard (with `@` easily accessible), and browsers perform basic format validation automatically (Lesson 06).
- **`type="number"`** — mobile devices show a numeric keypad; browsers prevent non-numeric characters.
- **`type="tel"`** — mobile devices show a phone-style keypad.
- **`type="password"`** — masks the entered characters visually.

---

# Date and Time Inputs

```html
<input type="date" name="birthdate">
<input type="time" name="appointment-time">
<input type="datetime-local" name="event-datetime">
<input type="month" name="expiry-month">
```

These render native date/time picker UI in supporting browsers — genuinely useful, avoiding the need to build a custom date picker from scratch for basic cases.

---

# Choice Inputs: Checkbox and Radio

```html
<!-- Checkbox: multiple selections allowed -->
<input type="checkbox" name="interests" value="html" id="interest-html">
<label for="interest-html">HTML</label>
<input type="checkbox" name="interests" value="css" id="interest-css">
<label for="interest-css">CSS</label>

<!-- Radio: only ONE selection allowed per group -->
<input type="radio" name="plan" value="free" id="plan-free">
<label for="plan-free">Free</label>
<input type="radio" name="plan" value="pro" id="plan-pro">
<label for="plan-pro">Pro</label>
```

**Critical detail:** radio buttons only behave as a mutually-exclusive group when they share the **same `name`** — different names mean each radio button acts independently, a very common beginner bug.

---

# File Upload

```html
<input type="file" name="resume" accept=".pdf,.doc,.docx">
<input type="file" name="photo" accept="image/*" multiple>
```

`accept` restricts which file types the browser's file picker suggests (not a hard security guarantee — real server-side validation is still required, a topic for later backend books). `multiple` allows selecting more than one file.

---

# Range and Color

```html
<input type="range" name="volume" min="0" max="100" value="50">
<input type="color" name="theme-color" value="#3498db">
```

Both render native, purpose-built UI — a slider and a color picker respectively.

---

# Hidden Inputs

```html
<input type="hidden" name="user-id" value="482">
```

Not rendered visibly at all, but still submitted with the form — commonly used to pass along data the server needs but the user doesn't need to see or edit directly.

---

# Practical Example

```html
<form action="/signup" method="POST">
  <input type="text" name="username" placeholder="Username" required>
  <input type="email" name="email" placeholder="Email" required>
  <input type="password" name="password" required>
  <input type="date" name="birthdate">
  <input type="checkbox" name="newsletter" value="yes" id="newsletter">
  <label for="newsletter">Subscribe to newsletter</label>
</form>
```

---

# Revision Questions

1. Why is the `name` attribute essential on form inputs?
2. What determines whether a group of radio buttons behaves as mutually exclusive?
3. Name two benefits of using `type="email"` over `type="text"` for an email field.

<details><summary>Answers</summary>

1. It's the key used to identify that field's value when the form data is submitted; without it, the field's value isn't included at all.
2. Sharing the same `name` attribute across all radio buttons in the group.
3. Mobile devices show an email-optimized keyboard, and browsers perform basic automatic format validation.

</details>
