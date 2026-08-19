# 📄 Cheat Sheet — Tables & Structured Data

## Core Structure

```html
<table>
  <caption>Table Title</caption>
  <thead>
    <tr><th scope="col">Header</th></tr>
  </thead>
  <tbody>
    <tr><td>Data</td></tr>
  </tbody>
  <tfoot>
    <tr><td>Footer/Total</td></tr>
  </tfoot>
</table>
```

## Elements

| Element | Purpose |
|---|---|
| `<table>` | Container |
| `<tr>` | Table row |
| `<th>` | Header cell (semantic, not just bold) |
| `<td>` | Data cell |
| `<thead>` | Header row group |
| `<tbody>` | Body row group |
| `<tfoot>` | Footer row group |
| `<caption>` | Table title (must be first child of `<table>`) |

## Spanning

```html
<th colspan="2">Spans 2 columns</th>
<td rowspan="2">Spans 2 rows</td>
```
⚠️ Rows below a `rowspan` cell must NOT include a cell for that spanned position.

## Accessibility

```html
<th scope="col">Column header</th>
<th scope="row">Row header</th>

<!-- Complex tables -->
<th id="h1">Header</th>
<td headers="h1 h2">Data</td>
```

## Decision Rule

| Content Type | Use `<table>`? |
|---|---|
| Spreadsheet-like data, comparisons, schedules | ✅ Yes |
| Page layout (sidebar, header, footer) | ❌ No — use CSS Grid/Flexbox (Book 03) |
| Navigation, blog list, photo gallery | ❌ No |
