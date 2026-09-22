# Lesson 02: Select Menus

## Learning Objectives
- Apply `.form-select` to native `<select>` dropdowns
- Use size variants and the `multiple` attribute
- Group options with `<optgroup>`
- Understand what Bootstrap does — and doesn't — style on native selects

## Introduction
Dropdowns are the second most common form control after text inputs. Bootstrap styles the native HTML `<select>` element directly rather than replacing it with a custom widget — this keeps full native accessibility and keyboard behavior intact (arrow keys, type-to-search, screen reader support) while still matching the rest of your form's visual language from Lesson 01.

## Basic Select
```html
<div class="mb-3">
  <label for="country" class="form-label">Country</label>
  <select class="form-select" id="country">
    <option selected>Choose...</option>
    <option value="us">United States</option>
    <option value="ca">Canada</option>
    <option value="mx">Mexico</option>
  </select>
</div>
```

`.form-select` adds the same border, padding, and focus treatment as `.form-control`, plus a custom-styled dropdown arrow icon (since the native arrow can't be styled consistently across browsers).

## Size Variants
Same pattern as `.form-control`:

```html
<select class="form-select form-select-sm">...</select>
<select class="form-select">...</select>
<select class="form-select form-select-lg">...</select>
```

## Multiple Selection
The native `multiple` attribute works exactly as it does in plain HTML — Bootstrap doesn't need a different class for it, since the browser renders a multi-select listbox instead of a dropdown automatically:

```html
<select class="form-select" multiple size="4">
  <option value="js">JavaScript</option>
  <option value="ts">TypeScript</option>
  <option value="py">Python</option>
  <option value="go">Go</option>
</select>
```

The `size` attribute here controls how many options are visible at once without scrolling — this is standard HTML, not Bootstrap-specific.

## Grouping Options
`<optgroup>` is native HTML for organizing long option lists into labeled sections, and Bootstrap's styling carries through automatically:

```html
<select class="form-select">
  <optgroup label="Frontend">
    <option value="react">React</option>
    <option value="vue">Vue</option>
  </optgroup>
  <optgroup label="Backend">
    <option value="node">Node.js</option>
    <option value="django">Django</option>
  </optgroup>
</select>
```

## What Bootstrap Doesn't Change
It's worth being explicit about the limits here: Bootstrap does NOT restyle the dropdown's open/expanded option list itself — that's rendered by the browser/OS and is largely outside CSS's reach for native `<select>` elements. If you need a fully custom-styled dropdown (custom option hover colors, icons inside options, etc.), you'd reach for a JS-driven component instead — something you'll encounter conceptually in Module 08 (Interactive Components) or, more fully, when you get to React/component libraries later in the curriculum. For most standard forms, though, native `.form-select` covers the need with zero extra JS and full accessibility for free.

## Practical Example
A shipping form section using single and multi-select together:

```html
<div class="mb-3">
  <label for="shipTo" class="form-label">Ship to</label>
  <select class="form-select" id="shipTo">
    <optgroup label="Domestic">
      <option>United States</option>
      <option>Canada</option>
    </optgroup>
    <optgroup label="International">
      <option>United Kingdom</option>
      <option>Australia</option>
    </optgroup>
  </select>
</div>
<div class="mb-3">
  <label for="addons" class="form-label">Add-ons (select all that apply)</label>
  <select class="form-select" id="addons" multiple size="3">
    <option>Gift wrap</option>
    <option>Extended warranty</option>
    <option>Express shipping</option>
  </select>
</div>
```

## Revision Questions

<details>
<summary>1. Why does Bootstrap style the native `<select>` element rather than building a custom dropdown widget?</summary>
It preserves native keyboard behavior, type-to-search, and screen reader accessibility, while still visually matching the rest of the form — without needing any JavaScript.
</details>

<details>
<summary>2. What does the `size` attribute do on a `<select multiple>`?</summary>
It's a native HTML attribute that sets how many options are visible at once before scrolling is needed — unrelated to Bootstrap's `.form-select-sm`/`.form-select-lg` size variants.
</details>

<details>
<summary>3. What is `<optgroup>` used for, and is it Bootstrap-specific?</summary>
It groups related `<option>` elements under a labeled heading inside a select — it's native HTML, and Bootstrap's styling simply carries through automatically without a special class.
</details>

<details>
<summary>4. What visual part of a `<select>` can Bootstrap NOT restyle?</summary>
The expanded/open option list itself is rendered by the browser or OS, so its appearance (hover colors, spacing) is largely outside CSS's control for native selects.
</details>
