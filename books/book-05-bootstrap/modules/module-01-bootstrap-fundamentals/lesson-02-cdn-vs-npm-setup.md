# CDN vs npm Setup

## Learning Objectives
- Add Bootstrap to a project using a CDN
- Install Bootstrap via npm and understand when that approach is preferable
- Understand the difference between the full bundle and the "no Popper" build
- Know which files you actually need: CSS, JS bundle, and their minified variants

## Introduction

There are two common ways to bring Bootstrap into a project: linking to a **CDN** (Content Delivery Network) hosted copy, or **installing it as an npm package** and bundling it yourself. Both get you the same framework — the difference is about your build process, not the CSS/JS itself.

## Method 1 — CDN

The fastest way to try Bootstrap: add a `<link>` tag for the CSS in your `<head>`, and a `<script>` tag for the JS bundle before your closing `</body>` tag.

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap CDN Demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <h1 class="text-primary">Hello, Bootstrap!</h1>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

**When to use the CDN:** quick prototypes, learning exercises, small static sites, or any project without a JavaScript build pipeline (webpack, Vite, etc.).

## Method 2 — npm

For projects that already use a build tool (which you'll set up properly in Module 11), installing via npm lets you import only what you need and customize Bootstrap's Sass source.

```bash
npm install bootstrap@5.3.8
```

Then, in your JavaScript entry file:

```js
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
```

**When to use npm:** production projects, anything with a build tool, or when you plan to customize Bootstrap's Sass variables (Module 11).

## The "Bundle" vs the Plain JS File

Bootstrap ships two JavaScript builds:

- `bootstrap.bundle.min.js` — includes **Popper**, the positioning library that powers tooltips, popovers, and dropdowns. Use this unless you have a specific reason not to.
- `bootstrap.min.js` — does **not** include Popper. Use this only if you're loading Popper separately yourself (e.g., a different version, or another library already provides it).

For nearly every project — especially as you're learning — always reach for the **bundle** version.

## File Reference Table

| File | Purpose |
|---|---|
| `bootstrap.min.css` | All framework CSS, minified for production |
| `bootstrap.css` | Same CSS, unminified — useful for reading/debugging |
| `bootstrap.bundle.min.js` | JS + Popper, minified — recommended default |
| `bootstrap.min.js` | JS only, no Popper — advanced use only |

## Practical Example

A minimal starter page using the CDN, ready to test that Bootstrap loaded correctly:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Setup Check</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <button type="button" class="btn btn-primary" data-bs-toggle="tooltip" title="It works!">
    Hover me
  </button>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Bootstrap 5 requires tooltips to be manually initialized (covered in Lesson 5)
    new bootstrap.Tooltip(document.querySelector('[data-bs-toggle="tooltip"]'));
  </script>
</body>
</html>
```

If the button shows a styled tooltip on hover, both the CSS and JS layers are wired up correctly.

## Revision Questions

<details>
<summary>1. What are the two main ways to add Bootstrap to a project?</summary>
Linking a CDN-hosted copy of the CSS/JS files, or installing Bootstrap as an npm package and bundling it with your own build tool.
</details>

<details>
<summary>2. What is the difference between bootstrap.bundle.min.js and bootstrap.min.js?</summary>
The bundle version includes Popper (needed for tooltips, popovers, and dropdown positioning); the plain version does not, and requires Popper to be loaded separately.
</details>

<details>
<summary>3. When would you prefer npm over a CDN?</summary>
In production projects, projects that already use a build tool, or when you plan to customize Bootstrap's Sass source variables.
</details>
