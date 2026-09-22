# Lesson 01: Form Controls

## Learning Objectives
- Apply `.form-control` to text-based inputs and textareas
- Use size variants (`.form-control-sm`, `.form-control-lg`)
- Understand `.form-label` and how Bootstrap structures a labeled field
- Apply `.form-text` for helper/description text below a field
- Recognize disabled and readonly states and their utility classes

## Introduction
Module 04 gave you the visual vocabulary — colors, borders, spacing, sizing. This module puts that vocabulary to work on the most interaction-heavy part of any site: forms. Lesson 01 starts with the foundation every other lesson in this module builds on — the humble text input — and how Bootstrap standardizes its appearance and spacing without you writing any custom CSS.

## The `.form-control` Class
Any single-line text input, textarea, or similar control gets the base styling class:

```html
<div class="mb-3">
  <label for="username" class="form-label">Username</label>
  <input type="text" class="form-control" id="username" placeholder="Enter username">
</div>
```

`.form-control` applies consistent padding, border, border-radius, and focus styling — using the border and rounding utilities you already know from Module 04 under the hood. Notice the `for`/`id` pairing between `<label>` and `<input>`: this isn't just a Bootstrap convention, it's an accessibility requirement — screen readers rely on this association to announce which label belongs to which field, and clicking the label text focuses the input.

## Textareas
The same class works on multi-line inputs:

```html
<div class="mb-3">
  <label for="bio" class="form-label">Bio</label>
  <textarea class="form-control" id="bio" rows="3"></textarea>
</div>
```

The `rows` attribute is plain HTML, not Bootstrap — it sets the visible height in text lines, same as it always has.

## Size Variants
Just like buttons and other components, form controls accept size modifiers:

```html
<input type="text" class="form-control form-control-sm" placeholder="Small input">
<input type="text" class="form-control" placeholder="Default size">
<input type="text" class="form-control form-control-lg" placeholder="Large input">
```

There's no `form-control-md` — the unmodified `.form-control` already *is* the medium/default size.

## Helper Text
`.form-text` renders muted, smaller-sized text below a field to explain what's expected:

```html
<div class="mb-3">
  <label for="password" class="form-label">Password</label>
  <input type="password" class="form-control" id="password">
  <div class="form-text">Must be at least 8 characters.</div>
</div>
```

Under the hood `.form-text` behaves similarly to `.text-body-secondary` from Module 04 — dimmed, de-emphasized text — but sized specifically to sit comfortably below a form field.

## Disabled and Readonly States
Both are native HTML attributes; Bootstrap styles them automatically once `.form-control` is applied:

```html
<input type="text" class="form-control" value="Can't touch this" disabled>
<input type="text" class="form-control" value="Look but don't edit" readonly>
```

`disabled` fields are excluded from form submission and can't be focused or edited. `readonly` fields can be focused and their value can be copied, but not edited, and — unlike `disabled` — they're still submitted with the form.

## Practical Example
A basic contact field group combining everything from this lesson:

```html
<form>
  <div class="mb-3">
    <label for="fullName" class="form-label">Full Name</label>
    <input type="text" class="form-control" id="fullName" placeholder="Jane Doe">
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">Email address</label>
    <input type="email" class="form-control" id="email" placeholder="name@example.com">
    <div class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="message" class="form-label">Message</label>
    <textarea class="form-control" id="message" rows="4"></textarea>
  </div>
</form>
```

## Revision Questions

<details>
<summary>1. Why does the `for` attribute on `<label>` need to match the input's `id`?</summary>
It creates a programmatic association screen readers use to announce which label belongs to which field, and it lets users click the label to focus the input — both accessibility requirements, not just visual convention.
</details>

<details>
<summary>2. What are the two size variant classes for `.form-control`, and what represents the "medium" size?</summary>
`.form-control-sm` and `.form-control-lg`. There's no "medium" class — the unmodified `.form-control` is already the default/medium size.
</details>

<details>
<summary>3. What's the difference between `disabled` and `readonly` on a form control?</summary>
`disabled` fields can't be focused, edited, or submitted with the form. `readonly` fields can be focused and copied but not edited, and they ARE still submitted with the form.
</details>

<details>
<summary>4. What does `.form-text` visually resemble from Module 04's utilities?</summary>
It behaves like a de-emphasized, muted text style similar to `.text-body-secondary`, but sized specifically for helper text placed under a form field.
</details>
