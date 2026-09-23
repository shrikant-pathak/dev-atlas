# Module 07 Quiz

1. What does `.navbar-expand-md` control?
   a) Navbar height  b) The breakpoint at which the navbar switches from collapsed to inline  c) Navbar background color  d) Navbar font size
   **Answer: b) The breakpoint at which the navbar switches from collapsed to inline**

2. Which attribute must be kept in sync when a tab becomes active?
   a) `aria-current`  b) `aria-selected`  c) `aria-checked`  d) `aria-pressed`
   **Answer: b) `aria-selected`**

3. Why is the current breadcrumb item not a link?
   a) Bootstrap doesn't support it technically  b) Convention: a page shouldn't link to itself  c) It would break the CSS separator  d) It's actually fine to link it
   **Answer: b) Convention: a page shouldn't link to itself**

4. How do you disable a pagination link (an `<a>` element) correctly?
   a) Add the `disabled` attribute  b) Add `.disabled` + `tabindex="-1"` + `aria-disabled="true"`  c) Remove the `href`  d) Add `.hidden`
   **Answer: b) Add `.disabled` + `tabindex="-1"` + `aria-disabled="true"`**

5. What library handles dynamic dropdown positioning in Bootstrap?
   a) jQuery  b) Popper  c) Tippy  d) Floating UI directly
   **Answer: b) Popper**

6. What does `.dropdown-toggle-split` do?
   a) Splits the dropdown into two menus  b) Removes spacing so a two-button split dropdown sits flush  c) Adds a divider inside the menu  d) Changes menu direction
   **Answer: b) Removes spacing so a two-button split dropdown sits flush**

7. What does `data-bs-backdrop="false"` do on an offcanvas?
   a) Removes the dimming overlay behind the panel  b) Prevents the panel from closing  c) Disables animations  d) Hides the close button
   **Answer: a) Removes the dimming overlay behind the panel**

8. What does `.offcanvas-lg` do differently from plain `.offcanvas`?
   a) Nothing, it's identical  b) Below `lg` it's a sliding drawer; at `lg`+ it's a static always-visible sidebar  c) It only affects font size  d) It disables the close button at `lg`+
   **Answer: b) Below `lg` it's a sliding drawer; at `lg`+ it's a static always-visible sidebar**

9. What do `.list-group-item-{color}` classes provide?
   a) A border only  b) A built-in soft/subtle background tint using the theme color  c) A full solid background exactly like `.bg-{color}`  d) Text color only
   **Answer: b) A built-in soft/subtle background tint using the theme color**

10. Why does an actionable list group use `<div>` instead of `<ul>` as its wrapper?
    a) It's arbitrary, either works  b) Because its children are `<a>`/`<button>` elements, not `<li>` elements  c) `<ul>` is deprecated  d) `.list-group-item-action` requires `<div>`
    **Answer: b) Because its children are `<a>`/`<button>` elements, not `<li>` elements**
