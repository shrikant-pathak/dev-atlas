# Lesson 05: Working with JSON and REST

## Learning Objectives
By the end of this lesson, you will be able to:
- Convert between JavaScript objects and JSON strings with `JSON.stringify()` and `JSON.parse()`
- Explain the core conventions of a REST API
- Map CRUD operations to HTTP methods and status codes
- Build a small, complete set of REST operations using `fetch()`

## Introduction

Lesson 04 used `JSON.stringify()` and `response.json()` without much explanation. This closing lesson of the module gives JSON its full treatment, and introduces **REST** — the set of conventions most real-world APIs (including whatever backend you'll eventually connect your React/Vue apps to) follow.

## What Is JSON?

**JSON** (JavaScript Object Notation) is a text-based data format, based on JavaScript's own object and array syntax (Module 02, Lesson 07; Module 03, Lesson 04), used as the standard way to exchange data between a client (your JavaScript) and a server.

```json
{
  "id": 1,
  "name": "Ada",
  "isActive": true,
  "tags": ["admin", "developer"]
}
```

It looks almost exactly like a JavaScript object literal, but with some strict rules JavaScript itself doesn't enforce: **property names must always be in double quotes**, and JSON has no functions, `undefined`, or comments — only plain data.

## `JSON.stringify()` — Object to String

Converts a JavaScript value into a JSON-formatted string — required whenever you send data in a `fetch()` request body (Lesson 04).

```js
const user = { id: 1, name: "Ada", isActive: true };

const json = JSON.stringify(user);
console.log(json); // '{"id":1,"name":"Ada","isActive":true}'
console.log(typeof json); // "string"
```

An optional third argument adds indentation, useful for logging/debugging:

```js
JSON.stringify(user, null, 2);
// {
//   "id": 1,
//   "name": "Ada",
//   "isActive": true
// }
```

## `JSON.parse()` — String to Object

The reverse operation — converts a JSON string back into a real JavaScript value.

```js
const jsonString = '{"id":1,"name":"Ada"}';
const user = JSON.parse(jsonString);

console.log(user.name); // "Ada"
console.log(typeof user); // "object"
```

Recall from Lesson 04: `response.json()` is doing exactly this internally — reading the response body as text, then running it through `JSON.parse()` — which is why it returns a Promise rather than the parsed value immediately.

### What Gets Lost in Translation

`JSON.stringify()` silently drops anything JSON can't represent:

```js
const data = {
  name: "Ada",
  greet: function () { return "hi"; }, // functions
  missing: undefined,                    // undefined values
};

console.log(JSON.stringify(data));
// '{"name":"Ada"}' — both `greet` and `missing` are simply gone
```

## What Is REST?

**REST** (Representational State Transfer) is a set of conventions — not a strict technical standard — for designing APIs around **resources** (like users, orders, products), each identified by a URL, and manipulated using standard HTTP methods.

| HTTP Method | Typical Purpose | CRUD Operation |
|---|---|---|
| `GET` | Retrieve a resource | Read |
| `POST` | Create a new resource | Create |
| `PUT` / `PATCH` | Update an existing resource | Update |
| `DELETE` | Remove a resource | Delete |

("CRUD" stands for Create, Read, Update, Delete — the four basic operations almost any data-driven application needs.)

### Typical REST URL Patterns

GET /users → list all users
GET /users/5 → get the user with ID 5
POST /users → create a new user (data sent in the request body)
PUT /users/5 → replace the user with ID 5 entirely
PATCH /users/5 → update part of the user with ID 5
DELETE /users/5 → delete the user with ID 5


### Common HTTP Status Codes

Recall from Lesson 04 that `response.status`/`response.ok` need to be checked manually. These are the codes you'll encounter constantly:

200 OK — request succeeded
201 Created — a POST successfully created something
204 No Content — succeeded, nothing to send back (common for DELETE)
400 Bad Request — the client sent invalid data
401 Unauthorized — authentication is required or failed
404 Not Found — the resource doesn't exist
500 Internal Server Error — something went wrong on the server


## Building a Full CRUD Set With `fetch()`

Combining everything from this module:

```js
const BASE_URL = "https://api.example.com/users";

async function getAllUsers() {
  const response = await fetch(BASE_URL);
  if (!response.ok) throw new Error(`Failed: ${response.status}`);
  return response.json();
}

async function createUser(userData) {
  const response = await fetch(BASE_URL, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(userData)
  });
  if (!response.ok) throw new Error(`Failed: ${response.status}`);
  return response.json();
}

async function updateUser(id, updates) {
  const response = await fetch(`${BASE_URL}/${id}`, {
    method: "PATCH",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(updates)
  });
  if (!response.ok) throw new Error(`Failed: ${response.status}`);
  return response.json();
}

async function deleteUser(id) {
  const response = await fetch(`${BASE_URL}/${id}`, { method: "DELETE" });
  if (!response.ok) throw new Error(`Failed: ${response.status}`);
}
```

## Practical Example

```js
// user-management.js

async function main() {
  try {
    const newUser = await createUser({ name: "Grace", email: "grace@dev.io" });
    console.log("Created:", newUser);

    const updated = await updateUser(newUser.id, { name: "Grace Hopper" });
    console.log("Updated:", updated);

    await deleteUser(newUser.id);
    console.log("Deleted user", newUser.id);
  } catch (error) {
    console.log("Operation failed:", error.message);
  }
}

main();
```

## Revision Questions

<details>
<summary>1. What does `JSON.stringify()` do, and what type of value does it always return?</summary>

It converts a JavaScript value into a JSON-formatted string. It always returns a string, regardless of the input's original type.
</details>

<details>
<summary>2. What happens to functions and `undefined` values when an object is passed through `JSON.stringify()`?</summary>

They're silently dropped — JSON has no way to represent functions or `undefined`, so any such properties simply disappear from the resulting string.
</details>

<details>
<summary>3. What does REST stand for, and what is it built around?</summary>

Representational State Transfer — a set of conventions for designing APIs around resources (like users or orders), each identified by a URL and manipulated using standard HTTP methods.
</details>

<details>
<summary>4. Which HTTP method conventionally corresponds to each CRUD operation: Create, Read, Update, Delete?</summary>

Create → `POST`, Read → `GET`, Update → `PUT` or `PATCH`, Delete → `DELETE`.
</details>

<details>
<summary>5. What does a `404` status code mean, and what does a `201` status code mean?</summary>

`404` means the requested resource was not found. `201` means a request (typically a `POST`) successfully created a new resource.
</details>
