# Module 08 Quiz — Tailwind with Frameworks & Ecosystem

15 questions. Answers at the bottom. Try first!

**1.** Which package connects Tailwind v4 to Vite?
- A) `@tailwindcss/postcss`
- B) `@tailwindcss/vite`
- C) `tailwind-vite`
- D) `postcss-tailwind`

**2.** Your fresh Vite React app looks centered and odd after adding Tailwind. Most likely cause?
- A) Tailwind v4 bug
- B) Template CSS (`index.css`, `App.css`) still present
- C) Missing `tailwind.config.js`
- D) React 19

**3.** Which of these works reliably in JSX?
- A) `` className={`bg-${color}-500`} ``
- B) A lookup map of full class strings
- C) `className={"bg-" + color}`
- D) `` className={`w-[${px}px]`} ``

**4.** What does `cn("px-4 py-2", "px-8")` return?
- A) `px-4 py-2 px-8`
- B) `py-2 px-8`
- C) `px-4 py-2`
- D) `px-8`

**5.** Which `tailwind-merge` version should you use with Tailwind v4?
- A) v1
- B) v2
- C) v3 or newer
- D) Any

**6.** In Vue, how do you let a parent override a child's classes properly?
- A) `!important` always
- B) Declare a `class` prop and merge with `cn(base, props.class)`
- C) Use `v-html`
- D) Use `<style scoped>` only

**7.** In a Vue `<style scoped>` block, `@apply` needs…
- A) `@import "tailwindcss"` again
- B) `@reference "path/to/main.css"`
- C) `@source`
- D) A `tailwind.config.js`

**8.** In Vue 3, `:data-active="false"` renders…
- A) No attribute
- B) `data-active="false"`
- C) `data-active=""`
- D) A warning

**9.** What's the status of the `cva` v1 package (Oct 2026)?
- A) Stable 1.0
- B) Beta (`1.0.0-beta.x`)
- C) Deprecated
- D) Removed

**10.** Which call shape is the cva **v1** one?
- A) `cva("base", { variants })`
- B) `cva({ base: "…", variants })`
- C) `cva.create(…)`
- D) `cva(variants, "base")`

**11.** Why can `twMerge("text-eyebrow text-white")` misbehave?
- A) `text-white` doesn't exist
- B) It can't tell your custom `text-eyebrow` is a font size, so it may treat both as colors
- C) clsx removes it
- D) Tailwind v4 forbids it

**12.** Headless UI v2 exposes state via…
- A) Inline styles
- B) `data-*` attributes such as `data-open`, `data-focus`
- C) CSS-in-JS
- D) Class names like `.is-open`

**13.** How does shadcn/ui deliver components?
- A) Normal npm package imports
- B) A CLI copies component source into your repo
- C) A CDN script
- D) A Tailwind plugin

**14.** daisyUI 5 is added to Tailwind v4 with…
- A) `plugins: [require("daisyui")]`
- B) `@plugin "daisyui";` in CSS
- C) `@import "daisyui/plugin";` only
- D) A CDN `<script>`

**15.** Which statement about NativeWind is correct?
- A) v5 is stable and uses Tailwind v3
- B) v4 is stable and uses Tailwind v3; v5 is a release candidate using Tailwind v4.1+
- C) NativeWind supports CSS Grid on native
- D) `Text` inherits color from `View`

---

<details>
<summary>✅ Answers</summary>

1. **B** — `@tailwindcss/vite`
2. **B** — leftover template CSS
3. **B** — full-string map
4. **B** — `py-2 px-8`
5. **C** — v3+ for Tailwind v4
6. **B** — `class` prop merged with `cn()`
7. **B** — `@reference`
8. **B** — `data-active="false"` (use `undefined`/`null`)
9. **B** — beta
10. **B** — `cva({ base, variants })`
11. **B** — it doesn't read your theme
12. **B** — `data-*` attributes
13. **B** — a CLI copies the source into your repo
14. **B** — `@plugin "daisyui";`
15. **B** — v4 stable/Tailwind v3; v5 RC/Tailwind v4.1+

**Score:** 13–15 Excellent · 10–12 Good · below 10 → revisit Lessons 01–03 and 05.
</details>
