# Module 04 Interview Questions — DOM, Events & Navigation

<details>
<summary>1. What's the difference between a live and a static DOM collection? Give an example of each.</summary>

A live collection (e.g. from `getElementsByClassName`) automatically reflects later changes to the page — if a matching element is added or removed, the collection updates. A static collection (e.g. from `querySelectorAll`) is a fixed snapshot at the moment it was created and never updates afterward.
</details>

<details>
<summary>2. Why might `.children.length` differ from `.childNodes.length` on the same element?</summary>

`.childNodes` includes every node type, including text nodes created by whitespace between tags in the HTML source. `.children` includes only actual element nodes, so it's typically a smaller (and more useful) count.
</details>

<details>
<summary>3. What does `element.closest(selector)` do, and what's a practical use case?</summary>

It searches upward from the element (including the element itself) for the nearest ancestor matching the given CSS selector, returning `null` if none is found. A practical use case is event delegation — determining which larger item (e.g. a card or list item) a clicked child element belongs to.
</details>

<details>
<summary>4. Explain event bubbling and how `stopPropagation()` relates to it.</summary>

When an event fires on an element, it propagates upward, triggering the same event on each ancestor in sequence, all the way to `document`, unless stopped. `stopPropagation()` halts this upward propagation after the current listener runs, preventing ancestor listeners for that event from firing.
</details>

<details>
<summary>5. What is event delegation, and why is it often preferred over attaching individual listeners to many elements?</summary>

Event delegation attaches a single listener to a shared parent element, using event bubbling and `event.target` (often combined with `closest()`) to determine what was actually interacted with. It's preferred because it requires far fewer listeners and automatically works for elements added to the page after the listener was attached — individual listeners would need to be reattached manually each time.
</details>

<details>
<summary>6. Why is `event.preventDefault()` almost always called at the start of a custom `submit` handler?</summary>

Without it, the browser's default behavior for form submission — typically a full page reload or navigation — happens immediately, which would interrupt any JavaScript processing intended to handle the submission instead.
</details>

<details>
<summary>7. What type does `input.value` always return, regardless of the input's `type` attribute?</summary>

A string — even for `type="number"` inputs, requiring explicit conversion with something like `Number()` before doing arithmetic.
</details>

<details>
<summary>8. What does `setCustomValidity()` do, and how is a custom error cleared?</summary>

Passing any non-empty string marks the field as invalid using the browser's native validation UI, displaying that message and blocking submission. Passing an empty string (`""`) clears the custom error, marking the field valid again.
</details>

<details>
<summary>9. What happens to HTML parsing when the browser encounters a plain `<script>` tag with no `defer` or `async` attribute?</summary>

Parsing stops entirely at that point — the browser downloads (if external) and executes the script immediately, resuming HTML parsing only once the script finishes.
</details>

<details>
<summary>10. What's the key difference between `defer` and `async` script attributes?</summary>

`defer` scripts don't block parsing and execute only after the entire document has been parsed, in document order. `async` scripts also don't block parsing, but execute as soon as they finish downloading — which could be before parsing completes, and with no guaranteed order relative to other `async` scripts.
</details>

<details>
<summary>11. When would `async` be an appropriate choice over `defer`?</summary>

When the script is independent of the rest of the page's content and doesn't need to interact with the DOM at all — a common example is a third-party analytics or tracking script.
</details>

<details>
<summary>12. What's the difference between `DOMContentLoaded` and `load`?</summary>

`DOMContentLoaded` fires once the HTML has been fully parsed into the DOM, without waiting for other resources like images or stylesheets. `load` fires later, only once everything on the page — including all images and resources — has finished loading.
</details>
