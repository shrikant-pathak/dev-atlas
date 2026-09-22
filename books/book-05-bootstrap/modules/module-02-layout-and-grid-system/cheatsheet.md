# Module 02 Cheatsheet — Layout & Grid System

## Containers
```html
<div class="container">      <!-- fixed responsive max-width -->
<div class="container-fluid"><!-- always 100% width -->
<div class="container-md">   <!-- fluid until md, then fixed -->
```

## Breakpoints
| sm | md | lg | xl | xxl |
|---|---|---|---|---|
| ≥576px | ≥768px | ≥992px | ≥1200px | ≥1400px |
(unprefixed classes = default/extra-small, <576px)

## Grid Basics
```html
<div class="row">
  <div class="col">Equal width</div>
  <div class="col-4">4 of 12 units</div>
  <div class="col-12 col-md-6 col-lg-4">Responsive</div>
</div>
```

## Offset / Order / Alignment
```html
<div class="col-md-4 offset-md-4">Centered</div>
<div class="col-md-6 order-md-2">Reordered</div>
<div class="row align-items-center">Vertically centered row</div>
<div class="col align-self-end">Self-aligned column</div>
```

## Gutters
```html
<div class="row g-3">        <!-- both directions -->
<div class="row gx-2 gy-4">  <!-- horizontal / vertical separately -->
<div class="row g-2 g-md-4"> <!-- responsive gutters -->
```

## Stacked-to-Horizontal Pattern
```html
<div class="col-12 col-md-6">Stacks on mobile, half-width from md up</div>
```

## Z-index & Position
```html
<div class="position-relative">
  <span class="position-absolute top-0 start-100 translate-middle z-2">Badge</span>
</div>
```
Bootstrap's own components (modal, dropdown, tooltip) use much higher internal z-index values — don't fight them with large custom values.
