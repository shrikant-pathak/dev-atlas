# Module 06 Exercises — Customization & Dark Mode

Use a Vite + Tailwind v4 project. Keep everything in one CSS entry file unless told otherwise.

## Part A — Warm-up (Lessons 01–03)

**1. System dark mode** — Build a card using `dark:` variants only (default strategy). Switch your OS theme and confirm it follows.

**2. Manual toggle** — Redefine `dark` with `@custom-variant` (class strategy) and build a light/dark/system toggle with `localStorage`. Reload the page: no flash of the wrong theme.

**3. Native UI** — Add a date input, a checkbox and a long scrolling area. Use `scheme-light dark:scheme-dark` and confirm the scrollbar and controls match the theme.

**4. Token set** — In `@theme`, define a `brand` color scale (50–950, OKLCH, constant hue), `--radius-card`, `--shadow-card` and `--font-display`. Use them in one component.

**5. Rescale spacing** — Change `--spacing` from `0.25rem` to `0.3rem`. What changed? Add `--spacing-gutter` and use `px-gutter`.

**6. Palette reset** — Use `--color-*: initial` and rebuild a small palette (white, black, ink 50–900, one accent). Try `bg-blue-500`: what happens?

## Part B — Core practice (Lessons 04–07)

**7. Arbitrary values** — Make a layout using `grid-cols-[200px_1fr_200px]`, `top-[calc(100%-2rem)]` and a CSS-variable-driven width `w-(--w)` set via a `style` prop.

**8. Dynamic class bug** — Reproduce `bg-${color}-500` in a React component and see it fail. Fix it three ways: lookup map, CSS variable, `@source inline`.

**9. Important & prefix** — Use `bg-red-500!` to beat a conflicting stylesheet. Then add `prefix(tw)` to a scratch project and convert three classes to `tw:` form.

**10. Custom utility** — Write `@utility no-scrollbar`, then a functional `@utility glow-*` accepting theme and arbitrary colors. Use `md:` and `hover:` on both.

**11. Custom variants** — Create `sidebar-open:` (driven by `data-sidebar`) and `compact:` (driven by `data-density`). Toggle both from JavaScript or React state.

**12. Layer trap** — Add a plain `.legacy { padding: 20px }` rule outside any layer and show it beating `p-2`. Fix it two ways.

**13. `@apply` in a framework** — In a Vue SFC `<style>` or a React CSS Module, use `@apply` with `@reference`. Then rewrite it using CSS variables only.

## Part C — Challenge (Lessons 08–09)

**14. Monorepo scan** — Create `packages/ui` and `apps/web`. Configure `@source` so the app sees the UI package's classes. Exclude a `fixtures` folder.

**15. Safelist replacement** — Use `@source inline("{hover:,}bg-{red,green}-{500,600}")` and confirm the classes exist in the build output.

**16. Semantic theme** — Build `--surface`, `--foreground`, `--primary` tokens for `light` and `dark`, expose them with `@theme inline`, and make a component page with **zero** `dark:` classes.

**17. Third theme + scoped theme** — Add an `ocean` theme via `[data-theme="ocean"]`. Then put one section on the page permanently in `midnight` regardless of the global theme.

## ⭐ Stretch Project — "Brand Studio"

Build a settings page where users can:

- Pick light / dark / system and a named theme (ocean, midnight)
- Choose an accent hue with a slider that updates a CSS variable live
- Toggle density (`compact:` custom variant)
- Preview all of it on a small sample dashboard
- Persist every choice in `localStorage`, applied before first paint

## ✅ Self-check

- [ ] Components use semantic tokens, not `dark:` everywhere
- [ ] No dynamic class names are built from strings
- [ ] Every custom utility works with `md:` and `hover:`
- [ ] No unlayered CSS fights with utilities
- [ ] The theme script lives in `<head>`
