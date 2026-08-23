# Lesson 05: Specificity Deep Dive

## Learning Objectives
By the end of this lesson, you will be able to:
- Calculate specificity for genuinely complex, real-world selectors.
- Understand how pseudo-classes, pseudo-elements, and combinators affect specificity.
- Apply specificity awareness to avoid common real-world conflicts.

---

# Introduction

Module 01, Lesson 05 introduced specificity with simple selectors. Now that you know pseudo-classes, pseudo-elements, attribute selectors, and combinators, this lesson returns to specificity with the full, precise picture.

---

# Recap: The Specificity Weights

| Selector Type | Weight |
|---|---|
| Inline styles | 1000 |
| ID (`#id`) | 100 |
| Class, attribute, pseudo-class | 10 |
| Element, pseudo-element | 1 |
| Universal (`*`), combinators | 0 |

**Genuinely important detail:** combinators themselves (space, `>`, `+`, `~`) add **zero** specificity — they only describe relationships. All specificity weight comes purely from the individual selectors being combined.

---

# Calculating Complex Selectors

```css
nav > ul li a:hover {
  color: red;
}
```

Breaking this down piece by piece:
- `nav` → element → 1
- `>` → combinator → 0
- `ul` → element → 1
- `li` → element → 1
- `a` → element → 1
- `:hover` → pseudo-class → 10

**Total specificity: 1 + 1 + 1 + 1 + 10 = 14**

```css
.sidebar .widget-title {
  color: blue;
}
```
- `.sidebar` → class → 10
- `.widget-title` → class → 10

**Total: 20**

Since `20 > 14`, the second rule's `color: blue` would win over the first rule's `color: red`, if both targeted the exact same element and both declared `color`.

---

# Attribute Selectors and Pseudo-classes Count the Same

Recall from the table above — attribute selectors (`[required]`) and pseudo-classes (`:hover`) carry identical specificity weight (10), same as a class selector:

```css
input[type="email"] { border-color: blue; }  /* 1 (element) + 10 (attribute) = 11 */
.email-field { border-color: green; }          /* 10 (class) = 10 */
```
The attribute selector version wins here (11 > 10), even though it might *feel* less "specific" at a glance than a dedicated class.

---

# `:not()` — A Genuine Specificity Trap

This is worth calling out explicitly, since it surprises many developers: `:not()` itself contributes **zero** specificity, but whatever selector is placed *inside* it still counts fully:

```css
li:not(.active) {
  opacity: 0.6;
}
```
- `li` → element → 1
- `:not()` → contributes 0 itself
- `.active` (inside the parentheses) → class → 10

**Total: 11**, not 1 — a common miscalculation if you forget the inner selector still counts.

---

# Real-World Specificity Conflicts and How to Resolve Them

**The problem:** you write a new rule, but an older, more specific rule elsewhere keeps winning:

```css
#sidebar .widget p { color: black; }   /* specificity: 100 + 10 + 1 = 111 */
.new-feature p { color: red; }           /* specificity: 10 + 1 = 11 */
```

`.new-feature p` will never win against `#sidebar .widget p`, regardless of source order, since 11 is always less than 111.

**Better solutions than adding `!important` (covered fully in Lesson 06):**
1. Match or slightly exceed the competing selector's specificity deliberately.
2. Refactor the original overly-specific selector to be less specific in the first place (often the genuinely correct long-term fix).
3. Use a single, well-placed class rather than ID-heavy or deeply-nested selectors from the start — prevention rather than a later fix.

---

# Practical Example

```css
/* Specificity: 1 (element) */
p { color: black; }

/* Specificity: 10 + 1 = 11 */
.intro p { color: gray; }

/* Specificity: 100 + 10 + 1 = 111 */
#main .intro p { color: blue; }

/* Specificity: 1 + 10 = 11 (same as .intro p, but appears LATER, so it wins between these two) */
p.highlight { color: green; }
```

---

# Revision Questions

1. Do combinators (space, `>`, `+`, `~`) themselves add any specificity weight?
2. Calculate the specificity of `.card:not(.disabled) button:hover`.
3. Why is `:not()` considered a "specificity trap" for beginners?

<details><summary>Answers</summary>

1. No — combinators contribute zero specificity themselves; only the actual selectors being combined contribute weight.
2. `.card` (10) + `.disabled` inside `:not()` (10) + `button` (1) + `:hover` (10) = 31.
3. Because `:not()` itself contributes zero specificity, but the selector written inside its parentheses still counts fully — it's easy to mistakenly assume the whole `:not(...)` construct is "free."

</details>
