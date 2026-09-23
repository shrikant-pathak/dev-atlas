# Lesson 01: Modal

## Learning Objectives
- Build a modal dialog with `.modal`, `.modal-dialog`, `.modal-content`
- Structure header/body/footer sections
- Trigger and dismiss a modal via `data-bs-toggle`/`data-bs-dismiss`
- Apply size variants and scrollable/centered modifiers
- Understand focus trapping and why modals require careful accessibility handling

## Introduction
Modals are the most structurally nested component you've built in this book, and the first to fully demonstrate why Bootstrap's JS bundle exists at all: a modal must trap keyboard focus inside itself while open, restore focus to the trigger element on close, dim the background, and block page scroll — all behavior that would take significant custom JavaScript to build correctly and accessibly from scratch. This lesson kicks off Module 08's focus on components that depend most heavily on that bundled JS.

## Basic Structure
```html
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch modal
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Modal body content goes here.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
```

Three nested layers, each with a specific job:
- **`.modal`** — the outer, normally-hidden overlay wrapper (uses the same `.fade` transition class from alerts/tabs)
- **`.modal-dialog`** — controls the dialog's positioning and max-width on the page
- **`.modal-content`** — the actual visible bordered box; `.modal-header`, `.modal-body`, `.modal-footer` structure its content, directly paralleling `.card-header`/`.card-body`/`.card-footer` from Module 06, Lesson 05

## The Trigger/Dismiss Pattern
```html
data-bs-toggle="modal" data-bs-target="#exampleModal"
```
```html
data-bs-dismiss="modal"
```

Exactly the same convention family you've used since Module 06 (alerts), continued through Module 07 (offcanvas) — `.btn-close` and any button can dismiss a modal simply by carrying `data-bs-dismiss="modal"`.

## Why `aria-hidden` and `tabindex="-1"` Matter Here
`tabindex="-1"` on the `.modal` element itself makes it programmatically focusable (needed so Bootstrap's JS can move keyboard focus into it on open) without adding it to the normal tab order. `aria-hidden="true"` marks it as hidden from assistive technology while closed; Bootstrap's JS automatically flips this to `false`/removes it while the modal is open. This is a more involved version of the same `aria-expanded`/`aria-selected` state-syncing you've relied on since Module 07 — the difference here is that a modal, unlike a dropdown or tab, must also **trap focus**: while open, Tab and Shift+Tab cycle only through focusable elements inside the modal, and closing it returns focus to whatever triggered it. This is all handled automatically by Bootstrap's JS as long as you use the standard data-attribute pattern — no manual focus-management code needed.

## Size Variants
```html
<div class="modal-dialog modal-sm">...</div>
<div class="modal-dialog">...</div>
<div class="modal-dialog modal-lg">...</div>
<div class="modal-dialog modal-xl">...</div>
```

## Centered and Scrollable Modals
```html
<div class="modal-dialog modal-dialog-centered">...</div>
<div class="modal-dialog modal-dialog-scrollable">...</div>
```

`.modal-dialog-centered` vertically centers the dialog in the viewport instead of the default top-aligned position. `.modal-dialog-scrollable` constrains the modal body's own height and makes IT scroll internally (rather than the whole page) when content is too long to fit — important for modals with lots of text, since without it the header/footer could otherwise scroll off-screen along with the body content.

## Static Backdrop (Preventing Accidental Close)
By default, clicking outside a modal or pressing Escape closes it. For confirmation dialogs where accidental dismissal matters (e.g. "are you sure you want to delete this?"), disable that:

```html
<div class="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
```

## Practical Example
A delete-confirmation modal using static backdrop and centered positioning:

```html
<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" 
     tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="deleteModalLabel">Delete item?</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        This action cannot be undone.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What three nested layers make up a modal, and what does each control?</summary>
`.modal` (outer hidden overlay wrapper), `.modal-dialog` (positioning/max-width on the page), `.modal-content` (the actual visible bordered box holding header/body/footer).
</details>

<details>
<summary>2. What does "focus trapping" mean for a modal, and does it require manual JS to implement?</summary>
While the modal is open, Tab/Shift+Tab cycle only through focusable elements inside it rather than the whole page, and closing it returns focus to the trigger element — this is handled automatically by Bootstrap's bundled JS when using the standard data-attribute pattern, with no manual focus-management code required.
</details>

<details>
<summary>3. What does `.modal-dialog-scrollable` change, and why does it matter for long content?</summary>
It constrains the modal body's height and makes the body itself scroll internally rather than the whole page, keeping the header/footer always visible instead of letting them scroll off-screen along with long body content.
</details>

<details>
<summary>4. How do you prevent a modal from closing when the user clicks outside it or presses Escape, and when would you want that?</summary>
Set `data-bs-backdrop="static"` and `data-bs-keyboard="false"`; useful for confirmation dialogs (like a delete confirmation) where accidental dismissal could be costly.
</details>
