# Module 08 Interview Questions

### 1. What is the difference between an ArrayBuffer and a TypedArray, and why do both exist?
**Answer:** An `ArrayBuffer` is a fixed-length block of raw memory with no way to read or write values directly — it's opaque on its own. A `TypedArray` (like `Int32Array`) is a *view* over an `ArrayBuffer` that interprets the raw bytes as a specific numeric type, giving you indexed access. Both exist because separating "the memory" from "how to interpret it" lets multiple views share the same underlying bytes without copying, which matters for performance-sensitive binary data (WebGL, audio, file parsing).

### 2. Why would a Float32Array produce a slightly different number than what you stored in it?
**Answer:** `Float32Array` uses single-precision (32-bit) floating point, which has less precision than JavaScript's normal 64-bit numbers. A value like 3.14 may not be exactly representable in 32 bits, so it gets rounded to the nearest representable float, which can show up as a longer, slightly different decimal when read back.

### 3. Explain the difference between the DOM's rendering model and canvas's rendering model.
**Answer:** The DOM is retained-mode and declarative: you build a tree of elements, and the browser keeps track of that tree so you (or the browser) can query and update individual nodes at any time. Canvas is immediate-mode and imperative: you issue direct pixel-drawing commands, and once something is drawn, there's no persistent reference to it — changing anything requires clearing and redrawing the whole frame.

### 4. Why is getImageData's pixel data returned as a Uint8ClampedArray specifically?
**Answer:** Each color channel (R, G, B, A) is constrained to the range 0–255. `Uint8ClampedArray` automatically clamps out-of-range values to 0 or 255 instead of wrapping around (which a plain `Uint8Array` would do via modulo), which matches the correct behavior for color math where you might briefly compute a value like -10 or 280 during a filter operation.

### 5. What does AJAX stand for, and is that name still technically accurate?
**Answer:** Asynchronous JavaScript and XML. It's not fully accurate anymore — virtually all AJAX-style requests today exchange JSON, not XML. The name persists from the era when `XMLHttpRequest` (and XML as a data format) were the standard, even though the underlying technique — async requests without a full page reload — is what actually matters and has outlived the specific data format.

### 6. Why doesn't a 404 response trigger XMLHttpRequest's onerror handler?
**Answer:** `onerror` only fires for network-level failures where the request never completed (e.g., DNS failure, connection refused). A 404 is still a complete HTTP exchange — the server responded — so `onload` fires normally, and the developer has to check `xhr.status` inside `onload` to detect the failure.

### 7. What problem did jQuery solve, and why is it now used far less often in new projects?
**Answer:** jQuery solved cross-browser inconsistency in DOM selection, event handling, and AJAX, back when browsers implemented these features differently or incompletely. It's used less now because modern browsers have standardized and consistently implemented the native equivalents (`querySelectorAll`, `addEventListener`, `fetch`) that jQuery used to paper over — the platform absorbed jQuery's core value proposition.

### 8. What is the same-origin policy, and what does it actually prevent?
**Answer:** It's a browser security rule that blocks a script on one origin (protocol + domain + port) from reading the response of a request made to a different origin. It exists to prevent a malicious site from using a victim's authenticated session in the background to silently read private data from another site the victim is logged into.

### 9. How does JSONP work, mechanically, to get around the same-origin policy?
**Answer:** JSONP exploits the fact that `<script>` tags can load content from any domain, unlike XHR requests. The client defines a global callback function, then loads a `<script>` tag pointing at the API with the callback's name as a parameter. The server responds with the requested data wrapped in a call to that function name, and the browser executes it as a normal script the moment it loads, delivering the data as the function's argument.

### 10. Why is JSONP considered a security risk, and what replaced it?
**Answer:** JSONP requires executing whatever JavaScript the third-party server sends back, with no way to inspect or sandbox it first — if that server is compromised or malicious, it can run arbitrary code with full access to the page. CORS replaced it: the target server explicitly opts in to cross-origin requests via response headers, and the browser still only hands back inert data, never executable code.

### 11. In one sentence, why is fetch() generally preferred over XMLHttpRequest for new code?
**Answer:** `fetch()` is Promise-based from the ground up, so it composes naturally with `async`/`await` and has a simpler, more consistent API than XHR's event-based, multi-step configuration.

### 12. What's one legitimate reason a developer might still choose XMLHttpRequest over fetch() in 2026?
**Answer:** Tracking upload progress — `xhr.upload.onprogress` provides built-in, granular upload progress events, which historically hasn't been as directly available through `fetch()`.
