# Lesson 08: Scrollspy

## Learning Objectives
- Wire up scrollspy to automatically highlight nav links based on scroll position
- Understand the required id/href matching between nav and target sections
- Apply scrollspy to a nav, list group, or simple link list
- Recognize scrollspy's specific use case: long single-page documents

## Introduction
Scrollspy solves a specific, narrow problem: on a long single-page document (a documentation page, a marketing landing page with several sections), how does the navigation automatically reflect which section the user is currently scrolled to, without any click having happened? This is the only component in this module driven by scroll position rather than a click, hover, or programmatic trigger — a genuinely different interaction model from everything else in Module 08.

## Basic Setup
Scrollspy requires three pieces working together: a scrollable container, a nav with links, and target sections whose ids match the nav's hrefs.

```html
<body data-bs-spy="scroll" data-bs-target="#navScrollspy" data-bs-offset="0" tabindex="0">

  <ul class="nav nav-pills flex-column" id="navScrollspy">
    <li class="nav-item"><a class="nav-link" href="#intro">Introduction</a></li>
    <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
    <li class="nav-item"><a class="nav-link" href="#pricing">Pricing</a></li>
  </ul>

  <div id="intro"><h2>Introduction</h2><p>...</p></div>
  <div id="features"><h2>Features</h2><p>...</p></div>
  <div id="pricing"><h2>Pricing</h2><p>...</p></div>

</body>
```

`data-bs-spy="scroll"` activates scrollspy on the scrollable element (here, `<body>`, but it can be any scrollable container with a defined height and `overflow-y: scroll`). `data-bs-target` points to the nav whose links should be updated as the user scrolls — matching each nav link's `href` (`#intro`) against the `id` of a corresponding section (`id="intro"`) is what lets scrollspy know which link corresponds to which section.

## Reusing Nav, Nav-Tabs, or List Groups
Scrollspy doesn't care which component styles the navigation — it works with the plain `.nav` from Module 07, Lesson 02, or with a `.list-group` from Module 07, Lesson 07, applying `.active` to whichever link/item matches the currently-visible section:

```html
<div class="list-group" id="listScrollspy">
  <a class="list-group-item list-group-item-action" href="#section1">Section 1</a>
  <a class="list-group-item list-group-item-action" href="#section2">Section 2</a>
</div>
```

This is a good example of how Bootstrap's JS behaviors are frequently decoupled from any single component's markup — the same underlying `.active`-toggling mechanism you've now seen applied to nav/tabs, pagination, breadcrumbs, and list groups gets reused here too, just driven by scroll position instead of a click.

## Offset
`data-bs-offset` (or, in a scrollable div rather than the body, `data-bs-root-margin`) adjusts how far from the top of the viewport a section must be before it's considered "active" — useful when a fixed navbar overlaps the top of the page and would otherwise trigger the next section's highlight slightly too early.

## Practical Example
A documentation sidebar using scrollspy against a scrollable content div (rather than the whole page body):

```html
<div class="row">
  <div class="col-3">
    <nav id="docsNav" class="nav flex-column">
      <a class="nav-link" href="#setup">Setup</a>
      <a class="nav-link" href="#usage">Usage</a>
      <a class="nav-link" href="#api">API Reference</a>
    </nav>
  </div>
  <div class="col-9">
    <div data-bs-spy="scroll" data-bs-target="#docsNav" data-bs-offset="0" 
         tabindex="0" style="height: 400px; overflow-y: scroll;">
      <div id="setup"><h4>Setup</h4><p>Installation instructions...</p></div>
      <div id="usage"><h4>Usage</h4><p>Basic usage guide...</p></div>
      <div id="api"><h4>API Reference</h4><p>Full API details...</p></div>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What interaction model does scrollspy use, and how is that different from every other component covered in this module?</summary>
It's driven by scroll position rather than a click, hover, or programmatic trigger — every other component in this module responds to a direct user action or an application event, while scrollspy responds continuously to where the user has scrolled.
</details>

<details>
<summary>2. What must match between a nav link and its target section for scrollspy to work?</summary>
The nav link's `href` (e.g. `#intro`) must match the `id` of the corresponding section (`id="intro"`) — this pairing is how scrollspy knows which link corresponds to which section.
</details>

<details>
<summary>3. Can scrollspy be used with a plain `.nav`, `.nav-tabs`, or a `.list-group`?</summary>
Yes — scrollspy doesn't require a specific navigation component; it applies `.active` toggling to whichever link/item markup is targeted, reusing the same active-state mechanism from nav/tabs, pagination, breadcrumbs, and list groups.
</details>

<details>
<summary>4. When would you need to set `data-bs-offset`?</summary>
When a fixed navbar overlaps the top of the scrollable area and would otherwise cause the next section to be marked active slightly too early — the offset adjusts how far from the top a section must be before scrollspy considers it active.
</details>
