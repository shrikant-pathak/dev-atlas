# Lesson 08: Form Validation

## Learning Objectives
- Apply `.is-valid` / `.is-invalid` and `.valid-feedback` / `.invalid-feedback`
- Use Bootstrap's `.needs-validation` + Constraint Validation API pattern for custom client-side validation
- Understand how validation styling ties back to the theme colors from Module 04
- Know the difference between browser-native validation UI and Bootstrap's styled validation

## Introduction
This lesson closes out Module 05 by tying together nearly everything you've learned in this book so far: the `success`/`danger` theme colors from Module 04, the form controls from Lessons 01–07, and — full circle back to Module 04 of Book 04 — the DOM/JavaScript skills needed to hook validation logic up to real form submission behavior.

## Static Validation States
The simplest approach: manually add `.is-valid` or `.is-invalid` to a control, plus a matching feedback message:

```html
<div class="mb-3">
  <label for="username" class="form-label">Username</label>
  <input type="text" class="form-control is-invalid" id="username" value="bad username!">
  <div class="invalid-feedback">
    Username can only contain letters, numbers, and underscores.
  </div>
</div>

<div class="mb-3">
  <label for="email" class="form-label">Email</label>
  <input type="email" class="form-control is-valid" id="email" value="jane@example.com">
  <div class="valid-feedback">
    Looks good!
  </div>
</div>
```

Notice `.invalid-feedback` and `.valid-feedback` are colored using exactly the `danger` and `success` theme colors from Module 04, Lesson 01 — validation styling isn't a separate color system, it's the same semantic palette applied to a new context. The feedback `<div>` is hidden by default and only becomes visible (`display: block`) when its sibling input carries the matching `.is-valid`/`.is-invalid` class — another CSS sibling-selector relationship, same underlying mechanism as the floating labels in Lesson 06.

## Real Client-Side Validation: the `.needs-validation` Pattern
Static classes are fine for demos, but real forms need validation applied dynamically based on actual user input. Bootstrap's documented pattern combines the browser's built-in **Constraint Validation API** with a small snippet of JavaScript:

```html
<form class="needs-validation" novalidate>
  <div class="mb-3">
    <label for="reqEmail" class="form-label">Email</label>
    <input type="email" class="form-control" id="reqEmail" required>
    <div class="invalid-feedback">
      Please enter a valid email address.
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Submit</button>
</form>

<script>
  const forms = document.querySelectorAll('.needs-validation');

  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
</script>
```

Breaking down what's happening:
- **`novalidate`** on the `<form>` disables the browser's own default validation popups, so Bootstrap's styled feedback can take over instead.
- **`required`** and other native constraint attributes (`pattern`, `minlength`, `type="email"`, etc.) still do the actual validation work — Bootstrap doesn't reimplement validation logic, it only restyles the result.
- **`form.checkValidity()`** is a native browser method (part of the Constraint Validation API) that returns `true`/`false` based on whether every constrained field currently passes its rules.
- **`.was-validated`**, once added to the `<form>`, is the class that actually activates the `.is-valid`/`.is-invalid` styling on every field based on its current native validity — this is why validation styling doesn't appear until after a submit attempt, matching how most real-world forms behave (don't shame the user before they've tried).

This is the same `addEventListener` pattern from Lesson 04's range input example, now applied to `submit` instead of `input`, and reading `checkValidity()` instead of `.value`.

## Practical Example
A required signup form using the full validation pattern:

```html
<form class="needs-validation" novalidate>
  <div class="mb-3">
    <label for="valName" class="form-label">Full name</label>
    <input type="text" class="form-control" id="valName" required>
    <div class="invalid-feedback">Please enter your name.</div>
  </div>
  <div class="mb-3">
    <label for="valEmail" class="form-label">Email</label>
    <input type="email" class="form-control" id="valEmail" required>
    <div class="invalid-feedback">Please enter a valid email.</div>
  </div>
  <div class="form-check mb-3">
    <input class="form-check-input" type="checkbox" id="valTerms" required>
    <label class="form-check-label" for="valTerms">I agree to the terms</label>
    <div class="invalid-feedback">You must agree before submitting.</div>
  </div>
  <button class="btn btn-primary" type="submit">Sign up</button>
</form>

<script>
  const form = document.querySelector('.needs-validation');
  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    }
    form.classList.add('was-validated');
  }, false);
</script>
```

## Revision Questions

<details>
<summary>1. What theme colors do `.valid-feedback` and `.invalid-feedback` use, and where were those colors originally introduced?</summary>
`success` and `danger`, respectively — the same eight-color theme palette introduced in Module 04, Lesson 01.
</details>

<details>
<summary>2. What does `novalidate` on the `<form>` element do, and why is it needed for Bootstrap's styled validation?</summary>
It disables the browser's own default validation popup UI, allowing Bootstrap's custom `.is-valid`/`.is-invalid` styled feedback to be shown instead, driven by JavaScript rather than the browser's native tooltip.
</details>

<details>
<summary>3. What native browser method does the validation script call to check whether a form currently passes its constraints?</summary>
`form.checkValidity()`, part of the browser's built-in Constraint Validation API.
</details>

<details>
<summary>4. Why doesn't validation styling appear on page load, only after a submit attempt?</summary>
Because `.was-validated` — the class that activates `.is-valid`/`.is-invalid` styling — is only added to the form inside the `submit` event handler, so nothing is styled as valid or invalid until the user has actually attempted to submit.
</details>
