# Lesson 01: Navigation Bars

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a horizontal navbar using Flexbox.
- Build a responsive navbar that collapses into a mobile menu.
- Apply active/hover states to navigation links.

---

# Introduction

This module shifts from individual CSS properties to complete, real-world UI patterns — assembling everything from Modules 01–09 into components you'll build constantly in actual projects. Navigation bars are the natural starting point: nearly every site has one, and it's a genuinely excellent showcase of Flexbox, positioning, and responsive design working together.

---

# The Basic Structure

```html
<nav class="navbar">
  <div class="navbar-brand">Dev Atlas</div>
  <ul class="navbar-links">
    <li><a href="#" class="active">Home</a></li>
    <li><a href="#">Courses</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```
```css
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
  background: #1a1a2e;
}

.navbar-links {
  display: flex;
  gap: 1.5rem;
  list-style: none;
}

.navbar-links a {
  color: white;
  text-decoration: none;
}

.navbar-links a.active,
.navbar-links a:hover {
  color: #4a90d9;
}
```

Recall Flexbox from Module 06 — `justify-content: space-between` pushes the brand left and the links right in one line, and `align-items: center` keeps everything vertically centered regardless of differing element heights.

---

# Making It Sticky

```css
.navbar {
  position: sticky;
  top: 0;
  z-index: 100;
}
```

Recall `position: sticky` and `z-index`/stacking context from Module 05 — the navbar scrolls normally until it reaches the top of the viewport, then sticks there. The `z-index` ensures it renders above page content scrolling beneath it.

---

# Responsive Collapse (Hamburger Pattern Preview)

```css
.navbar-links {
  display: flex;
}

.hamburger {
  display: none;
}

@media (max-width: 700px) {
  .navbar-links {
    display: none; /* hidden by default on mobile */
  }

  .hamburger {
    display: block; /* shown only on mobile */
  }
}
```

Recall mobile-first media queries from Module 08 — on narrow screens, the full link list hides and a hamburger icon takes its place. Actually *toggling* that hidden menu open typically needs a small amount of JavaScript to add/remove a class, which is outside CSS's scope — but the show/hide styling itself is pure CSS, driven by that toggled class:

```css
.navbar-links.mobile-open {
  display: flex;
  flex-direction: column;
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: #1a1a2e;
}
```

---

# Practical Example: A Complete Responsive Navbar

```html
<nav class="navbar">
  <div class="navbar-brand">Dev Atlas</div>
  <button class="hamburger">☰</button>
  <ul class="navbar-links">
    <li><a href="#">Home</a></li>
    <li><a href="#">Courses</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```
```css
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
  background: #1a1a2e;
  position: sticky;
  top: 0;
}

.navbar-links {
  display: flex;
  gap: 1.5rem;
  list-style: none;
}

.hamburger { display: none; background: none; border: none; color: white; font-size: 1.5rem; }

@media (max-width: 700px) {
  .navbar-links { display: none; }
  .hamburger { display: block; }
}
```

This single component now handles both a full desktop link row and a hidden mobile state ready for a hamburger toggle — the complete, realistic shape of a navbar you'll build repeatedly.

---

# Revision Questions

1. Which Flexbox property spaces the brand and links apart on opposite ends of a navbar?
2. What does `position: sticky` do differently from `position: fixed`?
3. Why is JavaScript typically still needed for a "hamburger menu," even though the show/hide styling is pure CSS?

<details><summary>Answers</summary>

1. `justify-content: space-between`.
2. `sticky` scrolls normally with the page until it reaches a specified threshold (e.g., `top: 0`), then sticks in place; `fixed` is positioned relative to the viewport from the start and never scrolls with the page at all.
3. CSS alone has no way to toggle a class or state on click — a small amount of JavaScript is needed to add/remove the class that CSS then uses to show or hide the mobile menu.

</details>
