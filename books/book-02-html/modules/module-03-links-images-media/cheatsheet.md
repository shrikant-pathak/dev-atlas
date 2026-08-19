# 📄 Cheat Sheet — Links, Images & Media

## File Paths

| Path | Meaning |
|---|---|
| `image.jpg` | Same folder |
| `images/image.jpg` | Into a subfolder |
| `../image.jpg` | Up one directory |
| `/images/image.jpg` | Root-absolute (from site root) |
| `https://...` | Full external URL |

## Anchor Tags

```html
<a href="page.html">Internal link</a>
<a href="https://ex.com" target="_blank" rel="noopener noreferrer">External, new tab (safe)</a>
<a href="#section-id">Jump to section</a>
<a href="mailto:user@example.com">Email link</a>
<a href="tel:+15551234567">Phone link</a>
```

## Images

```html
<img src="photo.jpg" alt="Meaningful description" width="600" height="400">

<figure>
  <img src="chart.png" alt="...">
  <figcaption>Caption text</figcaption>
</figure>
```

**Alt text rules:** describe content, not "image of"; use `alt=""` only for purely decorative images.

## Responsive Images

```html
<img src="img-800w.jpg"
     srcset="img-400w.jpg 400w, img-800w.jpg 800w"
     sizes="(max-width: 600px) 400px, 800px"
     alt="...">

<picture>
  <source media="(max-width: 600px)" srcset="mobile.jpg">
  <source srcset="desktop.jpg">
  <img src="desktop.jpg" alt="...">
</picture>
```

## Audio & Video

```html
<video controls width="640" height="360" poster="thumb.jpg">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  <track kind="captions" src="captions.vtt" srclang="en" label="English" default>
</video>

<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
</audio>
```

## iframes

```html
<iframe
  src="https://..."
  title="Descriptive title (required for a11y)"
  width="600" height="450"
  loading="lazy"
  sandbox="allow-scripts allow-same-origin">
</iframe>
```
