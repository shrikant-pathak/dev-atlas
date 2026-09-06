# Lesson 02: Dropdowns & Tooltips

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a CSS-only dropdown menu using `:hover` and positioning.
- Build a tooltip using pseudo-elements and `attr()`.
- Understand the accessibility trade-offs of hover-only interactive patterns.

---

# Introduction

Dropdowns and tooltips are two of the most common "reveal on interaction" UI patterns, and — genuinely worth knowing — both can be built with pure CSS, no JavaScript, for their simplest forms. This lesson builds both from first principles.

---

# CSS-Only Dropdown Menu

```html
<div class="dropdown">
  <button class="dropdown-trigger">Menu ▾</button>
  <ul class="dropdown-menu">
    <li><a href="#">Option 1</a></li>
    <li><a href="#">Option 2</a></li>
    <li><a href="#">Option 3</a></li>
  </ul>
</div>
```
```css
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-menu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background: white;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  list-style: none;
  min-width: 160px;
}

.dropdown:hover .dropdown-menu {
  display: block;
}
```

Recall `position: relative` + `position: absolute` from Module 05 — the dropdown menu positions itself relative to its `.dropdown` parent, and the descendant combinator (Module 04) `.dropdown:hover .dropdown-menu` reveals it the moment the mouse hovers anywhere over the parent, not just the button itself.

---

# The Accessibility Caveat

Worth flagging honestly: `:hover`-only dropdowns don't work well for keyboard or touch-only users, since there's no "hover" state to trigger with a keyboard or a tap. Real production dropdowns typically add `:focus-within` alongside `:hover`, and often JavaScript-driven click toggling for full accessibility:

```css
.dropdown:hover .dropdown-menu,
.dropdown:focus-within .dropdown-menu {
  display: block;
}
```

`:focus-within` (a pseudo-class covering elements containing a focused child) means keyboard users tabbing into the button also reveal the menu — a genuinely important accessibility improvement with one extra line.

---

# Tooltips with Pseudo-Elements

```html
<span class="tooltip" data-tooltip="This is helpful info">Hover me</span>
```
```css
.tooltip {
  position: relative;
}

.tooltip::after {
  content: attr(data-tooltip);
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%);
  background: #333;
  color: white;
  padding: 0.4rem 0.8rem;
  border-radius: 4px;
  font-size: 0.85rem;
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.2s;
}

.tooltip:hover::after {
  opacity: 1;
}
```

Genuinely clever piece worth calling out: `content: attr(data-tooltip)` — recall `::after` and generated content from Module 04 — pulls the tooltip's text directly from an HTML `data-*` attribute, meaning the tooltip text lives in your markup, not duplicated in your CSS. Recall `opacity` from Module 09 for the fade, and note `pointer-events: none` prevents the tooltip itself from intercepting mouse events meant for the element beneath it.

---

# Positioning the Tooltip

```css
.tooltip::after {
  transform: translateX(-50%); /* centers the tooltip horizontally over the trigger */
}
```

`transform: translateX(-50%)` shifts the tooltip left by exactly half its own width — since `left: 50%` alone only aligns the tooltip's *left edge* to the trigger's horizontal center, this correction is needed to visually center the whole tooltip box, not just its edge. (`transform` is previewed here; Module 11 covers it fully.)

---

# Practical Example: A Complete Tooltip Component

```html
<button class="btn tooltip" data-tooltip="Saves your current progress">Save</button>
```
```css
.tooltip { position: relative; }

.tooltip::after {
  content: attr(data-tooltip);
  position: absolute;
  bottom: calc(100% + 8px);
  left: 50%;
  transform: translateX(-50%);
  background: #222;
  color: white;
  padding: 0.5rem 0.75rem;
  border-radius: 6px;
  font-size: 0.8rem;
  white-space: nowrap;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.15s ease;
}

.tooltip:hover::after,
.tooltip:focus::after {
  opacity: 1;
  visibility: visible;
}
```

`calc(100% + 8px)` (recall `calc()` from earlier units work) adds a small gap between the button and the tooltip; pairing `opacity` with `visibility: hidden` here also fully removes the tooltip from interaction (unlike `opacity` alone, per Module 09's note that `opacity: 0` stays clickable) when it isn't shown.

---

# Revision Questions

1. What CSS combinator makes `.dropdown:hover .dropdown-menu` reveal the menu on hovering the parent?
2. Why is `:hover`-only interaction considered an accessibility gap, and what pseudo-class helps address it?
3. What does `attr(data-tooltip)` do inside a `content` value?

<details><summary>Answers</summary>

1. The descendant combinator (a space) between `:hover` and `.dropdown-menu`.
2. Keyboard and touch-only users have no equivalent "hover" state, so hover-only menus can be unreachable for them; `:focus-within` (or `:focus` on the trigger) helps by also revealing the menu when the element is focused via keyboard.
3. It pulls the value of the element's `data-tooltip` HTML attribute and inserts it as the generated content's text, keeping the tooltip's actual text in the markup rather than duplicated in CSS.

</details>
