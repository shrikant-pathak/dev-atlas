cat > cheatsheet.md << 'EOF'
# 📄 Cheat Sheet — Semantic HTML & Document Structure

## Core Semantic Elements

| Element | Represents | Can repeat per page? |
|---|---|---|
| `<header>` | Intro content of its nearest section | Yes (page + per-section) |
| `<nav>` | Major navigation block | Yes, but only for genuine nav |
| `<main>` | The page's unique dominant content | No — exactly one |
| `<section>` | Thematic grouping, part of a larger whole | Yes |
| `<article>` | Self-contained, standalone content | Yes |
| `<aside>` | Tangentially related content | Yes |
| `<footer>` | Closing content of its nearest section | Yes (page + per-section) |

## The Decisive Test: `<section>` vs `<article>`

> Would this content make complete sense read entirely on its own, out of context?
> **Yes** → `<article>`
> **No** → `<section>`

## `<main>` Rules

- Exactly one per page
- Never nested inside `<article>`, `<aside>`, `<header>`, `<footer>`, `<nav>`

## `<aside>` Rule

Semantic relevance, not visual position. Primary nav in a sidebar is still `<nav>`, not `<aside>`.

## Bonus Elements

```html
<details>
  <summary>Question</summary>
  <p>Answer (native collapsible, no JS needed)</p>
</details>

<dialog open>Modal content</dialog>
```

## When to Still Use `<div>`

When no semantic element genuinely fits — purely a generic wrapper for styling/scripting.
EOF