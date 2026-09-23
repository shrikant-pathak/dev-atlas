# Lesson 01: Navbar

## Learning Objectives
- Structure a responsive navbar with `.navbar`, `.navbar-brand`, `.navbar-nav`
- Build the collapsible hamburger menu with `.navbar-toggler` and `.collapse`
- Apply color scheme variants (`.navbar-light`/`.navbar-dark`, `.bg-*`)
- Use responsive collapse breakpoints (`.navbar-expand-{breakpoint}`)
- Add a search form or buttons inside a navbar

## Introduction
The navbar is usually the first component visitors interact with, and it's also the most structurally involved component you've built so far in this book — it combines the grid/flex concepts from Module 02, the buttons from Module 06, and introduces its first taste of Bootstrap's collapse JavaScript behavior, which you'll see in far more depth in Module 08.

## Basic Structure
```html
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Brand</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#navbarContent" aria-controls="navbarContent" 
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
```

## Breaking Down the Pieces
- **`.navbar`** — base container, handles internal flex layout and spacing
- **`.navbar-brand`** — the logo/site name, given distinct larger typography
- **`.navbar-toggler`** + **`.navbar-toggler-icon`** — the hamburger button shown only below the expand breakpoint; `.navbar-toggler-icon` is an empty `<span>` styled entirely with a background image, similar in spirit to `.btn-close` from Module 06, Lesson 06
- **`.collapse` + `.navbar-collapse`** — the collapsible wrapper around the nav links; `.collapse` is the same general-purpose show/hide class family you'll study fully in Module 08
- **`.navbar-nav`** — resets list styling and applies flex layout to the `<ul>` of nav items
- **`.nav-item` / `.nav-link`** — individual list items and their links

## The `data-bs-toggle`/`data-bs-target` Pattern
```html
<button data-bs-toggle="collapse" data-bs-target="#navbarContent" ...>
```

This is the same underlying `data-bs-*` convention from Module 06's alert dismissal, generalized: `data-bs-toggle="collapse"` tells Bootstrap's JS what *behavior* to attach, and `data-bs-target` (matching the target element's `id`) tells it *which* element to show/hide. `aria-expanded` should be kept in sync with the actual collapse state — Bootstrap's JS handles toggling this attribute automatically when using the data attributes as shown, so you get correct accessibility behavior without writing manual JS for it.

## Responsive Collapse Breakpoint
`.navbar-expand-lg` means: below the `lg` breakpoint, the navbar collapses into the hamburger menu; at `lg` and above, all nav links show inline automatically with no toggle needed. Swap `lg` for any breakpoint (`sm`, `md`, `xl`, `xxl`) depending on how much horizontal room your specific set of nav links needs before they should always be visible.

## Color Schemes
```html
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">...</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light">...</nav>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">...</nav>
```

`.navbar-light`/`.navbar-dark` control the *text and icon* color (dark text vs. light text), while `.bg-*` controls the *background* — same separation of concerns as text/background utilities in Module 04. Note these are chosen based on contrast need, not always matching light-bg-with-light-class: a `bg-primary` navbar still needs `.navbar-dark` since primary is a fairly dark blue that needs light text on top.

## Forms and Buttons in a Navbar
```html
<form class="d-flex" role="search">
  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
  <button class="btn btn-outline-success" type="submit">Search</button>
</form>
```

This drops the `.form-control` and `.btn` patterns you already know from Modules 05–06 directly into the navbar's flex layout, with no navbar-specific classes needed for the input/button themselves.

## Practical Example
A complete responsive navbar with brand, links, and a search form:

```html
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Dev Atlas</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#mainNav" aria-controls="mainNav" 
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#">Courses</a></li>
        <li class="nav-item"><a class="nav-link" href="#">About</a></li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
```

## Revision Questions

<details>
<summary>1. What does `.navbar-expand-lg` control?</summary>
The breakpoint below which the navbar collapses into a hamburger toggle, and at or above which all nav links display inline automatically with no toggle needed.
</details>

<details>
<summary>2. What's the difference between what `.navbar-light`/`.navbar-dark` control versus what `.bg-*` controls?</summary>
`.navbar-light`/`.navbar-dark` control the text/icon color scheme; `.bg-*` controls the background color — they're chosen independently based on contrast needs, not tied to each other by name.
</details>

<details>
<summary>3. What do `data-bs-toggle` and `data-bs-target` do together on the navbar toggler button?</summary>
`data-bs-toggle="collapse"` tells Bootstrap's JS which behavior to attach; `data-bs-target` (matching the target's `id`) tells it which specific element to show/hide.
</details>

<details>
<summary>4. Do you need to manually update `aria-expanded` with JavaScript when using the standard data-attribute toggle pattern?</summary>
No — Bootstrap's bundled JS automatically keeps `aria-expanded` in sync with the actual collapse state when the standard `data-bs-toggle`/`data-bs-target` attributes are used.
</details>
