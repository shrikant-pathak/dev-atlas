# Lesson 07: Progress Bars

## Learning Objectives
- Build a progress bar with `.progress` and `.progress-bar`
- Set width via inline style and understand why it can't be a utility class
- Apply theme colors, striping, and animation to a progress bar
- Add accessible ARIA attributes for assistive technology
- Stack multiple progress bars in one track

## Introduction
This closes out Module 06 with a component that, unlike most others in this module, requires a value that's inherently dynamic and can't be expressed as a fixed set of utility classes — progress percentage. This makes it a good lesson for understanding when Bootstrap expects you to reach for inline styles or a small amount of JS rather than a class name.

## Basic Progress Bar
```html
<div class="progress" role="progressbar" aria-label="Basic example" 
     aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar" style="width: 25%"></div>
</div>
```

Two elements, two jobs:
- **`.progress`** is the outer track/container — sets the background, rounded corners, and overall height
- **`.progress-bar`** is the actual filled portion — its width is set with an inline `style` attribute, not a utility class

This is a deliberate exception to the "always prefer utility classes" habit you've built through Modules 04–06: progress values are arbitrary and continuous (could be 1%, 47%, 83%...), so Bootstrap doesn't (and reasonably can't) ship a fixed class for every possible percentage. Inline `style="width: X%"` is the correct, intended approach here — not a shortcut or a hack.

## Accessibility Attributes
Every progress bar needs `role="progressbar"` plus three ARIA value attributes on the **outer** `.progress` element:
- `aria-valuenow` — the current value (should match the inline width percentage)
- `aria-valuemin` — the minimum (almost always `0`)
- `aria-valuemax` — the maximum (almost always `100`)

Without these, a screen reader has no way to announce progress state at all — visually sighted users can see the filled bar, but that information is entirely lost otherwise. If you update the bar's width dynamically via JavaScript, you must update `aria-valuenow` at the same time, or the accessible value will silently drift out of sync with what's visually shown.

## Colored Progress Bars
Same theme colors as everywhere else in this book:

```html
<div class="progress" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-success" style="width: 50%"></div>
</div>
<div class="progress" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-danger" style="width: 75%"></div>
</div>
```

## Striped and Animated
```html
<div class="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar progress-bar-striped" style="width: 60%"></div>
</div>
<div class="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 60%"></div>
</div>
```

`.progress-bar-striped` adds a diagonal-stripe texture; `.progress-bar-animated` additionally animates those stripes so they appear to move — commonly used for indeterminate or actively-in-progress states (a file upload in progress, for instance), as opposed to a static, completed percentage.

## Stacked Progress Bars
Multiple `.progress-bar` elements inside one `.progress` container sit side by side, useful for showing a breakdown (e.g. storage used by different file types):

```html
<div class="progress" role="progressbar" aria-label="Storage breakdown">
  <div class="progress-bar bg-primary" style="width: 30%">Docs</div>
  <div class="progress-bar bg-warning" style="width: 20%">Images</div>
  <div class="progress-bar bg-danger" style="width: 15%">Video</div>
</div>
```

## Practical Example
A file upload indicator using the animated striped pattern:

```html
<label class="form-label">Uploading report.pdf...</label>
<div class="progress" role="progressbar" aria-label="Upload progress" 
     aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" style="width: 45%">
    45%
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Why is a progress bar's fill width set with inline `style` instead of a utility class, unlike most other Bootstrap styling in this book?</summary>
Progress values are arbitrary and continuous, so there's no fixed, finite set of classes that could cover every possible percentage — inline width is the intended, correct approach for this specific case.
</details>

<details>
<summary>2. What three ARIA attributes are required on the outer `.progress` element, and what happens without them?</summary>
`aria-valuenow`, `aria-valuemin`, `aria-valuemax` — without them, screen readers have no way to announce the bar's current progress state at all, even though sighted users can see it visually.
</details>

<details>
<summary>3. What's the risk of updating a progress bar's width via JavaScript without also updating its ARIA attributes?</summary>
The accessible value (`aria-valuenow`) silently falls out of sync with the actual visual width, so screen reader users get an inaccurate progress reading even though sighted users see the correct one.
</details>

<details>
<summary>4. What's the practical difference between `.progress-bar-striped` and adding `.progress-bar-animated` on top of it?</summary>
`.progress-bar-striped` alone adds a static diagonal-stripe texture; adding `.progress-bar-animated` makes those stripes visually move, typically used to signal an actively ongoing (vs. static/completed) process.
</details>
