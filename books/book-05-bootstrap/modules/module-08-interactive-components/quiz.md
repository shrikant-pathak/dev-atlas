# Module 08 Quiz

1. What does `tabindex="-1"` on a modal element enable?
   a) Removes it from the page entirely  b) Makes it programmatically focusable without adding it to normal tab order  c) Disables all focus on the modal  d) Prevents keyboard dismissal
   **Answer: b) Makes it programmatically focusable without adding it to normal tab order**

2. What attribute makes an accordion allow only one panel open at a time?
   a) `data-bs-single`  b) `data-bs-parent`  c) `data-bs-exclusive`  d) `data-bs-group`
   **Answer: b) `data-bs-parent`**

3. What must be explicitly set for `.collapse-horizontal` to animate correctly?
   a) A fixed height  b) A fixed width on the inner content  c) `overflow: hidden`  d) Nothing extra is needed
   **Answer: b) A fixed width on the inner content**

4. What does `data-bs-slide-to="2"` do on a carousel indicator?
   a) Advances 2 slides forward  b) Jumps directly to slide index 2  c) Sets the interval to 2 seconds  d) Disables slide 2
   **Answer: b) Jumps directly to slide index 2**

5. Why must tooltips be manually initialized with JavaScript?
   a) They don't support HTML  b) For performance — to avoid activating every tooltip-tagged element automatically on load  c) Bootstrap forgot to automate it  d) They require a paid plugin
   **Answer: b) For performance — to avoid activating every tooltip-tagged element automatically on load**

6. What is the default trigger for a popover, as opposed to a tooltip?
   a) Hover  b) Focus only  c) Click  d) Double-click
   **Answer: c) Click**

7. Why do toasts need `aria-live`?
   a) For visual styling  b) So screen readers announce content that can appear without direct user interaction  c) It's required by HTML validators  d) It controls autohide timing
   **Answer: b) So screen readers announce content that can appear without direct user interaction**

8. How is a toast typically displayed?
   a) Automatically via `data-bs-toggle` on page load  b) Via a JavaScript `.show()` call, since toasts are usually event-triggered  c) It cannot be shown programmatically  d) By adding `.show` class manually only
   **Answer: b) Via a JavaScript `.show()` call, since toasts are usually event-triggered**

9. What must match for scrollspy to correctly highlight the right nav link?
   a) The nav link's class and the section's class  b) The nav link's `href` and the section's `id`  c) The nav link's `id` and the section's `class`  d) Nothing needs to match; it's automatic
   **Answer: b) The nav link's `href` and the section's `id`**

10. Why do spinner colors use `.text-{color}` rather than `.bg-{color}`?
    a) It's an arbitrary convention  b) Spinners render via border-color/currentColor, not a background fill  c) `.bg-*` doesn't work on `<div>` elements  d) Both work identically
    **Answer: b) Spinners render via border-color/currentColor, not a background fill**
