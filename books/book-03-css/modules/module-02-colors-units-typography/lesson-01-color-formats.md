# Lesson 01: Color Formats

## Learning Objectives
By the end of this lesson, you will be able to:
- Use named colors, hex, RGB, and HSL color formats correctly.
- Understand transparency via RGBA/HSLA and the alpha channel.
- Choose the right color format for a given situation.

---

# Introduction

Color is one of the very first things you'll want to control with CSS, and it connects directly back to Book 01, Module 02's number systems lesson — hex colors are literally hexadecimal numbers you already understand the math behind.

---

# Named Colors

CSS supports 140+ predefined color names:

```css
h1 { color: tomato; }
p { color: darkslategray; }
div { background-color: lightblue; }
```

Genuinely convenient for quick prototyping, but limited — you can't precisely control a specific brand color with named colors alone.

---

# Hex Colors

```css
h1 { color: #3498db; }
```

Recall Book 01, Module 02: hex is base-16, and each pair of hex digits represents Red, Green, and Blue intensity (0–255, written as `00`–`FF`):

#3498db
↑↑ ↑↑ ↑↑
R G B
34 = 52 (red)
98 = 152 (green)
db = 219 (blue)

**Shorthand hex:** when each pair repeats the same digit, you can shorten to 3 characters:
```css
#ffffff  /* white */
#fff     /* same white, shorthand */
#ff0000  /* red */
#f00     /* same red, shorthand */
```

---

# RGB Colors

The same Red/Green/Blue values, written as plain decimal numbers instead of hex:

```css
h1 { color: rgb(52, 152, 219); }
```

Functionally identical to `#3498db` — just a different, arguably more readable, way of writing the exact same color. Whether you prefer hex or RGB is largely a stylistic choice; both are equally valid and equally supported.

---

# RGBA: Adding Transparency

RGBA adds a fourth value — **alpha** (opacity), from `0` (fully transparent) to `1` (fully opaque):

```css
.overlay {
  background-color: rgba(0, 0, 0, 0.5);  /* 50% transparent black */
}
```

This is genuinely one of the most common real-world CSS patterns — semi-transparent overlays on images, modals (Book 02, Module 06's `<dialog>` preview), and hover effects all rely on this.

---

# HSL Colors: Thinking About Color Differently

**HSL (Hue, Saturation, Lightness)** describes color in a way many people find more intuitive than RGB:

```css
h1 { color: hsl(204, 70%, 53%); }
```

- **Hue** (0–360) — the actual color, based on a color wheel (0/360 = red, 120 = green, 240 = blue).
- **Saturation** (0–100%) — how vivid/intense the color is (0% = gray, 100% = fully vivid).
- **Lightness** (0–100%) — how light/dark (0% = black, 100% = white, 50% = the "pure" color).

**Why HSL is genuinely useful in practice:** creating a *lighter or darker version of the same color* is trivial — just change the Lightness value, keeping Hue and Saturation identical:

```css
.button { background-color: hsl(204, 70%, 53%); }
.button:hover { background-color: hsl(204, 70%, 43%); }  /* same color, darker */
```

Doing this same "make it darker" adjustment with hex or RGB requires recalculating all three R/G/B values — HSL makes color relationships far more intuitive to work with.

**HSLA** works exactly like RGBA — a fourth alpha value for transparency:
```css
.overlay { background-color: hsla(204, 70%, 53%, 0.3); }
```

---

# Choosing a Color Format

| Situation | Recommended Format |
|---|---|
| Quick prototyping | Named colors |
| Matching an exact brand/design color | Hex or RGB (whichever the designer provides) |
| Needing transparency | RGBA or HSLA |
| Needing lighter/darker variations of the same color | HSL/HSLA |

---

# Practical Example

```css
:root {
  --brand-color: hsl(204, 70%, 53%);
}

.card {
  background-color: white;
  border: 1px solid #dddddd;
}

.card-overlay {
  background-color: rgba(0, 0, 0, 0.6);
}

.button {
  background-color: hsl(204, 70%, 53%);
}
.button:hover {
  background-color: hsl(204, 70%, 43%);
}
```
(The `:root` custom property syntax is previewed here — full depth in Module 12.)

---

# Revision Questions

1. What do the three pairs of digits in a hex color represent?
2. What does the alpha value in RGBA/HSLA control, and what range does it use?
3. Why is HSL often more convenient than RGB for creating lighter/darker variants of the same color?

<details><summary>Answers</summary>

1. Red, Green, and Blue intensity respectively, each ranging from `00` to `FF` in hexadecimal.
2. Opacity/transparency, ranging from 0 (fully transparent) to 1 (fully opaque).
3. Because you can adjust just the Lightness value while keeping Hue and Saturation unchanged, producing a lighter or darker version of the exact same color — RGB would require recalculating all three R/G/B values to achieve the same effect.

</details>
