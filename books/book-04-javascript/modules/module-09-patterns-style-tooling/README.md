# Module 09: Patterns, Style & Tooling

## Overview

This module shifts focus from *what JavaScript can do* to *how professional teams actually work with it day to day*. The first two lessons cover design patterns and metaprogramming (`Proxy`/`Reflect`) that shape how you structure code. The remaining five lessons cover the ecosystem and tooling around JavaScript: naming and style conventions, package management, bundling, linting, and testing — the practical infrastructure every real project sits on top of.

By the end of this module, you'll understand not just how to write JavaScript, but how to write it in a way that scales across a team, a codebase, and time — and you'll recognize the tools (npm, Vite, ESLint, Jest/Vitest) that you've likely already been using in your own React and Vue projects, now with a clear understanding of what they're actually doing.

## Lessons

1. **Design Patterns — Module, Observer, Factory, Singleton** — recurring, named solutions to recurring structural problems
2. **Proxy and Reflect** — intercepting fundamental object operations, and the mechanism behind Vue 3's reactivity system
3. **Naming Conventions & Style Guide** — casing conventions, naming principles, and popular published style guides
4. **npm and Package Management** — package.json, semantic versioning, and package-lock.json
5. **Bundlers Overview** — why bundling exists, and how Webpack, Vite, and esbuild compare
6. **Linting with ESLint** — automated enforcement of code quality and style rules
7. **Intro to Unit Testing** — the unit-test mental model, Jest-style syntax, and basic mocking

## Prerequisites

This module builds directly on:
- **Module 02** (Functions, Scope & Objects) — closures and prototypes underpin the Module pattern and Proxy/Reflect
- **Module 05** (Asynchronous JavaScript & APIs) — async/await is used throughout the testing lesson
- **Module 06** (ES6+ Modern Features) — ES modules are the foundation for npm packages, tree shaking, and the modern Singleton discussion
- **Module 08** (Typed Arrays, Graphics & Legacy Web Tech) — no direct dependency, but this module's "recognize legacy code" framing carries forward into Lesson 3's style-guide history

## A Note on Scope

Design patterns, tooling, and testing are each large enough to be entire books on their own. This module is intentionally an on-ramp: enough to recognize these concepts confidently in real codebases, use the basic tools correctly, and know what to search for when you need to go deeper on any one of them.
