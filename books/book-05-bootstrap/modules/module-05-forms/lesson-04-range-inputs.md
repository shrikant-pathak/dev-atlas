# Lesson 04: Range Inputs

## Learning Objectives
- Apply `.form-range` to native `<input type="range">` sliders
- Set `min`, `max`, and `step` to control slider behavior
- Understand cross-browser styling challenges `.form-range` solves
- Pair a range input with a live value display using minimal JS

## Introduction
Range sliders are less common than text fields or checkboxes, but they show up often enough in real UIs — volume controls, price filters, rating inputs — that Bootstrap gives them dedicated styling. Native range inputs are notoriously inconsistent across browsers (each browser has historically rendered the track and thumb differently), so `.form-range` earns its keep here more than almost any other form class in this module.

## Basic Range
```html
<label for="volume" class="form-label">Volume</label>
<input type="range" class="form-range" id="volume" min="0" max="100">
```

Without `.form-range`, the same `<input type="range">` would render with the browser's default styling — thin, inconsistent, and visually mismatched with the rest of a Bootstrap-styled form. With it, the track, thumb, and focus states all match your theme automatically.

## Min, Max, and Step
All three are native HTML attributes — Bootstrap doesn't add new ones:

```html
<input type="range" class="form-range" min="0" max="10" step="1" id="rating">
```

- `min` / `max` set the slider's bounds
- `step` sets the increment the thumb snaps to when dragged or moved with arrow keys — omit it and the browser defaults to `1`

For a slider that should move in larger jumps (say, price in $10 increments):

```html
<input type="range" class="form-range" min="0" max="500" step="10" id="priceFilter">
```

## Disabled State
Same pattern as every other control in this module:

```html
<input type="range" class="form-range" disabled>
```

## Showing the Current Value
Unlike a text input, a range slider's current value isn't visible by default — you have to display it yourself, typically with a small amount of JavaScript listening to the `input` event:

```html
<label for="fontSize" class="form-label">
  Font size: <span id="fontSizeValue">16</span>px
</label>
<input type="range" class="form-range" id="fontSize" min="10" max="32" value="16">

<script>
  const slider = document.getElementById('fontSize');
  const output = document.getElementById('fontSizeValue');
  slider.addEventListener('input', () => {
    output.textContent = slider.value;
  });
</script>
```

This is a direct callback to Module 04 of Book 04 (DOM, Events & Navigation) — `addEventListener` and reading `.value` off an input are exactly the DOM/event-handling skills you built there, now applied to a Bootstrap-styled control.

## Practical Example
A product configurator using two ranges with live value output:

```html
<form>
  <div class="mb-3">
    <label for="quantity" class="form-label">
      Quantity: <span id="qtyValue">1</span>
    </label>
    <input type="range" class="form-range" id="quantity" min="1" max="20" value="1">
  </div>
  <div class="mb-3">
    <label for="budget" class="form-label">
      Max budget: $<span id="budgetValue">100</span>
    </label>
    <input type="range" class="form-range" id="budget" min="0" max="1000" step="50" value="100">
  </div>
</form>

<script>
  document.getElementById('quantity').addEventListener('input', e => {
    document.getElementById('qtyValue').textContent = e.target.value;
  });
  document.getElementById('budget').addEventListener('input', e => {
    document.getElementById('budgetValue').textContent = e.target.value;
  });
</script>
```

## Revision Questions

<details>
<summary>1. Why does `.form-range` matter more for sliders than `.form-control` does for text inputs?</summary>
Native range input styling varies significantly across browsers by default, so `.form-range` does more visual normalization work — unifying track and thumb appearance — than is needed for already-fairly-consistent text inputs.
</details>

<details>
<summary>2. What does the `step` attribute control, and what's its default value?</summary>
It sets the increment the slider snaps to when moved; the default is `1` if omitted.
</details>

<details>
<summary>3. Why isn't a range slider's current value shown automatically?</summary>
The native `<input type="range">` element has no built-in visible value display — you must read `.value` via JavaScript and render it yourself, typically listening to the `input` event.
</details>

<details>
<summary>4. Which earlier module's skills does live-value display for a range slider directly depend on?</summary>
Module 04 (DOM, Events & Navigation) from Book 04 — specifically `addEventListener` and reading an input's `.value` property.
</details>
