# Module 07 Exercises — Building Components & Patterns

Use a Vite + Tailwind v4 project. Test every component **with the keyboard only**.

## Part A — Warm-up (Lessons 01–03)

**1. Button set** — Build solid, outline, ghost and destructive buttons in three sizes. Cover hover, active, keyboard focus, disabled and a loading state with a spinner (`aria-busy`).

**2. Icon + group** — Make an icon-only close button with an accessible name, and a 3-button segmented control where borders don't double up.

**3. Badges** — Create status badges (active, pending, failed), a notification count badge on an icon button, and a removable tag. Make sure the count badge doesn't cause double announcements.

**4. Card grid** — Build 6 cards with images, varying text lengths, and footers aligned to the bottom. Responsive: 1/2/3 columns.

**5. Clickable card** — Make the whole card clickable via a stretched link. Add a secondary button inside that stays clickable. Show a focus ring on the card for keyboard users.

**6. Adaptive card** — Render the same card in a sidebar and a main column; it must stack in one and go horizontal in the other using container queries only.

**7. Navbar** — Build a sticky blurred navbar with a mobile menu. Requirements: `aria-current`, `aria-expanded`, Escape closes, resizing past `md` resets it.

## Part B — Core practice (Lessons 04–07)

**8. Sign-up form** — Build a form with text, email, password, a select, a textarea (auto-growing), a checkbox and radios. Add focus, disabled and error states. Errors must come from `aria-invalid` and be linked with `aria-describedby`.

**9. Validation timing** — Show the problem with `invalid:` on a required field, then fix it with `[&:user-invalid]:` and again with JS-driven `aria-invalid`.

**10. Confirm dialog** — Build a delete confirmation with `<dialog>`. Requirements: `m-auto` centering, backdrop blur, entry animation with `starting:`, Escape + button + backdrop-click close, body scroll lock.

**11. Accordion** — Build an FAQ with `<details name>`: exclusive open, rotating chevron, no JS.

**12. Dropdown** — Build an account menu (disclosure pattern): outside click and Escape close, focus returns to the button.

**13. Tabs** — Build tabs with `role="tab"`, `aria-selected`, roving tabindex and arrow/Home/End keys.

**14. Data table** — Build an invoice table with zebra rows, sticky header, right-aligned tabular numbers, status badges, and horizontal scroll on phones. Then try the stacked-card version using `data-label` and `max-md:`.

**15. Alerts** — Build info/success/warning/error alerts from a **variant map** with correct `role` per type and a dismiss button.

## Part C — Challenge (Lesson 08)

**16. Refactor** — Take the buttons, alerts and inputs from Parts A–B and extract `<Button>`, `<Alert>` and `<Field>` components (React or Vue). No dynamic class names.

**17. Conflicts** — Pass `className="px-10"` to your `Button` and watch the override fail. Fix it with `clsx` + `tailwind-merge`.

**18. Data variants** — Rewrite `Button` to use `data-variant` and `data-[variant=…]:` classes instead of a JS map. Compare readability.

**19. Abstraction choice** — For each, decide: loop, component, `@utility`, or `@layer components`? (a) 12 identical feature tiles, (b) a focus ring used by every control, (c) styling Markdown output from a CMS, (d) a card used on 8 pages.

## ⭐ Stretch Project — "Component Gallery"

Build a single page showcasing every component from this module, using semantic tokens (Module 06) so it supports light, dark and one extra theme. Include:

- A theme switcher
- A table of contents with `scroll-mt-*` anchors under a sticky header
- Live demos plus a "copy classes" button per component
- Full keyboard operability and reduced-motion support

## ✅ Self-check

- [ ] Everything works with the keyboard only
- [ ] Interactive state is stored in attributes (`aria-*`, `data-*`, `[open]`)
- [ ] No class names are built dynamically
- [ ] No component uses `role="menu"` without full menu keyboard behavior
- [ ] Repetition was removed with loops/components before any `@apply`
