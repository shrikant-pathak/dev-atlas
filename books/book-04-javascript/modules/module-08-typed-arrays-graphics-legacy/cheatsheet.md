# Module 08 Cheatsheet: Typed Arrays, Graphics & Legacy Web Tech

## Typed Arrays & ArrayBuffer

```js
// Raw memory
const buffer = new ArrayBuffer(16); // 16 bytes

// Views over that memory
const ints = new Int32Array(buffer);      // 4 elements (4 bytes each)
const bytes = new Uint8Array(buffer);     // 16 elements (1 byte each)

// Create directly
const floats = new Float32Array(4);
floats[0] = 3.14;

// From a regular array
const arr = Int16Array.from([1, 2, 3]);

// Mixed-type access with explicit endianness
const view = new DataView(buffer);
view.setInt16(0, 42);
view.setFloat32(2, 3.14, true); // true = little-endian
view.getInt16(0);
```

| Type | Bytes | Notes |
|---|---|---|
| `Int8Array` / `Uint8Array` | 1 | whole bytes |
| `Uint8ClampedArray` | 1 | clamps to 0–255 (used by Canvas pixel data) |
| `Int16Array` / `Uint16Array` | 2 | |
| `Int32Array` / `Uint32Array` | 4 | |
| `Float32Array` | 4 | single precision — can lose accuracy |
| `Float64Array` | 8 | double precision — same as normal JS numbers |

## Canvas

```js
const canvas = document.getElementById('c');
const ctx = canvas.getContext('2d');

// Shapes
ctx.fillStyle = 'blue';
ctx.fillRect(x, y, w, h);
ctx.strokeRect(x, y, w, h);
ctx.clearRect(x, y, w, h);

// Paths
ctx.beginPath();
ctx.moveTo(x1, y1);
ctx.lineTo(x2, y2);
ctx.closePath();
ctx.fill();  // or ctx.stroke();

// Circles/arcs
ctx.arc(x, y, radius, startAngle, endAngle); // radians!

// Text & images
ctx.fillText('hello', x, y);
ctx.drawImage(imgElement, x, y, w, h);

// State
ctx.save();
ctx.translate(x, y);
ctx.rotate(radians);
ctx.restore();

// Pixels (Uint8ClampedArray under the hood)
const imageData = ctx.getImageData(0, 0, w, h);
imageData.data[i]; // R, G, B, A repeating
ctx.putImageData(imageData, 0, 0);

// Animation loop
function loop() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  // ...draw frame...
  requestAnimationFrame(loop);
}
requestAnimationFrame(loop);
```

Coordinate system: `(0,0)` top-left, x → right, y → down.

## XMLHttpRequest

```js
const xhr = new XMLHttpRequest();
xhr.open('GET', url);

xhr.onload = () => {
  if (xhr.status >= 200 && xhr.status < 300) {
    console.log(JSON.parse(xhr.responseText));
  }
};
xhr.onerror = () => console.error('network error');

xhr.send();

// POST
xhr.open('POST', url);
xhr.setRequestHeader('Content-Type', 'application/json');
xhr.send(JSON.stringify(body));

// readyState values: 0 UNSENT, 1 OPENED, 2 HEADERS_RECEIVED, 3 LOADING, 4 DONE

// Upload progress (fetch doesn't do this as easily)
xhr.upload.onprogress = (e) => console.log(e.loaded / e.total);
```

## jQuery → Vanilla JS Translation

| jQuery | Vanilla JS |
|---|---|
| `$('.sel')` | `document.querySelectorAll('.sel')` |
| `$('#id')` | `document.getElementById('id')` |
| `$el.addClass('x')` | `el.classList.add('x')` |
| `$el.removeClass('x')` | `el.classList.remove('x')` |
| `$el.hide()` | `el.style.display = 'none'` |
| `$el.html(str)` | `el.innerHTML = str` |
| `$el.text(str)` | `el.textContent = str` |
| `$el.on('click', fn)` | `el.addEventListener('click', fn)` |
| `$el.attr('href')` | `el.getAttribute('href')` |
| `$.ajax({...})` | `fetch(...)` |
| `$(document).ready(fn)` | `document.addEventListener('DOMContentLoaded', fn)` |
| `$el.append(html)` | `el.insertAdjacentHTML('beforeend', html)` |

## JSONP

```js
// Client defines a global callback
function handleData(data) { console.log(data); }

// Loads via <script> tag, bypassing same-origin policy
const script = document.createElement('script');
script.src = 'https://api.example.com/data?callback=handleData';
document.body.appendChild(script);

// Server responds with:
// handleData({"key": "value"})
```

⚠️ Executes arbitrary remote code — never use for anything except trusted legacy APIs with no CORS alternative.

## Quick Decision Guide

| Need | Use |
|---|---|
| Raw binary data (files, WebGL, audio) | Typed Arrays |
| Draw pixels/shapes directly | Canvas |
| Make an HTTP request (new code) | `fetch()` |
| Make an HTTP request (reading legacy code) | recognize `XMLHttpRequest` |
| See `$(...)` in old code | translate to vanilla JS |
| See `?callback=` in an API URL | recognize JSONP |
