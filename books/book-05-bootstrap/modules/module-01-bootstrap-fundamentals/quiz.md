# Module 01 Quiz — Bootstrap Fundamentals

## Question 1
What is Bootstrap fundamentally composed of?
- A) Only CSS
- B) Only JavaScript
- C) A CSS layer and a JavaScript layer
- D) A backend server framework

<details><summary>Answer</summary>C — Bootstrap combines a CSS layer (grid, Reboot, typography, utilities, components) with a JavaScript layer for interactive component behavior.</details>

## Question 2
What major dependency did Bootstrap 5 remove compared to Bootstrap 4?
- A) Popper
- B) jQuery
- C) Sass
- D) CSS Grid

<details><summary>Answer</summary>B — Bootstrap 5 dropped its jQuery dependency; its JS plugins are now plain JavaScript.</details>

## Question 3
Which file should you load if you need both Bootstrap's JavaScript and Popper together?
- A) bootstrap.min.js
- B) bootstrap.bundle.min.js
- C) popper.min.js
- D) bootstrap.esm.js

<details><summary>Answer</summary>B — bootstrap.bundle.min.js includes Popper alongside Bootstrap's own JavaScript.</details>

## Question 4
Why is the viewport meta tag required in a Bootstrap project?
- A) It's only needed for SEO
- B) Without it, mobile browsers render at a fixed width, breaking responsive breakpoints
- C) It enables dark mode
- D) It's optional and rarely used

<details><summary>Answer</summary>B — Without it, mobile browsers scale down a desktop-width render, defeating Bootstrap's mobile-first grid.</details>

## Question 5
What is Reboot?
- A) A JavaScript plugin for restarting animations
- B) Bootstrap's built-in CSS normalization layer
- C) A build tool for compiling Sass
- D) A dark mode toggle utility

<details><summary>Answer</summary>B — Reboot is Bootstrap's CSS normalization layer, based on Normalize.css with Bootstrap-specific defaults added.</details>

## Question 6
Does Bootstrap 5 support Internet Explorer?
- A) Yes, fully
- B) Only IE 11
- C) No, IE support was dropped starting with 5.0
- D) Only with a polyfill included by default

<details><summary>Answer</summary>C — Internet Explorer support was dropped entirely starting with Bootstrap 5.0.</details>

## Question 7
Which attribute prefix does Bootstrap use for its data attributes?
- A) data-bootstrap-
- B) data-bs-
- C) bs-data-
- D) data-b5-

<details><summary>Answer</summary>B — e.g. data-bs-toggle, data-bs-target, data-bs-dismiss.</details>

## Question 8
Which two components require manual JavaScript initialization in Bootstrap 5?
- A) Modal and Dropdown
- B) Tooltip and Popover
- C) Carousel and Accordion
- D) Navbar and Offcanvas

<details><summary>Answer</summary>B — Tooltips and popovers must be manually initialized for performance reasons.</details>

## Question 9
What does the custom event name `shown.bs.modal` represent?
- A) It fires right before the modal starts showing
- B) It fires after the modal has fully finished showing
- C) It fires when the modal is destroyed
- D) It only fires on mobile devices

<details><summary>Answer</summary>B — the "shown" event fires once the modal has fully finished its show transition.</details>

## Question 10
When should you prefer installing Bootstrap via npm over a CDN?
- A) Never, CDN is always better
- B) Only for static single-page prototypes
- C) In production projects with a build tool, or when customizing Bootstrap's Sass source
- D) Only when working offline

<details><summary>Answer</summary>C — npm is preferred for production projects with a build pipeline, and is required for Sass customization (covered in Module 11).</details>
