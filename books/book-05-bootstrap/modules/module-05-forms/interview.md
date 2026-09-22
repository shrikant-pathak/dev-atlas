# Module 05 Interview Questions

1. **Why is the `for`/`id` pairing between `<label>` and form controls mandatory rather than just a nice-to-have?**
   Expected answer: it's an accessibility requirement — screen readers use it to announce which label belongs to which field, and it enables click-to-focus on the label; without it, the form is functionally broken for assistive technology users.

2. **What's the difference between `disabled` and `readonly`, and how does that affect form submission?**
   Expected answer: `disabled` fields can't be focused/edited and are excluded from submission entirely; `readonly` fields can be focused/copied but not edited, and are still submitted with the form.

3. **Why must the input come before the label in `.form-floating` markup?**
   Expected answer: the floating animation depends on a CSS sibling selector that only targets elements after a given element, so the label has to follow the input in source order for the selector to reach it.

4. **Walk through what `.needs-validation` + `checkValidity()` + `.was-validated` actually do together.**
   Expected answer: `novalidate` disables the browser's native validation UI; native constraint attributes (`required`, `pattern`, etc.) still define the actual rules; on submit, `checkValidity()` checks those rules programmatically, and adding `.was-validated` to the form is what triggers Bootstrap's `.is-valid`/`.is-invalid` styling to actually display based on each field's current validity.

5. **Why does validation styling typically not show up until after a first submit attempt?**
   Expected answer: because `.was-validated` is only added inside the `submit` event handler, so nothing is styled as valid/invalid on page load or during normal typing — only after the user has attempted to submit.

6. **What determines whether `.input-group-text` prepends or appends to a field?**
   Expected answer: its position in the markup relative to the input — before it prepends, after it appends.

7. **Why should size classes on an `.input-group` be applied to the wrapper rather than the individual input?**
   Expected answer: sizing at the group level keeps all children (input, attached text, buttons) visually consistent; sizing only the input would misalign it against unsized siblings in the same group.

8. **What native HTML mechanism makes radio buttons mutually exclusive, and what's the most common bug caused by getting it wrong?**
   Expected answer: a shared `name` attribute across all radios in the group; forgetting to match the `name` means every radio behaves independently, letting users select more than one supposedly-exclusive option.
