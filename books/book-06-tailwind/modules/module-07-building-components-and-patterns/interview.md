# Module 07 Interview Questions — Building Components & Patterns

## Beginner

<details>
<summary>1. How do you build a button with variants in Tailwind?</summary>

Share a base set of classes (layout, shape, focus, disabled) and swap color/size classes per variant. In React/Vue, do this with a component whose variant classes are complete strings in a map.
</details>

<details>
<summary>2. Why do you need `aria-label` on an icon-only button?</summary>

It has no text, so without a label screen readers can't announce its purpose.
</details>

<details>
<summary>3. How do you make a navbar collapse on mobile in Tailwind?</summary>

Render desktop links with `hidden md:flex`, add a `md:hidden` toggle, and show a mobile panel toggled by `aria-expanded`/`hidden`. There's no built-in navbar component.
</details>

<details>
<summary>4. What's `ring-inset` for on badges?</summary>

It draws the ring inside, so the badge's outer size doesn't change.
</details>

<details>
<summary>5. How do you center a `<dialog>` in a Tailwind project?</summary>

Add `m-auto`, because Preflight resets the margin the browser uses for centering.
</details>

## Intermediate

<details>
<summary>6. How do you make an entire card clickable without nesting the card in an `<a>`?</summary>

Make the card `relative` and give the main link `after:absolute after:inset-0`. Other interactive children get `relative z-10`. Show focus on the card with `has-focus-visible:`.
</details>

<details>
<summary>7. How do you keep card footers aligned in a grid with different text lengths?</summary>

Card `flex flex-col`, body `flex-1`, footer `mt-auto`.
</details>

<details>
<summary>8. Why style error states from `aria-invalid` instead of the `:invalid` pseudo-class?</summary>

`:invalid` matches on page load for empty required fields. `aria-invalid` (set by validation logic, which screen readers also use) or `:user-invalid` applies only after interaction.
</details>

<details>
<summary>9. What does the native `<dialog>` give you compared with Bootstrap's modal?</summary>

Top layer rendering, `::backdrop`, focus trapping, inert background, Escape handling and focus restoration, without a JS framework.
</details>

<details>
<summary>10. How do you build an accordion without JavaScript?</summary>

`<details name="group">` + `<summary>`, with `group` and `group-open:` variants to rotate icons. Same `name` makes them exclusive.
</details>

<details>
<summary>11. How do you make tables responsive?</summary>

Wrap in `overflow-x-auto` (simplest), or stack rows into cards below a breakpoint using `max-md:` variants and `data-label` pseudo-elements, being careful about table semantics.
</details>

## Advanced

<details>
<summary>12. Describe the accessible tabs pattern.</summary>

`role="tablist"`, `role="tab"` with `aria-selected` and `aria-controls`, `role="tabpanel"` with `aria-labelledby`, a roving tabindex (only the selected tab focusable), and arrow/Home/End key handling. Style via `aria-selected:` variants.
</details>

<details>
<summary>13. When should a dropdown be `role="menu"`?</summary>

Only when you implement the full menu keyboard model (arrows, typeahead, focus management). Otherwise use a disclosure (button + list) pattern, or a headless library for true menus.
</details>

<details>
<summary>14. Does the order of classes in `class="…"` decide which one wins? How do you resolve conflicting overrides in components?</summary>

No. The utility defined later in the generated CSS wins. Resolve conflicts with `tailwind-merge` (usually combined with `clsx`), or avoid conflicts via `data-*` variants.
</details>

<details>
<summary>15. When would you use `@utility`, `@layer components` + `@apply`, or a component?</summary>

`@utility` for small style groups needing variants; `@layer components` + `@apply` for markup you don't control; a component for repeated multi-element UI. Try loops and components first.
</details>

<details>
<summary>16. Why can `` `bg-${tone}-50` `` break a component library, and what's the fix?</summary>

Tailwind only generates classes it finds as complete strings. Use a map of full class strings (or CSS variables) per variant.
</details>

<details>
<summary>17. How do you ensure a modal doesn't let the page behind scroll, without JS?</summary>

`has-[dialog:modal]:overflow-hidden` on `<body>`.
</details>
