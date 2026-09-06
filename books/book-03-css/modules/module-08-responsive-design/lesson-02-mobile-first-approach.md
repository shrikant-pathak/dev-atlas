# Lesson 02: Mobile-First Approach

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the difference between mobile-first and desktop-first CSS strategies.
- Write a layout using the mobile-first approach with `min-width` queries.
- Articulate why mobile-first is the modern industry default.

---

# Introduction

Lesson 01 gave you the mechanism (media queries); this lesson is about the **strategy** for using them — specifically, which direction you write your base styles and breakpoints in. This is a genuinely consequential decision that affects every stylesheet you write from here on.

---

# Desktop-First (The Older Approach)

```css
/* Base styles: designed for desktop */
.container {
  display: flex;
  flex-direction: row;
}

/* Override DOWN for smaller screens */
@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
}
```

Base (unqueried) styles target desktop; `max-width` queries progressively override and simplify the layout for smaller screens. This was the natural approach when the web was designed for desktop first and mobile was an afterthought — which is, genuinely, no longer how most real traffic looks.

---

# Mobile-First (The Modern Default)

```css
/* Base styles: designed for mobile — simplest, most constrained case */
.container {
  display: flex;
  flex-direction: column;
}

/* Enhance UP for larger screens */
@media (min-width: 768px) {
  .container {
    flex-direction: row;
  }
}
```

Base (unqueried) styles target mobile — the simplest, narrowest, most constrained layout — and `min-width` queries progressively *add* complexity and richness as screen space becomes available.

---

# Why Mobile-First Won

- **Mobile traffic dominance** — for most sites today, the majority of visits come from phones, so it makes sense to optimize the base (unqueried, always-loaded) styles for the most common case.
- **Progressive enhancement mindset** — starting simple and adding complexity tends to produce cleaner, more maintainable CSS than starting complex and subtracting.
- **Performance** — mobile devices, which may be on slower connections, load the simpler base styles by default; the more complex desktop styles only apply on larger screens that can typically afford it.
- **Forces genuine prioritization** — designing for a small screen first forces real decisions about what content actually matters, which usually improves the desktop version too.

---

# A Side-by-Side Comparison

```css
/* DESKTOP-FIRST */
.grid { grid-template-columns: repeat(4, 1fr); }
@media (max-width: 900px) { .grid { grid-template-columns: repeat(2, 1fr); } }
@media (max-width: 500px) { .grid { grid-template-columns: 1fr; } }
```

```css
/* MOBILE-FIRST (equivalent result) */
.grid { grid-template-columns: 1fr; }
@media (min-width: 500px) { .grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 900px) { .grid { grid-template-columns: repeat(4, 1fr); } }
```

Both produce the identical visual result at every breakpoint — the difference is entirely about which direction you're thinking in while writing the CSS, and which case is treated as the default.

---

# Practical Example: A Mobile-First Card Layout

```html
<div class="cards">
  <div class="card">1</div>
  <div class="card">2</div>
  <div class="card">3</div>
</div>
```
```css
/* Mobile base: single column, full width */
.cards {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

/* Tablet and up: two columns */
@media (min-width: 600px) {
  .cards { grid-template-columns: repeat(2, 1fr); }
}

/* Desktop and up: three columns */
@media (min-width: 1000px) {
  .cards { grid-template-columns: repeat(3, 1fr); }
}
```

Recall Module 07's Grid properties — the same `grid-template-columns` technique, now deliberately layered mobile-first: one column by default, growing as more space becomes available.

---

# Revision Questions

1. In mobile-first CSS, do base (unqueried) styles target mobile or desktop?
2. Which media query type (`min-width` or `max-width`) is characteristic of mobile-first?
3. Name two reasons mobile-first became the industry default.

<details><summary>Answers</summary>

1. Mobile — base styles are the simplest, most constrained case, with complexity added for larger screens.
2. `min-width`.
3. Any two of: mobile traffic dominance, a cleaner progressive-enhancement mindset, performance benefits for mobile/slower connections, and it forces genuine content prioritization.

</details>
