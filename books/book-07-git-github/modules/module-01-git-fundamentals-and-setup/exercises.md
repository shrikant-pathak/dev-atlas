# Module 01 Exercises — Git Fundamentals & Setup

Work in a scratch folder (for example `~/git-practice`). Try each exercise before opening the solution.

---

## Exercise 1 — Concepts (Lessons 01–02)

Without looking back, answer:

1. Name the three states and the three areas, and match each state to an area.
2. Explain in one sentence why Git can work offline.
3. List two reasons a staging area is useful.

<details>
<summary>Solution</summary>

1. Modified (working tree), staged (staging area/index), committed (repository/.git).
2. Every clone contains the complete history, so most operations run locally.
3. It lets you build focused commits from related changes, and review exactly what will be committed before committing.
</details>

---

## Exercise 2 — Install and Verify (Lesson 03)

1. Print your Git version.
2. Find where the Git executable lives.
3. If you use WSL, repeat both steps inside WSL and compare.

<details>
<summary>Solution</summary>

```bash
git --version
which git        # Windows: where git
```
They may report different versions in Windows and WSL because they are separate installations.
</details>

---

## Exercise 3 — Configuration (Lesson 04)

1. Set your name, email, default branch `main`, and an editor.
2. Show every setting with the file it came from.
3. Create a repository and set a **different email** for that repo only. Verify which value Git uses inside it.

<details>
<summary>Solution</summary>

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --list --show-origin

mkdir cfg-test && cd cfg-test && git init
git config user.email "work@example.com"     # local, no --global
git config user.email                         # work@example.com
git config --show-origin user.email           # file: .git/config
```
The local value overrides the global one.
</details>

---

## Exercise 4 — Getting Help (Lesson 04)

Using only Git's built-in help, answer:

1. What does the `-p` flag of `git add` do?
2. Which `git commit` option replaces the previous commit?
3. What is an *index* according to the glossary?

<details>
<summary>Solution</summary>

1. `git help add` → `-p` / `--patch` lets you interactively choose hunks to stage.
2. `git help commit` → `--amend`.
3. `git help glossary` → the staging area, a list of paths and contents that will form the next commit.
</details>

---

## Exercise 5 — First Repository (Lesson 05)

1. Create `recipe-book`, initialize it on `main`.
2. Add `index.html` and `style.css`, commit them as **two separate commits**.
3. Edit `index.html`, view the diff, stage it, view the staged diff, commit.
4. Show a one-line history.

<details>
<summary>Solution</summary>

```bash
mkdir recipe-book && cd recipe-book
git init -b main
echo "<h1>Recipes</h1>" > index.html
git add index.html && git commit -m "Add recipe homepage"
echo "h1 { color: tomato; }" > style.css
git add style.css && git commit -m "Add base stylesheet"
echo "<p>Pasta</p>" >> index.html
git diff
git add index.html
git diff --staged
git commit -m "Add first recipe"
git log --oneline
```
</details>

---

## Exercise 6 — Reading `git status -s` (Lesson 05)

Predict the short status code for each, then verify:

1. A new file never added
2. A tracked file edited but not staged
3. A tracked file edited, staged, then edited again
4. A new file that you `git add`ed

<details>
<summary>Solution</summary>

1. `??`  2. ` M`  3. `MM`  4. `A `
</details>

---

## Exercise 7 — Remove, Move, Clean (Lesson 06)

In `recipe-book`:

1. Create `old-notes.txt`, commit it, then remove it with Git and commit.
2. Move `style.css` into `css/` using Git.
3. Commit a file called `.env`, then stop tracking it **without deleting it**.
4. Create `junk.tmp` and preview, then perform, a clean.

<details>
<summary>Solution</summary>

```bash
echo "x" > old-notes.txt && git add . && git commit -m "Add notes"
git rm old-notes.txt && git commit -m "Remove old notes"

mkdir css && git mv style.css css/style.css && git commit -m "Move stylesheet into css folder"

echo "KEY=1" > .env && git add .env && git commit -m "Add env (mistake)"
git rm --cached .env && git commit -m "Stop tracking .env"

touch junk.tmp
git clean -n          # preview
git clean -f          # CAUTION: would also delete untracked .env — read the preview first!
```
Observe that `.env` is untracked after `--cached`, so `git clean -f` would delete it. This is the danger Exercise 9 solves.
</details>

---

## Exercise 8 — Commit Message Makeover (Lesson 07)

Rewrite as imperative, atomic Conventional Commits. Split where needed.

1. `fixed stuff and added new login and updated readme`
2. `Changes.`
3. `Removed the deprecated API and now everything is broken`

<details>
<summary>Solution (sample)</summary>

1. `fix(auth): correct password validation` · `feat(auth): add login form` · `docs: update README setup steps`
2. Needs real content, e.g. `refactor(cart): simplify total calculation`
3. `feat!: remove deprecated v1 API` with a footer `BREAKING CHANGE: clients must migrate to the v2 API.`
</details>

---

## Exercise 9 — .gitignore (Lesson 08)

In `recipe-book`:

1. Create `node_modules/x.js`, `dist/app.js`, `.env`, `debug.log` and `important.log`.
2. Write a `.gitignore` that ignores all of them **except** `important.log`.
3. Prove which rule matches each path.
4. Create a global ignore file for `.DS_Store` and `Thumbs.db`.

<details>
<summary>Solution</summary>

```bash
mkdir -p node_modules dist
echo x > node_modules/x.js && echo x > dist/app.js
echo K=1 > .env && echo x > debug.log && echo x > important.log

cat > .gitignore << 'IGN'
node_modules/
dist/
.env
*.log
!important.log
IGN

git check-ignore -v node_modules/x.js dist/app.js .env debug.log important.log
git status -s     # only .gitignore and important.log are untracked

echo ".DS_Store" > ~/.gitignore_global && echo "Thumbs.db" >> ~/.gitignore_global
git config --global core.excludesFile ~/.gitignore_global
```
`important.log` prints nothing for `check-ignore` because it is not ignored.
</details>

---

## 🏆 Challenge — End-to-End Mini Project

Create a repository called `portfolio-practice` on branch `main`. In order:

1. Add `index.html` → commit `feat: add homepage`
2. Add `css/style.css` and link it → commit `feat(style): add base styles`
3. Create `node_modules/`, `dist/` and `.env` and a proper `.gitignore`, plus `.env.example` → commit `chore: add gitignore and env template`
4. Rename `index.html` to `home.html` using Git → commit `refactor: rename homepage`
5. Show `git log --oneline` and `git ls-files`

**Success criteria:** 4 clean commits, nothing ignored is tracked, `.env.example` is tracked, history follows the rename (`git log --follow home.html`).
