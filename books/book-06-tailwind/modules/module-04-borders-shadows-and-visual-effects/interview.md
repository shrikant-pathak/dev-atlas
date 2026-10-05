# Module 04 Interview Questions — Borders, Shadows & Visual Effects

**Q1: Explain the practical difference between `outline-*` and `ring-*`, and describe a scenario where the choice between them actually matters.**
`outline-*` uses the native CSS `outline` property; `ring-*` uses `box-shadow`. They look visually similar but behave differently when combined with an actual `box-shadow`-based drop shadow (`shadow-*`) on the same element — `ring-*` stacks cleanly with `shadow-*` since both use `box-shadow` and Tailwind layers them together, while an `outline` can visually clash or look disconnected from a shadow since it's a separate rendering mechanism. A button that needs both a resting drop shadow and a focus ring is the clearest case where `ring-*` is the better choice.

**Q2: A team migrating from Tailwind v3 to v4 reports that several components' focus rings look "too thin" after the upgrade. What's the likely cause, and what's the fix?**
v4 changed the bare `ring` class's default width from 3px (v3) to 1px. Any component relying on bare `ring` without an explicit width utility will render thinner after the upgrade. The fix is to explicitly specify the intended width, e.g., replacing `ring` with `ring-2` (or whatever width matches the design's previous appearance) wherever it was previously relied on implicitly.

**Q3: What's the difference between `opacity-50` and `bg-white/50` applied to the same card component, and which would you choose for a "disabled" state versus a translucent overlay?**
`opacity-50` dims the entire element, including all child content (text, icons, everything), uniformly — appropriate for a disabled state, where you want everything to visually read as "unavailable" together. `bg-white/50` (the Module 03 slash syntax) only affects the background color's opacity, leaving child content fully opaque — appropriate for an overlay or backdrop, where you want the dimming layer translucent but anything layered on top of it to stay fully legible.

**Q4: Why does `backdrop-blur-md` have no visible effect if applied to an element with a fully opaque background color?**
Backdrop filters affect whatever is rendered behind the element, as seen through the element's own transparency. With a fully opaque background, there's nothing visible behind the element for the viewer to see, so the blur effect — which only applies to that behind-the-element content — has nothing to visibly act on.

**Q5: What capability did Tailwind v4 add that lets you build a 3D flip-card effect using only utility classes, and what would this have required in v3?**
v4 added first-class 3D transform utilities: `rotate-x-*`/`rotate-y-*`/`rotate-z-*`, `perspective-*`, `transform-3d` (enabling `transform-style: preserve-3d`), and `backface-hidden`. In v3, these CSS properties weren't exposed as utilities at all, so achieving the same effect required arbitrary values for each raw CSS property individually.

**Q6: Why is `drop-shadow-*` sometimes preferred over `shadow-*` for an image or icon with transparent areas?**
`shadow-*` casts a shadow based on the element's rectangular box — including any transparent padding around an irregularly-shaped image, like a logo with transparency. `drop-shadow-*` is filter-based and follows the element's actual visible, non-transparent silhouette instead, producing a shadow that matches the real shape of the content rather than its bounding box.
