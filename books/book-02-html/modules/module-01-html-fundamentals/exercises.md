cat > exercises.md << 'EOF'
# Exercise Set — HTML Fundamentals

## Easy
- [ ] Write a complete HTML boilerplate from memory, without looking at the cheatsheet.
- [ ] Identify which of these are block or inline: `<div>`, `<span>`, `<a>`, `<p>`, `<strong>`, `<h1>`.
- [ ] Write a paragraph containing the text: `Use <div> for grouping.` — correctly escaped with entities.
- [ ] Create a `<div>` with both a `class` and an `id`, containing a heading and a paragraph.

---

## Medium
- [ ] Explain why `<img>` doesn't have a closing tag but `<div>` does.
- [ ] Write HTML for two `<p>` elements sharing the same class, and a `<div>` with a unique id — explain why the class is reused but the id isn't.
- [ ] Add three global attributes (`title`, `data-*`, and one more of your choice) to a single `<button>` element.
- [ ] Explain what happens if two elements on the same page share the same `id`, and why this is invalid.

---

## Hard
- [ ] Build a small "profile card" using only what you've learned so far: a `<div>` container, an image, a heading, a paragraph with inline `<strong>` text, and a link — using at least one class and one id correctly.
- [ ] Explain, using the DOM concept from Book 01, why writing unescaped `<` in your content would actually break page rendering, not just look wrong.
- [ ] Write a `data-*` attribute example that could plausibly be used later by JavaScript to identify which "add to cart" button was clicked on a product listing page.

---

## Bonus
- [ ] Research the `<meta name="description">` tag (not yet covered) and explain what it's likely used for, based on what you already know about SEO from Book 01.
EOF