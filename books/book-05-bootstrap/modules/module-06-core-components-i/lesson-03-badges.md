# Lesson 03: Badges

## Learning Objectives
- Apply `.badge` with theme color variants
- Nest badges inside headings, buttons, and links
- Use `.rounded-pill` (from Module 04) to create pill-shaped badges
- Understand badges as a "count/label" pattern vs. alerts as a "message" pattern

## Introduction
Badges are small, inline labels for counts or status — notification counters, "New" tags, category labels. They're visually simple, but this lesson is a good checkpoint for how much of Bootstrap you already understand: badges barely introduce anything new, they mostly *recombine* the color system (Module 04), the rounding utilities (Module 04), and now buttons (Lesson 01).

## Basic Badges
```html
<span class="badge bg-primary">Primary</span>
<span class="badge bg-secondary">Secondary</span>
<span class="badge bg-success">Success</span>
<span class="badge bg-danger">Danger</span>
```

Notice these use `bg-*` directly — the same background utility class from Module 04, Lesson 02 — rather than a badge-specific color class. `.badge` itself just handles the small font size, padding, and inline-block display; the color comes entirely from the utility you already know.

## Badges in Headings
A common pattern for a count or status right next to a heading:

```html
<h4>
  Notifications <span class="badge bg-secondary">4</span>
</h4>
```

## Badges Inside Buttons
Frequently used for unread counts on a button (e.g. a notification bell icon):

```html
<button type="button" class="btn btn-primary position-relative">
  Inbox
  <span class="badge bg-danger position-absolute top-0 start-100 translate-middle rounded-pill">
    3
    <span class="visually-hidden">unread messages</span>
  </span>
</button>
```

This positioning combo (`position-relative` on the button, `position-absolute top-0 start-100 translate-middle` on the badge) is the standard Bootstrap pattern for a floating notification dot — it's worth recognizing even though `position-*` utilities themselves are a Module 04 topic you've already covered conceptually via sizing/layout. The `.visually-hidden` span (from Module 05, Lesson 07) ensures screen readers announce "3 unread messages" rather than just the bare number "3".

## Pill Badges
Add `.rounded-pill` — the exact same class from Module 04, Lesson 03 — to soften a badge's corners into a full pill shape:

```html
<span class="badge rounded-pill bg-success">Active</span>
<span class="badge rounded-pill bg-secondary">Archived</span>
```

## Badges vs. Alerts — Choosing the Right Component
It's worth being explicit about when NOT to use a badge: badges are for short, inline counts or single-word/short-phrase labels sitting alongside other content. If you need to communicate a full message with more context — a paragraph of text, a dismiss button, an icon plus explanation — that's an alert, covered next in Lesson 04. Using a badge for a full sentence, or an alert for a one-word count, both work against each component's intended visual weight.

## Practical Example
A product list row using badges for category and stock status:

```html
<div class="d-flex align-items-center justify-content-between p-2 border-bottom">
  <div>
    <span>Wireless Mouse</span>
    <span class="badge rounded-pill bg-info text-dark ms-2">Electronics</span>
  </div>
  <span class="badge bg-success">In stock</span>
</div>
```

## Revision Questions

<details>
<summary>1. Where does a badge's color actually come from — a badge-specific class, or something else?</summary>
The standard `.bg-{color}` background utility from Module 04 — `.badge` only supplies the small size, padding, and inline-block layout, not the color itself.
</details>

<details>
<summary>2. What CSS positioning pattern creates a floating notification-count badge on a button?</summary>
`.position-relative` on the button combined with `.position-absolute .top-0 .start-100 .translate-middle` on the badge itself.
</details>

<details>
<summary>3. Why is a `.visually-hidden` span often included inside a notification badge?</summary>
So screen readers announce full context (e.g. "3 unread messages") instead of just reading the bare visible number, which would otherwise be meaningless out of context.
</details>

<details>
<summary>4. When should you reach for an alert (Lesson 04) instead of a badge?</summary>
When you need to communicate a fuller message with more context — explanatory text, an icon, a dismiss action — rather than a short inline count or single-word/short-phrase label.
</details>
