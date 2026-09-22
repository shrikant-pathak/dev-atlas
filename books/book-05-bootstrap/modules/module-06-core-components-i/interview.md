# Module 06 Interview Questions

1. **How does Bootstrap 5 achieve a full-width button without a `.btn-block` class?**
   Expected answer: by composing `.btn` with an existing utility class, typically `.w-100` from Module 04, since `.btn-block` was removed in Bootstrap 5 in favor of utility composition.

2. **What's the functional difference between `disabled` and `.active` on a button, and why does `.active` need `aria-pressed`?**
   Expected answer: `disabled` is a native attribute that actually blocks interaction; `.active` is purely visual styling for toggle-style buttons, so `aria-pressed="true"` is added to communicate pressed state to assistive technology since the class alone doesn't.

3. **Walk through how `.btn-check` turns a radio button into what looks like a segmented button.**
   Expected answer: the native radio is visually hidden via `.btn-check` but stays functional in the DOM; an adjacent `<label>` styled with `.btn` classes becomes the visible clickable surface, toggling the hidden radio through the standard `for`/`id` label association.

4. **Where does a badge's color come from, and what does that reveal about how Bootstrap's utilities are designed to compose?**
   Expected answer: from the plain `.bg-{color}` utility, not a badge-specific class — `.badge` only supplies sizing/padding, showing that many Bootstrap components are thin structural wrappers built to be combined with the same utility classes used everywhere else.

5. **Why is `role="alert"` important, and what would silently break without it?**
   Expected answer: it triggers assistive technology to announce the alert's content immediately on appearance; without it, screen reader users could miss time-sensitive alert content entirely, since it wouldn't be automatically announced.

6. **Why can't a progress bar's fill width be a utility class the way most other Bootstrap styling in this book is?**
   Expected answer: progress values are arbitrary and continuous, so there's no finite set of classes that could cover every possible percentage — inline `style="width:X%"` is the deliberate, correct approach here.

7. **What happens to a progress bar's accessibility if you update its width via JS but forget to update `aria-valuenow`?**
   Expected answer: the accessible value drifts out of sync with the visual state, so screen reader users get an incorrect progress reading even though sighted users see the correct updated bar.

8. **Why is `aria-label="Close"` mandatory rather than optional on `.btn-close`?**
   Expected answer: the button has no visible text content at all, only a background-image icon, so without the label a screen reader has literally nothing to announce for that button.
