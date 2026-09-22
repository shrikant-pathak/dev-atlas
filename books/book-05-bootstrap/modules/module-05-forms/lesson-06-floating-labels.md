# Lesson 06: Floating Labels

## Learning Objectives
- Build a floating label field using `.form-floating`
- Understand the required markup order (input before label) and why it matters
- Know which input types support floating labels and which don't
- Apply floating labels to `<select>` and `<textarea>`

## Introduction
Lesson 01 used the standard label-above-input pattern. Floating labels are an alternative style where the label starts as placeholder-like text inside the field, then animates up above it once the field has focus or content — a space-saving pattern popularized by Material Design and widely used in modern SaaS sign-up forms.

## Basic Floating Label
```html
<div class="form-floating mb-3">
  <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com">
  <label for="floatingEmail">Email address</label>
</div>
```

Two details are easy to get wrong here, and both matter:
1. **The `<input>` must come BEFORE the `<label>` in the markup**, reversed from the standard pattern in Lesson 01. This is because the floating animation is implemented with a CSS sibling selector that targets the label based on the input's state, and CSS sibling selectors only look at elements that come *after* a given element, never before it.
2. **A non-empty `placeholder` attribute is still required**, even though you won't typically see it — the browser's own placeholder behavior is what CSS hooks into to detect "is this field empty or not" via the `:placeholder-shown` pseudo-class. An empty or missing placeholder breaks the floating behavior on some browsers.

## Floating Labels on Select
```html
<div class="form-floating mb-3">
  <select class="form-select" id="floatingSelect">
    <option selected>Open this select menu</option>
    <option value="1">One</option>
    <option value="2">Two</option>
  </select>
  <label for="floatingSelect">Works with selects</label>
</div>
```

## Floating Labels on Textarea
```html
<div class="form-floating mb-3">
  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 100px"></textarea>
  <label for="floatingTextarea">Comments</label>
</div>
```

Note the inline `style="height: 100px"` — floating label textareas need an explicit height set, since the default browser textarea height doesn't leave enough room for the label animation to look right.

## What Doesn't Work Well
Floating labels aren't well-suited to every input type. Checkboxes, radios, and range inputs (Lessons 03–04) have no floating label equivalent — the pattern only makes sense for controls with a single, "typeable" content area (text-like inputs, selects, and textareas).

## Practical Example
A compact sign-up form using floating labels for its whole layout:

```html
<form>
  <div class="form-floating mb-3">
    <input type="text" class="form-control" id="floatName" placeholder="Jane Doe">
    <label for="floatName">Full name</label>
  </div>
  <div class="form-floating mb-3">
    <input type="email" class="form-control" id="floatEmail" placeholder="name@example.com">
    <label for="floatEmail">Email address</label>
  </div>
  <div class="form-floating mb-3">
    <input type="password" class="form-control" id="floatPassword" placeholder="Password">
    <label for="floatPassword">Password</label>
  </div>
</form>
```

## Revision Questions

<details>
<summary>1. Why must the `<input>` come before the `<label>` in a `.form-floating` block?</summary>
The floating animation relies on a CSS sibling selector that targets elements after the input based on its state, and sibling selectors can't look backward — so the label must come after the input in markup for the selector to reach it.
</details>

<details>
<summary>2. Why is a non-empty `placeholder` attribute still required even though it's not visually shown as a normal placeholder?</summary>
CSS uses the `:placeholder-shown` pseudo-class (which depends on the placeholder attribute existing) to detect whether the field is empty, which drives whether the label floats up or sits inside the field.
</details>

<details>
<summary>3. Why does a floating-label textarea need an explicit inline height?</summary>
The default browser textarea height doesn't leave enough vertical room for the floating label animation to display correctly, so a taller explicit height (e.g. `style="height: 100px"`) is set manually.
</details>

<details>
<summary>4. Name two input types from earlier lessons in this module that floating labels are NOT suited for.</summary>
Checkboxes/radios (Lesson 03) and range inputs (Lesson 04) — the pattern only fits single "typeable" content areas like text inputs, selects, and textareas.
</details>
