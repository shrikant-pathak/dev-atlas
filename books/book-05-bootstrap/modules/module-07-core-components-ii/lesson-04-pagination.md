# Lesson 04: Pagination

## Learning Objectives
- Build a pagination control with `.pagination` and `.page-item`/`.page-link`
- Mark active and disabled page states correctly
- Apply size variants (`.pagination-sm`, `.pagination-lg`)
- Understand pagination's accessibility requirements, including `aria-label` on the wrapping `<nav>`

## Introduction
Pagination shares more structural DNA with Lesson 03's breadcrumb than it might first appear — both are link lists inside a labeled `<nav>` landmark, with one item marked as current/active. This lesson also reuses the `.disabled` concept from buttons (Module 06, Lesson 01), applied here to "Previous"/"Next" controls at the boundaries of a page range.

## Basic Pagination
```html
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active" aria-current="page"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
```

Same three-part semantic pattern you've now seen twice: `<nav aria-label="...">` wrapping a list, `.active` + `aria-current="page"` marking the current item — Bootstrap is consistent about how it handles "which item is the current one" across breadcrumb, nav/tabs, and pagination alike.

## Disabled Boundary States
When there's no previous or next page to go to, disable that control rather than hiding it — this keeps the pagination's visual width and item count consistent across page loads:

```html
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
```

Note `tabindex="-1"` on the disabled link — since a plain `<a>` tag (unlike a `<button>`) doesn't natively support a `disabled` attribute that blocks keyboard focus, `tabindex="-1"` manually removes it from the keyboard tab order, and `aria-disabled="true"` communicates the disabled state to screen readers. This is a slightly more manual version of the same disabled-state problem buttons solve natively.

## Sizing
```html
<ul class="pagination pagination-sm">...</ul>
<ul class="pagination">...</ul>
<ul class="pagination pagination-lg">...</ul>
```

Same size-on-the-wrapper convention as `.btn-group-sm`/`.input-group-sm` from earlier modules — size the container, not individual items.

## Alignment
Pagination is left-aligned by default; use flex utilities from Module 02 to center or right-align it:

```html
<nav aria-label="Page navigation">
  <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
  </ul>
</nav>
```

## Practical Example
A search results pagination with disabled "Previous" (on the first page):

```html
<nav aria-label="Search results pages">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
```

## Revision Questions

<details>
<summary>1. Why disable a boundary pagination control (e.g. "Previous" on page 1) instead of removing it entirely?</summary>
To keep the pagination's visual width and item count consistent across different pages, rather than having the layout shift depending on which page the user is on.
</details>

<details>
<summary>2. Why is `tabindex="-1"` needed on a disabled pagination link, when buttons elsewhere just use the native `disabled` attribute?</summary>
A plain `<a>` element doesn't support a native `disabled` attribute the way `<button>` does, so `tabindex="-1"` is used to manually remove it from the keyboard tab order, paired with `aria-disabled="true"` for screen reader communication.
</details>

<details>
<summary>3. Where should pagination size classes like `.pagination-lg` be applied?</summary>
On the wrapping `.pagination` element, consistent with the same wrapper-level sizing convention used by `.btn-group-sm` and `.input-group-sm` in earlier modules.
</details>

<details>
<summary>4. How would you center a pagination control on the page?</summary>
Add `.justify-content-center` (a flex utility from Module 02) to the `.pagination` element — pagination has no dedicated alignment class of its own.
</details>
