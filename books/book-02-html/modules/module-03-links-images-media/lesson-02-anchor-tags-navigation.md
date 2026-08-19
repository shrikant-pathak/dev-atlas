# Lesson 02: Anchor Tags & Navigation

## Learning Objectives
By the end of this lesson, you will be able to:
- Create links to other pages, external sites, and specific sections within a page.
- Use `target`, `rel`, and other anchor attributes correctly and securely.
- Build a functioning navigation menu.

---

# Introduction

The `<a>` (anchor) element is what makes the web the *web* — the "hyper" in HyperText, connecting documents to each other. This lesson covers using it correctly, including a security detail most beginner tutorials skip entirely.

---

# The Basic Anchor Element

```html
<a href="https://example.com">Visit Example</a>
<a href="about.html">About Us</a>
<a href="../index.html">Home</a>
```

`href` (hypertext reference) specifies the destination — using the relative/absolute path rules from Lesson 01.

---

# Opening Links in a New Tab

```html
<a href="https://example.com" target="_blank">Visit Example</a>
```

`target="_blank"` opens the link in a new tab. **Important security detail:** whenever you use `target="_blank"` for an external link, you should also add `rel="noopener noreferrer"`:

```html
<a href="https://example.com" target="_blank" rel="noopener noreferrer">Visit Example</a>
```

Without `rel="noopener"`, the newly opened page gains partial JavaScript access back to your original page (via `window.opener`), a genuine security risk known as "tabnabbing." This is a real, industry-standard best practice — not just theoretical caution.

---

# Linking Within the Same Page: Fragment Identifiers

Recall `id` from Module 01, Lesson 05 — anchors can jump directly to any element with a matching `id`:

```html
<nav>
  <a href="#section-2">Jump to Section 2</a>
</nav>

<h2 id="section-2">Section 2</h2>
<p>Content here...</p>
```

This is exactly how "back to top" links and in-page table-of-contents navigation work — no JavaScript required for the basic jump behavior.

---

# Email and Phone Links

```html
<a href="mailto:hello@devatlas.com">Email us</a>
<a href="mailto:hello@devatlas.com?subject=Question">Email with subject</a>
<a href="tel:+15551234567">Call us</a>
```

`mailto:` opens the user's default email client with the address pre-filled; `tel:` triggers a phone call on mobile devices.

---

# Building a Navigation Menu

Semantically, navigation links belong inside a `<nav>` element (formally covered in Module 06), typically structured as a list:

```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about.html">About</a></li>
    <li><a href="/contact.html">Contact</a></li>
  </ul>
</nav>
```

Using `<ul>`/`<li>` for navigation isn't required by the browser to function, but it's the semantically correct structure — a navigation menu genuinely *is* a list of links, and screen readers announce it as such.

---

# Practical Example

```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="#pricing">Pricing</a></li>
    <li><a href="https://github.com/shrikant-pathak/dev-atlas" target="_blank" rel="noopener noreferrer">GitHub</a></li>
  </ul>
</nav>

<section id="pricing">
  <h2>Pricing</h2>
  <p>Contact us: <a href="mailto:sales@devatlas.com">sales@devatlas.com</a></p>
</section>
```

---

# Revision Questions

1. What does `href` stand for, and what does it specify?
2. Why should `target="_blank"` almost always be paired with `rel="noopener noreferrer"`?
3. How do you create a link that jumps to a specific section within the same page?

<details><summary>Answers</summary>

1. "Hypertext reference" — it specifies the destination the link points to.
2. Without it, the newly opened page gains partial JavaScript access back to the original page via `window.opener`, a security risk called tabnabbing.
3. Give the target element a unique `id`, then link to it using `href="#that-id"`.

</details>
