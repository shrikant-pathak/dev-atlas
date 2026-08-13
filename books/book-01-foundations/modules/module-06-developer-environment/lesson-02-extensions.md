cat > lesson-02-extensions.md << 'EOF'
# Lesson 02: Extensions

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what VS Code extensions are and how they extend the editor's functionality.
- Install and manage extensions.
- Identify a set of essential extensions for web development.

---

# Introduction

VS Code starts out fairly minimal by design — its real power comes from **extensions**, small add-on packages that add new features, languages support, themes, and tools. This is the same philosophy behind a smartphone's app store: a lean core platform, customized entirely by what you choose to install.

---

# What Is an Extension?

An extension is a package that adds specific functionality to VS Code — anything from syntax highlighting for a new language, to code formatting, to entirely new panels and tools within the editor. Extensions are installed from the built-in **Extensions Marketplace**, accessible via the Activity Bar or `Cmd/Ctrl + Shift + X`.

---

# Installing Extensions

1. Open the Extensions view (`Cmd/Ctrl + Shift + X`).
2. Search for the extension by name.
3. Click **Install**.
4. Some extensions require reloading VS Code or your project to take full effect.

Extensions can also be installed directly from the command line:
```bash
code --install-extension esbenp.prettier-vscode
```

---

# Essential Extensions for Web Development

- **Prettier** — automatically formats your code consistently (spacing, quotes, line length) on save.
- **ESLint** — analyzes JavaScript/TypeScript code for potential errors and style issues as you type.
- **GitLens** — supercharges VS Code's built-in Git features, showing line-by-line change history and authorship.
- **Live Server** — spins up a local development server with auto-reload for static HTML/CSS/JS projects.
- **Path Intellisense** — autocompletes file paths as you type import statements or link tags.
- **Auto Rename Tag** — automatically updates the matching closing HTML/JSX tag when you rename the opening one.

---

# Managing Extensions

- **Disable** an extension temporarily without uninstalling it (useful when troubleshooting conflicts).
- **Uninstall** extensions you no longer use — too many active extensions can slow down the editor.
- Extensions can be enabled **globally** (all projects) or just for the **current workspace**, useful for project-specific tools you don't want cluttering every project.

---

# Practical Example

```bash
# List all currently installed extensions
code --list-extensions
```

---

# Revision Questions

1. What is a VS Code extension, and where do you install them from?
2. Name two essential extensions for web development and what each does.
3. What's the difference between disabling and uninstalling an extension?

<details><summary>Answers</summary>

1. A package that adds functionality to VS Code (language support, formatting, tools, themes); installed from the built-in Extensions Marketplace.
2. Any two of: Prettier (auto-formats code), ESLint (flags code errors/style issues), GitLens (enhanced Git history), Live Server (local dev server with auto-reload), Path Intellisense (autocompletes file paths).
3. Disabling keeps the extension installed but inactive, easily re-enabled later; uninstalling removes it entirely from VS Code.

</details>
EOF