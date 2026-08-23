# Exercise Set — Selectors & Combinators

## Easy
- [ ] Write a rule styling a button's `:hover` and `:active` states differently.
- [ ] Write a rule adding an asterisk after any element with class `required-label` using `::after`.
- [ ] Write an attribute selector targeting all `<input>` elements with `type="checkbox"`.
- [ ] Write the four link state pseudo-classes in the correct order with any color values.

---

## Medium
- [ ] Write a `:nth-child()` rule selecting every 3rd list item, and explain the formula.
- [ ] Write a rule using the child combinator (`>`) to style only a `<nav>`'s direct-child `<ul>`, not nested sub-menus.
- [ ] Calculate the specificity of `#sidebar .widget:hover a`.
- [ ] Write an attribute selector targeting all links ending in `.pdf`, adding a small icon via `::before`.

---

## Hard
- [ ] Given two conflicting rules with specificity 21 and 111 respectively, explain which wins and why, regardless of source order.
- [ ] Write a rule using `:not()` to add dividers between list items, excluding the last one — then calculate its full specificity.
- [ ] Explain a real scenario where using `!important` might be justified, and a real scenario where it's better to fix the underlying selector instead.
- [ ] Combine an attribute selector, a `:not()`, and a pseudo-element to mark all external links (not containing your own domain) with an outbound-link icon.

---

## Bonus
- [ ] Research the `:is()` and `:where()` selectors (not covered in this module) and explain how `:where()` differs from `:is()` in terms of specificity.
