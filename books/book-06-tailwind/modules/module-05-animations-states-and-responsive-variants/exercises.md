# Module 05 Exercises — Animations, States & Responsive Variants

Use a Vite + Tailwind v4 project (Module 01) or the Tailwind Play environment. No custom CSS unless stated.

## Part A — Warm-up (Lessons 01–04)

**1. Loader kit** — Build a spinner, a pulsing skeleton card, and a bouncing "scroll down" arrow. Make all three respect reduced motion.

**2. Custom keyframes** — In your CSS entry file, define `--animate-fade-up` (opacity 0→1, translateY 12px→0). Apply it to a heading and give three list items staggered delays using `[animation-delay:…]`.

**3. Snap gallery** — Build a horizontal image gallery that snaps to the center of each image and lets the next image peek in. Add `scroll-px-*` so the first image isn't flush to the edge.

**4. Sticky header anchors** — Create a page with a sticky header and 4 sections linked from a nav. Make sure each section's heading is visible (not hidden by the header) after clicking, with smooth scrolling only for motion-safe users.

**5. Toast on mount** — Build a toast that slides up and fades in using `starting:` (no keyframes). Show/hide it with a button (plain JS `append`/`remove`, or conditional rendering in React/Vue).

**6. Button states** — Build one button covering default, hover, pressed, keyboard focus, disabled, and reduced motion. Verify focus appears for Tab but not for mouse click.

## Part B — Core practice (Lessons 05–08)

**7. Pure-CSS toggle switch** — Build a toggle with `peer` and `sr-only`. It must be keyboard-operable and show a focus ring.

**8. Selectable cards** — Build 3 plan cards where the whole card highlights when its hidden radio is checked, and shows a ring when the radio has keyboard focus. Use `has-*`.

**9. Accordion** — Build a 3-item accordion where the chevron rotates using `group-aria-expanded:`. Toggle `aria-expanded` with a few lines of JS (or state in React/Vue).

**10. Radix-style states** — Given `<button data-state="open|closed">`, style both states using `data-[state=…]:` variants. Then explain what would go wrong if you wrote `data-state={false}` in React.

**11. Pseudo-element toolbox** — In one page: required-field star, animated underline on links, drop cap, colored list markers, styled file input, brand-colored text selection.

**12. Zebra table** — Build a table with `odd:`/`even:` rows, no border on the last row (`not-last:` or `last:`), and an `empty:` row message that appears only when there are no rows.

## Part C — Challenge (Lessons 09–10)

**13. Breakpoint audit** — Take a 3-column card grid and make it 1 column on phones, 2 on `sm`, 3 on `lg`. Then define a custom `--breakpoint-xs: 30rem` and use `xs:` to make a small tweak.

**14. Range variants** — Hide an element only between `md` and `xl` using stacked variants. Verify at 767, 768, 1279 and 1280 px.

**15. Slot-aware card** — Build one product card component that renders as a stacked card in a narrow sidebar and a horizontal card in a wide main column, using container queries only. Both slots must use identical card markup.

**16. Named containers** — Nest two containers (page and card). Make the card's image size depend on the card container and its padding depend on the page container.

## ⭐ Stretch Project — "Settings panel"

Build a settings page that combines the whole module:

- Toggle switches (peer) and a radio-card group (has)
- Accordion sections driven by `aria-expanded`
- A responsive 2-column layout with container-query-aware cards
- Entry animation on a "Saved" toast (`starting:`)
- All motion gated with `motion-safe:` / `motion-reduce:`
- Keyboard-only usable end to end

## ✅ Self-check

- [ ] No JavaScript was needed purely for styling state
- [ ] Every animation has a reduced-motion story
- [ ] Every interactive element has a visible keyboard focus style
- [ ] No class names are built dynamically (`bg-${x}`)
