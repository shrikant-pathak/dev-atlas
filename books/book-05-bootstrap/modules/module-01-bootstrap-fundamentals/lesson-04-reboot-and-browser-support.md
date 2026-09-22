# Reboot & Browser Support

## Learning Objectives
- Explain what Reboot is and why Bootstrap includes it
- Identify specific browser default styles that Reboot normalizes
- Understand how Reboot differs from a plain CSS reset
- Know which browsers and platforms Bootstrap 5.3 officially supports

## Introduction

In Book 03 you learned that every browser ships its own default stylesheet — the "user agent stylesheet" — which is why an unstyled `<h1>`, `<button>`, or `<ul>` looks slightly different across Chrome, Firefox, and Safari. Bootstrap solves this the same way most serious CSS projects do: with a normalization layer. Bootstrap's version of this is called **Reboot**.

## What is Reboot?

Reboot is a collection of element-level CSS resets, baked into `bootstrap.css` itself — you don't need to include anything extra. It's built on top of **Normalize.css** (a well-known reset library) but adds Bootstrap-specific opinions on top.

Some of what Reboot does:

- Sets `box-sizing: border-box` globally, so padding and border don't add to an element's declared width (a concept from Book 03's Box Model module)
- Removes the default margin browsers apply to `<body>`
- Normalizes heading margins and font-weight across browsers
- Removes list bullets/numbers is *not* done by default (you still need `.list-unstyled`, covered later) — but it does normalize margin/padding on `<ul>`/`<ol>`
- Makes `<img>` responsive-friendly by default with `max-width: 100%` behavior baked into utility classes (not applied automatically, but supported)
- Normalizes form element fonts so `<button>`, `<input>`, and `<select>` inherit the page's font instead of the browser's default UI font

## Reboot vs. a Plain CSS Reset

A plain reset (like the one you might have written in Book 03) usually strips *everything* down to nothing — no margins, no list styles, no default emphasis — leaving you to rebuild basics like heading sizes from scratch.

Reboot is more **opinionated**: it doesn't just remove browser inconsistencies, it also establishes *sensible defaults* that match Bootstrap's own design system (e.g., a specific base font stack, specific heading scale, specific link color). This means once you add Bootstrap, plain unstyled HTML elements already look reasonably polished — before you've added a single Bootstrap class.

## Practical Example

```html
<!-- With just Reboot/Bootstrap loaded, no other classes added -->
<h1>This is a Heading</h1>
<p>This paragraph already has sensible margins and font sizing, thanks to Reboot.</p>
<button>Default Button</button>
```

Compare the same markup with no CSS framework at all — headings, paragraph spacing, and the button's appearance would look noticeably different (and inconsistent) between Chrome, Firefox, and Safari without Reboot normalizing them first.

## Browser Support

As of Bootstrap 5.3, official support covers:

- The latest stable releases of Chrome, Firefox, Safari, and Edge (all major desktop and mobile platforms)
- **Internet Explorer is not supported at all** (this was dropped starting with Bootstrap 5.0 — Bootstrap 4 was the last version to support IE)
- iOS Safari and Android's default browser are supported at their latest stable versions

This matters practically: if a client or employer says a site must support Internet Explorer, Bootstrap 5 is the wrong tool — you'd need Bootstrap 4 or an entirely different approach.

## Revision Questions

<details>
<summary>1. What is Reboot, and where does it come from?</summary>
Reboot is Bootstrap's built-in CSS normalization layer, based on Normalize.css with additional Bootstrap-specific opinions, and it's included automatically in bootstrap.css.
</details>

<details>
<summary>2. How does Reboot differ from a plain CSS reset?</summary>
A plain reset strips styles down to nothing, requiring you to rebuild basics from scratch. Reboot normalizes inconsistencies AND establishes sensible defaults (font stack, heading scale, link colors) that match Bootstrap's design system.
</details>

<details>
<summary>3. Does Bootstrap 5 support Internet Explorer?</summary>
No — IE support was dropped entirely starting with Bootstrap 5.0. Bootstrap 4 was the last version with IE support.
</details>
