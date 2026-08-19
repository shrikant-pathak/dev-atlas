# Lesson 06: Package Managers

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a package manager is and the problem it solves.
- Use `npm` to install, update, and remove packages.
- Understand the difference between global and local package installation.

---

# Introduction

This final lesson of Module 07 introduces **package managers** — tools that automate installing, updating, and removing software libraries, and one of the most-used command-line tools you'll interact with once you start writing real JavaScript projects.

---

# What Is a Package Manager?

A **package manager** automates the process of installing external code libraries ("packages" or "dependencies") that your project relies on, along with *their* dependencies, in the correct compatible versions — a task that would be extremely tedious and error-prone to do manually.

Different ecosystems have their own package managers:

| Ecosystem | Package Manager(s) |
|---|---|
| JavaScript/Node.js | npm, yarn, pnpm |
| Python | pip |
| macOS system tools | Homebrew |
| Linux (Debian/Ubuntu) | apt |
| Linux (Fedora) | dnf |

As a web developer working primarily in JavaScript, **npm (Node Package Manager)** is the one you'll use constantly.

---

# Using npm

```bash
npm init                      # start a new project, creating a package.json file
npm install express            # install a package as a project dependency
npm install --save-dev jest     # install a package as a development-only dependency
npm install                      # install all dependencies listed in an existing package.json
npm uninstall express              # remove a package
npm update                          # update all packages to their latest compatible versions
npm list                             # list installed packages
```

---

# `package.json`: The Project's Dependency Manifest

Every npm-managed project has a `package.json` file listing its dependencies:

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.2"
  },
  "devDependencies": {
    "jest": "^29.0.0"
  }
}
```

- **`dependencies`** — packages needed for the app to actually run in production.
- **`devDependencies`** — packages only needed during development (testing tools, formatters), not shipped to production.

---

# Global vs. Local Installation

```bash
npm install -g some-cli-tool     # install globally, usable from any project/terminal location
npm install some-package          # install locally, only usable within this specific project
```

Most packages should be installed **locally** to your project — this keeps each project's dependencies isolated and avoids version conflicts between different projects requiring different versions of the same package. Global installs are typically reserved for command-line tools you want available everywhere.

---

# Practical Example

```bash
mkdir my-app && cd my-app
npm init -y                    # quickly initialize with default settings
npm install express              # add Express as a dependency
npm install --save-dev nodemon    # add a dev-only tool
cat package.json                   # view the resulting dependency list
```

---

# Revision Questions

1. What problem does a package manager solve?
2. What's the difference between `dependencies` and `devDependencies` in `package.json`?
3. When would you choose a global install over a local one?

<details><summary>Answers</summary>

1. It automates installing, updating, and removing external code libraries a project depends on, including handling compatible versions of those libraries' own dependencies.
2. `dependencies` are needed for the app to run in production; `devDependencies` are only needed during development (like testing or formatting tools) and aren't shipped to production.
3. When installing a command-line tool you want available across all projects/terminal sessions, rather than something specific to a single project.

</details>

---

# 🏁 Module 07 Checkpoint

Before moving to Module 08, you should be able to:
- [ ] Navigate confidently between directories using relative and absolute paths
- [ ] Create, copy, move, and delete files and directories from the command line
- [ ] Search for files and text content using `find` and `grep`
- [ ] Read and modify file permissions using `chmod`
- [ ] Use `npm` to manage a project's dependencies

**Next up:** Module 08 — Git Basics
