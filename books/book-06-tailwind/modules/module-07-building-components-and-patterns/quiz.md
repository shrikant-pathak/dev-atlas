# Module 07 Quiz — Building Components & Patterns

15 questions. Answers at the bottom. Try first!

**1.** Which is the best way to give an icon-only button an accessible name?
- A) `title` only
- B) `aria-label`
- C) A `placeholder`
- D) `alt`

**2.** What does `not-first:-ml-px` do in a button group?
- A) Removes the first button
- B) Overlaps adjacent borders on all but the first button
- C) Adds a margin to the first button
- D) Hides borders

**3.** To make a whole card clickable using a stretched link, the card needs…
- A) `fixed`
- B) `relative`, and the link's `::after` set to `absolute inset-0`
- C) `overflow-visible`
- D) `pointer-events-none`

**4.** Which keeps card footers aligned at the bottom?
- A) `mt-auto` inside a `flex flex-col` card
- B) `align-bottom`
- C) `float-bottom`
- D) `bottom-0` on all cards

**5.** Which attribute drives the mobile menu's hamburger ↔ close icon swap in this module?
- A) `data-open`
- B) `aria-expanded` on a `group` button
- C) `class="open"`
- D) `hidden`

**6.** A native modal dialog is opened with…
- A) `dialog.open = true`
- B) `dialog.showModal()`
- C) `dialog.show()`
- D) `dialog.display()`

**7.** Why does a `<dialog>` appear in the top-left in Tailwind?
- A) Dialogs aren't supported
- B) Preflight resets margin, removing `margin: auto` centering
- C) `z-index` is missing
- D) Backdrop issue

**8.** Which variant styles the dimmed overlay behind a modal dialog?
- A) `overlay:`
- B) `backdrop:`
- C) `behind:`
- D) `modal:`

**9.** Which error styling approach avoids "red before the user touches the field"?
- A) `invalid:border-red-500`
- B) `[&:user-invalid]:border-red-500` or `aria-invalid:`
- C) `required:border-red-500`
- D) `empty:border-red-500`

**10.** How do you make several `<details>` open exclusively?
- A) `exclusive` attribute
- B) Same `name` attribute
- C) Same `id`
- D) `role="accordion"`

**11.** Which pattern is right for a simple dropdown of links?
- A) `role="menu"` with no keyboard handling
- B) A button with `aria-expanded` controlling a list (disclosure)
- C) A `<select>`
- D) `title` tooltips

**12.** In tabs, a "roving tabindex" means…
- A) Every tab has `tabindex="0"`
- B) Only the selected tab has `tabindex="0"`; others `-1`
- C) Tabs have no tabindex
- D) Panels get `tabindex="-1"`

**13.** In `class="px-4 px-8"`, which padding applies?
- A) `px-8` always (last wins)
- B) `px-4` always (first wins)
- C) Whichever is defined later in the generated CSS
- D) Neither

**14.** Which tool resolves conflicting Tailwind classes passed to a component?
- A) `clsx`
- B) `tailwind-merge`
- C) Prettier
- D) PostCSS

**15.** Which should you try *first* when you see the same utilities repeated in one file?
- A) `@apply`
- B) A loop (`map` / `v-for`) or multi-cursor edit
- C) `@layer components`
- D) A JS plugin

---

<details>
<summary>✅ Answers</summary>

1. **B** — `aria-label`
2. **B** — overlaps adjacent borders
3. **B** — `relative` card + `after:absolute after:inset-0`
4. **A** — `mt-auto` in a `flex flex-col` card
5. **B** — `aria-expanded` on a `group` button
6. **B** — `showModal()`
7. **B** — Preflight resets margins
8. **B** — `backdrop:`
9. **B** — `:user-invalid` or `aria-invalid`
10. **B** — same `name`
11. **B** — disclosure pattern
12. **B** — only the selected tab is in the Tab order
13. **C** — stylesheet order decides, not class order
14. **B** — `tailwind-merge`
15. **B** — loops/multi-cursor before any abstraction

**Score:** 13–15 Excellent · 10–12 Good · below 10 → revisit Lessons 03, 05, 06 and 08.
</details>
