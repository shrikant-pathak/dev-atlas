cat > lesson-01-file-paths-relative-absolute.md << 'EOF'
# Lesson 01: File Paths (Relative vs. Absolute)

## Learning Objectives
By the end of this lesson, you will be able to:
- Write correct relative file paths for links, images, and other resources.
- Understand when an absolute path (or full URL) is necessary.
- Avoid the most common path-related bugs beginners encounter.

---

# Introduction

Before diving into links, images, and media, you need a reliable grasp of file paths — because every one of those elements needs to point *somewhere*, and a huge share of "why isn't my image showing" bugs come down to path mistakes. This directly builds on file system and path concepts from Book 01, Module 03 (File Systems).

---

# Relative Paths

A **relative path** points to a file's location *relative to the current file* — exactly the concept from Book 01, Module 03, now applied inside `href`/`src` attributes.

Given this project structure:

project/
├── index.html
├── about.html
├── images/
│ └── logo.png
└── pages/
└── contact.html

From `index.html`:
```html
<img src="images/logo.png" alt="Logo">        <!-- go into images/ folder -->
<a href="about.html">About</a>                 <!-- same folder -->
<a href="pages/contact.html">Contact</a>          <!-- go into pages/ folder -->
```

From `pages/contact.html` (one level deeper), referencing the same logo requires going *up* a level first:
```html
<img src="../images/logo.png" alt="Logo">    <!-- ../ means "go up one directory" -->
```

`../` should feel familiar — it's the exact same relative path syntax you used constantly in the terminal back in Book 01, Module 07.

---

# Absolute Paths

An **absolute path** specifies a resource's complete location, either as a full URL or from the site's root:

```html
<!-- Full external URL -->
<a href="https://developer.mozilla.org">MDN Docs</a>

<!-- Absolute path from site root (starts with /) -->
<img src="/images/logo.png" alt="Logo">
<a href="/pages/contact.html">Contact</a>
```

A path starting with `/` is relative to the website's *root*, not the current file's folder — meaning it works identically no matter how deeply nested the current page is, unlike `../../../` chains which get fragile and hard to read.

---

# When to Use Which

| Situation | Path Type |
|---|---|
| Linking to another page on your own site | Relative (or root-absolute `/`) |
| Linking to an external website | Absolute (full URL) |
| Referencing images/assets within your own project | Relative (or root-absolute `/`) |
| Deeply nested pages referencing shared assets | Root-absolute `/` (avoids fragile `../../../`) |

---

# Common Path Mistakes

- **Forgetting file extensions:** `<a href="about">` instead of `<a href="about.html">` (fails on most static file servers).
- **Case sensitivity:** `Images/Logo.png` vs `images/logo.png` — many servers (especially Linux-based production servers, per Book 01) are case-sensitive even if your local machine isn't.
- **Miscounting `../` levels** when files are nested — always double-check by mentally tracing the folder structure.
- **Using an absolute local file path** (like `/Users/shrikant/project/image.png`) — this only works on *your* machine and will break the moment the site is deployed anywhere else.

---

# Practical Example

```html
<!-- From /pages/blog/post-1.html -->
<img src="../../images/banner.jpg" alt="Banner">     <!-- up 2 levels, then into images/ -->
<a href="../../index.html">Home</a>                    <!-- up 2 levels to root -->
<a href="/pages/contact.html">Contact</a>                <!-- root-absolute, always reliable -->
<a href="https://github.com">GitHub</a>                    <!-- external, always absolute -->
```

---

# Revision Questions

1. What does `../` mean in a relative path?
2. What's the key advantage of a root-absolute path (starting with `/`) over a long chain of `../../../`?
3. Why would a local absolute path like `/Users/name/project/image.png` break when deployed?

<details><summary>Answers</summary>

1. It means "go up one directory level" from the current file's location.
2. It works identically regardless of how deeply nested the current page is, avoiding fragile, hard-to-read, easy-to-miscount `../` chains.
3. Because that path only exists on the developer's own machine — a deployed server has an entirely different file system structure, so that exact path won't exist there.

</details>
EOF