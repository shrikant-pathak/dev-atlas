# Quiz — Forms & User Input

## Multiple Choice
1. Which HTTP method should a login form use?
   a) GET  b) POST  c) Either works fine  d) PUT

2. What is the default `type` of a `<button>` inside a form if not specified?
   a) button  b) reset  c) submit  d) none, it's invalid

3. What must radio buttons share to behave as a mutually exclusive group?
   a) id  b) value  c) name  d) type

4. What attribute is required for a form to correctly submit file uploads?
   a) `method="POST"` only  b) `enctype="multipart/form-data"`  c) `type="file"` on the form  d) `accept="*"`

---

## True / False
1. Placeholder text is an acceptable substitute for a `<label>`. (True/False)
2. Client-side HTML validation is sufficient on its own to secure a form. (True/False)
3. `<datalist>` restricts users to only the suggested values. (True/False)

---

## Short Answer
1. Explain why GET should never be used for a form containing a password field.
2. What's the purpose of `<fieldset>` and `<legend>`?
3. Why must server-side validation always accompany HTML5 validation attributes?

---

## Coding Questions
1. Write a properly labeled email input that is required.
2. Write a `<button>` inside a form that will NOT submit the form when clicked.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-c, 4-b

**True/False:** 1-False, 2-False, 3-False (datalist only suggests, doesn't restrict)

**Coding Question 1:**
```html
<label for="email">Email</label>
<input type="email" id="email" name="email" required>
```

**Coding Question 2:**
```html
<button type="button">Click Me</button>
```

</details>
