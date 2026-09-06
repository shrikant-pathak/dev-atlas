# Lesson 03: Container Queries

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the limitation of media queries that container queries solve.
- Set up a containment context with `container-type`.
- Write a `@container` query targeting a component's own size.

---

# Introduction

Every responsive technique so far — media queries (Module 08), even the fluid `calc()`/`clamp()` math in Lesson 02 — ultimately responds to one thing: **the viewport's** size (or values derived from it). That's the right tool for page-level layout, but it breaks down for reusable *components*: a card component might live in a wide main content area on one page and a narrow sidebar on another. The viewport is identical in both cases, but the component needs to look different. Container queries solve exactly this.

---

# The Limitation of Media Queries

```css
.card {
  display: flex;
  flex-direction: row;
}

@media (max-width: 500px) {
  .card { flex-direction: column; }
}
```

This card stacks vertically only when the *entire viewport* drops below 500px. But if this same `.card` component is dropped into a narrow 300px-wide sidebar on a desktop-width page, the media query never fires — the viewport is plenty wide, even though the card's own available space is cramped. The component has no way to respond to its actual container's size using media queries alone.

---

# Setting Up a Containment Context

Before `@container` queries can target an element, a *parent* element must explicitly opt in as a "container":

```css
.card-wrapper {
  container-type: inline-size;
  container-name: card; /* optional, but useful with multiple containers */
}
```

- **`container-type: inline-size`** — tells the browser to track this element's inline-axis size (width, in a standard horizontal writing mode) so descendants can query against it.
- **`container-name`** — an optional label, useful for disambiguating when a component might be nested inside multiple potential containers.

---

# Writing a Container Query

```css
@container card (min-width: 400px) {
  .card {
    flex-direction: row;
  }
}

@container card (max-width: 399px) {
  .card {
    flex-direction: column;
  }
}
```

The syntax deliberately mirrors `@media` — `min-width`/`max-width`, `and`/`or` combinators, all work identically. The critical difference is what's being measured: not the viewport, but the nearest ancestor with a matching `container-type`.

---

# Full Working Example

```html
<div class="card-wrapper">
  <div class="card">
    <img src="thumb.jpg" alt="">
    <div class="card-content">
      <h3>Card Title</h3>
      <p>Some card description text.</p>
    </div>
  </div>
</div>
```
```css
.card-wrapper {
  container-type: inline-size;
}

.card {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

@container (min-width: 400px) {
  .card {
    flex-direction: row;
    align-items: center;
  }
}
```

This exact same `.card` markup can now be dropped into a wide main content column (where it lays out horizontally, image beside text) or a narrow sidebar (where it stacks vertically) — genuinely responding to its own available space, completely independent of the overall page/viewport width.

---

# Container Queries vs. Media Queries — When to Use Which

- **Media queries**: page-level layout decisions — overall grid structure, navigation collapse (recall Module 10's navbar), viewport-wide typography.
- **Container queries**: reusable component-level decisions — a card, a widget, a nav item — anything meant to be dropped into varying contexts and look right regardless of where it lands.

In practice, many modern component-based codebases (recall this connects directly to your React/Vue work) use both together: media queries to shape the page, container queries to make individual components genuinely context-aware.

---

# Practical Example: A Sidebar Widget That Adapts

```css
.widget-slot {
  container-type: inline-size;
}

.widget {
  display: grid;
  grid-template-columns: 1fr;
}

@container (min-width: 300px) {
  .widget {
    grid-template-columns: auto 1fr;
  }
}
```

Recall Grid from Module 07 — the exact same `.widget` component stacks its icon above its text in a cramped 250px sidebar slot, but switches to a side-by-side Grid layout the moment it's placed somewhere with 300px or more available — no page-level media query involved at all.

---

# Revision Questions

1. What problem do container queries solve that media queries structurally cannot?
2. What CSS property must be set on a parent element before `@container` can target its descendants?
3. Give one example of when you'd reach for a media query instead of a container query, and vice versa.

<details><summary>Answers</summary>

1. Media queries can only respond to the viewport's size, not a component's actual available space within its parent; container queries let a component adapt based on its own container's size regardless of the overall viewport width.
2. `container-type` (e.g., `container-type: inline-size`).
3. Media queries suit page-level decisions (overall layout structure, navigation collapse); container queries suit reusable components that need to adapt correctly regardless of where they're placed on the page (a card, a widget, a sidebar item).

</details>
