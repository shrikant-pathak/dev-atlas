# Module 04 Exercises — Borders, Shadows & Visual Effects

## Exercise 1: Settings List with Dividers
Build a settings panel using `divide-y` between rows, `rounded-lg` on the outer container, and a `rounded-full` status pill on each row (reuse Module 03's color/opacity knowledge for the pill backgrounds).

## Exercise 2: Focus State Comparison
Build two versions of the same button: one using `outline-*` for its focus state, one using `ring-*`. Add a `shadow-md` to both and observe which one visually conflicts with the shadow and which stacks cleanly — explain why, referencing the underlying CSS property each uses.

## Exercise 3: Text Shadow Legibility
Build a hero section with a background image and a large heading. Without any text shadow, note how legible the text is over a busy part of the image. Add `text-shadow-lg` and compare — then try combining it with a gradient overlay from Module 03 and note how the two techniques work together.

## Exercise 4: Grayscale Hover Gallery
Build a 3-image gallery where each image is `grayscale` by default and transitions smoothly to full color (`grayscale-0`) on hover, using an appropriate `transition` and `duration-*`.

## Exercise 5: Frosted Glass Navigation
Build a hero image with `mask-b-from-70%` fading into the page background below it, and a navigation bar positioned over the top using `backdrop-blur-md` and a semi-transparent background, so the nav bar content stays sharp while the image behind it blurs.

## Exercise 6: Flip Card
Build a 3D flip-card effect: a card that rotates 180 degrees on `rotate-y-*` when hovered, using `transform-3d`, `backface-hidden` on both faces, and `perspective-*` on the parent, revealing a different face on each side.
