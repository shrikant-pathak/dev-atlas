# Module 05 Cheatsheet — Asynchronous JavaScript & APIs

## Callbacks
```js
setTimeout(() => console.log("later"), 1000); // async callback, doesn't block

function fn(id, callback) {         // error-first convention
  callback(error, result);
}
```

## Promises
```js
new Promise((resolve, reject) => {
  // resolve(value)  or  reject(error)
});

promise
  .then(value => { })
  .catch(error => { })
  .finally(() => { });

Promise.all([p1, p2]).then(([r1, r2]) => { });      // fails fast if any rejects
Promise.allSettled([p1, p2]).then(results => { });    // always waits for all
Promise.race([p1, p2]).then(first => { });             // settles on first to finish
```

## async/await
```js
async function fn() {
  try {
    const result = await somePromise;
    return result; // still wrapped in a Promise automatically
  } catch (error) {
    // handles a rejected awaited Promise
  }
}

// Parallel instead of sequential:
const [a, b] = await Promise.all([fnA(), fnB()]);
```

## Fetch API
```js
const response = await fetch(url);
response.status   // e.g. 200, 404
response.ok         // true if 200–299 — CHECK THIS MANUALLY, fetch never rejects on HTTP errors
const data = await response.json();

// Sending data
await fetch(url, {
  method: "POST", // or PUT, PATCH, DELETE
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify(payload)
});
```

## JSON
```js
JSON.stringify(obj)          // object → string (drops functions, undefined)
JSON.stringify(obj, null, 2)  // pretty-printed
JSON.parse(jsonString)         // string → object
```

## REST Conventions

GET /resource → list (Read)
GET /resource/:id → get one (Read)
POST /resource → create (Create)
PUT /resource/:id → replace (Update)
PATCH /resource/:id → partial update (Update)
DELETE /resource/:id → delete (Delete)

200 OK 201 Created 204 No Content
400 Bad Request 401 Unauthorized 404 Not Found 500 Server Error