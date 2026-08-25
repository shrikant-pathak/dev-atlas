# Interview Questions — Positioning & Layout Fundamentals

## Beginner
- What's the difference between `display: none` and `visibility: hidden`?
- What are the five values of the `position` property?
- What prerequisite must an element have for `z-index` to have any effect?
- What does `max-width: 100%` do for a responsive image?

## Intermediate
- Explain what a "positioning context" is and how `position: absolute` uses it.
- What is a stacking context, and why can a high `z-index` sometimes still lose to a sibling?
- Why does a container collapse to zero height when it only contains floated children?
- What's the difference between `overflow: scroll` and `overflow: auto`?

## Advanced
- Walk through debugging a real z-index issue using the stacking-context mental model.
- Explain `position: sticky`'s behavior in detail — what triggers it to switch between relative and fixed-like behavior?
- Why is float now considered legacy for layout, but still valid for one specific use case? What is that use case?
- Explain the whitespace-gap quirk with `inline-block` and at least one historical way to solve it.
