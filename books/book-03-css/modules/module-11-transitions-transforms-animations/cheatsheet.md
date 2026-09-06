# Module 11 Cheatsheet — Transitions, Transforms & Animations

## Transitions
```css
transition: PROPERTY DURATION TIMING-FUNCTION DELAY;
transition: transform 0.2s ease, box-shadow 0.3s ease-out;
```
Timing functions: `linear`, `ease-in`, `ease-out`, `ease-in-out`, `cubic-bezier()`

## 2D Transforms
```css
transform: translate(x, y);
transform: rotate(45deg);
transform: scale(1.1);
transform: skewX(-15deg);
transform-origin: top left; /* default: center center */
```

## 3D Transforms
```css
.scene { perspective: 800px; }
transform: rotateX(45deg);
transform: rotateY(45deg);
transform: translateZ(50px);
backface-visibility: hidden;
transform-style: preserve-3d;
```

## Keyframe Animations
```css
@keyframes pulse {
  0%   { transform: scale(1); }
  50%  { transform: scale(1.1); }
  100% { transform: scale(1); }
}
.badge {
  animation: pulse 2s ease-in-out infinite;
  animation-fill-mode: forwards;
  animation-direction: alternate;
}
```
Prefer animating `transform` and `opacity` — avoid animating `width`/`top`/`margin` for performance.

## Scroll Snap
```css
.container {
  scroll-snap-type: x mandatory; /* or y; mandatory | proximity */
  overflow-x: auto;
  scroll-padding-top: 60px; /* offset for sticky header */
}
.item { scroll-snap-align: start; /* center | end */ }
html { scroll-behavior: smooth; }
```
