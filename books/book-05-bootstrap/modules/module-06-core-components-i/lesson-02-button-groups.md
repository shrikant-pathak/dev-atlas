# Lesson 02: Button Groups

## Learning Objectives
- Group related buttons with `.btn-group`
- Stack button groups vertically with `.btn-group-vertical`
- Nest a dropdown inside a button group (toolbar pattern)
- Size and space out entire groups consistently
- Use `.btn-toolbar` to combine multiple groups

## Introduction
Lesson 01 covered individual buttons. Often, though, buttons come in related clusters — pagination controls, formatting toolbars, view-mode toggles. `.btn-group` visually merges a set of buttons into one connected unit, the same joined-corners concept you saw with `.input-group` back in Module 05.

## Basic Button Group
```html
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-primary">Left</button>
  <button type="button" class="btn btn-outline-primary">Middle</button>
  <button type="button" class="btn btn-outline-primary">Right</button>
</div>
```

`role="group"` and `aria-label` are required accessibility additions — without them, assistive technology has no way to announce that these buttons are related as a single control group rather than a random cluster of standalone buttons.

## Sizing an Entire Group
Just like `.input-group-sm`/`.input-group-lg` from Module 05, size classes go on the wrapping group, not on individual buttons:

```html
<div class="btn-group btn-group-sm" role="group">
  <button type="button" class="btn btn-outline-secondary">Small</button>
  <button type="button" class="btn btn-outline-secondary">Group</button>
</div>
```

## Vertical Button Groups
Same buttons, stacked instead of side by side:

```html
<div class="btn-group-vertical" role="group" aria-label="Vertical group">
  <button type="button" class="btn btn-outline-primary">Top</button>
  <button type="button" class="btn btn-outline-primary">Middle</button>
  <button type="button" class="btn btn-outline-primary">Bottom</button>
</div>
```

## Checkbox/Radio Button Groups
A common pattern: style checkboxes or radios (Module 05, Lesson 03) as a segmented button group instead of their default look, by hiding the actual input visually while keeping it functional:

```html
<div class="btn-group" role="group">
  <input type="radio" class="btn-check" name="viewMode" id="viewGrid" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="viewGrid">Grid</label>

  <input type="radio" class="btn-check" name="viewMode" id="viewList" autocomplete="off">
  <label class="btn btn-outline-primary" for="viewList">List</label>
</div>
```

`.btn-check` visually hides the native radio while keeping it in the DOM and fully functional — the `<label>` (styled as `.btn`) is what the user actually sees and clicks, and clicking it toggles the hidden radio exactly like Module 05's `for`/`id` label pairing always has. `autocomplete="off"` prevents browsers from restoring a previously-selected state on page reload, which can otherwise get out of sync with what's visually shown.

## Toolbars
Combine multiple `.btn-group`s into one row using `.btn-toolbar`, with spacing utilities from Module 04 to separate the groups:

```html
<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with grouped buttons">
  <div class="btn-group me-2" role="group">
    <button type="button" class="btn btn-outline-secondary">1</button>
    <button type="button" class="btn btn-outline-secondary">2</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-outline-secondary">3</button>
  </div>
</div>
```

## Practical Example
A text-editor-style formatting toolbar mixing regular buttons and a segmented toggle:

```html
<div class="btn-toolbar" role="toolbar" aria-label="Formatting toolbar">
  <div class="btn-group me-2" role="group" aria-label="Text style">
    <button type="button" class="btn btn-outline-secondary"><strong>B</strong></button>
    <button type="button" class="btn btn-outline-secondary"><em>I</em></button>
    <button type="button" class="btn btn-outline-secondary"><u>U</u></button>
  </div>
  <div class="btn-group" role="group" aria-label="Alignment">
    <input type="radio" class="btn-check" name="align" id="alignLeft" autocomplete="off" checked>
    <label class="btn btn-outline-secondary" for="alignLeft">Left</label>
    <input type="radio" class="btn-check" name="align" id="alignCenter" autocomplete="off">
    <label class="btn btn-outline-secondary" for="alignCenter">Center</label>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Why is `role="group"` combined with `aria-label` required on a `.btn-group`?</summary>
Without them, assistive technology has no way to announce that the buttons form a single related group rather than an arbitrary set of standalone buttons.
</details>

<details>
<summary>2. What does `.btn-check` actually do to a radio or checkbox input?</summary>
It visually hides the native input while keeping it functional in the DOM, so a styled `.btn`-classed `<label>` becomes the visible clickable control instead, toggling the hidden input via the standard `for`/`id` pairing.
</details>

<details>
<summary>3. Where should size classes like `.btn-group-sm` be applied?</summary>
On the wrapping `.btn-group` element, not on individual buttons — consistent with how `.input-group-sm` worked in Module 05.
</details>

<details>
<summary>4. What's `.btn-toolbar` for, and what utility type is typically used to space its groups apart?</summary>
It combines multiple `.btn-group`s into a single row; spacing utilities from Module 04 (e.g. `.me-2`) are used between groups.
</details>
