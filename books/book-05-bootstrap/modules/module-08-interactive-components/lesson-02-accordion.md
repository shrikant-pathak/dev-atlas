# Lesson 02: Accordion

## Learning Objectives
- Build an accordion with `.accordion`, `.accordion-item`, `.accordion-header`, `.accordion-collapse`
- Understand how accordions are built on top of the collapse component from Lesson 03
- Control whether multiple panels can be open at once (`data-bs-parent`)
- Apply the flush variant and always-open behavior

## Introduction
Structurally, an accordion is several collapse panels (the general show/hide mechanism you'll formalize in Lesson 03) grouped together with an added constraint: opening one panel typically closes the others. Covering accordion first, before the more general-purpose collapse lesson, mirrors how you'll most often encounter this behavior in real projects — as a ready-made accordion rather than a hand-assembled collapse group.

## Basic Accordion
```html
<div class="accordion" id="faqAccordion">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" 
              data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        What is Bootstrap?
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        Bootstrap is a CSS and JS framework for building responsive websites.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
              data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Is it free to use?
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
      <div class="accordion-body">
        Yes, Bootstrap is open source and free under the MIT license.
      </div>
    </div>
  </div>
</div>
```

## Breaking Down the Structure
- **`.accordion-item`** — one collapsible section, containing a header and a collapse panel
- **`.accordion-header`** wraps a **`.accordion-button`** — this is a real `<button>`, not a link, since it's a genuine interactive control, not navigation
- **`.collapsed`** on the button is purely a visual class (rotates the chevron icon) that Bootstrap's JS toggles automatically alongside `aria-expanded` — matching the state-syncing pattern from every toggle component since Module 07
- **`.accordion-collapse.collapse`** is the hidden/shown panel itself — same `.collapse` class family used generically in Lesson 03
- **`.accordion-body`** — inner padding wrapper for the panel's content

## `data-bs-parent`: The "Only One Open" Mechanism
```html
data-bs-parent="#faqAccordion"
```

This is the single attribute that turns a plain set of independent collapse panels into a true accordion — it tells Bootstrap's JS "when this panel opens, close every other panel that shares this same parent." Remove `data-bs-parent` from every panel, and you get a set of fully independent collapses that can all be open simultaneously — which is exactly the "always open" variant covered next.

## Always-Open Accordion
Simply omit `data-bs-parent` on each `.accordion-collapse`:

```html
<div class="accordion" id="alwaysOpenAccordion">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#alwaysOne">
        Section One
      </button>
    </h2>
    <div id="alwaysOne" class="accordion-collapse collapse show">
      <div class="accordion-body">Content one.</div>
    </div>
  </div>
</div>
```

## Flush Variant
```html
<div class="accordion accordion-flush" id="flushAccordion">
  ...
</div>
```

`.accordion-flush` removes the accordion's default outer border and rounded corners — the same "flush" naming and effect concept as `.list-group-flush` from Module 07, used when the accordion should sit borderless inside another container like a card.

## Practical Example
An FAQ accordion using the default single-open behavior:

```html
<div class="accordion" id="pricingFaq">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" 
              data-bs-target="#faq1" aria-expanded="true" aria-controls="faq1">
        Can I cancel anytime?
      </button>
    </h2>
    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#pricingFaq">
      <div class="accordion-body">Yes, no long-term contract required.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
              data-bs-target="#faq2" aria-expanded="false" aria-controls="faq2">
        Do you offer refunds?
      </button>
    </h2>
    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#pricingFaq">
      <div class="accordion-body">Yes, within 30 days of purchase.</div>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What single attribute is responsible for the "only one panel open at a time" behavior?</summary>
`data-bs-parent`, pointing at the accordion's outer container id — it tells Bootstrap's JS to close every sibling panel sharing that parent when one is opened.
</details>

<details>
<summary>2. How would you allow multiple accordion panels to stay open simultaneously?</summary>
Omit the `data-bs-parent` attribute from each `.accordion-collapse` panel, turning them into fully independent collapses instead of a coordinated group.
</details>

<details>
<summary>3. What does the `.collapsed` class on an accordion button do, and how does its state get managed?</summary>
It's a purely visual class (rotates the chevron icon) that Bootstrap's JS toggles automatically in sync with `aria-expanded`, the same automatic state-syncing pattern used by every toggle component since Module 07.
</details>

<details>
<summary>4. What does `.accordion-flush` change, and what earlier component's "flush" variant does it parallel?</summary>
It removes the accordion's outer border and rounded corners, directly paralleling `.list-group-flush` from Module 07 — used when the component should sit borderless inside a parent container.
</details>
