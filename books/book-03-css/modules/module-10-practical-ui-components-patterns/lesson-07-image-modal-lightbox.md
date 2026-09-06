# Lesson 07: Image Modal / Lightbox

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a CSS-only modal/lightbox using the `:target` pseudo-class.
- Center a modal using Flexbox.
- Add a dimmed backdrop overlay behind an open modal.

---

# Introduction

This module's final lesson combines nearly everything covered so far — positioning, Flexbox centering, opacity, transitions — into one cohesive, genuinely impressive component: an image lightbox that opens and closes without a single line of JavaScript, using a clever pseudo-class most developers don't discover until much later than they should.

---

# The `:target` Pseudo-Class

```css
.modal:target {
  display: flex;
}
```

`:target` matches an element whose `id` matches the current URL fragment (the part after `#`). This means a plain link like `<a href="#my-modal">` can "open" an element with `id="my-modal"` purely through browser navigation — no JavaScript click handler required.

---

# Building the Modal Structure

```html
<a href="#photo-modal" class="gallery-thumb">
  <img src="thumb.jpg" alt="Open larger photo">
</a>

<div id="photo-modal" class="modal">
  <a href="#" class="modal-backdrop"></a>
  <div class="modal-content">
    <img src="full-size.jpg" alt="Full-size photo">
    <a href="#" class="modal-close">✕</a>
  </div>
</div>
```
```css
.modal {
  display: none;
  position: fixed;
  inset: 0; /* shorthand for top/right/bottom/left: 0 */
  z-index: 1000;
  align-items: center;
  justify-content: center;
}

.modal:target {
  display: flex;
}

.modal-backdrop {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.75);
}

.modal-content {
  position: relative;
  z-index: 1;
  max-width: 90vw;
  max-height: 90vh;
}

.modal-content img {
  max-width: 100%;
  max-height: 90vh;
  border-radius: 4px;
}
```

Recall `position: fixed` and stacking context from Module 05 — `inset: 0` (a modern shorthand covering all four offset properties at once) makes both the modal wrapper and the backdrop fill the entire viewport. Recall Flexbox centering from Module 06 — `align-items: center` + `justify-content: center` on the `.modal` perfectly centers `.modal-content` regardless of the photo's actual dimensions.

---

# Closing the Modal

Both the backdrop and the close button link to a bare `#`, which clears the URL fragment — since nothing then matches `:target`, the modal's `display: none` default takes over again:

```html
<a href="#" class="modal-backdrop"></a>
<a href="#" class="modal-close">✕</a>
```

This is the entire "close" mechanism — no JavaScript, no event listeners, just the browser's own fragment-navigation behavior combined with `:target`.

---

# Adding a Fade Transition

```css
.modal {
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.2s ease;
}

.modal:target {
  opacity: 1;
  visibility: visible;
}
```

Recall `opacity` + `visibility` from Lesson 02's tooltip — swapping the `display: none`/`flex` toggle for an `opacity`/`visibility` toggle allows `transition` to actually animate the change smoothly, since `display` itself cannot be transitioned (a genuine CSS limitation worth remembering — Module 11 covers transitions in full).

---

# Practical Example: A Complete CSS-Only Lightbox Gallery

```html
<a href="#img1" class="gallery-thumb"><img src="thumb1.jpg" alt=""></a>
<a href="#img2" class="gallery-thumb"><img src="thumb2.jpg" alt=""></a>

<div id="img1" class="modal">
  <a href="#" class="modal-backdrop"></a>
  <div class="modal-content"><img src="full1.jpg" alt=""></div>
</div>
<div id="img2" class="modal">
  <a href="#" class="modal-backdrop"></a>
  <div class="modal-content"><img src="full2.jpg" alt=""></div>
</div>
```
```css
.modal {
  display: flex;
  position: fixed;
  inset: 0;
  align-items: center;
  justify-content: center;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.2s ease;
  z-index: 1000;
}

.modal:target {
  opacity: 1;
  visibility: visible;
}

.modal-backdrop {
  position: absolute;
  inset: 0;
  background: rgba(0,0,0,0.75);
}

.modal-content {
  position: relative;
  z-index: 1;
}

.modal-content img {
  max-width: 90vw;
  max-height: 90vh;
}
```

Each thumbnail links to its own `id`-matched modal — a genuinely full-featured lightbox gallery, fading smoothly in and out, entirely without JavaScript.

---

# Revision Questions

1. What does the `:target` pseudo-class match, and how does a plain link trigger it?
2. Why does the modal use `opacity`/`visibility` instead of `display` when a fade transition is wanted?
3. How does clicking the backdrop or close button actually close a `:target`-based modal?

<details><summary>Answers</summary>

1. `:target` matches the element whose `id` equals the current URL fragment (the part after `#`); a link like `<a href="#my-modal">` navigates the URL fragment to `#my-modal`, which then matches `:target` on the element with that `id`.
2. `display` cannot be animated with `transition` — it switches instantly between values — so `opacity`/`visibility`, which can be transitioned smoothly, are used instead to achieve a fade effect.
3. Both link to a bare `#`, clearing the URL fragment; since no element then matches that empty fragment, `:target` no longer applies and the modal reverts to its default hidden state.

</details>
