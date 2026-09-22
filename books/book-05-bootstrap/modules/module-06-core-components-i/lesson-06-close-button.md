# Lesson 06: Close Button

## Learning Objectives
- Apply the standalone `.btn-close` component
- Use `.btn-close-white` for dark backgrounds
- Understand `data-bs-dismiss` as a general dismissal mechanism, not just for alerts
- Recognize accessibility requirements for icon-only buttons

## Introduction
Lesson 04 used `.btn-close` briefly to dismiss an alert. This lesson looks at the component properly on its own, since it's reused across nearly every dismissible Bootstrap component you'll encounter from here forward — not just alerts, but modals, toasts, and offcanvas panels later in the curriculum.

## The Basic Close Button
```html
<button type="button" class="btn-close" aria-label="Close"></button>
```

Notice there's no visible text — `.btn-close` renders as a small "×"-style icon using a background image, with no text content in the button at all. This makes `aria-label="Close"` mandatory, not optional: without it, a screen reader has literally nothing to announce for this button, since there's no text content for it to read.

## On Dark Backgrounds
The default close button icon is dark-colored and becomes hard to see against a dark background. `.btn-close-white` inverts it:

```html
<div class="bg-dark p-3">
  <button type="button" class="btn-close btn-close-white" aria-label="Close"></button>
</div>
```

This directly parallels the light/dark text pairing problem from Module 04, Lesson 01 (`bg-dark` needing `text-white`) — the close button has the exact same contrast problem, just solved with a dedicated modifier class instead of a text utility, since there's no text color to swap here.

## `data-bs-dismiss` Beyond Alerts
Lesson 04 introduced `data-bs-dismiss="alert"`. The same data attribute pattern works for other dismissible components by changing the target value — for example `data-bs-dismiss="toast"` or `data-bs-dismiss="modal"`, both of which you'll build with fully in later modules. The important concept here is that `.btn-close` itself doesn't know or care what it's dismissing — the `data-bs-dismiss` value tells Bootstrap's JS which type of parent component to look for and close.

## Practical Example
A reusable notification banner pattern using the close button on both light and dark variants:

```html
<div class="alert alert-info alert-dismissible fade show" role="alert">
  New feature available — check out the updated dashboard.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<div class="bg-dark text-white p-3 d-flex justify-content-between align-items-center rounded">
  <span>Dark-themed banner message</span>
  <button type="button" class="btn-close btn-close-white" aria-label="Close"></button>
</div>
```

## Revision Questions

<details>
<summary>1. Why is `aria-label="Close"` mandatory on `.btn-close`, not just good practice?</summary>
The button has no visible text content at all — only a background-image icon — so without an aria-label, screen readers have nothing to announce for it whatsoever.
</details>

<details>
<summary>2. What problem does `.btn-close-white` solve, and what earlier lesson's problem does it parallel?</summary>
It inverts the close icon's color so it's visible against dark backgrounds, directly paralleling the `bg-dark` + `text-white` pairing requirement from Module 04, Lesson 01 — same contrast problem, different mechanism since there's no text color to swap.
</details>

<details>
<summary>3. Does `.btn-close` know what component it's dismissing on its own?</summary>
No — the `data-bs-dismiss` attribute's value (e.g. `"alert"`, `"toast"`, `"modal"`) tells Bootstrap's JavaScript which type of parent component to find and close; the button class itself is purely visual/generic.
</details>

<details>
<summary>4. Name two Bootstrap components, beyond alerts, that reuse the `.btn-close` + `data-bs-dismiss` pattern.</summary>
Toasts and modals (also offcanvas panels) — all covered in later modules, all reusing this same dismiss mechanism.
</details>
