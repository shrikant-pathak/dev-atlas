# Module 01 Quiz — Tailwind Fundamentals & Setup

**1. In utility-first CSS, what does a class like `p-4` do?**
a) Applies a pre-built padding component
b) Sets a single CSS property (padding) to a value from Tailwind's spacing scale
c) Imports a padding preset from a config file
d) Nothing without additional configuration

**2. What does Tailwind ship by default, unlike Bootstrap?**
a) Pre-styled components like `.btn` and `.card`
b) No components at all — only utility classes
c) A required JavaScript config file
d) A fixed, unchangeable color palette

**3. Which package(s) do you install for the Vite plugin method?**
a) `tailwindcss` only
b) `tailwindcss` and `@tailwindcss/cli`
c) `tailwindcss` and `@tailwindcss/vite`
d) `@tailwindcss/postcss` only

**4. Why should the Play CDN never be used in production?**
a) It doesn't support any colors
b) It requires a paid license
c) It compiles styles client-side on every page load instead of using a pre-built CSS file
d) It only works in Chrome

**5. What single line replaces v3's three `@tailwind` directives in v4?**
a) `@tailwind all;`
b) `@import "tailwindcss";`
c) `@use "tailwindcss";`
d) `@include tailwind;`

**6. What does Preflight do?**
a) Adds default component styles
b) Resets browser default styling (margins, heading sizes, list bullets, etc.)
c) Minifies the final CSS output
d) Generates a `tailwind.config.js` file

**7. Why does `` className={`bg-${color}-500`} `` fail to apply any styling?**
a) Template literals aren't supported in JSX
b) Tailwind only sees the literal source string, never the interpolated runtime value, so no matching CSS is generated
c) `bg-` utilities require a config change
d) React strips dynamic class names automatically

**8. What replaced v3's `content` array in v4?**
a) Manual glob patterns are now required in `vite.config.ts`
b) Automatic content detection — no configuration needed for most projects
c) A `.tailwindignore` file
d) Nothing — the `content` array is still required

**9. What does `prettier-plugin-tailwindcss` do?**
a) Minifies your CSS output
b) Automatically sorts utility classes into a consistent order on save
c) Generates a Tailwind config file
d) Validates color contrast ratios

**10. What is the v4 replacement for v3's `safelist` config array, used to force-generate classes that never appear as literal strings?**
a) `@apply` directive
b) `@source inline(...)` directive
c) `!important` modifier
d) `@layer` directive

---
### Answer Key
1-b, 2-b, 3-c, 4-c, 5-b, 6-b, 7-b, 8-b, 9-b, 10-b
