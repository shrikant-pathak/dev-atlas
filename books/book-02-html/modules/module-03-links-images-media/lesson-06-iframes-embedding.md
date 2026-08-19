# Lesson 06: iframes & Embedding Third-Party Content

## Learning Objectives
By the end of this lesson, you will be able to:
- Embed third-party content (maps, videos, etc.) using `<iframe>`.
- Understand the security implications of embedding external content.
- Use `<iframe>` attributes to control its behavior safely.

---

# Introduction

This final lesson of Module 03 covers `<iframe>` — how you embed an entire *other webpage* inside your own, the technology behind embedded YouTube videos, Google Maps, and countless other third-party widgets you've seen on real websites.

---

# What Is an `<iframe>`?

An **iframe (inline frame)** embeds another complete HTML document within the current page, rendered in its own independent browsing context:

```html
<iframe
  src="https://www.youtube.com/embed/dQw4w9WgXcQ"
  width="560"
  height="315"
  title="YouTube video player"
></iframe>
```

Unlike `<img>` or `<video>`, which embed a single media file, an `<iframe>` embeds a *full webpage* — complete with its own HTML, CSS, and JavaScript running independently of your page.

---

# Common Real-World Uses

- **Embedded videos** (YouTube, Vimeo)
- **Embedded maps** (Google Maps)
- **Payment widgets** (Stripe, PayPal checkout embeds)
- **Social media embeds** (embedded tweets/posts)
- **Third-party comment systems, live chat widgets**

Most of these services provide ready-made `<iframe>` embed code for you to copy — you rarely construct one from scratch for a well-known third-party service.

---

# Security Considerations

Because an `<iframe>` runs another site's actual code, it introduces genuine security surface area:

- **`sandbox` attribute** — restricts what the embedded content is allowed to do (e.g., block scripts, block form submission, block opening new windows):
```html
  <iframe src="..." sandbox="allow-scripts allow-same-origin"></iframe>
```
  An empty `sandbox=""` applies maximum restrictions; specific permissions are added back explicitly as needed.

- **Only embed content from sources you trust.** An iframe can be used maliciously for "clickjacking" — overlaying invisible content to trick users into clicking something unintended. This is exactly why many sites configure their servers to *prevent* being embedded in other people's iframes (a header called `X-Frame-Options`, touching back on Book 01's HTTP headers concept).

- **`loading="lazy"`** — defers loading the iframe's content until it's about to scroll into view, improving initial page load performance:
```html
  <iframe src="..." loading="lazy"></iframe>
```

---

# Accessibility: Always Include `title`

```html
<iframe src="..." title="Embedded map showing office location"></iframe>
```

The `title` attribute is required for accessibility — screen readers announce it so users understand what the embedded frame contains before deciding whether to interact with it.

---

# Practical Example

```html
<h2>Find Us</h2>
<iframe
  src="https://www.google.com/maps/embed?pb=..."
  width="600"
  height="450"
  title="Map showing Dev Atlas HQ location"
  loading="lazy"
  sandbox="allow-scripts allow-same-origin"
></iframe>

<h2>Watch Our Intro Video</h2>
<iframe
  width="560"
  height="315"
  src="https://www.youtube.com/embed/dQw4w9WgXcQ"
  title="Dev Atlas introduction video"
  loading="lazy"
></iframe>
```

---

# Revision Questions

1. What's the fundamental difference between `<iframe>` and `<img>`/`<video>`?
2. What does the `sandbox` attribute do, and what does an empty `sandbox=""` mean?
3. Why is the `title` attribute required for accessibility on an `<iframe>`?

<details><summary>Answers</summary>

1. `<iframe>` embeds an entire independent webpage (HTML/CSS/JS) within the current page; `<img>`/`<video>` embed a single media file.
2. It restricts what the embedded content is allowed to do; an empty `sandbox=""` applies maximum restrictions, with specific permissions added back explicitly as needed.
3. Screen readers announce the `title` so users understand what the embedded frame contains, since the frame's actual content isn't otherwise described to them.

</details>

---

# 🏁 Module 03 Checkpoint

Before moving to Module 04, you should be able to:
- [ ] Write correct relative and absolute paths for links, images, and media
- [ ] Create links (internal, external, in-page, email/phone) securely and correctly
- [ ] Write genuinely useful alt text and use `<figure>`/`<figcaption>` appropriately
- [ ] Use `srcset` and `<picture>` to serve responsive, appropriately-sized images
- [ ] Embed audio and video with proper fallbacks and captions
- [ ] Embed third-party content via `<iframe>` with appropriate security attributes

**Next up:** Module 04 — Forms & User Input
