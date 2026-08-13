cat > lesson-01-visual-studio-code.md << 'EOF'
# Lesson 01: Visual Studio Code

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what VS Code is and why it's the most widely used code editor today.
- Navigate its core interface elements.
- Use basic keyboard shortcuts to work more efficiently.

---

# Introduction

Every developer needs a place to actually write code. While you could technically use a plain text editor like Notepad, modern development relies on tools purpose-built for writing, navigating, and debugging code efficiently. **Visual Studio Code (VS Code)** has become the dominant choice for web developers, and setting it up properly is one of the first real steps into professional development.

---

# What Is VS Code?

VS Code is a free, open-source code editor developed by Microsoft. Unlike a full Integrated Development Environment (IDE), which bundles many heavy built-in tools, VS Code is lightweight by default and becomes powerful through **extensions** (covered in the next lesson) — you customize it to fit exactly what you need.

---

# Core Interface Elements

- **Activity Bar** (left edge) — icons for Explorer, Search, Source Control, Run/Debug, and Extensions.
- **Explorer** — shows your project's file and folder structure.
- **Editor** — the main area where you write and edit code; supports multiple tabs and split views.
- **Integrated Terminal** — a full terminal built directly into the editor (covered in more depth in Lesson 04).
- **Status Bar** (bottom) — shows info like line/column position, file encoding, and Git branch.
- **Command Palette** (`Cmd/Ctrl + Shift + P`) — a searchable menu for every command VS Code supports, without needing to memorize menu locations.

---

# Essential Keyboard Shortcuts

| Action | macOS | Windows/Linux |
|---|---|---|
| Command Palette | Cmd+Shift+P | Ctrl+Shift+P |
| Quick file open | Cmd+P | Ctrl+P |
| Toggle terminal | Cmd+` | Ctrl+` |
| Save | Cmd+S | Ctrl+S |
| Find in file | Cmd+F | Ctrl+F |
| Find in all files | Cmd+Shift+F | Ctrl+Shift+F |
| Multi-cursor (add cursor) | Option+Click | Alt+Click |

Learning the Command Palette especially pays off quickly — nearly everything VS Code can do is searchable there by typing a few relevant words, without needing to remember exact menu paths.

---

# Why VS Code Specifically?

1. **Free and cross-platform** — works identically on Windows, macOS, and Linux.
2. **Massive extension ecosystem** — covered in the next lesson, letting you add support for virtually any language or workflow.
3. **Built-in Git integration** — no separate Git GUI needed for most day-to-day version control.
4. **Strong community and documentation** — tutorials, extensions, and troubleshooting guides are widely available since it's the most popular editor among web developers.

---

# Revision Questions

1. What's the difference between a lightweight editor and a full IDE, and where does VS Code fit?
2. What does the Command Palette do, and how do you open it?
3. Name two core interface elements of VS Code.

<details><summary>Answers</summary>

1. A full IDE bundles many built-in tools by default and can be heavier; a lightweight editor like VS Code starts minimal and becomes powerful through extensions you choose to add.
2. It's a searchable menu giving access to every command VS Code supports; opened with Cmd+Shift+P (macOS) or Ctrl+Shift+P (Windows/Linux).
3. Any two of: Activity Bar, Explorer, Editor, Integrated Terminal, Status Bar.

</details>
EOF