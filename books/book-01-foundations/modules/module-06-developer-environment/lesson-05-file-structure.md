cat > lesson-05-file-structure.md << 'EOF'
# Lesson 05: File Structure

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain why consistent project file structure matters.
- Identify common folders and files found in most web development projects.
- Organize a basic project following sensible conventions.

---

# Introduction

This final lesson of Module 06 ties your editor, extensions, DevTools, and terminal knowledge together by focusing on how projects are actually organized on disk. A clean, conventional file structure makes projects easier to navigate — for you, for collaborators, and for the tools (like build systems) that expect certain files in certain places.

---

# Why File Structure Matters

- **Navigability** — a predictable structure means you (and others) can find things quickly, even in an unfamiliar project.
- **Tooling expectations** — many tools and frameworks expect specific files in specific locations (e.g., a `package.json` at the project root, discussed below).
- **Scalability** — a good structure keeps a project manageable as it grows from a few files to hundreds.

---

# Common Files and Folders in Web Projects

- **`README.md`** — describes the project: what it is, how to set it up, how to run it.
- **`package.json`** — (for Node.js-based projects) lists project dependencies, scripts, and metadata. You'll work with this extensively once you reach Book 04 (JavaScript) and beyond.
- **`.gitignore`** — tells Git which files/folders to exclude from version control (like `node_modules/` or environment secrets).
- **`src/`** — commonly holds the actual source code of the application.
- **`public/`** or **`assets/`** — static files like images, fonts, and icons.
- **`node_modules/`** — installed dependencies (never edited directly, and always excluded from Git via `.gitignore`).
- **`.env`** — stores environment-specific configuration and secrets (like API keys), also excluded from Git.

---

# Example: A Simple Project Structure

my-project/
├── README.md
├── package.json
├── .gitignore
├── .env
├── src/
│ ├── index.html
│ ├── styles/
│ │ └── main.css
│ └── scripts/
│ └── app.js
└── public/
└── images/
└── logo.png

---

# Naming Conventions

Consistency matters more than any single "correct" convention, but common patterns include:
- **kebab-case** for file and folder names (`user-profile.js`), especially common in web projects.
- **Descriptive names over generic ones** — `nav-bar.css` rather than `styles2.css`.
- **Grouping by type or feature** — some projects organize by file type (`components/`, `styles/`), others by feature (`login/`, `dashboard/`) — both are valid; consistency within a project is what matters most.

---

# Revision Questions

1. Why does consistent file structure matter, beyond personal preference?
2. What is `.gitignore` used for, and name one common thing excluded via it.
3. What's the difference between organizing a project "by type" versus "by feature"?

<details><summary>Answers</summary>

1. It makes navigation predictable for collaborators, meets tooling expectations (many tools look for specific files in specific places), and keeps projects manageable as they grow.
2. It tells Git which files/folders to exclude from version control; commonly used to exclude `node_modules/` or `.env` secret files.
3. "By type" groups files by their kind (all CSS together, all JS together); "by feature" groups files related to the same feature/section of the app together, regardless of file type.

</details>

---

# 🏁 Module 06 Checkpoint

Before moving to Module 07, you should be able to:
- [ ] Navigate VS Code's core interface confidently
- [ ] Install and manage extensions
- [ ] Use browser DevTools to inspect elements, check console errors, and set breakpoints
- [ ] Use VS Code's integrated terminal for common daily commands
- [ ] Organize a basic project with sensible file structure and naming

**Next up:** Module 07 — Command Line
EOF