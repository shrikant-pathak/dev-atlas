# Lesson 07: Toasts

## Learning Objectives
- Build a toast notification with `.toast`, `.toast-header`, `.toast-body`
- Initialize and show a toast via JavaScript (unlike most components, toasts aren't shown by data attributes alone)
- Control autohide behavior and delay
- Stack multiple toasts using `.toast-container`
- Understand `aria-live` and why toasts need it

## Introduction
Toasts are small, non-blocking notification messages — "Message sent," "File uploaded," "Connection lost" — that appear briefly, usually in a page corner, without interrupting whatever the user is doing (unlike a modal, which demands full attention). This lesson also introduces your first real use of `aria-live`, a distinct accessibility mechanism from anything covered so far in this book.

## Basic Structure
```html
<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="me-auto">Notification</strong>
    <small class="text-body-secondary">Just now</small>
    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    Your file has been uploaded successfully.
  </div>
</div>
```

Familiar pieces reappear here: `.btn-close` + `data-bs-dismiss="toast"` (same generic dismiss pattern from Module 06 Lesson 06, Module 07's offcanvas, and this module's modal), `.me-auto` pushing the timestamp to the right (Module 04's spacing utilities), and `role="alert"` echoing the same requirement from Module 06's alert component.

## Why `aria-live` Matters Here Specifically
Every other component in this book so far only needs accessibility attention when a user directly interacts with it (clicking a toggle, tabbing to a field). A toast is different: it can appear **without any user action at all** — triggered by a background event like a completed upload or an incoming message. `aria-live="assertive"` (or the gentler `"polite"`) tells screen readers to announce new content automatically, the moment it appears in the DOM, regardless of where the user's focus currently is. `aria-atomic="true"` ensures the entire toast content is read as one unit rather than only the specific part that changed.

## Toasts Require JavaScript to Show
Unlike almost every prior component, a toast is NOT displayed via a data-attribute trigger alone — you must call `.show()` on it through JavaScript, typically because toasts are meant to be triggered by application events (a form submission completing, a websocket message arriving) rather than a direct user click on a toggle button:

```html
<script>
  const toastElement = document.getElementById('myToast');
  const toast = new bootstrap.Toast(toastElement);
  toast.show();
</script>
```

## Autohide and Delay
By default, toasts autohide after a delay. Control this with data attributes on the `.toast` element itself:

```html
<div class="toast" data-bs-autohide="true" data-bs-delay="3000">
```

Set `data-bs-autohide="false"` for a toast that should persist until the user manually dismisses it — appropriate for more important messages (an error, say) versus a routine success confirmation.

## Stacking Multiple Toasts
`.toast-container` positions and stacks multiple toasts consistently, typically fixed to a screen corner:

```html
<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">Success</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">Changes saved.</div>
  </div>
</div>
```

`.position-fixed .bottom-0 .end-0` is a straightforward positioning-utility combination — fixed to the viewport, pinned to the bottom-right corner — no toast-specific positioning class is needed beyond the container itself.

## Practical Example
A save-confirmation toast triggered programmatically after a (simulated) form save:

```html
<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="saveToast" class="toast" role="alert" aria-live="polite" aria-atomic="true" 
       data-bs-delay="4000">
    <div class="toast-header">
      <strong class="me-auto text-success">Saved</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">Your profile changes were saved.</div>
  </div>
</div>

<script>
  function showSaveToast() {
    const toastEl = document.getElementById('saveToast');
    const toast = new bootstrap.Toast(toastEl);
    toast.show();
  }
</script>
```

## Revision Questions

<details>
<summary>1. Why do toasts need `aria-live`, when most other components in this book don't?</summary>
Toasts can appear without any direct user interaction (triggered by a background event), so `aria-live` tells screen readers to automatically announce the new content the moment it appears, regardless of where the user's focus currently is.
</details>

<details>
<summary>2. What does `aria-atomic="true"` do?</summary>
It ensures the entire toast's content is read as one complete unit by assistive technology, rather than only announcing the specific part that changed.
</details>

<details>
<summary>3. Why can't a toast typically be shown via a simple data-attribute trigger the way a modal or offcanvas can?</summary>
Toasts are usually triggered by application/background events (an upload completing, a message arriving) rather than a direct user click on a toggle button, so showing them requires calling `.show()` via JavaScript instead.
</details>

<details>
<summary>4. When would you set `data-bs-autohide="false"` on a toast?</summary>
For more important messages — such as an error — that should persist until the user manually dismisses them, rather than a routine success confirmation that's fine to disappear automatically.
</details>
