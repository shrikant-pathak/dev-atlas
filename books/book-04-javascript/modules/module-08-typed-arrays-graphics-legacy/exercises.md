# Module 08 Exercises

## Lesson 1: Typed Arrays and ArrayBuffer

**1. Byte inspector**
Write a function `inspectBytes(buffer)` that takes an `ArrayBuffer` and logs its contents as a `Uint8Array` (each byte 0–255).

**2. Shared buffer demo**
Create a single 4-byte `ArrayBuffer`. Create both a `Uint8Array` view and a `Uint32Array` view over it. Write a value through the `Uint32Array` view and log the `Uint8Array` view to observe the shared memory. Explain in a comment what you see.

**3. Mixed binary record**
Using `DataView`, write a function `encodeRecord(id, value)` that packs a 16-bit integer `id` followed by a 32-bit float `value` into an 6-byte `ArrayBuffer`, and a matching `decodeRecord(buffer)` that reads them back out.

## Lesson 2: Canvas Graphics Basics

**4. Shape gallery**
On a single canvas, draw: a filled rectangle, a stroked rectangle, a filled triangle (via path), and a filled circle — each a different color, none overlapping.

**5. Grayscale filter**
Load an image onto a canvas, then write a function that reads its pixel data with `getImageData`, converts every pixel to grayscale by averaging its R/G/B channels, and writes it back with `putImageData`.

**6. Bouncing shapes**
Extend the bouncing ball example from the lesson to animate three balls of different colors and speeds simultaneously, each bouncing independently off the canvas edges.

## Lesson 3: AJAX & XMLHttpRequest

**7. Promise-wrapped XHR**
Without looking back at the lesson, write your own `xhrRequest(method, url, body)` helper that wraps `XMLHttpRequest` in a Promise and supports both GET and POST.

**8. readyState logger**
Write an XHR request that logs every readyState transition (0 through 4) with a human-readable label (e.g., "OPENED", "LOADING") using `onreadystatechange`.

**9. fetch() vs XHR side-by-side**
Write the same GET request to a public API (e.g., `https://jsonplaceholder.typicode.com/users`) twice — once with raw `XMLHttpRequest`, once with `fetch()` — and log identical output from both. Note in a comment which required more lines of code.

## Lesson 4: jQuery Patterns

**10. Translate to vanilla**
Given this jQuery snippet, rewrite it in vanilla JavaScript without changing its behavior:
```js
$('.item').each(function () {
  $(this).on('click', function () {
    $(this).toggleClass('selected');
  });
});
```

**11. Translate to jQuery**
Given this vanilla JS snippet, rewrite it using jQuery syntax:
```js
document.querySelectorAll('.card').forEach(card => {
  card.addEventListener('mouseenter', () => card.classList.add('hover'));
  card.addEventListener('mouseleave', () => card.classList.remove('hover'));
});
```

**12. Spot the wrapper**
Research (or recall from the lesson) what native API `$.ajax()` is built on top of, and write one paragraph explaining what jQuery adds on top of that native API.

## Lesson 5: JSONP

**13. Trace the mechanics**
Write out, step by step in comments (no need to actually call a real API), what happens from the moment `fetchJSONP('https://api.example.com/data', 'myCallback')` is called to the moment your `.then()` callback receives data.

**14. Security explanation**
In 3–4 sentences, explain to a hypothetical junior developer why they should not use JSONP for a new API integration in 2026, even if it "works."

**15. CORS vs JSONP request**
Given a public CORS-enabled API, write a `fetch()` request to it. Then, in a comment, describe what would need to be true about that same API for a JSONP version of the same request to work instead.
