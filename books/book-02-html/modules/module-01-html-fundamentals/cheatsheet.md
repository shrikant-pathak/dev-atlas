cat > cheatsheet.md << 'EOF'
# 📄 Cheat Sheet — HTML Fundamentals

## Boilerplate

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Title</title>
  </head>
  <body>

  </body>
</html>
```

## Tag / Element / Attribute

| Term | Meaning |
|---|---|
| Tag | The angle-bracket markup: `<p>`, `</p>` |
| Element | Opening tag + content + closing tag together |
| Attribute | `name="value"` info inside an opening tag |

## Void (Self-Closing) Elements

<img> <br> <hr> <input> <meta> <link>

## Block vs. Inline

| Block | Inline |
|---|---|
| New line, full width | Flows within text |
| `div`, `p`, `h1`–`h6`, `ul`, `li`, `section` | `span`, `a`, `strong`, `em`, `img` |

## `class` vs. `id`

| | class | id |
|---|---|---|
| Reusable | Yes | No — unique per page |
| Multiple per element | Yes (space-separated) | No |
| Typical use | Styling groups | Targeting one element |

## Common Global Attributes

| Attribute | Purpose |
|---|---|
| `id` / `class` | Targeting for CSS/JS |
| `title` | Hover tooltip |
| `hidden` | Hides the element |
| `tabindex` | Keyboard nav order |
| `contenteditable` | Makes content editable |
| `data-*` | Custom data for JavaScript |

## Common HTML Entities

| Character | Entity |
|---|---|
| `<` | `&lt;` |
| `>` | `&gt;` |
| `&` | `&amp;` |
| `"` | `&quot;` |
| (non-breaking space) | `&nbsp;` |
| © | `&copy;` |
| — | `&mdash;` |
| × | `&times;` |
EOF
