# Lesson 07: Transforms (2D and 3D)

## Learning Objectives
- Apply 2D transform utilities: scale, rotate, translate, and skew
- Apply v4's native 3D transform utilities, a capability not available in v3
- Set transform origin to control the pivot point of a transform

## Introduction
Transforms move, resize, rotate, or skew an element visually without affecting the normal document flow — unlike changing `width`/`height`/`top`/`left` directly, a transformed element doesn't push or reposition its siblings. This lesson covers Tailwind's full transform vocabulary, including 3D capabilities that v4 added as first-class utilities.

## 2D Transforms

```html
<div class="scale-105">Slightly larger</div>
<div class="rotate-45">Rotated 45 degrees</div>
<div class="translate-x-4">Shifted right 1rem</div>
<div class="skew-x-6">Slightly slanted</div>
```

| Class | Effect |
|---|---|
| `scale-{n}` (`scale-95`, `scale-100`, `scale-105`, `scale-110`, etc.) | resize, as a percentage |
| `scale-x-*`/`scale-y-*` | resize on one axis only |
| `rotate-{deg}` | rotate (positive = clockwise) |
| `translate-x-*`/`translate-y-*` | shift position, using the spacing scale |
| `skew-x-*`/`skew-y-*` | slant along one axis |

These combine naturally with Lesson 6's transitions for interactive effects:

```html
<button class="transition-transform duration-200 hover:scale-105 active:scale-95">
  Press me
</button>
```

A very common pattern: slightly growing on hover (`hover:scale-105`) and slightly shrinking on active/press (`active:scale-95`), giving tactile, responsive-feeling feedback.

## Transform Origin

By default, transforms pivot from an element's center. `origin-*` changes this pivot point:

```html
<div class="origin-top-left rotate-12">Rotates around its top-left corner instead of center</div>
```

Values include `origin-center` (default), `origin-top`, `origin-top-right`, `origin-right`, `origin-bottom-right`, `origin-bottom`, `origin-bottom-left`, `origin-left`, `origin-top-left`.

## 3D Transforms (New First-Class Utilities in v4)

v3's transform utilities were effectively 2D-only — achieving a true 3D effect (rotating an element in 3D space, with perspective) required falling back to arbitrary values for properties like `perspective` and `transform-style`. v4 added these as proper first-class utilities:

```html
<div class="perspective-distant">
  <div class="rotate-x-45 transform-3d">
    A card tilted in 3D space
  </div>
</div>
```

| Class | Effect |
|---|---|
| `rotate-x-*`/`rotate-y-*`/`rotate-z-*` | rotate around a specific 3D axis |
| `perspective-*` (`perspective-near`, `perspective-distant`, etc., or arbitrary) | sets how pronounced the 3D effect looks, applied to the parent |
| `transform-3d` | enables `transform-style: preserve-3d`, needed for nested 3D-transformed children to render correctly in 3D space together |
| `backface-hidden`/`backface-visible` | controls whether an element's "back" is visible when rotated past 90 degrees — relevant for flip-card effects |

A classic use case this enables directly as utilities: a "flip card" effect, where a card rotates 180 degrees on `rotate-y-*` to reveal a different face, using `backface-hidden` on both faces so each is only visible from its correct side.

## Practical Example

An interactive card with a hover-lift (2D) and a tilt effect achieved with a 3D rotation:

```html
<div class="perspective-distant">
  <div class="rounded-lg bg-white p-6 shadow-lg transition-transform duration-300 hover:rotate-x-6 hover:scale-105">
    <h3 class="font-semibold">Tilts on hover</h3>
  </div>
</div>
```

## Summary
2D transforms (`scale-*`, `rotate-*`, `translate-*`, `skew-*`) resize, rotate, move, or slant an element without affecting document flow; `origin-*` changes the pivot point. v4 added native 3D transform utilities (`rotate-x/y/z-*`, `perspective-*`, `transform-3d`, `backface-hidden`) as first-class classes, enabling effects like flip cards and 3D tilts that previously required arbitrary values in v3.

## Revision Questions

<details>
<summary>1. Why doesn't a `translate-x-8` shift on one element push its sibling elements out of position?</summary>

Transforms operate visually, outside the normal document flow calculation — the element's original space in the layout is preserved, and the transform only affects where its content is painted, not the layout positions of other elements.
</details>

<details>
<summary>2. What did achieving a 3D rotation effect require in Tailwind v3, before native 3D utilities existed?</summary>

Falling back to arbitrary values for raw CSS properties like `perspective` and `transform-style`, since v3's transform utilities were effectively 2D-only.
</details>

<details>
<summary>3. What role does `transform-3d` (enabling `transform-style: preserve-3d`) play in a nested 3D transform setup?</summary>

It's required on a parent element for its 3D-transformed children to render correctly together in shared 3D space — without it, nested children would be flattened back into 2D, losing the 3D positioning relative to each other.
</details>
