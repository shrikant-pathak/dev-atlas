# Module 02 Exercises — Inspecting & Undoing Changes

Work in throwaway repositories under `~/git-practice`. Try each exercise before opening the solution.

---

## Setup — Shared Practice Repository

```bash
mkdir -p ~/git-practice && cd ~/git-practice
rm -rf m02-lab && mkdir m02-lab && cd m02-lab
git init -b main

mk() {  # author, email, date, message, file, line
  echo "$6" >> "$5"
  git add "$5"
  GIT_AUTHOR_DATE="$3" GIT_COMMITTER_DATE="$3" \
    git -c user.name="$1" -c user.email="$2" commit -q -m "$4"
}

mk "Asha Rao"  asha@example.com "2026-01-05T09:00:00" "feat: add homepage"       index.html   "<h1>Home</h1>"
mk "Ben Ortiz" ben@example.com  "2026-01-12T14:30:00" "feat: add navbar"         index.html   "<nav>Menu</nav>"
mk "Asha Rao"  asha@example.com "2026-02-02T11:15:00" "fix: navbar link colour"   styles.css   "nav a { color: navy; }"
mk "Chen Wei"  chen@example.com "2026-02-20T16:45:00" "docs: add README"         README.md    "# Lab"
mk "Ben Ortiz" ben@example.com  "2026-03-09T10:05:00" "feat: add contact form"    contact.html "<form></form>"
mk "Asha Rao"  asha@example.com "2026-03-30T08:20:00" "fix: contact form label"   contact.html "<label>Email</label>"
```

---

## Exercise 1 — Log Filters

Using one command each:

1. Commits by Asha only, one line each
2. Commits between 1 Feb and 28 Feb 2026
3. Commits whose messages start with a `feat`
4. Files changed by Ben's commits (names only)
5. Output formatted as `date | author | subject` (short dates)

<details>
<summary>Solution</summary>

```bash
git log --oneline --author="Asha"
git log --oneline --since="2026-02-01" --until="2026-02-28"
git log --oneline --grep="^feat"
git log --author="Ben" --name-only --pretty=format:"%h %s"
git log --pretty=format:"%ad | %an | %s" --date=short
```
</details>

---

## Exercise 2 — Revision Syntax and Ranges

1. Print the full hash of the commit three before `HEAD`.
2. Create a branch `exp` at `HEAD~2`, add one commit there, return to `main`.
3. List what `exp` has that `main` lacks, then the reverse.
4. Show both sides together with markers.
5. Find the newest commit mentioning "README" without knowing its hash.

<details>
<summary>Solution</summary>

```bash
git rev-parse HEAD~3
git switch -c exp HEAD~2
echo "<p>exp</p>" >> index.html && git commit -qam "feat: experiment"
git switch main
git log --oneline main..exp
git log --oneline exp..main
git log --oneline --left-right main...exp
git log --oneline -1 :/README
```
</details>

---

## Exercise 3 — Diff Matrix

Make these changes, then predict which diff command shows each before running it:

```bash
echo "a" >> index.html            # change 1: stage it
git add index.html
echo "b" >> index.html            # change 2: leave unstaged
echo "c" >> styles.css            # change 3: unstaged, other file
```

Which command shows: (a) only change 2 and 3? (b) only change 1? (c) all three?

<details>
<summary>Solution</summary>

(a) `git diff`  (b) `git diff --staged`  (c) `git diff HEAD`

Clean up afterwards: `git restore --staged --worktree --source=HEAD .`
</details>

---

## Exercise 4 — Old Versions

1. Print `index.html` as it was in the very first commit, without changing files.
2. Save the old `contact.html` (from 1 commit before HEAD) into `contact.old.html`.
3. Show only the statistics of the last commit.

<details>
<summary>Solution</summary>

```bash
git show $(git rev-list --max-parents=0 HEAD):index.html
git show HEAD~1:contact.html > contact.old.html
git show --stat HEAD
```
</details>

---

## Exercise 5 — Detective Work

Create `app.js`:

```bash
cat > app.js << 'JS'
function total(items) {
  return items.length;
}
JS
git add . && git commit -q -m "feat: add total helper"
sed -i.bak 's/items.length/items.reduce((s, i) => s + i.price, 0)/' app.js && rm app.js.bak
git commit -qam "fix: total sums prices" --author="Ben Ortiz <ben@example.com>"
```

1. Which commit introduced `reduce`?
2. Who last changed the `return` line?
3. Show the history of the `total` function.
4. Find every `TODO` in the repository (there should be none) and explain why searching with `git grep` beats `grep -r` in a real project.

<details>
<summary>Solution</summary>

```bash
git log -S"reduce" --oneline
git blame -L :total app.js
git log -L :total:app.js
git grep -n "TODO"
```
`git grep` only searches tracked files, so it skips `node_modules`, build output and other junk, and it can search any past revision.
</details>

---

## Exercise 6 — Atomic Commits with Patch Mode

```bash
cat > ui.js << 'JS'
const title = "Shop";
const colour = "red";
const size = 10;
JS
git add . && git commit -q -m "chore: add ui constants"
cat > ui.js << 'JS'
const title = "Online Shop";
const colour = "blue";
const size = 12;
JS
```

Make **three** commits, one per constant, using `git add -p`.

<details>
<summary>Solution</summary>

Because the three changes are on adjacent lines they form a single hunk, so use `e` (edit) or `s` if offered. For each commit:

```bash
git add -p ui.js        # choose only one change (use s, or e to drop the others)
git diff --staged
git commit -m "feat: rename shop title"
```
Repeat for colour and size. Verify with `git log --stat`.
</details>

---

## Exercise 7 — Restore

1. Delete `styles.css` from disk and bring it back.
2. Edit `index.html`, stage it, then unstage it without losing the edit.
3. Discard the edit.
4. Fetch `contact.html` from three commits ago into your working tree, inspect, and discard.

<details>
<summary>Solution</summary>

```bash
rm styles.css && git restore styles.css
echo "x" >> index.html && git add index.html
git restore --staged index.html       # edit still present
git restore index.html                # discarded
git restore --source=HEAD~3 contact.html
git diff
git restore contact.html              # back to index version (= HEAD)
```
</details>

---

## Exercise 8 — Amend

1. Make a commit `fix: typo in navbr` that is missing `.gitignore`.
2. Fix the message and add the file in the same amend.
3. Confirm the hash changed and find the old one in the reflog.

<details>
<summary>Solution</summary>

```bash
echo "node_modules/" > .gitignore
echo "<p>nav</p>" >> index.html
git commit -qam "fix: typo in navbr"
git add .gitignore
git commit --amend -m "fix: typo in navbar" --no-edit  # -m wins; --no-edit also accepted with -m on newer Git
git reflog | head -4
```
</details>

---

## Exercise 9 — Reset Modes

Create 3 commits, then for each mode start from the same state and report where the undone change ends up:

1. `git reset --soft HEAD~1`
2. `git reset HEAD~1`
3. `git reset --hard HEAD~1`

Use `git reset --hard ORIG_HEAD` between experiments.

<details>
<summary>Solution</summary>

1. Staged (`git status -s` → `M `)
2. Unstaged (` M`)
3. Discarded from the index and working tree
</details>

---

## Exercise 10 — Revert

1. Make a bad commit, then undo it **without rewriting history**.
2. Revert the three most recent commits as a **single** revert commit.

<details>
<summary>Solution</summary>

```bash
git revert HEAD --no-edit
git revert -n HEAD~3..HEAD
git commit -m "revert: undo last three changes"
```
</details>

---

## Exercise 11 — Disaster Recovery 🏆

1. `git reset --hard HEAD~3`, then restore everything.
2. Create a branch `feature/x` with a commit, delete it with `-D`, recover it.
3. Make a stash, drop it and recover it.
4. Explain which of these you could **not** have recovered if the changes had never been committed or staged.

<details>
<summary>Solution</summary>

```bash
git reset --hard HEAD~3 && git reflog && git reset --hard HEAD@{1}

git switch -c feature/x && echo x > x.txt && git add . && git commit -qm "feat: x"
git switch main && git branch -D feature/x     # note hash
git branch feature/x <hash>

echo precious >> index.html && git stash && git stash drop   # note hash
git stash apply <hash>
```
Without a commit or `git add`, none of these could be recovered, because Git never stored the content.
</details>

---

## Exercise 12 — Describe, Shortlog, Notes

1. Tag `v1.0.0` on `HEAD~2` (annotated) and `v1.1.0` on `HEAD`.
2. Print a build string with `describe`.
3. Show a contributor summary between the two tags.
4. Attach a note "QA approved" to `v1.1.0` and display it.

<details>
<summary>Solution</summary>

```bash
git tag -a v1.0.0 HEAD~2 -m "first"
git tag -a v1.1.0 -m "second"
git describe --tags --always --dirty
git shortlog -sn v1.0.0..v1.1.0
git notes add -m "QA approved" v1.1.0
git log -1 v1.1.0
```
</details>

---

## 🏆 Challenge — The Messy Afternoon

You have this history problem in a fresh repo:

1. Five commits exist. The third one added a bug (`const rate = 0.5;` should be `0.05`).
2. Your working tree has **three unrelated edits** in one file.
3. You accidentally ran `git reset --hard HEAD~2`.

Tasks:

1. Recover the two lost commits.
2. Find the commit that introduced `0.5` using the pickaxe.
3. Fix it with a **revert**, not a reset (pretend it is pushed).
4. Split the three working-tree edits into three atomic commits using `git add -p`.

**Success criteria:** history shows all original commits, one revert, and three clean new commits; `git reflog` shows how you got back.
