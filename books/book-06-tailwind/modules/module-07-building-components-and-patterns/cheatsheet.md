# Module 07 Cheatsheet — Building Components & Patterns

## Button

```
base:    inline-flex cursor-pointer items-center justify-center gap-2 rounded-lg border border-transparent font-medium transition
         outline-hidden focus-visible:outline-2 focus-visible:outline-offset-2 disabled:pointer-events-none disabled:opacity-50
solid:   bg-indigo-600 text-white hover:bg-indigo-700 focus-visible:outline-indigo-600
outline: border-slate-300 bg-white text-slate-700 hover:bg-slate-50
ghost:   text-slate-700 hover:bg-slate-100
danger:  bg-red-600 text-white hover:bg-red-700 focus-visible:outline-red-600
sizes:   sm px-3 py-1.5 text-xs · md px-4 py-2 text-sm · lg px-6 py-3 text-base
icon:    size-9 + aria-label
group:   first:rounded-l-lg last:rounded-r-lg not-first:-ml-px
```

## Badge

```
inline-flex items-center rounded-full bg-green-50 px-2.5 py-0.5 text-xs font-medium text-green-700 ring-1 ring-green-600/20 ring-inset
count:   absolute -top-0.5 -right-0.5 grid min-w-5 place-items-center rounded-full bg-red-600 text-[11px] text-white
```

## Card

```
overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm
equal height:   card flex flex-col · body flex-1 · footer mt-auto
stretched link: card relative · link after:absolute after:inset-0 · card has-focus-visible:ring-2
adaptive:       wrapper @container · card flex-col @md:flex-row
```

## Navbar

```
header: sticky top-0 z-50 border-b bg-white/80 backdrop-blur
desktop links: hidden md:flex          mobile toggle: md:hidden
current link:  aria-[current=page]:text-indigo-600
toggle icons:  group-aria-expanded:hidden / group-aria-expanded:block
panel:         hidden attribute + md:hidden       JS: toggle aria-expanded + panel.hidden
```

## Form

```
input: block w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm placeholder:text-slate-400
       outline-hidden focus:border-indigo-500 focus:ring-3 focus:ring-indigo-500/25
       disabled:bg-slate-50 disabled:text-slate-500 aria-invalid:border-red-500
after interaction: [&:user-invalid]:border-red-500        grow textarea: field-sizing-content
check/radio: accent-indigo-600        wrapper focus: has-focus-visible:ring-3
```

## Dialog

```
<dialog class="m-auto w-[calc(100%-2rem)] max-w-md rounded-2xl p-0 shadow-xl
  opacity-0 scale-95 transition-all transition-discrete duration-200
  open:opacity-100 open:scale-100 starting:open:opacity-0 starting:open:scale-95
  backdrop:bg-slate-950/50 backdrop:backdrop-blur-sm">
```

- Open: `dialog.showModal()` · Close: `dialog.close()` or `<form method="dialog">`
- Backdrop click: `if (e.target === dialog) dialog.close()`
- Scroll lock: `<body class="has-[dialog:modal]:overflow-hidden">`
- Preflight resets margin → always `m-auto`

## Accordion / dropdown / tabs

```
accordion: <details name="faq" class="group"> · summary list-none [&::-webkit-details-marker]:hidden · icon group-open:rotate-180
dropdown:  button[aria-expanded][aria-controls] + ul[hidden]; JS: toggle, outside click, Escape; icon group-aria-expanded:rotate-180
tabs:      role=tablist/tab/tabpanel · aria-selected:border-indigo-600 · roving tabindex · arrows/Home/End
```

## Table / list / alert

```
table wrapper: overflow-x-auto rounded-xl border      table: min-w-full divide-y text-sm
th: px-4 py-3 text-left text-xs font-semibold uppercase tracking-wide text-slate-500    numbers: text-right tabular-nums
zebra: odd:bg-slate-50       truncate in flex: min-w-0       selectable row: has-checked:bg-indigo-50
alert: flex gap-3 rounded-lg p-4 text-sm ring-1 ring-inset + tone map; role="alert" (urgent) / role="status" (polite)
```

## Repetition ladder

1. Loop / multi-cursor → 2. Component (props + full-string variant map) → 3. `@utility` → 4. `@layer components` + `@apply`

| Tool | Does |
|---|---|
| `clsx` | Conditional class strings |
| `tailwind-merge` | Resolves conflicting Tailwind classes |
| `cva` | Typed variant API |
| `data-[variant=x]:` | Variants from attributes, no JS map |

Class order in `class="…"` never decides which utility wins.
