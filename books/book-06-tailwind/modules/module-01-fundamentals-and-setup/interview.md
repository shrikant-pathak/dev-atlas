# Module 01 Interview Questions — Tailwind Fundamentals & Setup

**Q1: What is utility-first CSS, and how does it differ from both traditional semantic CSS and a component framework like Bootstrap?**
Utility-first CSS composes single-purpose classes (each controlling one CSS property, like `flex` or `p-4`) directly in markup, instead of inventing semantic class names and writing separate CSS rules (traditional approach), or using pre-built, pre-styled components (Bootstrap's approach). Tailwind ships no components at all — every visual decision is composed from utilities, giving full control at the cost of having to build your own design system.

**Q2: Walk through what happens, end to end, when you add a new utility class to a component in a Vite-based Tailwind project.**
You save the file. Vite's dev server (via the `@tailwindcss/vite` plugin) detects the change, re-scans the file for class names as literal strings, finds the new class, and generates its corresponding CSS rule on the spot — appended to the styles Vite injects. No manual rebuild step, no `content` array to update, because v4 auto-detects scanned files.

**Q3: A teammate writes `` className={`text-${size}xl`} `` where `size` is a prop like `2`, `3`, or `4`. Their text isn't resizing at all in the browser. What's wrong, and how would you fix it?**
Tailwind's scanner only sees the literal source text `` `text-${size}xl` ``, never the interpolated value at runtime — so no complete class name like `text-2xl` ever appears as a literal string in the source, and no matching CSS is generated. The fix is a lookup object: `{ 2: 'text-2xl', 3: 'text-3xl', 4: 'text-4xl' }[size]`, so every possible complete class name appears literally in the source code.

**Q4: What is Preflight, and why might a client report that headings "look broken" (unstyled) immediately after adding Tailwind to an existing site?**
Preflight is Tailwind's built-in base reset, included automatically via `@import "tailwindcss"`. It resets headings to inherit `font-size` and `font-weight` rather than use browser defaults, along with removing default margins and list styling — so any existing site's headings, lists, and spacing will visually "break" the moment Tailwind is added, until they're re-styled explicitly with utility classes. This is expected behavior, not a bug.

**Q5: Why did Tailwind v4 remove the `content` array from configuration, and is there ever a case where you'd still need to tell Tailwind about files explicitly?**
v4 introduced automatic content detection — it scans a project's template files by default with sensible built-in rules (respecting `.gitignore`, skipping binaries), removing the common bug where a forgotten `content` glob pattern caused classes in an unlisted file to never generate. For genuine edge cases — files outside the normal scan path, or explicitly injecting classes that never appear literally anywhere — v4 exposes the `@source` directive (and `@source inline(...)` for the latter case) as an explicit override.

**Q6: Why should the Tailwind Play CDN never be used in a production deployment?**
It ships the entire Tailwind compiler as client-side JavaScript and recompiles styles in the browser on every page load, instead of shipping a small, pre-generated CSS file from a real build step — resulting in a much larger payload, slower runtime performance, and unreliable support for full customization compared to any of the real installation methods (Vite, CLI, PostCSS).
