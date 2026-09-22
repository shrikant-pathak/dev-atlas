# Module 05 Cheatsheet

## Text Controls
`.form-control` · `.form-control-sm` / `.form-control-lg` · `.form-label` · `.form-text`
`disabled` · `readonly` (native attributes)

## Select
`.form-select` · `.form-select-sm` / `.form-select-lg` · `multiple` + `size="N"` (native)

## Checks & Radios
`.form-check` (wrapper) · `.form-check-input` · `.form-check-label`
`.form-switch` + `role="switch"` · `.form-check-inline` · `.form-check-reverse`
Radio grouping: shared `name` attribute (native, required)

## Range
`.form-range` · `min` / `max` / `step` (native)

## Input Groups
`.input-group` · `.input-group-text` (prepend/append by position)
`.input-group-sm` / `.input-group-lg` (on wrapper, not children)

## Floating Labels
`.form-floating` — input/select/textarea BEFORE label in markup
Requires non-empty `placeholder`; textarea needs explicit inline height

## Layout
`.row` + `.g-*` (gutters) · `.col-md-6` etc. · `.col-auto` · `.visually-hidden`
Horizontal: `.col-form-label` on label + `.col-sm-N` on field wrapper

## Validation
`.is-valid` / `.is-invalid` · `.valid-feedback` / `.invalid-feedback`
`novalidate` on `<form>` + `.needs-validation` class
JS: `form.checkValidity()` + `.was-validated` on submit
