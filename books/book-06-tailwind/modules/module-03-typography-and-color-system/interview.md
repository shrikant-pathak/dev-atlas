# Module 03 Interview Questions — Typography & Color System

**Q1: What problem does the `@tailwindcss/typography` plugin solve, and why can't you just rely on Preflight's default styling for the same content?**
Preflight deliberately strips default styling (headings, lists, spacing) so developers can style every element explicitly with utilities. This breaks down for raw, uncontrolled HTML content — like Markdown-rendered blog posts or CMS fields — where you can't add individual classes to each element a content editor creates. The `prose` class from `@tailwindcss/typography` solves this by applying a complete typographic treatment via descendant selectors targeting raw tags, without requiring any classes on the inner content itself.

**Q2: Explain why Tailwind v4 switched its default color palette to OKLCH, and whether this changes how a developer writes color classes day to day.**
OKLCH is a perceptually uniform color space, meaning equal numeric steps correspond more closely to equal perceived lightness changes than RGB does — giving more visually consistent shade scales — and it supports a wider color gamut (P3), producing more vivid colors on modern displays with automatic fallback on older ones. Day-to-day class usage (`bg-blue-500`, etc.) is unchanged; the difference is purely in how the underlying palette values are defined, and becomes relevant once a developer starts customizing colors themselves.

**Q3: A developer writes `bg-black bg-opacity-50` in a new Tailwind v4 project and it doesn't behave as expected. What's wrong, and what should they write instead?**
`bg-opacity-*` is a legacy v3 utility; in v4 it's been superseded by the slash opacity syntax applied directly to the color utility. They should write `bg-black/50` instead, which bakes the opacity directly into the generated color value rather than relying on a separate utility and shared CSS custom property.

**Q4: What's the difference between `truncate` and `line-clamp-3`, and when would you choose one over the other?**
`truncate` clips text to a single line with an ellipsis, requiring the element to have a constrained width. `line-clamp-3` clips text after a specific number of lines (three, in this case), also showing an ellipsis at the cutoff. Choose `truncate` for short, single-line text like a title; choose `line-clamp-*` for multi-line body content, like a card description, where you want to preserve some context rather than cutting off after the very first line.

**Q5: Why might a heading styled with `font-black` render at a lighter weight than expected?**
`font-black` sets `font-weight: 900`, but that weight only renders correctly if the currently loaded font actually includes a 900-weight file. If a custom web font was loaded without that specific weight variant, the browser substitutes the closest available weight instead, making the utility appear to have no effect even though the class itself is applied correctly.

**Q6: What's the purpose of `text-balance`, and why wouldn't you typically apply it to a long body paragraph?**
`text-balance` redistributes words across all wrapped lines so their lengths look visually even — ideal for short headlines where an unbalanced wrap can leave one line much shorter than the others. It's not typically used on long body paragraphs because recalculating balanced line lengths across many lines is computationally more expensive and the visual benefit is much less noticeable than on a short headline; `text-pretty` (which only addresses the final line's orphan word) is the better fit for longer body content.
