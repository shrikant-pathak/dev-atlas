# Images

## Learning Objectives
- Make images responsive with `.img-fluid`
- Apply shape utilities: rounded corners, circles, and thumbnails
- Align images using float and centering utilities
- Understand how Bootstrap's image classes relate to the `object-fit` concepts from Book 03

## Introduction

In Book 03's Box Model module, you learned `object-fit` and `object-position` for controlling how images fill their containers, plus writing your own `max-width: 100%` rule for responsiveness. Bootstrap packages the most common of these patterns into simple utility classes.

## Making Images Responsive

```html
<img src="photo.jpg" class="img-fluid" alt="A responsive photo">
```

`.img-fluid` applies `max-width: 100%` and `height: auto` — the image scales down to fit its parent container but never stretches beyond its natural size. This should be your default for nearly every image in a Bootstrap project; without it, a large image can overflow its container and break your grid layout.

## Shape Utilities

```html
<img src="photo.jpg" class="img-fluid rounded" alt="Rounded corners">
<img src="photo.jpg" class="img-fluid rounded-circle" alt="Circular crop">
<img src="photo.jpg" class="img-thumbnail" alt="Thumbnail with border and padding">
```

- `.rounded` — applies a moderate `border-radius`
- `.rounded-circle` — crops the image into a perfect circle (works best with a square source image)
- `.img-thumbnail` — adds a light border, padding, and rounded corners, evoking a classic "photo frame" look

## Image Alignment

```html
<!-- Float-based alignment -->
<img src="photo.jpg" class="rounded float-start me-3" alt="">
<p>Text wraps around the floated image, exactly like the float behavior from Book 03's Positioning module.</p>

<!-- Block-level centering -->
<img src="photo.jpg" class="rounded mx-auto d-block" alt="">
```

Note the last example: `.mx-auto` (horizontal auto margins, from Book 03's Box Model) only centers a **block-level** element, which is why `.d-block` is paired alongside it — images are `inline` by default, so without `.d-block`, `.mx-auto` would have no centering effect.

## Practical Example — A Profile Card with a Circular Avatar

```html
<div class="card text-center p-4" style="max-width: 300px;">
  <img src="avatar.jpg" class="rounded-circle mx-auto d-block mb-3" style="width: 100px; height: 100px; object-fit: cover;" alt="Profile photo">
  <h5 class="card-title mb-0">Jane Doe</h5>
  <p class="text-muted">Product Designer</p>
</div>
```

Notice `object-fit: cover` here is plain CSS from Book 03 — Bootstrap's `.rounded-circle` only handles the shape, not how a non-square image fills that shape, so the two techniques combine naturally.

## Revision Questions

<details>
<summary>1. What does .img-fluid actually apply under the hood?</summary>
max-width: 100% and height: auto — letting the image scale down to fit its container without overflowing, but never scale up beyond its natural size.
</details>

<details>
<summary>2. Why is .d-block necessary alongside .mx-auto to center an image?</summary>
Images are inline elements by default, and mx-auto (auto horizontal margins) only has a centering effect on block-level elements — so .d-block is needed to change the image's display type first.
</details>

<details>
<summary>3. What's the difference between .rounded and .rounded-circle?</summary>
.rounded applies a moderate border-radius for softened corners; .rounded-circle crops the image into a full circle, which works best when the source image is square.
</details>
