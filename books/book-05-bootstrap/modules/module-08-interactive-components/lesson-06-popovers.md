# Lesson 06: Popovers

## Learning Objectives
- Understand popovers as tooltips with a title/body structure, capable of richer content
- Enable popovers with the same manual initialization pattern as tooltips
- Control dismissal behavior with `focus` trigger vs. `click`
- Choose correctly between a tooltip, a popover, and a full modal

## Introduction
Popovers are structurally and behaviorally almost identical to Lesson 05's tooltips — same Popper-based positioning, same manual JS initialization requirement, same placement system — but support a separate title and body, making them suited to more substantial content than a tooltip's single short line.

## Basic Popover
```html
<button type="button" class="btn btn-primary" data-bs-toggle="popover" 
        data-bs-title="Popover title" data-bs-content="This is the popover body content.">
  Click to toggle popover
</button>

<script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
  const popoverList = [...popoverTriggerList].map(el => new bootstrap.Popover(el));
</script>
```

Notice the initialization script is identical in shape to Lesson 05's tooltip script, just swapping `bootstrap.Tooltip` for `bootstrap.Popover` and the selector to `[data-bs-toggle="popover"]` — the same reusable pattern.

## Title and Content, Not Just One String
Where a tooltip has a single `data-bs-title`, a popover splits into two: `data-bs-title` (the bolded heading) and `data-bs-content` (the body text below it) — this is the structural difference that justifies choosing a popover over a tooltip when you have more than a single short phrase to convey.

## Default Trigger: Click, Not Hover
This is an important behavioral difference from tooltips: popovers default to a **click** trigger (toggle open/closed), while tooltips default to **hover/focus**. This makes sense given the difference in content length — a longer popover body benefits from staying open until the user deliberately dismisses it, rather than vanishing the instant the mouse moves away.

## Dismiss on Next Click (Focus Trigger)
For a popover that should close as soon as the user clicks anywhere else — a common expectation for popovers attached to a link or icon — use the `focus` trigger instead:

```html
<a href="#" class="btn btn-secondary" role="button" data-bs-toggle="popover" 
   data-bs-trigger="focus" data-bs-title="Dismissible popover" 
   data-bs-content="This popover closes when you click elsewhere.">
  Dismissible popover
</a>
```

`data-bs-trigger="focus"` requires the triggering element to actually be focusable — this is why `role="button"` and `href="#"` matter on an `<a>` used this way, mirroring the same `<a>`-as-button accessibility concern first raised in Module 06, Lesson 01.

## Choosing Between Tooltip, Popover, and Modal
By this point you have three components capable of showing supplementary content, and picking the right one matters:
- **Tooltip** — a single short phrase, shown on hover/focus, no persistent interaction needed
- **Popover** — a short heading plus a sentence or two of body text, typically click-triggered, still lightweight
- **Modal** (Lesson 01) — anything requiring real user interaction, forms, or content substantial enough that it needs its own dedicated space and focus-trapped attention

If you find yourself wanting to put a button or a form field inside a popover, that's usually a sign you actually need a modal instead.

## Practical Example
A form field with a click-triggered help popover explaining a password requirement:

```html
<label for="pwHelp" class="form-label">
  Password
  <button type="button" class="btn btn-sm btn-link p-0" data-bs-toggle="popover" 
          data-bs-trigger="focus" data-bs-title="Password requirements" 
          data-bs-content="Must be 8+ characters, include a number, and one symbol.">
    (?)
  </button>
</label>
<input type="password" class="form-control" id="pwHelp">

<script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
  const popoverList = [...popoverTriggerList].map(el => new bootstrap.Popover(el));
</script>
```

## Revision Questions

<details>
<summary>1. What's the structural difference between a tooltip's content and a popover's content?</summary>
A tooltip has a single `data-bs-title` string; a popover splits into a separate `data-bs-title` (heading) and `data-bs-content` (body text), suited to more substantial content.
</details>

<details>
<summary>2. What's the default trigger for a popover, and how does that differ from a tooltip's default?</summary>
Popovers default to a click trigger (toggle open/closed); tooltips default to hover/focus — the difference reflects popovers typically holding longer content that benefits from staying open until dismissed deliberately.
</details>

<details>
<summary>3. When would you use `data-bs-trigger="focus"` on a popover, and what accessibility requirement comes with it?</summary>
When the popover should close as soon as the user clicks elsewhere; the triggering element must be genuinely focusable, which is why `role="button"` (and a real `href`) matter if the trigger is an `<a>` element.
</details>

<details>
<summary>4. What's a good signal that you should actually use a modal instead of a popover?</summary>
Wanting to place a button, form field, or any real interactive control inside the popover's content — that level of interaction generally calls for a modal's dedicated, focus-trapped space instead.
</details>
