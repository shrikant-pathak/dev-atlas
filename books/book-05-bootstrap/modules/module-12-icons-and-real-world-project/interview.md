# Module 12 Interview Questions

1. **What are the three ways to include Bootstrap Icons, and when would you choose npm over the CDN webfont?**
   Expected answer: CDN webfont, npm package, or inline SVG/sprite; npm is preferable when the project already has a Module 11 custom Sass build, so icons compile into the same pipeline rather than adding a second external CDN dependency.

2. **Why does an SVG icon need `fill="currentColor"` to match its surrounding text color, while a webfont icon doesn't need anything special?**
   Expected answer: webfont icons render as font glyphs and inherit standard CSS color/font-size properties directly like any text; SVG icons are graphics, so `fill="currentColor"` is required to explicitly make them inherit the surrounding CSS `color` value.

3. **Walk through the difference in when to use `aria-hidden="true"` alone on an icon versus pairing it with a `.visually-hidden` span.**
   Expected answer: if adjacent visible text already conveys the icon's meaning, `aria-hidden="true"` alone suffices since the icon is purely decorative; if the icon is the only label present with no visible text, a `.visually-hidden` span must supply the accessible label alongside the still-`aria-hidden` icon.

4. **What naming convention do Bootstrap's custom JS events follow, and give an example from the modal component.**
   Expected answer: `{stage}.bs.{component}`; e.g. `show.bs.modal` (about to open), `shown.bs.modal` (fully open), `hide.bs.modal`/`hidden.bs.modal` for closing.

5. **When is the Bootstrap JavaScript API (e.g. `new bootstrap.Modal()`) necessary instead of the data-attribute pattern used throughout most of this book?**
   Expected answer: when a component's open/close state needs to be driven by application logic (form submission success, an API response) rather than a direct user click on a `data-bs-toggle` trigger element.

6. **In the capstone project's suggested build order, why is the shared navbar/footer and theme setup built before any individual page?**
   Expected answer: to catch integration issues (misconfigured CSS variables, script load order problems) early while the project is small, rather than discovering them later after multiple pages already depend on a broken shared foundation.

7. **Name at least three distinct modules whose components are combined on the capstone project's single landing page.**
   Expected answer: any three of — Module 07 (navbar), Module 09 (hero flex/spacing), Module 06 (feature cards), Module 08 (testimonial carousel), Module 05 (newsletter input group), Module 09 (footer stacks/vr).
