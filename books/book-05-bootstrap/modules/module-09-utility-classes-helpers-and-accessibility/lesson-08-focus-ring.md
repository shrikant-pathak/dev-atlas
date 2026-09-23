# Lesson 08: Focus Ring

## Learning Objectives
- Understand what the focus ring is and why it must never be removed without replacement
- Apply `.focus-ring` and its color/opacity modifiers to custom interactive elements
- Recognize how Bootstrap's built-in components already handle focus rings automatically
- Know when you're responsible for adding focus-ring styling yourself

## Introduction
Every native interactive element you've used throughout this book — buttons, links, form controls — already receives a visible focus indicator automatically from the browser, which Bootstrap then restyles consistently to match its color system. This lesson is about the cases where YOU are responsible for adding that same visible indicator yourself, and why skipping it is a serious accessibility failure, not a minor cosmetic choice.

## Why the Focus Ring Must Never Simply Be Removed
It's worth stating this directly, since "remove the ugly blue outline" is a genuinely common but harmful instinct among developers who haven't thought through who depends on it: keyboard-only users (including many users with motor impairments, and simply anyone who prefers or needs to navigate without a mouse) rely ENTIRELY on the focus ring to know which element is currently active as they tab through a page. Removing it with `outline: none` and providing no replacement makes a page fully unusable for keyboard navigation, even though it looks "cleaner" to a mouse user who never needed the indicator in the first place. Bootstrap's `.focus-ring` utility exists specifically so you always have a correctly-styled, accessible alternative on hand rather than an excuse to remove focus indication entirely.

## Applying a Focus Ring
```html
<div tabindex="0" class="focus-ring p-3 border rounded">
  A custom focusable element with a visible focus ring.
</div>
```

`.focus-ring` becomes visible specifically when the element receives keyboard focus (via the `:focus-visible` CSS pseudo-class under the hood), matching the same on-demand-visibility pattern you've already seen with `.visually-hidden-focusable` in Lesson 05 — both stay invisible until keyboard interaction specifically triggers them.

## Color and Opacity Variants
```html
<button class="btn btn-outline-primary focus-ring focus-ring-primary">Primary-ringed button</button>
<div tabindex="0" class="focus-ring focus-ring-danger focus-ring-opacity-50 p-3 border rounded">
  Custom danger-colored, half-opacity focus ring
</div>
```

Same theme-color and opacity-scale conventions from Module 04 and Lesson 07 reappear here — `.focus-ring-{color}` and `.focus-ring-opacity-{value}` let a custom focus ring match your specific component's color context rather than always defaulting to the primary theme color.

## When You Actually Need to Apply This Yourself
It's worth being explicit about scope: every native Bootstrap component you've built throughout this entire book — `.btn`, `.form-control`, `.nav-link`, `.dropdown-item`, and so on — ALREADY has appropriate focus styling built in automatically. You only need `.focus-ring` when you're building a genuinely custom interactive element from a non-naturally-focusable tag (like a `<div>` given `tabindex="0"` to make it keyboard-reachable, as in the examples above) — a card that's clickable via JavaScript, for instance, rather than a real `<button>` or `<a>`.

## Practical Example
A custom clickable card (built from a `<div>` rather than a real link, perhaps because it triggers a JS action rather than navigation) with proper focus styling added manually:

```html
<div class="card p-3" tabindex="0" role="button" 
     onclick="console.log('card activated')" 
     style="cursor: pointer;">
  <div class="focus-ring focus-ring-primary">
    <h6 class="mb-1">Custom Interactive Card</h6>
    <p class="mb-0 text-body-secondary">Click or press Enter to activate.</p>
  </div>
</div>
```

Note this is exactly the kind of case where, per Module 06, Lesson 01's earlier lesson on `role="button"`, you'd generally prefer a real `<button>` element if at all possible — this example exists specifically to illustrate `.focus-ring`'s use case, not to recommend `<div>`-as-button as a default pattern.

## Revision Questions

<details>
<summary>1. Why is removing the default focus outline without providing a replacement a serious accessibility problem?</summary>
Keyboard-only users rely entirely on the focus ring to know which element is currently active while tabbing through a page; removing it with no replacement makes the page unusable for keyboard navigation, even though it may look cleaner to mouse users.
</details>

<details>
<summary>2. Do standard Bootstrap components like `.btn` and `.form-control` need `.focus-ring` applied manually?</summary>
No — they already have appropriate focus styling built in automatically; `.focus-ring` is needed specifically for custom interactive elements built from non-naturally-focusable tags.
</details>

<details>
<summary>3. What earlier lesson's utility does `.focus-ring`'s "invisible until keyboard focus" behavior most closely resemble?</summary>
`.visually-hidden-focusable` from Lesson 05 — both stay invisible until a keyboard-focus interaction specifically triggers their visibility.
</details>

<details>
<summary>4. What CSS pseudo-class does `.focus-ring` rely on under the hood to show itself only for keyboard focus, not mouse clicks?</summary>
`:focus-visible`.
</details>
