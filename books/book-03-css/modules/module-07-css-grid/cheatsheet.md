# Module 07 Cheatsheet — CSS Grid

## Activation
```css
.container { display: grid; }
```

## Defining Tracks
```css
grid-template-columns: 1fr 2fr 1fr;
grid-template-columns: repeat(4, 1fr);
grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
grid-template-rows: auto 1fr auto;
```

## Spacing
```css
gap: 1rem;
row-gap: 1rem;
column-gap: 2rem;
```

## Container Alignment
```css
justify-items: center;   /* items inside their cell, row axis */
align-items: center;     /* items inside their cell, column axis */
justify-content: center; /* whole grid inside container, row axis */
align-content: center;   /* whole grid inside container, column axis */
```

## Item Placement
```css
grid-column: 1 / 3;
grid-column: span 2;
grid-row: 2 / span 2;
grid-area: 1 / 1 / 3 / 4; /* row-start / col-start / row-end / col-end */
```

## Item Self-Alignment
```css
justify-self: end;
align-self: center;
```

## Named Template Areas
```css
grid-template-areas:
  "header header"
  "sidebar main"
  "footer footer";

.header { grid-area: header; }
```
Use `.` for an intentionally empty cell.

## 12-Column Pattern
```css
grid-template-columns: repeat(12, 1fr);
.half    { grid-column: span 6; }
.third   { grid-column: span 4; }
.quarter { grid-column: span 3; }
```

## Feature Detection
```css
@supports (display: grid) { /* ... */ }
@supports not (gap: 1rem) { /* ... */ }
@supports (display: grid) and (gap: 1rem) { /* ... */ }
```
