# Lesson 04: Alerts

## Learning Objectives
- Apply `.alert` with theme color contextual variants
- Add headings, links, and icons inside an alert
- Make an alert dismissible with `.alert-dismissible` and the close button
- Use `.fade` and `.show` to control alert transition behavior

## Introduction
Where badges (Lesson 03) handle short inline labels, alerts handle fuller feedback messages — form submission confirmations, warnings, error banners. This lesson also sets up Lesson 06, since dismissible alerts depend on the close button component you'll study in depth there.

## Basic Alerts
```html
<div class="alert alert-primary" role="alert">A simple primary alert.</div>
<div class="alert alert-success" role="alert">Your changes were saved.</div>
<div class="alert alert-danger" role="alert">Something went wrong.</div>
<div class="alert alert-warning" role="alert">Please review before continuing.</div>
```

`role="alert"` is a required accessibility attribute — it tells assistive technology to announce the content immediately when it appears, which matters for alerts specifically because they often communicate time-sensitive or important information the user might otherwise miss.

## Alerts with Headings and Extra Content
Alerts can contain full block-level content, not just plain text:

```html
<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Well done!</h4>
  <p>Your submission was received and is now being processed.</p>
  <hr>
  <p class="mb-0">Check your email for a confirmation shortly.</p>
</div>
```

`.alert-heading` ensures the heading's color matches the alert's theme rather than using a default heading color that might clash. The `<hr>` here automatically inherits an appropriate border color matching the alert's context.

## Links Inside Alerts
`.alert-link` styles a link so it matches and stands out appropriately within its parent alert's color scheme, rather than using the default blue link color which might clash or blend in:

```html
<div class="alert alert-warning" role="alert">
  Please read our <a href="#" class="alert-link">updated terms of service</a>.
</div>
```

## Dismissible Alerts
Combine `.alert-dismissible` with a close button to let users manually hide an alert:

```html
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  This offer expires soon.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
```

Breaking down the moving parts:
- **`.alert-dismissible`** adds extra right-side padding so the message text doesn't overlap the close button
- **`.fade`** enables a CSS opacity transition
- **`.show`** is what actually makes the alert visible — without it, `.fade` alone would leave the alert at opacity 0
- **`.btn-close`** is the dedicated close-button component you'll study fully in Lesson 06
- **`data-bs-dismiss="alert"`** is a Bootstrap data attribute that wires up the dismiss behavior automatically via Bootstrap's bundled JavaScript, with no custom JS required on your part

This `data-bs-*` pattern — HTML attributes that trigger Bootstrap's built-in JS behavior without you writing any JavaScript yourself — is something you'll see repeatedly starting in Module 08 (Interactive Components), where far more complex components (modals, dropdowns, tooltips) all use the same underlying convention.

## Practical Example
A form submission alert combining heading, dismiss button, and a link:

```html
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <h4 class="alert-heading">Submission failed</h4>
  <p class="mb-0">
    Please check the highlighted fields below, or 
    <a href="#" class="alert-link">contact support</a> if the problem persists.
  </p>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
```

## Revision Questions

<details>
<summary>1. Why is `role="alert"` required on an alert component?</summary>
It tells assistive technology to announce the alert's content immediately upon appearing, which matters because alerts often carry time-sensitive or important information the user shouldn't miss.
</details>

<details>
<summary>2. What does `.fade` do without `.show`, and why are they almost always used together on a dismissible alert?</summary>
`.fade` alone enables the opacity CSS transition but leaves the element at opacity 0 (invisible); `.show` is what actually sets it to visible, so both classes together are needed for a properly visible, smoothly-transitioning alert.
</details>

<details>
<summary>3. What does `data-bs-dismiss="alert"` do, and what does it NOT require from you?</summary>
It wires up the button to automatically close/remove its parent alert using Bootstrap's bundled JavaScript — it requires no custom JavaScript to be written by you at all.
</details>

<details>
<summary>4. Why use `.alert-link` instead of a plain `<a>` inside an alert?</summary>
It restyles the link's color to match and stand out appropriately within the alert's specific theme color, rather than using a default link color that might clash with or blend into the alert's background.
</details>
