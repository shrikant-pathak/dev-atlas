# Module 12 Quiz

1. Which inclusion method for Bootstrap Icons best fits a project already using a Module 11 custom Sass build?
   a) CDN webfont only  b) npm package, imported into the Sass build  c) Inline SVG only, never CDN  d) It makes no difference
   **Answer: b) npm package, imported into the Sass build**

2. Why does an SVG icon need `fill="currentColor"` while a webfont icon (`<i class="bi bi-*">`) doesn't?
   a) SVGs don't support color at all  b) Webfont icons behave like text and inherit CSS color directly; SVGs need explicit inheritance via fill  c) It's arbitrary, both need it  d) Webfont icons are always black
   **Answer: b) Webfont icons behave like text and inherit CSS color directly; SVGs need explicit inheritance via fill**

3. When should an icon get ONLY `aria-hidden="true"`, without an accompanying `.visually-hidden` span?
   a) Never, both are always required together  b) When adjacent visible text already conveys the icon's meaning  c) Only for SVG icons  d) Only for webfont icons
   **Answer: b) When adjacent visible text already conveys the icon's meaning**

4. What naming pattern do Bootstrap's custom JS component events follow?
   a) `bs-{component}-{stage}`  b) `{stage}.bs.{component}`  c) `on{Component}{Stage}`  d) `{component}:{stage}`
   **Answer: b) `{stage}.bs.{component}`**

5. What does `bootstrap.Modal.getInstance(element)` do?
   a) Creates a brand new modal instance  b) Retrieves an already-initialized component instance without duplicating it  c) Destroys the modal  d) Only works on Bootstrap 4
   **Answer: b) Retrieves an already-initialized component instance without duplicating it**

6. When is the Bootstrap JS API preferred over the data-attribute toggle pattern?
   a) Always, data attributes are deprecated  b) When a component must open/close as a result of application logic rather than a direct user click  c) Never, data attributes always suffice  d) Only for modals
   **Answer: b) When a component must open/close as a result of application logic rather than a direct user click**

7. In the capstone project, what module's technique keeps the dark-mode preference consistent across all three pages?
   a) Module 08 (toasts)  b) Module 10's localStorage-based toggler (Lesson 04)  c) Module 05 (forms)  d) Module 07 (navbar)
   **Answer: b) Module 10's localStorage-based toggler (Lesson 04)**

8. Why build the shared navbar/footer and theme setup before individual capstone pages?
   a) It's required by Bootstrap  b) To catch integration issues early while the project is still small  c) It has no real benefit, order doesn't matter  d) Pages can't share a navbar otherwise
   **Answer: b) To catch integration issues early while the project is still small**

9. Which module's component is used for the capstone services page's "Book now" flow?
   a) Module 06 badges  b) Module 08 modal + Module 05 validated form  c) Module 07 breadcrumb only  d) Module 04 spacing utilities
   **Answer: b) Module 08 modal + Module 05 validated form**

10. What four cross-cutting requirements apply to every page in the capstone project?
    a) Icons, colors, fonts, borders  b) Custom Sass theme, dark mode, accessibility patterns, full responsiveness  c) Only accessibility and responsiveness  d) None, each page is independent
    **Answer: b) Custom Sass theme, dark mode, accessibility patterns, full responsiveness**
