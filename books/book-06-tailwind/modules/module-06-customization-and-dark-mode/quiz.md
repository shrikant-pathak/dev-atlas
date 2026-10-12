# Module 06 Quiz — Customization & Dark Mode

15 questions. Answers at the bottom — try first!

**1.** By default, `dark:` follows…
- A) A `.dark` class
- B) `prefers-color-scheme`
- C) `localStorage`
- D) The viewport width

**2.** Where should the theme-applying script run to avoid a flash?
- A) End of `<body>`
- B) In `<head>`, before CSS paints
- C) After `DOMContentLoaded`
- D) In a `useEffect` only

**3.** Which makes `dark:` depend on a `.dark` class in v4?
- A) `darkMode: 'class'` in a JS config
- B) `@custom-variant dark (&:where(.dark, .dark *));`
- C) `@theme { --dark: class }`
- D) `<html dark>`

**4.** `--radius-card: 1rem` inside `@theme` creates…
- A) `card-radius`
- B) `rounded-card`
- C) `radius-card`
- D) Nothing; only colors work

**5.** `@theme static` means…
- A) Variables can't change
- B) Variables are always emitted even if unused
- C) Variables are only for JS
- D) Variables skip Preflight

**6.** `--color-*: initial;` does what?
- A) Resets one color
- B) Removes all default colors
- C) Makes colors transparent
- D) Imports the default palette

**7.** Which rescales *all* numeric spacing utilities?
- A) `--spacing`
- B) `--space-scale`
- C) `--base-unit`
- D) `--gap`

**8.** In v4, which is correct for `!important`?
- A) `!bg-red-500` (required)
- B) `bg-red-500!`
- C) `bg-red-500-important`
- D) `important:bg-red-500`

**9.** Which class works reliably?
- A) `` `bg-${color}-500` ``
- B) A lookup map of full class strings
- C) `` `w-[${px}px]` ``
- D) `"bg-" + color`

**10.** Why is `@utility` preferred over `@layer utilities` for custom classes in v4?
- A) It's shorter
- B) It registers a real utility that works with variants
- C) `@layer` is deprecated in CSS
- D) It's faster to compile

**11.** What does `@slot` do?
- A) Declares a Vue slot
- B) Marks where a utility's styles go inside a custom variant block
- C) Defines a layer
- D) Imports a plugin

**12.** `@apply` inside a Vue SFC `<style>` needs…
- A) `@import "tailwindcss"` again
- B) `@reference "path/to/app.css"`
- C) `@source`
- D) Nothing

**13.** Unlayered CSS compared with `utilities` layer styles:
- A) Always loses
- B) Always wins
- C) Depends on specificity only
- D) Is ignored

**14.** Which replaces `safelist` in v4.1+?
- A) `@plugin safelist`
- B) `@source inline("…")`
- C) `@config safelist`
- D) `@utility safe`

**15.** Why use `@theme inline` for `--color-surface: var(--surface)`?
- A) It makes CSS smaller
- B) So scoped/nested overrides of `--surface` resolve correctly
- C) It's required for any color
- D) It disables dark mode

---

<details>
<summary>✅ Answers</summary>

1. **B** — `prefers-color-scheme`
2. **B** — in `<head>`, before paint
3. **B** — redefine with `@custom-variant`
4. **B** — `rounded-card`
5. **B** — always emitted
6. **B** — removes all default colors
7. **A** — `--spacing`
8. **B** — suffix `!`
9. **B** — full strings only; the others are built dynamically
10. **B** — `@utility` supports variants and values
11. **B** — marks the insertion point in a block-form custom variant
12. **B** — `@reference`
13. **B** — unlayered CSS beats all layers
14. **B** — `@source inline("…")`
15. **B** — the utility references the semantic variable directly where it's used

**Score:** 13–15 Excellent · 10–12 Good · below 10 → revisit Lessons 02, 05, 07 and 09.
</details>
