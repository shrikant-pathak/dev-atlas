# 📄 Cheat Sheet — Flexbox

## Activate

```css
.container { display: flex; }
```

## Container Properties

```css
flex-direction: row | row-reverse | column | column-reverse;
flex-wrap: nowrap | wrap | wrap-reverse;
flex-flow: row wrap;  /* shorthand */

justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly;
align-items: stretch | flex-start | flex-end | center | baseline;
align-content: /* same values as justify-content, for multiple wrapped lines */

gap: 20px;           /* row and column */
gap: 10px 20px;        /* row-gap column-gap */
```

## Item Properties

```css
flex-grow: 1;      /* proportion of extra space to consume */
flex-shrink: 1;      /* proportion to shrink by if space is tight */
flex-basis: 200px;     /* starting size before grow/shrink */

flex: 1;                  /* grow:1 shrink:1 basis:0 — equal sharing */
flex: auto;                 /* grow:1 shrink:1 basis:auto */
flex: none;                   /* grow:0 shrink:0 — rigid */
flex: 0 0 200px;                /* fixed 200px, never resizes */

align-self: center;               /* override this ONE item's cross-axis alignment */
order: 1;                           /* visual reorder (⚠️ doesn't affect a11y/tab order) */
```

## Common Patterns

```css
/* Perfect centering */
.center { display: flex; justify-content: center; align-items: center; }

/* Nav bar */
.nav { display: flex; justify-content: space-between; align-items: center; }

/* Equal columns */
.col { flex: 1; }

/* Fixed sidebar + fluid main */
.sidebar { flex: 0 0 250px; }
.main { flex: 1; }

/* Sticky footer */
body { display: flex; flex-direction: column; min-height: 100vh; }
main { flex: 1; }

/* Wrapping card grid */
.grid { display: flex; flex-wrap: wrap; gap: 20px; }
.card { flex: 1 1 250px; }
```
