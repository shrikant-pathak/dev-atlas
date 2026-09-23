# Lesson 05: Text Truncation and Visually Hidden

## Learning Objectives
- Apply `.text-truncate` to cut off overflowing single-line text with an ellipsis
- Understand the width constraint `.text-truncate` requires to function
- Consolidate `.visually-hidden` usage patterns seen throughout this book
- Distinguish `.visually-hidden` from `display: none` and from `.text-truncate`

## Introduction
This lesson formalizes two utilities you've already relied on repeatedly without a full explanation: `.visually-hidden` (used for icon-button labels since Module 06) and its close conceptual cousin, `.text-truncate`, which solves the opposite-feeling but related problem of "there's too much text, and no more room."

## Text Truncation
```html
<div style="width: 200px;">
  <span class="text-truncate d-block">
    This is a long piece of text that will be cut off with an ellipsis once it runs out of room.
  </span>
</div>
```

`.text-truncate` requires two things to actually work, both easy to forget: the text must be constrained to `display: inline-block` or `block` (never plain `inline`, hence `.d-block` in the example above), AND its containing element must have a defined or constrainable width — without a width limit, there's simply nothing for the text to overflow against, so the ellipsis never appears.

## Truncation Inside Flex Layouts
A common real-world snag: text inside a flex item (say, a list item's title next to a fixed-width badge) needs `.text-truncate` PLUS an explicit `min-width: 0` on the flex item itself, since flex items default to a minimum width based on their content, which silently prevents truncation from ever kicking in:

```html
<div class="d-flex align-items-center" style="max-width: 250px;">
  <span class="text-truncate" style="min-width: 0;">
    A genuinely very long notification title that needs to be cut off
  </span>
  <span class="badge bg-primary ms-2">New</span>
</div>
```

## Visually Hidden: A Recap Across the Book
`.visually-hidden` has quietly appeared in nearly every module since Module 05:
- Module 05, Lesson 07 — labeling a quantity input visually replaced by placeholder text
- Module 06, Lesson 03 — announcing "unread messages" alongside a bare notification number
- Module 06, Lesson 06 — text inside icon-only buttons like split-dropdown toggles
- Module 08, Lesson 04 — "Previous"/"Next" labels inside icon-only carousel controls
- Module 08, Lesson 09 — the standalone spinner's "Loading..." text

The unifying principle behind every one of these: content that's essential for a screen reader to announce, but redundant or unnecessary for a sighted user who can already see an icon, a symbol, or context that conveys the same meaning visually.

## `.visually-hidden` vs. `display: none` — A Critical Distinction
This is worth being explicit about, since confusing the two silently breaks accessibility: `display: none` (and Bootstrap's own `.d-none`) removes content from BOTH the visual page AND the accessibility tree — screen readers skip it entirely, exactly as if it didn't exist. `.visually-hidden` does the opposite of what its name might suggest at first glance: it hides content visually (via clipping/positioning tricks) while keeping it fully present and announced in the accessibility tree. If you ever reach for `.d-none` on text meant only for screen readers, you've accidentally hidden it from everyone, including the audience it was written for.

## `.visually-hidden-focusable`
A variant that stays hidden until it receives keyboard focus — used for "Skip to main content" links, a common accessibility pattern that should remain invisible for sighted mouse users but become visible the moment a keyboard user tabs to it:

```html
<a class="visually-hidden-focusable" href="#mainContent">Skip to main content</a>
```

## Practical Example
A message list item combining truncation and a visually-hidden label:

```html
<div class="d-flex align-items-center border-bottom p-2">
  <span class="text-truncate" style="min-width: 0; max-width: 250px;">
    Reminder: Quarterly planning meeting moved to Thursday afternoon
  </span>
  <span class="badge bg-danger rounded-pill ms-auto">
    2
    <span class="visually-hidden">unread messages</span>
  </span>
</div>
```

## Revision Questions

<details>
<summary>1. What two conditions must be true for `.text-truncate` to actually take effect?</summary>
The element must be `display: block` or `inline-block` (not plain inline), and it must have a defined or constrainable width — without both, there's nothing for the text to visibly overflow against.
</details>

<details>
<summary>2. Why does `.text-truncate` sometimes fail to work inside a flex item unless `min-width: 0` is also set?</summary>
Flex items default to a minimum width based on their content size, which silently prevents them from shrinking enough for truncation to ever kick in unless that default is overridden.
</details>

<details>
<summary>3. What's the critical difference between `.visually-hidden` and `.d-none`?</summary>
`.d-none` removes content from both the visual page and the accessibility tree entirely; `.visually-hidden` hides it only visually while keeping it fully present and announced to screen readers — using `.d-none` on screen-reader-only text accidentally hides it from its intended audience too.
</details>

<details>
<summary>4. What does `.visually-hidden-focusable` add on top of plain `.visually-hidden`, and what's its most common use case?</summary>
It stays hidden until the element receives keyboard focus, then becomes visible — most commonly used for "Skip to main content" links, which should be invisible for mouse users but appear for keyboard users tabbing through the page.
</details>
