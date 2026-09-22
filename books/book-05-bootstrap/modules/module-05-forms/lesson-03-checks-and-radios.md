# Lesson 03: Checks and Radios

## Learning Objectives
- Apply `.form-check`, `.form-check-input`, and `.form-check-label` correctly together
- Use the `.form-switch` variant for toggle-style checkboxes
- Group radio buttons correctly using a shared `name` attribute
- Use inline layout (`.form-check-inline`) for horizontal groups
- Recognize the `.form-check-reverse` layout order

## Introduction
Checkboxes and radio buttons need a different structural pattern than the fields in Lessons 01–02, because a checkbox/radio and its label sit side by side rather than label-above-field. Bootstrap wraps both in a `.form-check` container to get the spacing and alignment right.

## The Base Pattern
```html
<div class="form-check">
  <input class="form-check-input" type="checkbox" id="terms">
  <label class="form-check-label" for="terms">
    I agree to the terms and conditions
  </label>
</div>
```

Three classes, three jobs:
- `.form-check` on the wrapping `<div>` — handles spacing/positioning
- `.form-check-input` on the `<input>` — styles the checkbox/radio itself
- `.form-check-label` on the `<label>` — aligns the label text with the input

Just like Lesson 01, the `for`/`id` pairing is mandatory for accessibility and click-to-toggle behavior — this pattern doesn't change just because the control looks different.

## Radio Button Groups
Radios only behave as a mutually-exclusive group when they share the same `name` attribute — this is native HTML behavior, not something Bootstrap adds:

```html
<div class="form-check">
  <input class="form-check-input" type="radio" name="plan" id="planBasic" value="basic">
  <label class="form-check-label" for="planBasic">Basic</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="plan" id="planPro" value="pro">
  <label class="form-check-label" for="planPro">Pro</label>
</div>
```

Forgetting to give radios in the same group the same `name` is one of the most common form bugs — without it, every radio behaves independently and users can select multiple "mutually exclusive" options at once.

## Switches
`.form-switch` turns a checkbox into an iOS-style toggle switch — purely visual, the underlying behavior is still a checkbox:

```html
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="notifications">
  <label class="form-check-label" for="notifications">Enable notifications</label>
</div>
```

The `role="switch"` attribute is recommended alongside `.form-switch` so assistive technology announces it as a toggle rather than a plain checkbox.

## Inline Layout
By default, each `.form-check` stacks vertically. Add `.form-check-inline` to lay a group out horizontally:

```html
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="size" id="sizeS" value="s">
  <label class="form-check-label" for="sizeS">S</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="size" id="sizeM" value="m">
  <label class="form-check-label" for="sizeM">M</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="size" id="sizeL" value="l">
  <label class="form-check-label" for="sizeL">L</label>
</div>
```

## Reverse Layout
`.form-check-reverse` swaps the visual order so the label sits before the input rather than after — useful for right-aligned layouts:

```html
<div class="form-check form-check-reverse">
  <input class="form-check-input" type="checkbox" id="reverseExample">
  <label class="form-check-label" for="reverseExample">Label appears first</label>
</div>
```

## Practical Example
A settings panel combining a switch, an inline radio group, and a standard checkbox:

```html
<form>
  <div class="form-check form-switch mb-3">
    <input class="form-check-input" type="checkbox" role="switch" id="darkMode">
    <label class="form-check-label" for="darkMode">Dark mode</label>
  </div>

  <p class="mb-1">Preferred contact method</p>
  <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="contact" id="contactEmail">
    <label class="form-check-label" for="contactEmail">Email</label>
  </div>
  <div class="form-check form-check-inline mb-3">
    <input class="form-check-input" type="radio" name="contact" id="contactSms">
    <label class="form-check-label" for="contactSms">SMS</label>
  </div>

  <div class="form-check">
    <input class="form-check-input" type="checkbox" id="newsletter">
    <label class="form-check-label" for="newsletter">Subscribe to newsletter</label>
  </div>
</form>
```

## Revision Questions

<details>
<summary>1. What three classes make up the standard checkbox/radio pattern, and what does each style?</summary>
`.form-check` (wrapper spacing), `.form-check-input` (the checkbox/radio itself), `.form-check-label` (the label text alignment).
</details>

<details>
<summary>2. What makes a group of radio buttons mutually exclusive?</summary>
Sharing the same `name` attribute — this is native HTML radio group behavior, not something Bootstrap adds.
</details>

<details>
<summary>3. Is `.form-switch` a behaviorally different input, or purely visual?</summary>
Purely visual — it's still a checkbox underneath; `.form-switch` just restyles it to look like a toggle. `role="switch"` should be added so assistive tech announces it correctly.
</details>

<details>
<summary>4. What does `.form-check-reverse` change?</summary>
It swaps the visual order of the label and input so the label appears before (to the left of) the checkbox/radio instead of after it.
</details>
