cat > quiz.md << 'EOF'
# Quiz — Developer Environment

## Multiple Choice
1. What is the default shell on macOS?
   a) bash  b) PowerShell  c) zsh  d) fish

2. Which VS Code panel would you use to view/edit HTML and CSS live in DevTools?
   a) Console  b) Elements  c) Sources  d) Network

3. Which file tells Git which files/folders to exclude from version control?
   a) package.json  b) README.md  c) .gitignore  d) .env

4. What does running `code .` do in a terminal?
   a) Runs a code file  b) Opens the current folder in VS Code  c) Installs VS Code  d) Clears the terminal

---

## True / False
1. VS Code is a full IDE that comes with every tool built in by default, with no extensions needed. (True/False)
2. Changes made in DevTools' Elements panel are permanent and saved to the actual file. (True/False)
3. `node_modules/` should typically be excluded from Git via `.gitignore`. (True/False)

---

## Short Answer
1. Explain what an "extension" is in the context of VS Code.
2. Why might a developer use VS Code's integrated terminal instead of a separate terminal app?
3. What's the purpose of a `README.md` file in a project?

---

## Coding Questions
1. Write the keyboard shortcut (for macOS) to open VS Code's Command Palette.
2. Write a basic `.gitignore` entry that would exclude a `node_modules` folder from version control.

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-b, 3-c, 4-b

**True/False:** 1-False (VS Code is lightweight by default; extensions add most functionality), 2-False (Elements panel changes are temporary, reset on reload), 3-True

**Coding Question 1:** Cmd+Shift+P

**Coding Question 2:** `node_modules/`

</details>
EOF