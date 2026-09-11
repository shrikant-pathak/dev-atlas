# Lesson 4: npm and Package Management

## Learning Objectives
- Understand what npm is and the problem package managers solve
- Read and understand `package.json`, including dependencies vs devDependencies
- Understand semantic versioning (semver) and what `^` and `~` mean in version ranges
- Understand `package-lock.json` and why it exists
- Run common npm commands: install, scripts, and publishing basics

## Introduction

Every React and Vue project you've worked with (per your own stated experience) depends on **npm** (Node Package Manager) under the hood, whether or not you've thought about it directly. Any time you've run `npm install` or seen a `package.json` file, you've been using the ecosystem this lesson explains properly, tying together threads from earlier in the book: ES modules (Module 06) are what the packages you install actually export, and the whole system exists to make sharing and reusing JavaScript code across projects and teams manageable at scale.

## What npm Actually Is

npm is three things bundled together: a public registry of published packages (npmjs.com), a command-line tool for installing and managing those packages, and a specification (`package.json`) for describing a project's dependencies and metadata.

When you run:

```bash
npm install lodash
```

npm downloads the `lodash` package and its own dependencies from the registry, places them in a `node_modules` folder, and records that your project now depends on it inside `package.json`.

## package.json

Every npm project has a `package.json` file at its root — the project's manifest.

```json
{
  "name": "my-app",
  "version": "1.0.0",
  "description": "A sample application",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "jest",
    "build": "webpack"
  },
  "dependencies": {
    "react": "^18.2.0",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "eslint": "^8.50.0",
    "jest": "^29.7.0"
  }
}
```

**`dependencies`** are packages your application needs to actually *run* — things like React itself, or a library used directly in your production code.

**`devDependencies`** are packages only needed *while developing* — testing tools (Lesson 7), linters (Lesson 6), build tools — that don't need to ship with your finished application.

```bash
npm install react           # adds to "dependencies"
npm install --save-dev jest # adds to "devDependencies"
```

**`scripts`** are named shortcuts for commands you run often, invoked with `npm run <name>` (`start` and `test` get a small shortcut — just `npm start` / `npm test`, no `run` needed):

```bash
npm run build
npm test
npm start
```

## Semantic Versioning (semver)

Package versions follow the pattern `MAJOR.MINOR.PATCH` (e.g., `18.2.0`), and each segment carries a specific meaning:

- **MAJOR** — breaking changes; code that worked before might not work anymore
- **MINOR** — new features added, but backward-compatible
- **PATCH** — bug fixes only, no new features, fully backward-compatible

This convention lets `package.json` express *how much* a dependency is allowed to update automatically, using two common prefixes:

```json
"dependencies": {
  "react": "^18.2.0",   // ^ = compatible with 18.x.x — allows minor and patch updates, not major
  "lodash": "~4.17.21"  // ~ = compatible with 4.17.x — allows patch updates only
}
```

| Prefix | Meaning | Example range allowed |
|---|---|---|
| `^18.2.0` | Minor + patch updates allowed | `18.2.0` up to (not including) `19.0.0` |
| `~4.17.21` | Patch updates only | `4.17.21` up to (not including) `4.18.0` |
| `18.2.0` (no prefix) | Exact version only | only `18.2.0` |

`^` is npm's default when you `npm install` a package, and it's by far the most common you'll see in real `package.json` files — it reflects a reasonable trust that minor/patch updates, per semver's promise, shouldn't break your code.

## package-lock.json

Version ranges like `^18.2.0` are inherently a *range*, not a single exact version — which means two developers running `npm install` on the same `package.json`, at different times, could theoretically get slightly different actual versions installed. `package-lock.json` solves this: it's an auto-generated file recording the *exact* version of every installed package (including nested dependencies of dependencies), so that every install — on every machine, at any time — produces an identical `node_modules` tree.

package.json → what version RANGES you've allowed
package-lock.json → the EXACT versions actually installed, locked


This is why `package-lock.json` should always be committed to version control alongside `package.json` — without it, teammates (and CI pipelines) could end up running subtly different dependency versions than you tested with locally.

## Common Commands

```bash
npm install                  # install everything listed in package.json
npm install <package>        # install a package, add to dependencies
npm install <package> --save-dev  # install, add to devDependencies
npm uninstall <package>      # remove a package
npm update                   # update packages within their allowed semver ranges
npm outdated                 # see which installed packages have newer versions available
npm run <script-name>        # run a custom script defined in package.json
npx <command>                # run a package's CLI tool without installing it globally
```

`npx` deserves a specific callout: it lets you run a one-off command (like scaffolding a new project) using a package's binary without permanently installing it on your system — for example, `npx create-vite@latest` downloads and runs the latest Vite scaffolding tool just for that one command.

## Practical Example

A realistic `package.json` fragment for a small React project, annotated to show the concepts from this lesson working together:

```json
{
  "name": "todo-app",
  "version": "0.1.0",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint src",
    "test": "vitest"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "vite": "^5.0.0",
    "eslint": "^8.50.0",
    "vitest": "^1.0.0"
  }
}
```

Running `npm install` reads this file, resolves every version range against the registry, downloads the exact resolved versions into `node_modules`, and writes (or updates) `package-lock.json` to pin those exact versions for next time. Running `npm run dev` then executes the `vite` command listed under `"dev"`.

## Revision Questions

<details>
<summary>1. What's the practical difference between dependencies and devDependencies, and why does that distinction matter for deploying an application?</summary>

`dependencies` are needed for the application to actually run in production; `devDependencies` are only needed while developing (linters, test runners, build tools). The distinction matters because a production deployment can skip installing `devDependencies` entirely, keeping the shipped application smaller and its dependency surface leaner.
</details>

<details>
<summary>2. In semantic versioning, what does each of the three numbers in MAJOR.MINOR.PATCH represent?</summary>

MAJOR indicates breaking changes that may require code updates; MINOR indicates new, backward-compatible features; PATCH indicates backward-compatible bug fixes only.
</details>

<details>
<summary>3. What's the difference in the version range allowed by ^18.2.0 versus ~4.17.21?</summary>

`^18.2.0` allows any minor and patch update within the same major version (up to but not including 19.0.0). `~4.17.21` allows only patch updates within the same minor version (up to but not including 4.18.0) — a narrower, more conservative range.
</details>

<details>
<summary>4. Why should package-lock.json be committed to version control instead of relying on package.json alone?</summary>

`package.json` specifies version *ranges*, which could resolve to slightly different actual versions at different times or on different machines. `package-lock.json` records the exact resolved versions of every dependency (including nested ones), guaranteeing that everyone who installs from the same commit gets an identical dependency tree.
</details>
