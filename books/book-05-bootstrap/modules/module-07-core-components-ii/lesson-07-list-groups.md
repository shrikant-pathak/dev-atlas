# Lesson 07: List Groups

## Learning Objectives
- Build a basic list group with `.list-group` and `.list-group-item`
- Apply active, disabled, and contextual color states to list items
- Build actionable (clickable) list groups with `.list-group-item-action`
- Add badges and custom content inside list group items
- Use horizontal list groups and flush variants (recap from Module 06)

## Introduction
This closes out Module 07 with list groups covered in their own right — you saw `.list-group-flush` used briefly inside a card back in Module 06, Lesson 05, but list groups are a fully independent component capable of much more than that single use case, including acting as a full navigation or selection interface on their own.

## Basic List Group
```html
<ul class="list-group">
  <li class="list-group-item">An item</li>
  <li class="list-group-item">A second item</li>
  <li class="list-group-item">A third item</li>
</ul>
```

## Active and Disabled Items
```html
<ul class="list-group">
  <li class="list-group-item active" aria-current="true">Active item</li>
  <li class="list-group-item">Regular item</li>
  <li class="list-group-item disabled" aria-disabled="true">Disabled item</li>
</ul>
```

Same `.active`/`aria-current` convention you've now seen across nav/tabs (Lesson 02), breadcrumbs (Lesson 03), and pagination (Lesson 04) — Bootstrap is consistent about this pattern across every "list of related items with one current/selected" component in the framework.

## Contextual Colors
```html
<ul class="list-group">
  <li class="list-group-item list-group-item-success">Success item</li>
  <li class="list-group-item list-group-item-danger">Danger item</li>
  <li class="list-group-item list-group-item-warning">Warning item</li>
</ul>
```

These `.list-group-item-{color}` classes work like a "subtle" variant (Module 04, Lesson 02) baked directly into the component — a soft background tint using the theme color, without needing to separately compose `.bg-{color}-subtle` yourself.

## Actionable List Groups
When list items should behave like clickable links or buttons (a settings menu, a selectable list), use `<a>` or `<button>` elements instead of `<li>`, plus `.list-group-item-action` for hover/focus feedback:

```html
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    Inbox
  </a>
  <a href="#" class="list-group-item list-group-item-action">Sent</a>
  <a href="#" class="list-group-item list-group-item-action">Drafts</a>
</div>
```

Note the parent changes from `<ul>` to `<div>` here — since the children are no longer `<li>` elements, an unordered list wrapper is no longer the semantically correct container.

## Custom Content and Badges
List group items accept arbitrary block-level content, including the badges from Module 06, Lesson 03:

```html
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
    <div>
      <div class="fw-bold">Project Alpha</div>
      Updated 3 hours ago
    </div>
    <span class="badge bg-primary rounded-pill">2</span>
  </a>
</div>
```

The `.d-flex .justify-content-between` pattern here is the same flex-alignment approach from Module 02, now used to push the badge to the far right of each list item while the text content sits on the left.

## Horizontal and Flush Variants
```html
<ul class="list-group list-group-horizontal-md">
  <li class="list-group-item">Item 1</li>
  <li class="list-group-item">Item 2</li>
</ul>

<ul class="list-group list-group-flush">
  <li class="list-group-item">Item 1</li>
  <li class="list-group-item">Item 2</li>
</ul>
```

`.list-group-horizontal-md` lays items in a row starting at the `md` breakpoint (stacking vertically below it) — same responsive-infix convention used throughout this book. `.list-group-flush` is the exact class from Module 06's card example, removing rounded corners and outer border so the list sits flush against a parent container like a card.

## Practical Example
An actionable notification list with badges and a mix of active/regular states:

```html
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active d-flex justify-content-between" aria-current="true">
    <span>New comment on your post</span>
    <span class="badge bg-light text-primary rounded-pill">New</span>
  </a>
  <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between">
    <span>Weekly summary ready</span>
    <span class="badge bg-secondary rounded-pill">3</span>
  </a>
  <a href="#" class="list-group-item list-group-item-action list-group-item-success">
    Payment received successfully
  </a>
</div>
```

## Revision Questions

<details>
<summary>1. What earlier component's "current item" convention does the list group's `.active` + `aria-current` pattern match?</summary>
The same pattern used across nav/tabs, breadcrumbs, and pagination earlier in this module — Bootstrap consistently marks the current/selected item the same way across every list-of-related-items component.
</details>

<details>
<summary>2. Why does an actionable list group use `<div>` as its wrapper instead of `<ul>`?</summary>
Because the items are `<a>` or `<button>` elements rather than `<li>` elements, so an unordered list wrapper is no longer the semantically correct container for them.
</details>

<details>
<summary>3. What do `.list-group-item-{color}` classes do, and what Module 04 pattern do they resemble?</summary>
They apply a soft, theme-colored background tint directly to a list item — functioning like a built-in version of the "subtle" background pattern from Module 04, Lesson 02, without needing to compose `.bg-{color}-subtle` yourself.
</details>

<details>
<summary>4. What does `.list-group-horizontal-md` do, and what naming convention does the `-md` suffix follow?</summary>
It lays list items in a horizontal row starting at the `md` breakpoint and above, stacking vertically below it — following the same responsive breakpoint-infix convention used throughout the rest of this book (grid, spacing, sizing).
</details>
