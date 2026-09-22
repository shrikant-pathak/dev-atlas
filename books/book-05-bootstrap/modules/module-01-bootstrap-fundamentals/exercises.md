# Module 01 Exercises — Bootstrap Fundamentals

## Exercise 1 — First Setup
Create a new HTML file that loads Bootstrap via the CDN (CSS + JS bundle). Add an `<h1>`, a `<p>`, and a `<button class="btn btn-primary">`. Open it in a browser and confirm the button is styled — proof Bootstrap loaded correctly.

## Exercise 2 — Compare Reboot's Effect
Create two versions of the same simple page (a heading, a paragraph, an unstyled `<button>`, and a `<ul>` with three items) — one with Bootstrap's CSS linked, one without any CSS at all. Compare them side by side and write down at least three visible differences Reboot causes.

## Exercise 3 — npm Setup
Set up a small project using npm: run `npm install bootstrap`, then create a JS entry file that imports both Bootstrap's CSS and JS bundle. Confirm it works with a bundler of your choice (or a simple static server).

## Exercise 4 — Multi-Page Structure
Build a 3-page mini-site (`index.html`, `about.html`, `contact.html`) that all share the same Bootstrap setup, plus a `css/custom.css` and `js/custom.js` file linked in the correct order. Add one custom CSS rule that overrides a Bootstrap default (e.g., change the body's background color) to confirm your custom CSS loads after Bootstrap's.

## Exercise 5 — Data Attributes Only
Using only `data-bs-*` attributes (no JavaScript), build a button that opens a Bootstrap modal containing a short welcome message.

## Exercise 6 — Programmatic Control
Rebuild Exercise 5, but this time open the modal automatically 2 seconds after the page loads, using `bootstrap.Modal` and `setTimeout` (from Book 04).

## Exercise 7 — Tooltip Initialization
Add three buttons, each with a `data-bs-toggle="tooltip"` attribute and a different `title`. Write the JavaScript needed to initialize all three tooltips at once using `querySelectorAll`.

## Exercise 8 — Component Events
Using the modal from Exercise 5 or 6, add event listeners for both `shown.bs.modal` and `hidden.bs.modal` that log a message to the console each time.

## Exercise 9 — Browser Support Research
Look up Bootstrap 5.3's official supported browser list on getbootstrap.com and write a short paragraph explaining what you'd tell a client who insists their site must support Internet Explorer 11.

## Exercise 10 — Mini Challenge
Combine everything from this module: build a single HTML page with a proper starter template, custom CSS/JS files linked correctly, a button using data attributes to open a modal, and a tooltip that's manually initialized on page load.
