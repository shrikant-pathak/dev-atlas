# Lesson 04: Forms and Validation

## Learning Objectives
By the end of this lesson, you will be able to:
- Read values from form inputs using JavaScript
- Handle the `submit` event correctly, including preventing the default page reload
- Use HTML's built-in constraint validation attributes and API
- Write custom validation logic for cases the built-in attributes can't cover

## Introduction

Forms are one of the most common places JavaScript, HTML, and CSS meet in a real page. This lesson combines selecting elements (Lesson 01) and event handling (Lesson 03) to read form input, respond to submission, and validate what the user typed before it's used or sent anywhere.

## Reading Input Values

```html
<input type="text" id="username" />
<input type="checkbox" id="subscribe" />
```

```js
const usernameInput = document.getElementById("username");
const subscribeCheckbox = document.getElementById("subscribe");

usernameInput.value;      // whatever text the user typed, as a string
subscribeCheckbox.checked; // true or false
```

Note: `.value` on a text input is always a string, even for `type="number"` — you'll often need `Number()` (Module 03, Lesson 02) to convert it before doing any math.

## Handling Form Submission

```html
<form id="signup-form">
  <input type="text" id="username" />
  <button type="submit">Sign Up</button>
</form>
```

```js
const form = document.getElementById("signup-form");

form.addEventListener("submit", event => {
  event.preventDefault(); // stops the browser's default full-page reload/navigation
  console.log(`Submitted with username: ${usernameInput.value}`);
});
```

**Always call `event.preventDefault()`** at the start of a `submit` handler if you're processing the form with JavaScript — otherwise the browser reloads the page immediately, wiping out anything your script was about to do.

## HTML's Built-In Constraint Validation

Before writing any custom JavaScript validation, it's worth knowing HTML itself already provides quite a lot, entirely via attributes (Book 02):

```html
<input type="email" required />
<input type="text" minlength="3" maxlength="20" required />
<input type="number" min="1" max="100" />
```

The browser automatically blocks submission and shows a built-in message if these constraints aren't met — no JavaScript required at all for these basic cases.

### The Constraint Validation API

JavaScript can check and interact with this same built-in validation:

```js
const emailInput = document.getElementById("email");

emailInput.checkValidity();   // true or false — does it currently satisfy all its constraints?
emailInput.validity.valid;     // same information, as a property instead of a method call
emailInput.validationMessage;  // the browser's default error message, e.g. "Please fill out this field"
```

## Custom Validation Logic

For rules the built-in attributes can't express (e.g. "password and confirmation must match"), you write your own checks, typically inside the `submit` handler:

```js
const form = document.getElementById("signup-form");
const password = document.getElementById("password");
const confirmPassword = document.getElementById("confirm-password");
const errorMessage = document.getElementById("error-message");

form.addEventListener("submit", event => {
  event.preventDefault();

  if (password.value !== confirmPassword.value) {
    errorMessage.textContent = "Passwords do not match.";
    return; // stop here — don't proceed with a "successful" submission
  }

  errorMessage.textContent = "";
  console.log("Form is valid — proceeding.");
});
```

### Custom Error Messages via `setCustomValidity()`

You can hook your own logic into the browser's native validation bubble, rather than building your own error display:

```js
confirmPassword.addEventListener("input", () => {
  if (confirmPassword.value !== password.value) {
    confirmPassword.setCustomValidity("Passwords do not match.");
  } else {
    confirmPassword.setCustomValidity(""); // clearing it is required to mark the field valid again
  }
});
```

Calling `setCustomValidity()` with any non-empty string makes the field invalid (blocking submission and showing that message via the browser's native UI); calling it with `""` clears the custom error.

## Practical Example

```js
// signup-validation.js

const form = document.getElementById("signup-form");
const username = document.getElementById("username");
const email = document.getElementById("email");
const errorBox = document.getElementById("error-box");

form.addEventListener("submit", event => {
  event.preventDefault();

  const errors = [];

  if (username.value.trim().length < 3) {
    errors.push("Username must be at least 3 characters.");
  }

  if (!email.checkValidity()) {
    errors.push("Please enter a valid email address.");
  }

  if (errors.length > 0) {
    errorBox.textContent = errors.join(" ");
    return;
  }

  errorBox.textContent = "";
  console.log("Signing up:", username.value, email.value);
});
```

## Revision Questions

<details>
<summary>1. Why should you almost always call `event.preventDefault()` in a `submit` handler?</summary>

Without it, the browser's default behavior — a full page reload/navigation — happens immediately, which would interrupt or wipe out any JavaScript processing the handler was meant to do.
</details>

<details>
<summary>2. What type of value does `.value` return on a text or number input?</summary>

Always a string — even for `type="number"` inputs, requiring explicit conversion (e.g. with `Number()`) before doing arithmetic on it.
</details>

<details>
<summary>3. What does `input.checkValidity()` return?</summary>

A boolean — `true` if the input currently satisfies all of its HTML validation constraints (like `required`, `minlength`, `type="email"`), `false` otherwise.
</details>

<details>
<summary>4. What does `setCustomValidity("some message")` do, and how do you clear it?</summary>

It marks the field as invalid, using the browser's native validation UI to display the given message and blocking form submission. It's cleared by calling `setCustomValidity("")` with an empty string, marking the field valid again.
</details>

<details>
<summary>5. Why might you still need custom JavaScript validation even when using HTML's built-in constraint attributes?</summary>

Built-in attributes can only express fairly simple, per-field rules (required, length, format). Rules that depend on comparing multiple fields together — like confirming two password fields match — require custom JavaScript logic.
</details>
