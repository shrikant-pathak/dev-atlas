# Module 11 Interview Questions

1. **Why can't a CSS custom property override alone (Module 10) achieve everything a Sass-level customization can?**
   Expected answer: some component internals reference derived variables calculated by Sass at build time; a runtime CSS override of a base variable doesn't recalculate those already-compiled derived values, which requires a fresh Sass compilation instead.

2. **Explain exactly why override order matters when customizing Bootstrap's Sass variables.**
   Expected answer: Bootstrap's internal variables are declared with `!default`, meaning they only take their stated value if not already assigned; defining your own value BEFORE Bootstrap's `@import` means Bootstrap's own default assignment is skipped in favor of yours.

3. **What happens when you add a new key to the `$theme-colors` Sass map, and why is that powerful?**
   Expected answer: an entire new set of consistent utility classes and component variants (`.btn-{name}`, `.text-{name}`, `.bg-{name}`, etc.) is automatically generated across the framework from one map entry, without writing any of those classes by hand.

4. **Why are `functions`, `variables`, `maps`, `mixins`, and `root` never safe to omit in a selective import, even for a minimal build?**
   Expected answer: they're shared foundational files every other partial depends on (helper functions, variable/map definitions, reusable Sass logic, generated root CSS variables), so omitting any of them breaks whatever is imported after them.

5. **What is `_root.scss`'s role in connecting Sass variables to CSS custom properties?**
   Expected answer: it's the file that takes Sass variable values and generates the actual `:root { --bs-*: ...; }` CSS custom property declarations, which is what makes those values exposed and runtime-mutable at all.

6. **When would you choose a Sass variable override versus a CSS custom property override for a given customization need?**
   Expected answer: Sass for permanent, build-time decisions (brand color, project-wide font); CSS custom properties for dynamic, runtime changes that shouldn't require a rebuild (dark mode, per-user preferences).

7. **What's the real tradeoff of selectively importing only used Bootstrap partials, beyond the file-size benefit?**
   Expected answer: it requires knowing in advance exactly what will be used and remembering every needed import; a forgotten import silently produces no CSS output, adding development friction compared to the more forgiving full-import approach.

8. **Why does logical CSS property naming (`.ms-auto`, `.border-start`) matter specifically for RTL support?**
   Expected answer: logical properties refer to a side relative to the current reading direction rather than a fixed screen side, so the exact same class names automatically flip correctly between LTR and RTL layouts with zero markup changes required.
