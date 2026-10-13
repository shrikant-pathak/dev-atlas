# Module 08 Exercises — Tailwind with Frameworks & Ecosystem

Create a **fresh project** for each framework exercise so you practice the setup.

## Part A — Setup (Lessons 01–02)

**1. React + Vite** — Create a React app, install Tailwind v4 with the Vite plugin, and prove it works. Then deliberately **break** it three ways (leave the template CSS in, forget the CSS import, use an old `@tailwind base;`) and write down the symptom of each.

**2. Tokens and alias** — Add a `brand` color scale and a `--font-display` token in `index.css`. Add the `@/` path alias and import a component through it.

**3. Vue + Vite** — Create a Vue app with Tailwind v4. Build `BaseButton.vue` with variant props and a `class` prop merged through `cn()`. Show a parent overriding `px-4` with `px-8`.

**4. Nuxt (optional)** — Set up Tailwind in Nuxt with the Vite plugin and a CSS entry file.

**5. Attribute-driven state** — In React *and* Vue, build an accordion using `aria-expanded` + `group-aria-expanded:`. Then reproduce the `data-active={false}` bug in both and fix it.

**6. Scoped `@apply`** — In a Vue `<style scoped>` block, use `@apply` with `@reference`. Remove `@reference` to see the error; then rewrite with CSS variables instead.

**7. Transition** — Build a dismissible alert in Vue with `<Transition>` and Tailwind classes. Rebuild the entry animation in React with `starting:`.

## Part B — Helpers (Lesson 03)

**8. `cn()` helper** — Install `clsx` and `tailwind-merge` (v3+). Prove each of these: `p-4`+`px-8`, two `bg-*` colors, `bg-red-500 hover:bg-blue-500`.

**9. Variants** — Build a `Button` with `cva` (0.7 API): `intent` (solid/outline/danger), `size` (sm/md/lg), a `compoundVariants` entry, and `defaultVariants`. Use it in React.

**10. Same in Vue** — Reuse the exact `buttonVariants` function in a Vue component.

**11. cva v1 beta (optional)** — Install `cva@beta`, create `cva.config.js` with `defineConfig({ cx })`, and port the button. Write down every API difference you hit.

**12. Custom token merge bug** — Add `--text-eyebrow` in `@theme`. Show `twMerge("text-eyebrow text-white")` misbehaving, then fix it with `extendTailwindMerge`.

**13. Data variants** — Rewrite the button's variants with `data-[intent=…]:` classes. Compare with the cva version: which would you choose, and why?

## Part C — Libraries and platforms (Lessons 04–06)

**14. Three dropdowns** — Build an account menu by hand, with Headless UI, and with daisyUI. Compare lines of code, keyboard behavior, and positioning near the viewport edge.

**15. shadcn/ui** — In your React app run the shadcn init, add `button` and `dialog`, then open the generated source. Find where `cva`, `cn` and `data-[state=…]` are used. Change a variant and add a new one.

**16. daisyUI theming** — Install daisyUI 5 with `light --default, dark --prefersdark`. Add a custom theme. Override a `btn` with a Tailwind utility using the `!` suffix.

**17. Typography** — Add `@tailwindcss/typography` and render a Markdown-sourced article with `prose`, `dark:prose-invert`, and one `not-prose` embedded widget.

**18. Plugin audit** — Take a plugin from an old tutorial (e.g., `@tailwindcss/container-queries`). Decide using the flowchart in Lesson 06 whether to install it, and justify.

**19. NativeWind (optional)** — Create an Expo app with NativeWind v5 RC (`npx rn-new@next --nativewind`). Build the `PlanCard`. Test iOS/Android/web, a dark-mode switch, and one class that doesn't apply on native.

## ⭐ Stretch Project — "Starter Kit"

Create a reusable starter that contains:

- Vite + React + Tailwind v4, aliases, `cn()`, tokens, dark mode with a blocking script
- `Button`, `Badge`, `Alert`, `Field` built with `cva`
- One shadcn/ui component and one Headless UI component styled with your tokens
- Prettier + IntelliSense configs
- A README with the commands and the version notes you verified

## ✅ Self-check

- [ ] No starter-template CSS remains
- [ ] Every component accepts `className`/`class` and merges it with `cn()`
- [ ] No class names are built dynamically
- [ ] I can state which package versions I'm using and why
- [ ] I checked each library's current docs before copying commands
