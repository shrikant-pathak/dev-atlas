cat > lesson-04-terminal.md << 'EOF'
# Lesson 04: Terminal

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the role of VS Code's integrated terminal in a modern development workflow.
- Understand what a shell is and identify common shells.
- Customize basic terminal settings for a smoother workflow.

---

# Introduction

You already learned core command-line skills in Book 01's very first module. This lesson connects that knowledge to your actual daily development environment — specifically, using the terminal built directly into VS Code, so you never need to switch between separate windows for coding and running commands.

---

# What Is a Shell?

A **shell** is the program that interprets and executes the commands you type into a terminal. Different operating systems default to different shells:

| OS | Default Shell |
|---|---|
| macOS | zsh |
| Linux | bash or zsh (varies by distro) |
| Windows | PowerShell |

VS Code's integrated terminal simply runs whichever shell your system defaults to (or one you configure it to use instead).

---

# The Integrated Terminal in VS Code

Opening it: `` Cmd+` `` (macOS) or `` Ctrl+` `` (Windows/Linux), or via View → Terminal.

**Why use it instead of a separate terminal app:**
- Automatically opens in your current project's root folder — no manual navigation needed.
- Supports multiple terminal tabs and split panes, letting you run a dev server in one and Git commands in another simultaneously.
- Integrates with VS Code's file explorer — clicking a file in a terminal error message can jump straight to that line in the editor.

---

# Common Daily-Use Commands (Recap + Context)

```bash
npm install          # install project dependencies
npm run dev           # start a local development server (common in modern frameworks)
git status             # check current Git changes
git add .                # stage all changes
git commit -m "message"   # commit staged changes
code .                      # open the current folder in VS Code (from any terminal)
```

That last one, `code .`, is worth remembering — it's often the fastest way to jump from a plain terminal window straight into VS Code for a project.

---

# Customizing Your Terminal (Optional but Common)

Many developers customize their shell prompt and add tools like:
- **Oh My Zsh** — a popular framework for customizing `zsh` with themes and plugins.
- **Git branch display** — showing your current Git branch directly in the prompt, so you always know your context at a glance.

This isn't required to be productive, but it's a common part of a developer's personalized setup you'll see referenced in tutorials and screenshots.

---

# Revision Questions

1. What is a shell, and what shell does macOS use by default?
2. Name two advantages of using VS Code's integrated terminal over a separate terminal app.
3. What does running `code .` do?

<details><summary>Answers</summary>

1. A shell is the program that interprets and executes typed commands; macOS defaults to zsh.
2. Any two of: opens automatically in the project's root folder, supports multiple tabs/split panes, integrates with the file explorer for jumping to error locations.
3. It opens the current folder in VS Code, directly from the terminal.

</details>
EOF