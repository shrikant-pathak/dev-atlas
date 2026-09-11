# Module 08: Typed Arrays, Graphics & Legacy Web Tech

## Overview

This module is a bit of a hybrid. The first two lessons look forward: `ArrayBuffer`, typed arrays, and Canvas are the foundation for anything performance-sensitive or visual — games, image processing, data visualization, WebGL. The last three lessons look backward: `XMLHttpRequest`, jQuery, and JSONP are technologies you're unlikely to write from scratch again, but you *will* encounter them — in job interviews, in legacy codebases, and in older third-party APIs that never modernized.

The throughline connecting all five lessons is **evolution**: how JavaScript's approach to binary data, graphics, and networking has changed over time, and why. By the end of this module, you'll be able to work with raw binary data and pixels directly, and you'll be able to read and confidently translate legacy networking code into the modern patterns you already know from Modules 05–07.

## Lessons

1. **Typed Arrays and ArrayBuffer** — raw binary data, `ArrayBuffer`, `TypedArray` views, `DataView`, and where they show up in real APIs
2. **Canvas Graphics Basics** — the `<canvas>` element, the 2D drawing API, pixel manipulation via `ImageData`, and animation with `requestAnimationFrame`
3. **AJAX & XMLHttpRequest** — what AJAX actually means, the `XMLHttpRequest` API, the readyState lifecycle, and why `fetch()` replaced it
4. **jQuery Patterns** — why jQuery existed, its core syntax, and a full translation reference to modern vanilla JavaScript
5. **JSONP** — the same-origin policy, how JSONP hacked around it using `<script>` tags, its security risks, and why CORS made it obsolete

## Prerequisites

This module builds directly on:
- **Module 03** (Arrays & Array Methods) — typed arrays share method names like `.map()`/`.filter()` but behave differently
- **Module 04** (DOM Manipulation & Events) — Canvas setup and jQuery's DOM methods both assume you know the native DOM APIs they parallel or wrap
- **Module 05** (Async JS, Promises & fetch) — XHR and JSONP are both predecessors to patterns you already know from this module
- **Module 07** (Errors, Debugging & Browser Storage) — `requestAnimationFrame` is compared against `setInterval` from that module

## A Note on the Legacy Lessons

Lessons 3–5 are deliberately framed around **reading and translating**, not writing new code this way. You will not be asked to build a new jQuery plugin or a new JSONP endpoint. You will, at some point in your career, be asked to fix a bug in one, or explain in an interview why `fetch()` replaced `XMLHttpRequest`. Treat these lessons as building fluency in a "dialect" of JavaScript history, not as tools for your own toolbox going forward.
