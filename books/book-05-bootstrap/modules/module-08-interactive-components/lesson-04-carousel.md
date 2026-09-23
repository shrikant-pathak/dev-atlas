# Lesson 04: Carousel

## Learning Objectives
- Build a basic image carousel with `.carousel`, `.carousel-inner`, `.carousel-item`
- Add indicators, controls, and captions
- Control autoplay behavior with `data-bs-ride` and `data-bs-interval`
- Add crossfade transitions instead of the default slide
- Understand accessibility concerns specific to auto-rotating content

## Introduction
The carousel is the most animation-heavy component in this book so far, cycling through a set of slides automatically or via user-controlled arrows/indicators. It's also a good moment to discuss a real accessibility tension: auto-rotating content can be genuinely difficult for some users (those with cognitive or vestibular conditions, or simply anyone trying to read at their own pace), so this lesson treats accessible configuration as a first-class concern, not an afterthought.

## Basic Structure
```html
<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="slide1.jpg" class="d-block w-100" alt="First slide">
    </div>
    <div class="carousel-item">
      <img src="slide2.jpg" class="d-block w-100" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img src="slide3.jpg" class="d-block w-100" alt="Third slide">
    </div>
  </div>
</div>
```

Exactly one `.carousel-item` must carry `.active` at a time — this marks which slide is currently visible, and Bootstrap's JS moves this class between items as the carousel advances. `.d-block w-100` on each image are the same display and sizing utilities from Modules 02/04 — images are `inline` by default, which introduces unwanted extra spacing below them inside a flex/block layout, so `.d-block` is a standard fix seen throughout Bootstrap's own image-in-component examples.

## Controls (Previous/Next Arrows)
```html
<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
  <span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
  <span class="carousel-control-next-icon" aria-hidden="true"></span>
  <span class="visually-hidden">Next</span>
</button>
```

`data-bs-slide="prev"`/`"next"` are the specific values here, distinct from the toggle-family attributes you've used elsewhere — carousels use their own dedicated data-attribute vocabulary since "advance one slide in a direction" isn't a generic show/hide toggle. `.visually-hidden` (Module 05) again supplies text for the icon-only control buttons, same pattern as the notification badge and split-dropdown toggle you've seen before.

## Indicators
```html
<div class="carousel-indicators">
  <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" 
          aria-current="true" aria-label="Slide 1"></button>
  <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
  <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
</div>
```

`data-bs-slide-to` jumps directly to a specific slide index (zero-based) rather than advancing one step at a time — a different mechanism from `data-bs-slide="prev/next"` on the arrow controls.

## Captions
```html
<div class="carousel-item active">
  <img src="slide1.jpg" class="d-block w-100" alt="First slide">
  <div class="carousel-caption d-none d-md-block">
    <h5>First slide label</h5>
    <p>Some representative placeholder content.</p>
  </div>
</div>
```

`.d-none .d-md-block` is a common real-world pairing here: hide captions on small screens where they'd crowd a narrow image, but show them from `md` up where there's enough room — the same responsive display utility pattern from Module 02.

## Autoplay Control
```html
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
```

`data-bs-ride="carousel"` starts autoplay on page load; `data-bs-interval` sets milliseconds between automatic slide changes. To disable autoplay entirely and require manual navigation only, simply omit `data-bs-ride` — a genuinely important accessibility option given the concerns raised in this lesson's introduction. Bootstrap's carousel JS also automatically pauses autoplay on hover/focus by default, giving users a way to read content at their own pace even when autoplay is enabled.

## Crossfade Transition
Replace the default slide animation with a fade:

```html
<div id="carouselFade" class="carousel slide carousel-fade">
```

## Practical Example
An accessible product image carousel with controls, indicators, and no forced autoplay:

```html
<div id="productCarousel" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" 
            class="active" aria-current="true" aria-label="View 1"></button>
    <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="View 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="product-front.jpg" class="d-block w-100" alt="Product front view">
    </div>
    <div class="carousel-item">
      <img src="product-side.jpg" class="d-block w-100" alt="Product side view">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
```

Note there's no `data-bs-ride="carousel"` here — for a product image gallery, manual user-controlled navigation is generally the more appropriate and accessible choice than forced autoplay.

## Revision Questions

<details>
<summary>1. What must be true about the `.active` class across a carousel's `.carousel-item` elements at any given moment?</summary>
Exactly one `.carousel-item` must carry `.active` at a time, marking the currently visible slide; Bootstrap's JS moves this class between items as the carousel advances.
</details>

<details>
<summary>2. What's the difference between `data-bs-slide="prev"` and `data-bs-slide-to="2"`?</summary>
`data-bs-slide="prev"`/`"next"` advances one slide at a time in a direction (used on the arrow controls); `data-bs-slide-to` jumps directly to a specific zero-based slide index (used on indicators).
</details>

<details>
<summary>3. What accessibility concern motivates disabling `data-bs-ride="carousel"`, and what does Bootstrap do automatically even when autoplay is enabled?</summary>
Auto-rotating content can be difficult for users with cognitive or vestibular conditions, or anyone reading at their own pace; even with autoplay on, Bootstrap's carousel JS automatically pauses on hover/focus by default to mitigate this.
</details>

<details>
<summary>4. Why is `.d-none .d-md-block` a common pairing on carousel captions?</summary>
It hides captions on small screens where they'd crowd a narrow image, while showing them from the `md` breakpoint up where there's enough room — a responsive display utility pattern from Module 02.
</details>
