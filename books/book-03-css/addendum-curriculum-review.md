# Addendum: Curriculum Review — Logical Properties, currentColor, will-change & Print Styles

## Why This Addendum Exists

A full review pass across all 13 modules of Book 03 surfaced four genuinely useful topics that were either used implicitly in later examples without ever being formally taught, or omitted entirely. This addendum closes those gaps before Book 03 is considered complete.

---

# Part 1: Logical Properties

## The Problem Physical Properties Have

```css
.card {
  margin-left: 1rem;
  padding-right: 2rem;
}
```

Recall `margin`/`padding` from Module 03 — properties like `margin-left` and `padding-right` are **physical**: they always refer to the literal left/right/top/bottom of the screen, regardless of the page's actual reading direction. This breaks down for right-to-left languages (Arabic, Hebrew) or vertical writing modes (some East Asian typesetting), where "start" and "end" don't correspond to fixed physical sides.

## Logical Properties: Direction-Independent Equivalents

```css
.card {
  margin-inline-start: 1rem; /* "start" of the inline axis — left in LTR, right in RTL */
  padding-inline-end: 2rem;  /* "end" of the inline axis */
}
```

You've actually already seen these in earlier examples without a formal introduction — recall `margin-inline`/`padding-inline` from Module 08's container examples, and `inset` (a logical shorthand covering all four physical offsets at once) from Module 05's positioning and Module 10's modal.

## The Full Mapping

| Physical | Logical |
|---|---|
| `margin-left` / `margin-right` | `margin-inline-start` / `margin-inline-end` (or shorthand `margin-inline`) |
| `margin-top` / `margin-bottom` | `margin-block-start` / `margin-block-end` (or shorthand `margin-block`) |
| `width` | `inline-size` |
| `height` | `block-size` |
| `top`/`right`/`bottom`/`left` | `inset` (all four at once) |

**Inline axis** = the direction text flows within a line (horizontal in English); **block axis** = the direction lines stack (vertical in English). In an RTL or vertical-writing-mode context, these axes' physical mapping changes automatically — the logical property adapts, while a physical property would not.

## Practical Rule of Thumb

For most single-language English-only projects, physical properties remain perfectly fine and more immediately readable. Logical properties earn their place specifically when a project needs genuine internationalization support, or when building a reusable component library meant to work correctly regardless of the consuming site's language direction.

---

# Part 2: currentColor

```css
.icon {
  color: #4a90d9;
  border: 2px solid currentColor; /* inherits the element's own `color` value */
  fill: currentColor; /* for inline SVGs */
}
```

`currentColor` is a special CSS keyword that always resolves to the element's own computed `color` value — genuinely useful for keeping a border, an SVG icon's fill, or a box-shadow color in sync with text color without repeating the same value twice or introducing a second custom property just to mirror it.

```css
.btn-outline {
  color: #4a90d9;
  border: 2px solid currentColor; /* automatically matches, no matter what color is set above */
}

.btn-outline.btn-danger {
  color: #e05252; /* border automatically follows, since currentColor re-resolves */
}
```

Recall the outline button variant from Module 10, Lesson 03 — rewriting its border to use `currentColor` means a variant only needs to change `color` once, and the border stays in sync automatically, rather than needing its own separate override.

---

# Part 3: will-change

Recall Module 13, Lesson 03's render pipeline (Layout → Paint → Composite) and Module 11's guidance to prefer animating `transform`/`opacity`. `will-change` is a directly related property that lets you go one step further:

```css
.card {
  will-change: transform;
}

.card:hover {
  transform: translateY(-6px);
}
```

`will-change` hints to the browser that a property is *about to* change, letting it prepare an optimized rendering path (such as promoting the element to its own compositor layer) ahead of time, rather than reacting only once the change actually starts.

## The Genuine Caution

```css
/* Overusing will-change on many elements can hurt performance rather than help it */
* {
  will-change: transform; /* genuinely a bad idea — promotes far too many layers */
}
```

Worth being direct: `will-change` consumes real memory (each hinted element may get its own compositor layer), so applying it broadly or permanently can hurt performance rather than help it. The common, safer pattern is toggling it on shortly before a change and removing it afterward — e.g., adding it on `:hover`/`:focus` rather than leaving it a permanent, blanket rule.

```css
.card {
  transition: transform 0.2s;
}

.card:hover {
  will-change: transform;
  transform: translateY(-6px);
}
```

**Practical rule of thumb:** reach for `will-change` only after noticing an actual, measurable animation performance problem — not as a default, precautionary addition to every animated element.

---

# Part 4: Print Stylesheets

Recall `@media print` was mentioned briefly in Module 08, Lesson 01 — this section expands on it properly.

## Hiding Non-Printable UI

```css
@media print {
  .navbar,
  .btn,
  .modal,
  .sidebar-ads {
    display: none;
  }
}
```

Recall `@media` syntax from Module 08 — navigation bars, buttons, and other interactive-only UI genuinely serve no purpose on a printed page and should be hidden entirely.

## Controlling Page Breaks

```css
@media print {
  h2 {
    break-after: avoid; /* keep a heading with its following content */
  }

  .card {
    break-inside: avoid; /* don't split a card across two printed pages */
  }

  .article {
    columns: 1; /* recall Module 10's multi-column layout — collapse to single column for print */
  }
}
```

Recall `break-inside`/`break-after` from Module 10's multi-column lesson — the identical properties apply here, just in a print-specific context, preventing awkward mid-element page breaks.

## Adjusting Colors and Links for Print

```css
@media print {
  body {
    color: black;
    background: white; /* avoid wasting ink on background colors/images */
  }

  a::after {
    content: " (" attr(href) ")"; /* show the actual URL, since it can't be clicked on paper */
  }
}
```

Recall `attr()` and generated content from Module 04/10 — printing out a link's actual URL next to its text is a small but genuinely thoughtful touch, since a printed page obviously can't be clicked.

## Practical Example: A Print-Ready Article Page

```css
@media print {
  .navbar, .btn, .sidebar { display: none; }

  body {
    color: black;
    background: white;
    font-size: 12pt;
  }

  .article {
    columns: 1;
  }

  h2, h3 {
    break-after: avoid;
  }

  img {
    max-width: 100% !important; /* recall Module 08 — ensures images never overflow a printed page's width */
  }
}
```

A genuinely complete print stylesheet needs surprisingly little CSS — mostly hiding interactive chrome, flattening multi-column layouts, and preventing awkward page splits.

---

# Revision Questions

1. What's the difference between a physical property like `margin-left` and its logical equivalent `margin-inline-start`?
2. What value does `currentColor` always resolve to?
3. Why should `will-change` generally be toggled on/off around an interaction rather than applied permanently and broadly?
4. Name two things a print stylesheet commonly hides or adjusts that a screen stylesheet wouldn't need to.

<details><summary>Answers</summary>

1. `margin-left` always refers to the literal left side of the screen; `margin-inline-start` refers to the "start" of the inline (text-flow) axis, which adapts automatically for right-to-left languages or vertical writing modes rather than being tied to a fixed physical side.
2. The element's own computed `color` value.
3. Because it consumes real memory (each hinted element may get its own compositor layer), so applying it broadly or permanently can hurt performance rather than help it — it's meant as a short-lived hint just before an actual change, not a standing optimization.
4. Any two of: hiding navigation/buttons/interactive-only UI, avoiding wasted ink on background colors/images, controlling page breaks around headings/cards, or showing a link's actual URL next to its text since it can't be clicked on paper.

</details>
