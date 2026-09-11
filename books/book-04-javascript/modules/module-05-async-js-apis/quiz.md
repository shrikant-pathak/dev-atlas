# Module 05 Quiz — Asynchronous JavaScript & APIs

<details>
<summary>Q1. In the error-first callback convention, what does the first parameter represent?</summary>

An error (or `null` if there wasn't one).
</details>

<details>
<summary>Q2. What are the three states a Promise can be in?</summary>

Pending, fulfilled, and rejected.
</details>

<details>
<summary>Q3. Which Promise method runs regardless of whether the Promise fulfilled or rejected?</summary>

`.finally()`
</details>

<details>
<summary>Q4. Which keyword pauses execution inside an `async` function until a Promise settles?</summary>

`await`
</details>

<details>
<summary>Q5. What does an `async` function always return?</summary>

A Promise.
</details>

<details>
<summary>Q6. Which Promise combinator rejects as soon as any one of the given Promises rejects?</summary>

`Promise.all()`
</details>

<details>
<summary>Q7. Does `fetch()` reject its Promise when the server responds with a 404?</summary>

No — only on a genuine network failure; HTTP error statuses must be checked manually via `response.ok`.
</details>

<details>
<summary>Q8. Which `Response` method parses the response body as JSON?</summary>

`.json()`
</details>

<details>
<summary>Q9. What does `JSON.stringify()` convert an object into?</summary>

A JSON-formatted string.
</details>

<details>
<summary>Q10. Which HTTP method conventionally creates a new resource?</summary>

`POST`
</details>

<details>
<summary>Q11. What does a `204 No Content` status typically indicate?</summary>

The request succeeded, but there's no response body to return — common for `DELETE` requests.
</details>

<details>
<summary>Q12. True or false: two independent `await`-ed operations should always be awaited one after another rather than run in parallel.</summary>

False — if they don't depend on each other, running them in parallel with `Promise.all()` is faster than awaiting them sequentially.
</details>
