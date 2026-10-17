# Module 01 Quiz — Git Fundamentals & Setup

15 questions. Choose the best answer, then check the key at the bottom.

---

**1.** Which best describes Git?
- A) A cloud hosting service for code
- B) A distributed version control system
- C) A code editor
- D) A package manager

**2.** In a distributed VCS, each clone contains…
- A) Only the latest files
- B) Only the files you changed
- C) The full repository history
- D) Nothing until you push

**3.** Git stores project data primarily as…
- A) A list of line-by-line differences
- B) Snapshots of the project at each commit
- C) Compressed ZIP archives
- D) Database tables

**4.** What is the staging area also called?
- A) The stash
- B) The index
- C) The reflog
- D) The remote

**5.** A file you edited but never `git add`ed is in which state?
- A) Committed
- B) Staged
- C) Modified
- D) Ignored

**6.** Which configuration level takes precedence?
- A) System
- B) Global
- C) Local
- D) They are all equal

**7.** Which command shows every setting and the file it came from?
- A) `git config --list`
- B) `git config --list --show-origin`
- C) `git help config`
- D) `git status --config`

**8.** `git status -s` prints `MM file.js`. What does this mean?
- A) The file is untracked
- B) The file is staged and also modified again afterwards
- C) A merge conflict exists
- D) The file was renamed

**9.** What does `git diff --staged` compare?
- A) Working tree vs staging area
- B) Staging area vs the last commit
- C) Two branches
- D) Local vs remote

**10.** Which command deletes a tracked file **and** stages the deletion?
- A) `rm file`
- B) `git rm file`
- C) `git rm --cached file`
- D) `git clean file`

**11.** What does `git rm --cached secrets.txt` do?
- A) Deletes the file from disk and from Git
- B) Stops tracking the file but keeps it on disk
- C) Hides the file from `git status` permanently
- D) Moves the file to the stash

**12.** Why run `git clean -n` before `git clean -f`?
- A) `-n` makes it faster
- B) `-n` previews what would be permanently deleted
- C) `-n` is required by Git
- D) `-n` restores deleted files

**13.** Which is the best commit subject?
- A) `Fixed stuff.`
- B) `Updating the cart code`
- C) `Fix cart total ignoring discounts`
- D) `WIP`

**14.** Which Conventional Commit triggers a **MAJOR** version bump?
- A) `fix: typo`
- B) `feat: add search`
- C) `feat!: drop Node 18 support`
- D) `docs: update readme`

**15.** A file was committed, then added to `.gitignore`, yet Git still tracks it. What is the fix?
- A) Delete `.gitignore` and recreate it
- B) `git rm --cached <file>` and commit
- C) `git clean -f`
- D) Nothing can be done

---

<details>
<summary>📋 Answer Key</summary>

| Q | Answer | Why |
|---|---|---|
| 1 | **B** | Git is a distributed VCS; GitHub is the hosting service |
| 2 | **C** | Every clone holds the full history |
| 3 | **B** | Git stores snapshots, linking unchanged files |
| 4 | **B** | The staging area is the index |
| 5 | **C** | Edited but not staged = modified |
| 6 | **C** | Local overrides global, which overrides system |
| 7 | **B** | `--show-origin` adds the source file |
| 8 | **B** | `MM` = staged plus further unstaged edits |
| 9 | **B** | `--staged` compares index vs last commit |
| 10 | **B** | `git rm` deletes and stages the removal |
| 11 | **B** | `--cached` untracks without deleting the file |
| 12 | **B** | `-n` is a dry run; clean deletes permanently |
| 13 | **C** | Specific, imperative, explains the change |
| 14 | **C** | `!` (or `BREAKING CHANGE:`) means a major bump |
| 15 | **B** | `.gitignore` affects only untracked files |

**Scoring:** 13–15 Excellent · 10–12 Good, review the missed lessons · below 10, revisit Lessons 02, 05 and 08.
</details>
