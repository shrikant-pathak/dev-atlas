# Lesson 03: Collapse

## Learning Objectives
- Understand `.collapse` as the general-purpose show/hide mechanism underlying accordions, navbars, and more
- Toggle a single element or multiple elements at once
- Build a horizontal collapse
- Use the collapse JavaScript API conceptually (data attributes vs. manual invocation)

## Introduction
This lesson formalizes something you've actually been using since Module 07's navbar and this module's accordion: `.collapse` is Bootstrap's single, general-purpose "smoothly show or hide this element" mechanism. Everywhere you've seen `data-bs-toggle="collapse"` so far has been a specific application of this same underlying component.

## Basic Collapse
```html
<button class="btn btn-primary" type="button" data-bs-toggle="collapse" 
        data-bs-target="#simpleCollapse" aria-expanded="false" aria-controls="simpleCollapse">
  Toggle content
</button>
<div class="collapse" id="simpleCollapse">
  <div class="card card-body">
    Some placeholder content revealed by the collapse.
  </div>
</div>
```

This is the exact same pattern as the navbar toggler (Module 07, Lesson 01) and the accordion button (Lesson 02) — because both of those ARE this component, just wrapped in more specific surrounding markup and classes.

## Toggling Multiple Targets at Once
`data-bs-target` accepts a CSS selector, not just a single id — you can toggle several elements simultaneously by targeting a shared class instead of one id, or by listing multiple selectors:

```html
<button class="btn btn-primary" type="button" data-bs-toggle="collapse" 
        data-bs-target=".multi-collapse" aria-expanded="false">
  Toggle both
</button>
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="collapseA">
      <div class="card card-body">Panel A</div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="collapseB">
      <div class="card card-body">Panel B</div>
    </div>
  </div>
</div>
```

## Horizontal Collapse
By default, `.collapse` animates height (vertical reveal). Add `.collapse-horizontal` to animate width instead:

```html
<button class="btn btn-primary" type="button" data-bs-toggle="collapse" 
        data-bs-target="#horizontalCollapse">
  Toggle width
</button>
<div class="collapse collapse-horizontal" id="horizontalCollapse">
  <div class="card card-body" style="width: 300px;">
    This panel expands horizontally instead of vertically.
  </div>
</div>
```

Note the explicit `width` set on the inner content — without a defined width, the browser has no meaningful target to animate toward for a horizontal expand, unlike vertical collapse where content naturally has a measurable height.

## Data Attributes vs. JavaScript API
Every example so far uses data attributes (`data-bs-toggle="collapse"`) — no custom JavaScript required. Bootstrap also exposes a full JavaScript API for triggering the same behavior programmatically, which becomes relevant once you're building components inside a JS framework (React, Vue) later in this curriculum, where declarative data-attributes are often replaced with imperative JS calls:

```javascript
const collapseElement = document.getElementById('simpleCollapse');
const bsCollapse = new bootstrap.Collapse(collapseElement, { toggle: false });
bsCollapse.show();  // or .hide(), or .toggle()
```

For a plain HTML/vanilla-JS project — which is the context of this entire book — the data-attribute approach is almost always sufficient and preferred, since it requires zero custom JavaScript. The JS API becomes genuinely necessary once component state needs to be driven by application logic rather than a direct user click, a distinction that will matter far more once you reach the React/Vue books later in the curriculum.

## Practical Example
A "Show more" content reveal — a common pattern for truncated text or optional details:

```html
<p>
  This product includes a 1-year warranty and free shipping.
  <a class="btn btn-link p-0" data-bs-toggle="collapse" href="#moreDetails" 
     role="button" aria-expanded="false" aria-controls="moreDetails">
    Show more
  </a>
</p>
<div class="collapse" id="moreDetails">
  <div class="card card-body">
    Extended warranty available for purchase. Free shipping applies to orders over $50 within the continental US.
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What relationship does this lesson's `.collapse` component have to the navbar toggler (Module 07) and the accordion (Lesson 02)?</summary>
Both of those are specific applications of this exact same underlying `.collapse` show/hide mechanism — not separate components, just this one wrapped in more specific surrounding markup.
</details>

<details>
<summary>2. How can a single button toggle two separate collapse panels at once?</summary>
By targeting a shared class (rather than a single id) with `data-bs-target`, e.g. `data-bs-target=".multi-collapse"`, applied to both panels.
</details>

<details>
<summary>3. Why does `.collapse-horizontal` require an explicit width on its inner content?</summary>
Vertical collapse can animate toward the content's naturally measurable height, but horizontal expansion has no equivalent natural target unless a width is explicitly defined for the browser to animate toward.
</details>

<details>
<summary>4. When would you reach for the JavaScript Collapse API instead of the data-attribute pattern?</summary>
When a component's open/closed state needs to be driven by application logic rather than a direct user click — a distinction that becomes especially relevant once building inside a framework like React or Vue, covered later in the curriculum.
</details>
