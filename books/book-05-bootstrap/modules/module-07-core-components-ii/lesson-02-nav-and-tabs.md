# Lesson 02: Nav and Tabs

## Learning Objectives
- Build a basic `.nav` component independent of the navbar
- Style navs as pills (`.nav-pills`) or underlined tabs (`.nav-tabs`)
- Wire up functional tab switching with `.tab-content`/`.tab-pane` and `data-bs-toggle="tab"`
- Understand the accessibility roles required for a proper tab interface

## Introduction
Lesson 01's navbar used `.nav-item`/`.nav-link` inside a navbar-specific context. This lesson looks at `.nav` as its own standalone component — the same link-list styling, but usable anywhere, and extendable into fully interactive tabbed content panels.

## Basic Nav
```html
<ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
  </li>
</ul>
```

## Pills and Tabs Styling
Two visual variants, same underlying markup:

```html
<ul class="nav nav-pills">
  <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
  <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
</ul>

<ul class="nav nav-tabs">
  <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
  <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
</ul>
```

`.nav-pills` renders rounded, filled "pill" buttons for each link; `.nav-tabs` renders a classic underlined browser-tab look with a bottom border joining the active tab to its content. Both are purely visual choices layered on the same `.nav`/`.nav-item`/`.nav-link` structure.

## Making Tabs Functional
Visual tabs alone don't switch content — that requires pairing the nav with a `.tab-content` container and Bootstrap's tab JavaScript:

```html
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" 
            data-bs-target="#home-pane" type="button" role="tab" 
            aria-controls="home-pane" aria-selected="true">Home</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" 
            data-bs-target="#profile-pane" type="button" role="tab" 
            aria-controls="profile-pane" aria-selected="false">Profile</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home-pane" role="tabpanel" 
       aria-labelledby="home-tab" tabindex="0">
    Home tab content goes here.
  </div>
  <div class="tab-pane fade" id="profile-pane" role="tabpanel" 
       aria-labelledby="profile-tab" tabindex="0">
    Profile tab content goes here.
  </div>
</div>
```

This is a significantly more accessibility-attribute-heavy pattern than anything earlier in this book, and each piece matters:
- **`role="tablist"`** on the nav, **`role="tab"`** on each toggle, **`role="tabpanel"`** on each content pane — these establish the semantic relationship a screen reader needs to understand this as a tabbed interface, not just a list of buttons and unrelated divs
- **`aria-selected`** tracks which tab is currently active (Bootstrap's JS updates this automatically on click, matching what `aria-expanded` did for the navbar toggler in Lesson 01)
- **`aria-controls`** on each tab points to its corresponding pane's `id`; **`aria-labelledby`** on each pane points back to its tab's `id` — this two-way linkage is what lets a screen reader announce "which tab am I in, and what controls it"
- **`.tab-pane.fade`** on every pane plus `.show.active` only on the initially visible one follows the exact same fade/show pattern from Module 06's dismissible alerts — `.fade` alone means invisible, `.show` makes it visible

## Vertical and Justified Layouts
```html
<div class="d-flex">
  <ul class="nav nav-pills flex-column me-3" role="tablist">
    <li class="nav-item"><button class="nav-link active" data-bs-toggle="pill" data-bs-target="#v1">One</button></li>
    <li class="nav-item"><button class="nav-link" data-bs-toggle="pill" data-bs-target="#v2">Two</button></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="v1">Content one</div>
    <div class="tab-pane fade" id="v2">Content two</div>
  </div>
</div>
```

`.flex-column` (from Module 02) is what turns a horizontal nav into a vertical sidebar-style tab list — no special vertical-nav class is needed, just the standard flex-direction utility.

## Practical Example
A settings page with functional tabbed sections:

```html
<ul class="nav nav-tabs mb-3" id="settingsTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#general" 
            type="button" role="tab" aria-selected="true">General</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#security" 
            type="button" role="tab" aria-selected="false">Security</button>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="general" role="tabpanel">
    <p>General settings form fields here.</p>
  </div>
  <div class="tab-pane fade" id="security" role="tabpanel">
    <p>Security settings form fields here.</p>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What's the visual difference between `.nav-pills` and `.nav-tabs`, and what do they share structurally?</summary>
`.nav-pills` renders rounded, filled buttons; `.nav-tabs` renders an underlined browser-tab look. Both apply purely visual styling on top of the identical `.nav`/`.nav-item`/`.nav-link` markup structure.
</details>

<details>
<summary>2. What links a tab button to its content pane, both functionally and for accessibility?</summary>
Functionally: `data-bs-target` on the button matching the pane's `id`. For accessibility: `aria-controls` on the button pointing to the pane's `id`, and `aria-labelledby` on the pane pointing back to the button's `id`.
</details>

<details>
<summary>3. What earlier component's show/hide pattern does `.tab-pane.fade` + `.show.active` directly reuse?</summary>
The dismissible alert pattern from Module 06 — `.fade` alone means invisible, `.show` makes it visible, and here `.active` additionally marks which single pane should currently display.
</details>

<details>
<summary>4. How do you turn a horizontal nav into a vertical one?</summary>
Add `.flex-column` (a Module 02 flex utility) to the `.nav` element — no dedicated "vertical nav" class exists; it's composed from the general-purpose flex-direction utility.
</details>
