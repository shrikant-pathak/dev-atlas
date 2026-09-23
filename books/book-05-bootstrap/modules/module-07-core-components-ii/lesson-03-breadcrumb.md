# Lesson 03: Breadcrumb

## Learning Objectives
- Build a breadcrumb trail with `.breadcrumb` and `.breadcrumb-item`
- Mark the current page correctly with `.active` and `aria-current`
- Customize the breadcrumb separator via CSS custom properties
- Understand `<nav>` + `aria-label` as the required semantic wrapper

## Introduction
Breadcrumbs are one of the simplest components in this module structurally, but they carry real semantic weight for both SEO and accessibility — they tell users (and search engines) exactly where a page sits in a site's hierarchy.

## Basic Breadcrumb
```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Library</a></li>
    <li class="breadcrumb-item active" aria-current="page">Data</li>
  </ol>
</nav>
```

Every piece here is semantically deliberate:
- **`<nav aria-label="breadcrumb">`** — the outer `<nav>` landmark, labeled specifically so a screen reader distinguishes it from other `<nav>` regions on the page (like the navbar from Lesson 01, which is also technically a `<nav>` element)
- **`<ol class="breadcrumb">`** — an ordered list, because breadcrumb items have a meaningful sequence (this is not decorative; it's the correct semantic HTML element for a hierarchical trail)
- **`.breadcrumb-item.active` + `aria-current="page"`** on the last item — marks the current page as both visually distinct (no link, different styling) and programmatically identified for assistive technology, exactly mirroring how `.nav-link.active` + `aria-current="page"` worked back in Lesson 01's navbar

## Why the Last Item Has No Link
Notice the final breadcrumb item is plain text, not wrapped in an `<a>` — this is intentional and matches general UX/accessibility convention: you should never link a page to itself, since clicking a link to the page you're already on either does nothing or forces an unnecessary reload.

## Customizing the Separator
The `/` separator between items is CSS-generated content, not literal text in the HTML — which means it can be customized via a CSS custom property without touching any markup:

```css
.breadcrumb {
  --bs-breadcrumb-divider: '>';
}
```

```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb" style="--bs-breadcrumb-divider: '>';">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Settings</li>
  </ol>
</nav>
```

This CSS custom property approach directly parallels the `--bs-primary`-style variables from Module 04, Lesson 01 — Bootstrap consistently exposes small customization points as CSS variables rather than requiring you to override full CSS rules.

## Practical Example
A documentation page breadcrumb reflecting a nested URL structure:

```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dev Atlas</a></li>
    <li class="breadcrumb-item"><a href="#">Book 05 — Bootstrap</a></li>
    <li class="breadcrumb-item"><a href="#">Module 07</a></li>
    <li class="breadcrumb-item active" aria-current="page">Breadcrumb</li>
  </ol>
</nav>
```

## Revision Questions

<details>
<summary>1. Why is `<ol>` used for a breadcrumb instead of `<ul>`?</summary>
Because breadcrumb items have a meaningful, hierarchical sequence — an ordered list is the semantically correct HTML element for that, not a decorative choice.
</details>

<details>
<summary>2. Why should the current/last breadcrumb item not be wrapped in a link?</summary>
Standard UX/accessibility convention says a page should never link to itself, since doing so either does nothing or triggers an unnecessary reload of the current page.
</details>

<details>
<summary>3. How would you change the breadcrumb separator from `/` to `>`?</summary>
By overriding the `--bs-breadcrumb-divider` CSS custom property, either inline (`style="--bs-breadcrumb-divider: '>';"`) or in a stylesheet rule targeting `.breadcrumb` — the separator is CSS-generated content, not literal HTML text.
</details>

<details>
<summary>4. Why does the outer `<nav>` need its own `aria-label="breadcrumb"` if the page already has a navbar (also a `<nav>` element)?</summary>
So assistive technology can distinguish between multiple `<nav>` landmarks on the same page — without a distinguishing label, a screen reader user would have no way to tell the breadcrumb region apart from the main site navigation.
</details>
