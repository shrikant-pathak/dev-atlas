# Module 09 Cheatsheet — Backgrounds, Borders & Visual Effects

## Backgrounds
```css
background: color image repeat position / size;
background: linear-gradient(to right, #ff7e5f, #feb47b);
background: radial-gradient(circle at top right, yellow, transparent);
background: conic-gradient(red, yellow, green, blue, red);
background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url("photo.jpg") center / cover;
```

## Shadows
```css
box-shadow: 0 4px 8px rgba(0,0,0,0.15);           /* x y blur spread color */
box-shadow: inset 0 2px 4px rgba(0,0,0,0.3);      /* inner shadow */
box-shadow: 0 1px 2px rgba(0,0,0,0.1), 0 4px 12px rgba(0,0,0,0.1); /* layered */
text-shadow: 1px 1px 2px rgba(0,0,0,0.5);         /* x y blur color (no spread) */
```

## Text Effects
```css
white-space: nowrap; overflow: hidden; text-overflow: ellipsis; /* truncate */
overflow-wrap: break-word;   /* wrap long words */
background: linear-gradient(...); background-clip: text; color: transparent; /* gradient text */
filter: grayscale(100%) blur(4px) brightness(1.2) contrast(1.1);
backdrop-filter: blur(10px); /* frosted glass */
```

## CSS Counters
```css
.list { counter-reset: item; }
.list li { counter-increment: item; }
.list li::before { content: counter(item) ". "; }
```

## Opacity
```css
opacity: 0.5;              /* fades ENTIRE element + children */
background: rgba(0,0,0,0.5); /* fades ONLY the color */
```
