# Module 08 Quiz

1. What does an ArrayBuffer store, and can you read or write to it directly?
2. Name two different TypedArray constructors and how many bytes each element occupies.
3. Why might you use a DataView instead of a single TypedArray?
4. What does canvas's getContext('2d') return, and what is it used for?
5. In the canvas coordinate system, which direction does y increase?
6. What type of array does ctx.getImageData().data return?
7. Why is requestAnimationFrame usually preferred over setInterval for animations?
8. What does AJAX stand for?
9. What HTTP status check do you need to perform manually inside XMLHttpRequest's onload handler that fetch() also requires (just via a different property)?
10. What are the five readyState values of an XMLHttpRequest, in order?
11. What symbol/function does virtually every jQuery snippet begin with?
12. Why does $('.button').addClass('active') apply to every matched element without an explicit loop in your code?
13. What native API is $.ajax() built on top of?
14. What is the same-origin policy designed to prevent?
15. What loophole does JSONP exploit to make cross-origin requests work?
16. Why is a JSONP response fundamentally different from a fetch() response, in terms of what the browser does with it?
17. What replaced JSONP as the standard way to make legitimate cross-origin requests?
18. True or false: Uint8ClampedArray wraps around (like modulo) when a value exceeds 255.
19. What is the main reason you're learning XMLHttpRequest, jQuery, and JSONP in this book if you're not expected to write new code with them?
20. Which lesson in this module connects directly back to Lesson 1's ArrayBuffer/TypedArray material, and how?

---

## Answer Key

1. A fixed-length block of raw memory; no, you cannot read/write it directly — you need a TypedArray or DataView.
2. Any two from: Int8Array/Uint8Array (1 byte), Int16Array/Uint16Array (2 bytes), Int32Array/Uint32Array/Float32Array (4 bytes), Float64Array (8 bytes).
3. When binary data mixes multiple types at specific byte offsets, or when you need explicit control over endianness — a single TypedArray assumes uniform type/size throughout.
4. A 2D rendering context object; it's used to draw shapes, paths, text, and images onto the canvas.
5. Downward (opposite of standard math graphs).
6. A Uint8ClampedArray.
7. It syncs with the browser's actual refresh rate for smoother motion and automatically pauses when the tab isn't visible, saving resources.
8. Asynchronous JavaScript and XML.
9. Checking the HTTP status code (xhr.status in XHR, response.ok/response.status in fetch) — neither treats a 404/500 as an automatic error.
10. UNSENT (0), OPENED (1), HEADERS_RECEIVED (2), LOADING (3), DONE (4).
11. $ (dollar sign, shorthand for jQuery).
12. jQuery methods implicitly loop over every element in the current selection internally, unlike native querySelectorAll which just returns a NodeList.
13. XMLHttpRequest.
14. A malicious site silently using a visitor's authenticated session to read private data from another origin in the background.
15. That <script> tags can load content from any domain, unlike XHR requests which are restricted by the same-origin policy.
16. A JSONP response is executable JavaScript that runs automatically with full page access; a fetch() response is inert data you explicitly parse yourself.
17. CORS (Cross-Origin Resource Sharing).
18. False — it clamps to 0–255 instead of wrapping around.
19. To be able to read, debug, and translate legacy code you'll encounter in real jobs and interviews, not to write new code this way.
20. Lesson 2 (Canvas Graphics Basics) — ctx.getImageData() returns pixel data as a Uint8ClampedArray, the same family of TypedArrays introduced in Lesson 1.
