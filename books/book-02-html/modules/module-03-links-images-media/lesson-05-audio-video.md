cat > lesson-05-audio-video.md << 'EOF'
# Lesson 05: Audio & Video

## Learning Objectives
By the end of this lesson, you will be able to:
- Embed audio and video directly using HTML5's native elements.
- Provide multiple source formats for cross-browser compatibility.
- Add captions/subtitles for accessibility.

---

# Introduction

Before HTML5 (2014, per Book 02 Module 01's history note), embedding audio or video required third-party plugins like Flash — a genuinely painful, insecure, and inconsistent experience. HTML5 introduced native `<audio>` and `<video>` elements, which this lesson covers.

---

# The `<video>` Element

```html
<video controls width="640" height="360">
  <source src="demo.mp4" type="video/mp4">
  <source src="demo.webm" type="video/webm">
  Your browser does not support the video tag.
</video>
```

- **`controls`** — shows the browser's default play/pause/volume UI (boolean attribute, Module 01 Lesson 03).
- Multiple `<source>` elements let the browser pick the first format it supports — not every browser supports every video codec, so providing 2+ formats (commonly MP4 and WebM) maximizes compatibility.
- The text between the tags ("Your browser does not support...") only displays as a fallback in genuinely ancient browsers that don't support `<video>` at all.

**Other useful attributes:**
```html
<video controls autoplay muted loop poster="thumbnail.jpg">
```
- `autoplay` — starts playing automatically (most browsers require `muted` alongside it, to prevent jarring unexpected sound).
- `loop` — restarts automatically when finished.
- `poster` — an image shown before playback starts.

---

# The `<audio>` Element

Structurally identical to `<video>`, just without visual dimensions:

```html
<audio controls>
  <source src="podcast-episode.mp3" type="audio/mpeg">
  <source src="podcast-episode.ogg" type="audio/ogg">
  Your browser does not support the audio tag.
</audio>
```

---

# Captions and Subtitles: `<track>`

For accessibility (Module 07) — and because many viewers watch with sound off — video should include captions using the `<track>` element:

```html
<video controls width="640" height="360">
  <source src="demo.mp4" type="video/mp4">
  <track kind="captions" src="captions-en.vtt" srclang="en" label="English" default>
</video>
```

- `kind="captions"` — specifies this track provides captions (other values include `subtitles`, `descriptions`).
- `src` — points to a `.vtt` (WebVTT) file containing timestamped caption text.
- `default` — makes this track active automatically.

---

# Why `controls` Matters (and Autoplay Etiquette)

Always include `controls` unless you're deliberately building custom playback controls with JavaScript (a much later topic). Never autoplay audio/video with sound without explicit user action — this is broadly considered poor UX, and most modern browsers actively block unmuted autoplay anyway, which is worth knowing so you're not surprised when `autoplay` alone doesn't work as expected.

---

# Practical Example

```html
<video controls width="640" height="360" poster="thumbnail.jpg">
  <source src="tutorial.mp4" type="video/mp4">
  <source src="tutorial.webm" type="video/webm">
  <track kind="captions" src="captions-en.vtt" srclang="en" label="English" default>
  Your browser does not support the video tag.
</video>

<audio controls>
  <source src="theme-song.mp3" type="audio/mpeg">
  Your browser does not support the audio tag.
</audio>
```

---

# Revision Questions

1. Why should you provide multiple `<source>` elements for the same video?
2. Why do most browsers require `muted` alongside `autoplay`?
3. What is the `<track>` element used for, and what file format does it typically reference?

<details><summary>Answers</summary>

1. Because not every browser supports every video/audio codec/format; providing multiple formats maximizes the chance the browser finds one it can play.
2. To prevent jarring, unexpected sound from playing automatically without user action — most modern browsers actively block unmuted autoplay as a UX protection.
3. It provides captions or subtitles for video, typically referencing a `.vtt` (WebVTT) file containing timestamped text.

</details>
EOF