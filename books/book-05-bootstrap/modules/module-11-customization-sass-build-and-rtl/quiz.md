# Module 11 Quiz

1. What must be installed as a dev dependency to compile `.scss` files into CSS?
   a) `bootstrap`  b) `sass`  c) `popper`  d) `webpack`
   **Answer: b) `sass`**

2. Where must your own Sass variable overrides be placed relative to Bootstrap's `@import`?
   a) After  b) Before  c) Position doesn't matter  d) In a separate file entirely, never combined
   **Answer: b) Before**

3. What Sass flag allows your own variable value to take precedence over Bootstrap's built-in default?
   a) `!important`  b) `!default`  c) `!override`  d) Nothing needed, it's automatic
   **Answer: b) `!default`**

4. What happens when you add a new entry to the `$theme-colors` map?
   a) Nothing, it must be added elsewhere too  b) A full set of utility/component classes for that color is auto-generated  c) It replaces `$primary` automatically  d) It only affects buttons
   **Answer: b) A full set of utility/component classes for that color is auto-generated**

5. Which files are never safe to omit from a selective Bootstrap Sass import?
   a) `card`, `alert`, `modal`  b) `functions`, `variables`, `maps`, `mixins`, `root`  c) Only `variables`  d) None are required
   **Answer: b) `functions`, `variables`, `maps`, `mixins`, `root`**

6. What's the key difference between a Sass variable and a CSS custom property?
   a) They're the same thing  b) Sass variables exist only at build time; CSS custom properties exist at runtime in the browser  c) CSS custom properties are faster  d) Sass variables can be changed via DevTools
   **Answer: b) Sass variables exist only at build time; CSS custom properties exist at runtime in the browser**

7. What file generates Bootstrap's `:root { --bs-*: ...; }` CSS custom properties from Sass variable values?
   a) `_variables.scss`  b) `_root.scss`  c) `_mixins.scss`  d) `_utilities.scss`
   **Answer: b) `_root.scss`**

8. What does setting a `$utilities` map entry to `null` do?
   a) Sets its default value  b) Removes that utility's class generation entirely  c) Makes it responsive  d) Nothing, it's ignored
   **Answer: b) Removes that utility's class generation entirely**

9. What Sass variable enables generating an RTL-flipped Bootstrap build?
   a) `$flip: true`  b) `$rtl: true`  c) `$direction: rtl`  d) `$mirror: true`
   **Answer: b) `$rtl: true`**

10. Which of these does RTL conversion NOT handle automatically?
    a) `.ms-auto` flipping sides  b) `.border-start` flipping sides  c) An icon's visual direction (e.g. a "next" arrow)  d) `.offcanvas-start` flipping sides
    **Answer: c) An icon's visual direction (e.g. a "next" arrow)**
