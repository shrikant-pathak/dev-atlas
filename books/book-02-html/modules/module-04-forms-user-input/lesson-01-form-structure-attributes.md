# Lesson 01: Form Structure & Attributes

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a `<form>` element does and how it submits data.
- Understand the `action` and `method` attributes.
- Explain the difference between GET and POST form submissions.

---

# Introduction

Forms are how the web collects information from users — logins, signups, search bars, checkout flows. This module covers everything involved in building one correctly, starting with the `<form>` container itself and how it actually sends data somewhere.

---

# The `<form>` Element

```html
<form action="/submit" method="POST">
  <!-- form fields go here -->
</form>
```

`<form>` is a block-level container (Module 01, Lesson 04) that groups related input fields together and defines *how* and *where* their combined data gets submitted.

---

# The `action` Attribute

`action` specifies the URL the form data is sent to when submitted — directly connecting to the client-server request/response cycle from Book 01, Module 04:

```html
<form action="/login" method="POST">
```

If `action` is omitted, the form submits to the current page's own URL by default.

---

# The `method` Attribute: GET vs. POST

Recall the HTTP methods from Book 01, Module 04, Lesson 05 — forms primarily use two of them:

**`GET`** — appends form data directly to the URL as query parameters:
```html
<form action="/search" method="GET">
```
Submitting a search for "html" might navigate to `/search?q=html`. GET is appropriate for non-sensitive data, like search queries, where a shareable/bookmarkable URL is actually desirable.

**`POST`** — sends form data in the request body, not visible in the URL:
```html
<form action="/login" method="POST">
```
POST is required for sensitive data (passwords, personal information) and any action that changes data on the server (creating an account, submitting a payment) — never use GET for anything involving passwords or sensitive data, since GET data is visible in browser history, server logs, and the URL bar itself.

---

# Why This Distinction Matters

| | GET | POST |
|---|---|---|
| Data visibility | Visible in URL | Hidden in request body |
| Bookmarkable/shareable | Yes | No |
| Data size limits | Limited (URL length) | Much larger |
| Appropriate for | Search, filters, non-sensitive reads | Login, signup, payments, anything sensitive |

This maps directly back to Book 01's REST conventions — GET requests should be safe to repeat and shouldn't change server state; POST requests typically do change state (creating a new user, placing an order).

---

# Other Useful Form Attributes

```html
<form action="/upload" method="POST" enctype="multipart/form-data">
```
`enctype="multipart/form-data"` is required whenever a form includes file uploads (covered in Module 04, Lesson 02) — without it, uploaded files won't be transmitted correctly.

```html
<form action="/search" method="GET" autocomplete="off">
```
`autocomplete` controls whether the browser offers to remember/autofill previously entered values.

---

# Practical Example

```html
<form action="/login" method="POST">
  <!-- input fields go here, covered in Lesson 02 -->
</form>

<form action="/search" method="GET">
  <!-- a search bar — GET is appropriate here -->
</form>
```

---

# Revision Questions

1. What does the `action` attribute specify?
2. Why should GET never be used for a login form?
3. What does `enctype="multipart/form-data"` enable?

<details><summary>Answers</summary>

1. The URL the form's data is sent to upon submission.
2. Because GET puts data directly in the URL, making it visible in browser history, server logs, and the address bar — completely inappropriate for sensitive data like passwords.
3. It enables file uploads to be correctly transmitted as part of the form submission.

</details>
