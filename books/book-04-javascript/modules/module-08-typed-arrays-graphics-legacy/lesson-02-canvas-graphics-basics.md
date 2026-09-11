# Lesson 2: Canvas Graphics Basics

## Learning Objectives
- Set up a `<canvas>` element and get its 2D rendering context
- Draw shapes, paths, text, and images onto a canvas
- Understand the canvas coordinate system and the immediate-mode drawing model
- Read and manipulate raw pixel data with `ImageData`, connecting back to typed arrays from Lesson 1
- Build a simple animation loop with `requestAnimationFrame`

## Introduction

Everything you've built so far in this book has been declarative: you describe DOM elements (Module 04) and the browser figures out how to draw them. Canvas is different. It's an **imperative**, pixel-based drawing surface — you give explicit step-by-step instructions ("move here, draw a line to there, fill this shape"), and once drawn, the browser has no memory of *how* something got onto the canvas. There's no "canvas element tree" to inspect or update the way there is with the DOM — if you want to change something, you redraw it.

This makes canvas the tool of choice for games, data visualizations, image editors, and generative art — anything where you need direct, high-performance control over individual pixels rather than a tree of styled elements.

## Setting Up a Canvas

A `<canvas>` is just an HTML element with a width and height. On its own it draws nothing — you get a **rendering context** from it, and that context object is what you actually draw with.

```html
<canvas id="myCanvas" width="400" height="300"></canvas>
```

```js
const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');
```

`getContext('2d')` gives you the 2D drawing API this lesson covers. (There's also `'webgl'` for 3D/GPU-accelerated graphics, which is out of scope here, but everything you learn about the canvas coordinate system and pixel data applies there too.)

Set width and height as HTML/JS attributes, not CSS. Setting canvas size via CSS (`canvas { width: 400px }`) stretches the existing pixel grid rather than giving you more pixels to draw with, causing blurry output — a common beginner mistake.

## The Coordinate System

Canvas uses a coordinate system where `(0, 0)` is the **top-left corner**, x increases to the right, and y increases **downward** — the opposite of the Cartesian graphs you may remember from math class.

(0,0) ────────────► x
│
│
│
▼
y


Every drawing method takes coordinates in this system, measured in pixels.

## Drawing Shapes

The context object exposes methods for filling and stroking (outlining) shapes.

```js
// Rectangle
ctx.fillStyle = 'steelblue';
ctx.fillRect(20, 20, 150, 100); // x, y, width, height

ctx.strokeStyle = 'darkred';
ctx.lineWidth = 3;
ctx.strokeRect(200, 20, 150, 100);

// Clear a region (useful before redrawing a frame)
ctx.clearRect(0, 0, canvas.width, canvas.height);
```

For anything beyond a rectangle, you build a **path**: a sequence of points and line/curve instructions, then fill or stroke it.

```js
ctx.beginPath();
ctx.moveTo(50, 200);      // start point
ctx.lineTo(150, 200);     // line to
ctx.lineTo(100, 120);     // line to
ctx.closePath();          // connects back to the start, forming a triangle
ctx.fillStyle = 'orange';
ctx.fill();
```

Circles and arcs use `arc(x, y, radius, startAngle, endAngle)`, with angles in **radians**, not degrees:

```js
ctx.beginPath();
ctx.arc(300, 200, 50, 0, Math.PI * 2); // full circle
ctx.fillStyle = 'seagreen';
ctx.fill();
```

## Text and Images

```js
ctx.font = '24px sans-serif';
ctx.fillStyle = 'black';
ctx.fillText('Hello, Canvas', 20, 250);

const img = new Image();
img.onload = () => {
  ctx.drawImage(img, 0, 0, 100, 100); // draw at (0,0), scaled to 100x100
};
img.src = 'photo.png';
```

Note the `img.onload` — image loading is asynchronous (echoing the async patterns from Module 05), so you must wait for the image to finish loading before you can safely draw it.

## Saving and Restoring State, and Transformations

The context carries state — current fill color, stroke color, transformations, and so on. `ctx.save()` pushes the current state onto a stack, and `ctx.restore()` pops it back, which is invaluable when you want to apply a temporary transformation without affecting everything drawn afterward.

```js
ctx.save();
ctx.translate(200, 150);       // move the origin
ctx.rotate(Math.PI / 4);       // rotate 45 degrees
ctx.fillStyle = 'purple';
ctx.fillRect(-25, -25, 50, 50); // drawn relative to the new, rotated origin
ctx.restore();                  // undo translate + rotate for subsequent drawing
```

## Pixel Data: Where Typed Arrays Come Back In

Canvas gives you direct access to the raw pixel data of a region, via `getImageData`, and it comes back as an `ImageData` object whose `.data` property is a `Uint8ClampedArray` — the same typed arrays you learned in Lesson 1.

```js
const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
console.log(imageData.data); // Uint8ClampedArray

// Each pixel is 4 consecutive values: R, G, B, A (0-255 each)
console.log(imageData.data.length); // width * height * 4
```

Because it's a typed array, you can loop over it directly to manipulate pixels — for example, converting an image to grayscale by averaging each pixel's RGB values:

```js
function toGrayscale(ctx, width, height) {
  const imageData = ctx.getImageData(0, 0, width, height);
  const data = imageData.data;

  for (let i = 0; i < data.length; i += 4) {
    const avg = (data[i] + data[i + 1] + data[i + 2]) / 3;
    data[i] = avg;     // R
    data[i + 1] = avg; // G
    data[i + 2] = avg; // B
    // data[i + 3] is alpha — leave it untouched
  }

  ctx.putImageData(imageData, 0, 0); // write the modified pixels back
}
```

`Uint8ClampedArray` is a good fit here specifically because pixel channel values must stay within 0–255 — if a computation produces 280 or -10, the "clamped" behavior automatically caps it to 255 or 0 instead of wrapping around, which is exactly what you want for color math.

## Animation with requestAnimationFrame

Canvas has no built-in animation — you redraw the entire frame yourself, repeatedly, using `requestAnimationFrame` to sync with the browser's refresh rate (typically 60 times per second).

```js
let x = 0;

function animate() {
  ctx.clearRect(0, 0, canvas.width, canvas.height); // clear previous frame
  ctx.fillStyle = 'tomato';
  ctx.fillRect(x, 100, 40, 40);

  x += 2;
  if (x > canvas.width) x = -40; // wrap around

  requestAnimationFrame(animate); // schedule the next frame
}

requestAnimationFrame(animate); // kick off the loop
```

`requestAnimationFrame` is preferable to `setInterval` (Module 07) for animation: it automatically pauses when the tab isn't visible, and it's timed to the display's actual refresh rate rather than a fixed interval, producing smoother motion with less wasted work.

## Practical Example

A simple bouncing ball, tying together shapes, clearing, and the animation loop:

```html
<canvas id="ballCanvas" width="400" height="300" style="border: 1px solid #ccc;"></canvas>
```

```js
const canvas = document.getElementById('ballCanvas');
const ctx = canvas.getContext('2d');

const ball = { x: 50, y: 50, radius: 20, dx: 3, dy: 2, color: 'royalblue' };

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  ctx.beginPath();
  ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
  ctx.fillStyle = ball.color;
  ctx.fill();

  // bounce off walls
  if (ball.x + ball.radius > canvas.width || ball.x - ball.radius < 0) {
    ball.dx *= -1;
  }
  if (ball.y + ball.radius > canvas.height || ball.y - ball.radius < 0) {
    ball.dy *= -1;
  }

  ball.x += ball.dx;
  ball.y += ball.dy;

  requestAnimationFrame(draw);
}

requestAnimationFrame(draw);
```

## Revision Questions

<details>
<summary>1. How is canvas's drawing model fundamentally different from working with the DOM?</summary>

The DOM is declarative and retained — you describe elements as a tree, and the browser keeps track of them so you can query and update individual nodes later. Canvas is imperative and immediate-mode — you issue drawing commands directly onto a pixel grid, and once something is drawn, there's no reference to "it" anymore; changing anything requires clearing and redrawing.
</details>

<details>
<summary>2. Why does setting a canvas's size via CSS cause blurry drawing?</summary>

CSS width/height stretches the existing fixed pixel grid to fit the new display size rather than creating more pixels to draw into. The canvas's actual resolution is controlled by its width/height attributes (or properties), not its CSS size.
</details>

<details>
<summary>3. What type of array does getImageData return the pixel data as, and why is that type a good fit?</summary>

It returns a `Uint8ClampedArray`. It's a good fit because each color channel (R, G, B, A) must stay within the 0–255 range, and the "clamped" behavior automatically caps out-of-range values to 0 or 255 instead of wrapping around, matching how color math should behave.
</details>

<details>
<summary>4. Why is requestAnimationFrame generally preferred over setInterval for animations?</summary>

`requestAnimationFrame` syncs with the browser's actual display refresh rate for smoother motion, and it automatically pauses when the tab is in the background, saving CPU and battery — behavior `setInterval` doesn't provide on its own.
</details>
