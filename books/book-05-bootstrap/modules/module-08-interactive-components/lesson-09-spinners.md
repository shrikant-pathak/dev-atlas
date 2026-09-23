# Lesson 09: Spinners

## Learning Objectives
- Apply `.spinner-border` and `.spinner-grow` loading indicators
- Apply theme colors and size variants to spinners
- Add visually-hidden loading text for accessibility
- Combine a spinner with a disabled button to communicate an in-progress action

## Introduction
This closes out Module 08 — and the book's JS-driven component coverage — with its simplest component: a loading spinner. Unlike almost everything else in this module, spinners require no JavaScript initialization and no data attributes at all; they're pure CSS animations, making this a good deliberate change of pace to end on before Module 09 moves into utility classes and accessibility.

## Two Spinner Styles
```html
<div class="spinner-border" role="status">
  <span class="visually-hidden">Loading...</span>
</div>

<div class="spinner-grow" role="status">
  <span class="visually-hidden">Loading...</span>
</div>
```

`.spinner-border` renders a rotating ring; `.spinner-grow` renders a pulsing, growing/shrinking dot. Both are purely visual/stylistic choices with identical accessibility requirements.

## Why `role="status"` and the Hidden Text Are Both Required
A spinner conveys meaning entirely through animation, with no default text of its own — a screen reader has nothing to read unless you supply it. `role="status"` marks the region as a live status update (a lighter-weight cousin of the `role="alert"` + `aria-live` combination from Lesson 07's toasts, appropriate here since a loading state is informative rather than urgent), and the nested `.visually-hidden` span (from Module 05) supplies the actual announced text — visually hidden since sighted users can already see the spinning animation itself.

## Colors
Same theme color system as everywhere else in this book:

```html
<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>
<div class="spinner-border text-success" role="status"><span class="visually-hidden">Loading...</span></div>
<div class="spinner-border text-danger" role="status"><span class="visually-hidden">Loading...</span></div>
```

Notice these use `.text-{color}` rather than `.bg-{color}` — spinners are rendered using `border-color`/`currentColor` under the hood, so the text color utility is what actually controls the visible spinner color, not a background.

## Sizing
```html
<div class="spinner-border spinner-border-sm" role="status"><span class="visually-hidden">Loading...</span></div>
```

There's only a small size modifier (`-sm`) for spinners, unlike the sm/lg pattern seen elsewhere in this book — the default size is already considered the "large" option.

## Spinner Inside a Button
The most common real-world spinner use case: communicating that a button's action is currently in progress, paired with disabling the button to prevent duplicate submissions:

```html
<button class="btn btn-primary" type="button" disabled>
  <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
  <span role="status">Loading...</span>
</button>
```

Note the slightly different accessibility pattern here compared to the standalone spinner example above: since the button already has a visible text label ("Loading...") to announce, the spinner itself just needs `aria-hidden="true"` (it's now purely decorative, since the adjacent text already conveys the same information) rather than its own separate `.visually-hidden` span.

## Practical Example
A form submit button that shows a spinner and disables itself once clicked, using minimal JS:

```html
<button class="btn btn-primary" type="submit" id="submitBtn">
  Submit
</button>

<script>
  document.getElementById('submitBtn').addEventListener('click', function() {
    this.disabled = true;
    this.innerHTML = '<span class="spinner-border spinner-border-sm" aria-hidden="true"></span> <span role="status">Submitting...</span>';
  });
</script>
```

This closing example deliberately reuses the exact `addEventListener` pattern from Module 05's range input and validation lessons — a fitting bookend, since it shows that even this module's most JS-dependent components (modals, toasts) and its simplest one (a spinner) both ultimately rely on the same basic DOM/event skills from Book 04.

## Revision Questions

<details>
<summary>1. What's the visual difference between `.spinner-border` and `.spinner-grow`?</summary>
`.spinner-border` renders a rotating ring; `.spinner-grow` renders a pulsing, growing/shrinking dot — both are purely stylistic variants with identical accessibility requirements.
</details>

<details>
<summary>2. Why does a spinner need both `role="status"` and a `.visually-hidden` text span?</summary>
A spinner conveys meaning entirely through animation with no inherent text; `role="status"` marks it as a live status update for assistive technology, while the hidden span supplies the actual text to be announced, since sighted users already see the animation itself.
</details>

<details>
<summary>3. Why do spinner colors use `.text-{color}` rather than `.bg-{color}`?</summary>
Spinners are rendered using border-color/currentColor rather than a background fill, so the text color utility is what actually controls the visible spinner color.
</details>

<details>
<summary>4. Why does a spinner inside a button with visible "Loading..." text use `aria-hidden="true"` instead of its own `.visually-hidden` span?</summary>
The button's adjacent visible text already conveys the loading state, so the spinner itself becomes purely decorative at that point — `aria-hidden="true"` prevents redundant announcement of the same information twice.
</details>
