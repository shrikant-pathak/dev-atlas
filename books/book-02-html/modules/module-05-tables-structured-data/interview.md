cat > interview.md << 'EOF'
# Interview Questions — Tables & Structured Data

## Beginner
- What's the difference between `<th>` and `<td>`?
- Are HTML tables built row-by-row or column-by-column?
- What does `<caption>` do, and where must it be placed?
- What are `<thead>`, `<tbody>`, and `<tfoot>` used for?

## Intermediate
- What does `colspan` do, and how does it affect the rest of that row?
- What must you be careful of when a cell uses `rowspan`?
- What does the `scope` attribute on `<th>` accomplish for accessibility?
- Why is styling a `<td>` to look bold not equivalent to using `<th>`?

## Advanced
- Explain why "tables for layout" was considered an anti-pattern, with specific accessibility and maintainability reasons.
- When would `id`/`headers` be necessary instead of `scope` alone?
- Describe how a screen reader user experiences a table differently from a sighted user, and why that matters for markup choices.
- Give a real-world example each of content that IS and ISN'T appropriate for a `<table>`, with reasoning.
EOF