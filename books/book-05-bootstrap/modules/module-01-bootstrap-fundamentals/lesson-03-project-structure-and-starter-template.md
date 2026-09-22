# Project Structure & Starter Template

## Learning Objectives
- Build Bootstrap's official recommended starter template from memory
- Explain why each meta tag and attribute in the template exists
- Organize a small multi-page Bootstrap project's folders and files sensibly
- Know where custom CSS should live relative to Bootstrap's own files

## Introduction

Every Bootstrap project should begin from the same reliable foundation: the **official starter template**. It looks deceptively simple, but every line solves a specific, real problem you'd otherwise hit later. Let's build it piece by piece and understand *why* it looks the way it does.

## The Starter Template, Annotated

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap Starter</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

  <h1>Hello, world!</h1>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

- **`<meta charset="utf-8">`** — you saw this in Book 02; required so special characters render correctly.
- **`<meta name="viewport" content="width=device-width, initial-scale=1">`** — this is *non-negotiable* for Bootstrap. Without it, Bootstrap's responsive breakpoints won't work correctly on real mobile devices — the browser will render the page at a fixed desktop-like width and then scale it down, defeating the whole mobile-first grid system from Book 03's Responsive Design module.
- **CSS `<link>` in `<head>`** — same reason as always: styles should load before content renders, to avoid a flash of unstyled content.
- **JS `<script>` at the end of `<body>`** — you learned in Book 04 (Module 04, Script Loading) why scripts are best placed just before `</body>`, or loaded with `defer`. Bootstrap's own docs follow this same pattern.

## Organizing a Multi-Page Project

For anything beyond a single test page, use a structure like this:

my-bootstrap-project/
├── index.html
├── about.html
├── contact.html
├── css/
│ └── custom.css ← your own overrides, loaded AFTER bootstrap.min.css
├── js/
│ └── custom.js ← your own scripts, loaded AFTER bootstrap.bundle.min.js
└── img/
└── ...


Two rules matter here:

1. **Your custom CSS file must be linked *after* Bootstrap's**, so your rules can override the framework's defaults when needed (this is the cascade and specificity behavior you learned in Book 03).
2. **Your custom JS must load *after* the Bootstrap bundle**, since your code may need to reference the global `bootstrap` object (used for manually initializing components — see Lesson 5).

```html
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">
</head>
<body>
  ...
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/custom.js"></script>
</body>
```

## Practical Example

A three-page site skeleton (`index.html`, `about.html`, `contact.html`) all sharing the same head/foot pattern:

```html
<!-- index.html -->
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home | My Site</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">
</head>
<body>
  <main class="container py-5">
    <h1>Welcome Home</h1>
    <p class="lead">This is the starting point of every page in this project.</p>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/custom.js"></script>
</body>
</html>
```

`about.html` and `contact.html` would repeat this exact `<head>` and script setup, changing only the `<title>` and the content inside `<main>`.

## Revision Questions

<details>
<summary>1. Why is the viewport meta tag non-negotiable in a Bootstrap project?</summary>
Without it, mobile browsers render the page at a fixed desktop-like width and scale it down, which breaks Bootstrap's mobile-first responsive breakpoints entirely.
</details>

<details>
<summary>2. In what order should your custom CSS file be linked relative to bootstrap.min.css, and why?</summary>
After it — so your own rules come later in the cascade and can override Bootstrap's defaults when you need to.
</details>

<details>
<summary>3. Why should your custom JavaScript file load after the Bootstrap bundle script tag?</summary>
Your custom scripts may need to reference the global `bootstrap` object (for manually initializing components like tooltips), which only exists once the bundle has loaded.
</details>
