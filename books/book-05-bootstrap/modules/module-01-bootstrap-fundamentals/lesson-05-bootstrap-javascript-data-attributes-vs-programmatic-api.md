# Bootstrap's JavaScript: Data Attributes vs Programmatic API

## Learning Objectives
- Trigger a Bootstrap component using `data-bs-*` attributes with zero JavaScript
- Initialize and control a component programmatically using the global `bootstrap` object
- Understand Bootstrap's JS event system for hooking into component lifecycle events
- Decide when to use each approach

## Introduction

Every interactive Bootstrap component — modals, dropdowns, tooltips, collapses, carousels, and more — can be controlled in one of **two ways**. This lesson covers both, since you'll use each throughout the rest of this book depending on the situation.

## Approach 1 — Data Attributes (No JS Required)

Bootstrap components can be wired up entirely through HTML `data-bs-*` attributes. This is the fastest way to add interactivity and requires no JavaScript code from you at all.

```html
<!-- A button that opens a modal, purely via data attributes -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Open Modal
</button>

<div class="modal" id="exampleModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        This modal was opened without writing a single line of JavaScript.
      </div>
    </div>
  </div>
</div>
```

Here, `data-bs-toggle="modal"` tells Bootstrap's JS bundle (already loaded from Module 1's earlier lessons) *what kind* of component to control, and `data-bs-target="#exampleModal"` tells it *which element* to control.

**Note the `bs-` prefix** — every Bootstrap data attribute is namespaced with `bs-` (e.g. `data-bs-toggle`, `data-bs-target`, `data-bs-dismiss`) specifically to avoid colliding with your own custom `data-*` attributes or those used by other libraries.

## Approach 2 — Programmatic API (JavaScript)

Some situations need more control than a data attribute can offer — for example, triggering a tooltip on page load (as you saw in Lesson 2) rather than waiting for a user hover, or opening a modal in response to some other JS logic (like a successful form submission from Book 04's async lessons).

Every Bootstrap component is exposed as a JavaScript class on the global `bootstrap` object:

```js
// Programmatically create and show a modal
const modalEl = document.getElementById('exampleModal');
const modal = new bootstrap.Modal(modalEl);
modal.show();

// Later, hide it
modal.hide();
```

Notice this is standard DOM API work from Book 04 (Module 04) — `document.getElementById`, then handing that element to a Bootstrap constructor.

## Why Some Components Need Manual Initialization

Not all components auto-initialize the same way. **Tooltips and popovers explicitly require manual JavaScript initialization** — Bootstrap does this intentionally for performance, since a page could contain hundreds of elements and Bootstrap doesn't want to scan and activate every one of them automatically.

```js
// Required for every tooltip on the page
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
tooltipTriggerList.forEach(el => new bootstrap.Tooltip(el));
```

Modals, dropdowns, collapses, and offcanvas panels, by contrast, work automatically via data attributes with no manual JS needed — the framework listens for clicks on any element with the right `data-bs-toggle` attribute.

## Bootstrap's Component Events

Every component fires custom events at points in its lifecycle — before it shows, after it shows, before it hides, after it hides. This lets you hook custom logic (like fetching fresh data, or Book 04's fetch API) into a component's behavior:

```js
const modalEl = document.getElementById('exampleModal');

modalEl.addEventListener('shown.bs.modal', () => {
  console.log('Modal is now fully visible');
});

modalEl.addEventListener('hidden.bs.modal', () => {
  console.log('Modal has finished closing');
});
```

This is the same `addEventListener` pattern from Book 04's DOM Events module — Bootstrap just defines its own custom event names (always namespaced with `.bs.<component>`).

## Data Attributes vs Programmatic API — When to Use Which

| Situation | Use |
|---|---|
| Simple "click this button to open that modal" | Data attributes |
| Need to open/close a component in response to other JS logic | Programmatic API |
| Tooltips or popovers anywhere on the page | Programmatic API (required) |
| Need to hook into show/hide lifecycle events | Programmatic API + event listeners |

## Practical Example

Combining both approaches — a button using data attributes to open a modal, plus JS listening for when it's shown:

```html
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#welcomeModal">
  Show Welcome
</button>

<div class="modal" id="welcomeModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">Welcome to the site!</div>
    </div>
  </div>
</div>

<script>
  document.getElementById('welcomeModal')
    .addEventListener('shown.bs.modal', () => {
      console.log('Welcome modal is now visible — good time to focus the first input, log an analytics event, etc.');
    });
</script>
```

## Revision Questions

<details>
<summary>1. What is the purpose of the "bs-" prefix on Bootstrap's data attributes?</summary>
It namespaces Bootstrap's attributes (e.g. data-bs-toggle, data-bs-target) so they don't collide with your own custom data attributes or those from other libraries.
</details>

<details>
<summary>2. Which two components explicitly require manual JavaScript initialization, and why?</summary>
Tooltips and popovers — Bootstrap doesn't auto-initialize them for performance reasons, since a page could contain a large number of potential trigger elements.
</details>

<details>
<summary>3. How would you hook custom logic into the moment a modal finishes closing?</summary>
Add an event listener for the 'hidden.bs.modal' custom event on the modal element, using the same addEventListener pattern learned in Book 04.
</details>
