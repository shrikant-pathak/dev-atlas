# Lesson 01: Buttons

## Learning Objectives
- Apply `.btn` with theme color variants (`.btn-primary`, `.btn-danger`, etc.)
- Use outline button variants (`.btn-outline-*`)
- Apply size variants (`.btn-sm`, `.btn-lg`) and block-level buttons
- Understand disabled vs. active button states
- Render a `<button>`, `<a>`, and `<input>` as visually identical buttons

## Introduction
This module shifts from form-specific controls (Module 05) to general-purpose UI components you'll use across every kind of page — starting with the single most-used interactive element on the web: the button. Everything here builds directly on the theme color system from Module 04.

## Base Button Classes
Every button starts with `.btn`, then a color variant:

```html
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>
<button type="button" class="btn btn-link">Link-styled</button>
```

Every one of these color names is exactly the eight-color palette from Module 04, Lesson 01 — buttons don't introduce new colors, they just apply the same semantic system to a new component.

## Outline Buttons
Swap the solid fill for a bordered, transparent-background version by inserting `-outline`:

```html
<button type="button" class="btn btn-outline-primary">Outline Primary</button>
<button type="button" class="btn btn-outline-danger">Outline Danger</button>
```

Outline buttons are commonly used for secondary actions on a page, reserving the solid variant for the single primary action — e.g. a solid "Save" button next to an outline "Cancel" button.

## Sizes
```html
<button type="button" class="btn btn-primary btn-sm">Small</button>
<button type="button" class="btn btn-primary">Default</button>
<button type="button" class="btn btn-primary btn-lg">Large</button>
```

## Block-Level Buttons
To make a button span the full width of its parent, use the sizing utilities from Module 04 rather than a dedicated button class — Bootstrap 5 dropped the old `.btn-block` class in favor of composing it from existing utilities:

```html
<button type="button" class="btn btn-primary w-100">Full-width button</button>
```

## Disabled and Active States
```html
<button type="button" class="btn btn-primary" disabled>Disabled</button>
<button type="button" class="btn btn-primary active" aria-pressed="true">Active</button>
```

`disabled` on a real `<button>` element automatically prevents clicks and greys out the button — this is native `<button>` behavior that Bootstrap styles. The `.active` class is purely visual (a slightly darker/pressed look) and does NOT disable the button — it's meant for cases like a toggle button where you're tracking pressed state yourself, which is why `aria-pressed="true"` is added alongside it for accessibility.

## Buttons on Different Elements
`.btn` classes work identically whether applied to a `<button>`, an `<a>`, or an `<input>`:

```html
<a href="#" class="btn btn-primary" role="button">Link button</a>
<button type="button" class="btn btn-primary">Button element</button>
<input type="submit" class="btn btn-primary" value="Submit input">
```

An important accessibility note: when `.btn` is applied to an `<a>` tag, add `role="button"` so assistive technology announces it as a button rather than a link — since visually it will look and act like one (especially if it triggers JS instead of navigating), but semantically `<a>` and `<button>` behave differently by default.

## Practical Example
A card footer with a primary and secondary action, following the solid/outline convention:

```html
<div class="d-flex gap-2">
  <button type="button" class="btn btn-primary">Save changes</button>
  <button type="button" class="btn btn-outline-secondary">Cancel</button>
</div>
```

## Revision Questions

<details>
<summary>1. Where do button color variant names (`primary`, `danger`, etc.) come from?</summary>
The same eight-color theme palette introduced in Module 04, Lesson 01 — buttons apply the existing semantic color system rather than defining their own.
</details>

<details>
<summary>2. How do you make a full-width button in Bootstrap 5, given `.btn-block` was removed?</summary>
Compose it from an existing utility class, typically `.w-100` from Module 04, alongside the normal `.btn` classes.
</details>

<details>
<summary>3. What's the functional difference between `disabled` and `.active` on a button?</summary>
`disabled` is a native attribute that actually prevents clicks/focus; `.active` is a purely visual class that darkens the button's appearance without disabling it — used for toggle-style buttons where pressed state is tracked separately.
</details>

<details>
<summary>4. Why should `role="button"` be added when `.btn` is applied to an `<a>` element?</summary>
So assistive technology announces the element as a button rather than a link, since `<a>` and `<button>` have different default semantics even though `.btn` makes them look identical.
</details>
