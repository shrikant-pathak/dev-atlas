# Lesson 05: Cascade, Specificity & Inheritance

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the three mechanisms that determine which CSS rule actually applies.
- Calculate basic specificity to predict which rule wins a conflict.
- Understand which CSS properties inherit by default, and which don't.

---

# Introduction

This is genuinely the single most important lesson in this module — and possibly this book. Nearly every confusing "why isn't my CSS working?!" moment beginners hit comes down to not understanding these three mechanisms. Get comfortable here, and CSS debugging becomes dramatically more predictable.

---

# The Cascade: Multiple Sources, One Result

Recall Lesson 03's preview — CSS can come from multiple places (external, internal, inline) and even multiple separate rules targeting the same element. The **cascade** is the overall system for resolving which declarations actually apply when there's overlap, based on three factors, in this priority order:

1. **Importance** (`!important`, covered fully in Module 04) — overrides nearly everything else.
2. **Specificity** — how precisely a selector targets an element (this lesson's main focus).
3. **Source order** — when specificity ties, whichever rule appears *last* in the CSS wins.

---

# Specificity: The Core Mechanism

**Specificity** is a scoring system determining which selector "wins" when multiple rules target the same element with conflicting declarations. Each selector type carries a different weight:

| Selector Type | Specificity Weight |
|---|---|
| Inline styles | 1000 |
| ID selector (`#id`) | 100 |
| Class, attribute, pseudo-class selectors (`.class`, `[attr]`, `:hover`) | 10 |
| Element, pseudo-element selectors (`p`, `::before`) | 1 |
| Universal selector (`*`) | 0 |

**Calculating specificity — add up the weights:**

```css
p { color: blue; }                    /* specificity: 1 */
.intro { color: red; }                 /* specificity: 10 */
p.intro { color: green; }               /* specificity: 1 + 10 = 11 */
#main p.intro { color: purple; }         /* specificity: 100 + 1 + 10 = 111 */
```

Given this HTML: `<p class="intro" id="main">Hello</p>` — **purple wins**, since `111` is the highest specificity score among all four rules, regardless of the order they're written in.

---

# Source Order: The Tiebreaker

When two rules have *identical* specificity, the one appearing **later** in the CSS (or later `<style>`/`<link>` in the HTML) wins:

```css
p { color: blue; }
p { color: red; }  /* This wins - same specificity, appears later */
```

This is exactly why the order of your CSS files/rules genuinely matters, and why a common quick (if imperfect) debugging trick is "just move this rule further down" when fighting a specificity issue.

---

# Inheritance: Some Properties Pass Down Automatically

**Inheritance** is a separate mechanism from the cascade — some CSS properties automatically pass from a parent element down to its children, without needing to be explicitly re-declared:

```html
<div style="color: navy; font-family: Arial;">
  <p>This paragraph inherits navy color and Arial font automatically.</p>
</div>
```

**Properties that typically inherit:** text-related properties — `color`, `font-family`, `font-size`, `line-height`, `text-align`.

**Properties that typically do NOT inherit:** box-model and layout properties — `margin`, `padding`, `border`, `width`, `height`, `background`.

**The logic behind this split:** it generally makes sense for text styling to flow down naturally (you don't want to re-declare font choices on every single nested element), while spacing/sizing genuinely needs to be independent per element (you wouldn't want every nested `<div>` to automatically inherit its parent's exact margin).

---

# Forcing Inheritance: The `inherit` Keyword

For properties that don't inherit by default, you can force it explicitly:

```css
.child {
  border: inherit;
}
```

---

# Putting It All Together: A Debugging Mental Model

When a style "isn't working," walk through this checklist:
1. Is there a more specific rule elsewhere overriding it? (Specificity)
2. Is there an identical-specificity rule appearing later? (Source order)
3. Is this a property that doesn't inherit, and you expected it to? (Inheritance)
4. Is there an `!important` somewhere fighting you? (Module 04)

This exact checklist is what experienced developers run through almost instinctively — and now you have it explicitly.

---

# Practical Example

```css
p { color: black; }              /* specificity: 1 */
.note { color: orange; }          /* specificity: 10 */
#warning { color: red; }           /* specificity: 100 */
```
```html
<p class="note" id="warning">This text is red.</p>
```
Red wins — `#warning` has the highest specificity (100), regardless of `.note` and the base `p` rule both existing.

---

# Revision Questions

1. List the three factors of the cascade, in priority order.
2. Between `.button` and `#submit-button`, which has higher specificity, and by how much?
3. Name two CSS properties that inherit by default, and two that don't.

<details><summary>Answers</summary>

1. Importance (`!important`), specificity, then source order.
2. `#submit-button` — ID selectors carry a specificity weight of 100, versus a class selector's weight of 10; a difference of 90.
3. Inherit: `color`, `font-family` (or `font-size`, `line-height`, `text-align`). Don't inherit: `margin`, `padding` (or `border`, `width`, `height`, `background`).

</details>

---

# 🏁 Module 01 Checkpoint

Before moving to Module 02, you should be able to:
- [ ] Explain CSS's role relative to HTML and JavaScript
- [ ] Write correct CSS syntax from memory
- [ ] Choose the right method (inline/internal/external) for a given situation
- [ ] Use element, class, ID, and universal selectors appropriately
- [ ] Calculate basic specificity and predict which rule wins a conflict
- [ ] Explain which properties inherit by default and which don't

**Next up:** Module 02 — Colors, Units & Typography
