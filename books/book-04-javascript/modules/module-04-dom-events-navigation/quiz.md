# Module 04 Quiz — DOM, Events & Navigation

<details>
<summary>Q1. Which selector method returns only the first matching element?</summary>

`querySelector`
</details>

<details>
<summary>Q2. Does `querySelectorAll` return a live or a static collection?</summary>

Static.
</details>

<details>
<summary>Q3. Which traversal property excludes text/whitespace nodes: `.childNodes` or `.children`?</summary>

`.children`
</details>

<details>
<summary>Q4. What method finds the nearest matching ancestor of an element (including itself)?</summary>

`.closest(selector)`
</details>

<details>
<summary>Q5. What does `event.target` refer to?</summary>

The exact element that actually triggered the event — which may be a nested child of the element the listener is attached to.
</details>

<details>
<summary>Q6. What does `event.preventDefault()` do on a form's submit event?</summary>

Stops the browser's default full page reload/navigation on submission.
</details>

<details>
<summary>Q7. What's the main benefit of event delegation?</summary>

A single listener on a shared parent can handle events for many (including future) child elements, instead of attaching a separate listener to each one.
</details>

<details>
<summary>Q8. What type is always returned by `input.value`?</summary>

A string.
</details>

<details>
<summary>Q9. Which method checks whether an input currently satisfies its HTML validation constraints?</summary>

`.checkValidity()`
</details>

<details>
<summary>Q10. Which script attribute guarantees execution happens only after the full document has been parsed, in order?</summary>

`defer`
</details>

<details>
<summary>Q11. Which event fires once the DOM is fully parsed, without waiting for images to load?</summary>

`DOMContentLoaded`
</details>

<details>
<summary>Q12. True or false: `async` scripts always execute in the order they appear in the HTML.</summary>

False — `async` scripts execute as soon as they finish downloading, with no guaranteed order relative to each other.
</details>
