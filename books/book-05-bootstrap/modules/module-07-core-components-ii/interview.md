# Module 07 Interview Questions

1. **What does `.navbar-expand-lg` actually control, and what happens on either side of that breakpoint?**
   Expected answer: below `lg` the navbar collapses into a hamburger toggle; at `lg` and above, all nav links display inline automatically with no toggle needed.

2. **Walk through the full accessibility wiring required to make a tab interface functional and accessible, not just visually tabbed.**
   Expected answer: `role="tablist"` on the nav, `role="tab"` on each toggle, `role="tabpanel"` on each pane; `aria-selected` tracking active tab; `aria-controls` on the tab pointing to the pane's id; `aria-labelledby` on the pane pointing back to the tab's id; `.tab-pane.fade` with `.show.active` only on the visible pane.

3. **Why is the last breadcrumb item never wrapped in a link?**
   Expected answer: standard UX/accessibility convention — a page should never link to itself, since it's redundant or forces an unnecessary reload.

4. **Why does a disabled pagination link need `tabindex="-1"` when a disabled button elsewhere in the framework doesn't?**
   Expected answer: `<a>` elements don't support a native `disabled` attribute the way `<button>` does, so `tabindex="-1"` manually removes it from keyboard tab order, paired with `aria-disabled="true"` for screen readers.

5. **What role does Popper play in dropdowns, and why don't collapse-based components (navbar, offcanvas) need it?**
   Expected answer: Popper dynamically repositions the dropdown menu based on available viewport space (e.g. flipping upward near the screen edge); collapse/offcanvas components use fixed slide directions and don't need dynamic repositioning logic.

6. **What's structurally reused between a split-button dropdown and Module 06's button groups?**
   Expected answer: a split dropdown is literally a `.btn-group` with two buttons, where the second button carries `.dropdown-toggle-split` and a `data-bs-toggle="dropdown"` attribute instead of being an independent action button.

7. **What does `.offcanvas-lg` do differently from a plain `.offcanvas`, and what earlier component's responsive pattern does it mirror?**
   Expected answer: below `lg` it acts as a normal toggleable sliding drawer; at `lg` and above it renders as an always-visible static sidebar with no toggle/backdrop — directly mirroring `.navbar-expand-lg`'s responsive collapse behavior.

8. **Why does an actionable list group use `<div>`/`<a>` instead of `<ul>`/`<li>`?**
   Expected answer: because the items are link or button elements rather than list items, so an unordered list wrapper is no longer the semantically correct container for them.
