# Z-index & Layout Utilities

## Learning Objectives
- Use Bootstrap's z-index utility scale
- Understand Bootstrap's own internal z-index values for components like modals and dropdowns
- Avoid stacking-context conflicts between custom content and Bootstrap components
- Use `.position-*` utilities alongside z-index for layered layouts

## Introduction

In Book 03 you learned that `z-index` only has an effect on positioned elements (`relative`, `absolute`, `fixed`, or `sticky`) and only meaningfully compares elements within the same **stacking context**. Bootstrap provides a small utility scale for z-index, plus its own internal system for layering components like modals and dropdowns above your page content — understanding both prevents a common frustration: "why is my dropdown appearing behind this other element?"

## Bootstrap's Z-index Utility Classes

```html
<div class="position-relative">
  <div class="position-absolute z-3">On top</div>
  <div class="position-absolute z-1">Underneath</div>
</div>
```

Bootstrap's scale is intentionally small: `.z-n1`, `.z-0`, `.z-1`, `.z-2`, `.z-3`. It's meant for simple layering of your own content — not for competing with Bootstrap's internal component z-index values, which are much higher and covered next.

## Bootstrap's Internal Component Z-index Values

Bootstrap components that need to appear above regular page content — modals, dropdowns, tooltips, popovers, offcanvas panels, the sticky navbar — use much higher z-index values internally (in the hundreds to low thousands), defined as Sass variables you'll learn to customize in Module 11.

Roughly, from lowest to highest:

| Component | Approx. z-index |
|---|---|
| Sticky/fixed elements | ~1020–1030 |
| Offcanvas | ~1045 |
| Modal backdrop | ~1050 |
| Modal | ~1055 |
| Popover | ~1070 |
| Tooltip | ~1080 |

**The practical implication:** your own custom `z-index` values (using the `.z-*` utilities above, or custom CSS) should almost never need to exceed roughly 10–20 for typical layered content — if you find yourself setting a z-index value in the hundreds to "beat" a Bootstrap component, you're fighting the framework instead of using its intended layering system.

## Position Utilities

Z-index is meaningless without positioning. Bootstrap provides positioning utilities matching the CSS `position` property from Book 03:

```html
<div class="position-relative">
  <span class="position-absolute top-0 end-0 badge bg-danger">New</span>
</div>
```

- `.position-static`, `.position-relative`, `.position-absolute`, `.position-fixed`, `.position-sticky` — set the `position` property directly
- `.top-0`, `.bottom-0`, `.start-0`, `.end-0` — position an absolutely/fixed positioned element flush against an edge (note: `start`/`end` respect text direction, relevant again in Module 11's RTL lesson)
- `.translate-middle` — combined with the above, centers an element exactly on a corner or edge, a common pattern for notification badges

## Practical Example — A Notification Badge on an Icon

```html
<div class="position-relative d-inline-block">
  <button class="btn btn-secondary">
    🔔
  </button>
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    9
    <span class="visually-hidden">unread notifications</span>
  </span>
</div>
```

`top-0 start-100 translate-middle` together place the badge exactly centered on the button's top-right corner — a combination you'll see constantly in real dashboards and apps.

## Revision Questions

<details>
<summary>1. Why is Bootstrap's own z-index utility scale (.z-0 through .z-3) intentionally small?</summary>
It's meant only for simple layering of your own page content — Bootstrap's internal components (modals, dropdowns, tooltips) use much higher z-index values defined separately, so the small utility scale doesn't need to compete with them.
</details>

<details>
<summary>2. What is the practical warning sign that you're "fighting the framework" with z-index?</summary>
If you find yourself setting a custom z-index value in the hundreds just to appear above a Bootstrap component, you're working against Bootstrap's intended layering system instead of using it.
</details>

<details>
<summary>3. What does .translate-middle typically get combined with, and what effect does that combination produce?</summary>
It's typically combined with top-0/bottom-0 and start-0/end-100 positioning classes to center an element exactly on a corner or edge — the standard pattern for notification badges.
</details>
