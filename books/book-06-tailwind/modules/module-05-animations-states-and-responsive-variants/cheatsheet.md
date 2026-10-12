# Module 05 Cheatsheet — Animations, States & Responsive Variants

## Animations

| Class | Effect |
|---|---|
| `animate-spin` / `ping` / `pulse` / `bounce` / `none` | Built-in animations |
| `animate-[name_1s_ease_infinite]` | Arbitrary animation |
| `animate-(--var)` | Animation from a CSS variable |
| `motion-safe:` / `motion-reduce:` | Respect reduced-motion preference |
| `[animation-delay:150ms]` | Animation delay (`delay-*` is for transitions) |

```css
@theme {
  --animate-wiggle: wiggle 0.8s ease-in-out infinite;
  @keyframes wiggle { 0%,100% { transform: rotate(-4deg) } 50% { transform: rotate(4deg) } }
}
```

## Scroll

| Class | Effect |
|---|---|
| `scroll-smooth` / `scroll-auto` | Smooth anchor scrolling |
| `snap-x` `snap-y` `snap-both` | Snap axis |
| `snap-mandatory` / `snap-proximity` | Snap strictness |
| `snap-start` `snap-center` `snap-end` | Child alignment |
| `snap-always` / `snap-normal` | Allow skipping or not |
| `scroll-mt-*` / `scroll-p-*` | Scroll margin / padding |
| `overscroll-contain` / `-none` | Stop scroll chaining |

## Entry animations

| Class | Effect |
|---|---|
| `starting:opacity-0` | Style to animate **from** on first render |
| `transition-discrete` | Allow `display` etc. to transition |
| `open:` | `[open]` or `:popover-open` |
| `backdrop:` | `<dialog>` / popover backdrop |

## State variants

`hover:` `focus:` `focus-visible:` `focus-within:` `active:` `disabled:` `enabled:` `visited:` `checked:` `invalid:` `required:` `read-only:` `open:` `empty:`

- Variants stack **left → right** in v4: `md:hover:bg-…`
- `hover:` only applies on hover-capable devices (v4)
- Use `outline-hidden` (not `outline-none`) with a custom ring

## Group / peer

| Marker | Variants | Direction |
|---|---|---|
| `group` / `group/name` | `group-hover:` `group-focus:` `group-aria-expanded:` | Ancestor → descendants |
| `peer` / `peer/name` | `peer-checked:` `peer-invalid:` `peer-placeholder-shown:` | Earlier → **later** sibling |

## Relational variants

| Variant | Meaning |
|---|---|
| `has-checked:` `has-[img]:` | Parent contains… |
| `not-first:` `not-hover:` `not-supports-[…]:` | Negation |
| `in-focus:` | Any ancestor has state |
| `nth-3:` `nth-[2n+1]:` `odd:` `even:` `first:` `last:` `only:` | Position |
| `*:` / `**:` | Direct children / all descendants |

## ARIA / data / arbitrary

| Variant | Matches |
|---|---|
| `aria-expanded:` | `[aria-expanded="true"]` |
| `aria-[sort=ascending]:` | Specific value |
| `data-active:` | `[data-active]` (presence) |
| `data-[state=open]:` | Specific value |
| `[&>li]:py-1` | Arbitrary selector |
| `supports-[display:grid]:` | `@supports` |

React tip: `data-active={on ? "" : undefined}` (not `{on}`).

## Pseudo-elements

`before:` `after:` (content added automatically; use `content-['…']` for text) · `placeholder:` · `file:` · `marker:` · `selection:` · `first-letter:` · `first-line:` · `autofill:` · `backdrop:`

## Responsive

| Prefix | Min width |
|---|---|
| `sm:` | 40rem / 640px |
| `md:` | 48rem / 768px |
| `lg:` | 64rem / 1024px |
| `xl:` | 80rem / 1280px |
| `2xl:` | 96rem / 1536px |

`max-md:` · `md:max-xl:` · `min-[820px]:` · `portrait:` · `landscape:` · `print:`

```css
@theme { --breakpoint-xs: 30rem; }   /* custom */
```

## Container queries

```html
<div class="@container"><div class="flex-col @md:flex-row">…</div></div>
```

| | |
|---|---|
| `@3xs`→`@7xl` | 16rem → 80rem container sizes |
| `@max-md:` | Below container size |
| `@sm:@max-lg:` | Range |
| `@container/name` + `@md/name:` | Named container |
| `--container-8xl: 96rem` | Custom size in `@theme` |
