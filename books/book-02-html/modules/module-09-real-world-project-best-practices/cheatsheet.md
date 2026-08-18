cat > cheatsheet.md << 'EOF'
# 📄 Cheat Sheet — Real-World Project & Best Practices

## Style Conventions

| Convention | Rule |
|---|---|
| Indentation | 2 or 4 spaces, consistent (use Prettier) |
| Naming | kebab-case for classes/IDs/files |
| Tags/attributes | lowercase |
| Quotes | double quotes `"..."` |

## Multi-Page Structure

site/
├── index.html
├── about.html
├── section/
│ └── index.html ← default page for a folder
├── images/
└── favicon.png

⚠️ Plain HTML has no native way to share headers/footers across pages — this motivates templating (backend) and components (React, Book 09).

## Common Mistakes Quick List

- Skipped heading levels
- Div soup instead of semantic elements
- Missing/meaningless `alt` text
- Placeholder used as the only label
- `<button>` with no `type` inside a form
- `target="_blank"` without `rel="noopener noreferrer"`
- `<table>` for layout
- "Click here" anchor text
- Trusting client-side validation alone

## Code Review Checklist (Condensed)

- [ ] Valid boilerplate, one `<h1>`, no skipped headings
- [ ] Semantic landmarks, correct `<section>`/`<article>` choice
- [ ] Meaningful `alt` text, secure external links, descriptive anchor text
- [ ] Labeled forms, correct method, explicit button types
- [ ] Tables used appropriately with `<th scope>` and `<caption>`
- [ ] Unique `<title>`/description, Open Graph tags
- [ ] Passes W3C Validator + Lighthouse Accessibility audit
EOF