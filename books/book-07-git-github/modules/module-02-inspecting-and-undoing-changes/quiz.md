# Module 02 Quiz — Inspecting & Undoing Changes

15 questions. Choose the best answer, then check the key at the bottom.

---

**1.** What does `git log main..feature` show?
- A) Commits in `main` not in `feature`
- B) Commits in `feature` not in `main`
- C) Commits in either branch but not both
- D) Commits in both branches

**2.** Which refers to the **second parent** of a merge commit?
- A) `HEAD~2`
- B) `HEAD@{2}`
- C) `HEAD^2`
- D) `HEAD--2`

**3.** What does `git diff` (no arguments) compare?
- A) Working tree vs index
- B) Index vs HEAD
- C) HEAD vs remote
- D) Two branches

**4.** Which command shows a file as it was three commits ago, without changing anything?
- A) `git checkout HEAD~3 file`
- B) `git show HEAD~3:file`
- C) `git restore file`
- D) `git blame HEAD~3`

**5.** Which tool finds the commit that **added or removed** the text `retryCount`?
- A) `git grep retryCount`
- B) `git log -S"retryCount"`
- C) `git blame retryCount`
- D) `git describe retryCount`

**6.** In `git add -p`, which key splits a hunk into smaller hunks?
- A) `e`
- B) `q`
- C) `s`
- D) `d`

**7.** How do you stage part of a **brand-new** file with patch mode?
- A) `git add -p` works directly
- B) `git add -N file` first, then `git add -p file`
- C) Commit it first
- D) It is not possible

**8.** Which command unstages `app.js` but keeps your edits?
- A) `git restore app.js`
- B) `git restore --staged app.js`
- C) `git reset --hard app.js`
- D) `git clean app.js`

**9.** What happens to the hash of a commit when you `--amend` it?
- A) It stays the same
- B) It changes because a new commit is created
- C) It is deleted
- D) It becomes `ORIG_HEAD`

**10.** After `git reset --soft HEAD~1`, where are the undone changes?
- A) Staged
- B) Unstaged in the working tree
- C) Discarded
- D) In the stash

**11.** Which is safe to use on a commit that is already pushed to a shared branch?
- A) `git reset --hard`
- B) `git commit --amend`
- C) `git revert`
- D) `git reflog expire`

**12.** Reverting a merge commit requires which option?
- A) `--force`
- B) `-m <parent-number>`
- C) `--hard`
- D) `--merge-base`

**13.** You ran `git reset --hard HEAD~2` by accident. What is the first thing to try?
- A) Reinstall Git
- B) `git reflog`, then `git reset --hard HEAD@{1}`
- C) `git clean -fd`
- D) Re-clone the repository

**14.** Which of these can the reflog **not** recover?
- A) A deleted branch's commits
- B) Commits removed by `reset --hard`
- C) Edits that were never staged or committed
- D) A commit before an amend

**15.** What does `v2.1.0-14-g3f2a9c1` from `git describe` mean?
- A) 14 branches exist
- B) The nearest tag is v2.1.0 and HEAD is 14 commits after it
- C) 14 authors contributed
- D) The tag was created 14 days ago

---

<details>
<summary>📋 Answer Key</summary>

| Q | Answer | Why |
|---|---|---|
| 1 | **B** | `A..B` = reachable from B but not A |
| 2 | **C** | `^N` selects the N-th parent; `~N` goes back N first-parent generations |
| 3 | **A** | Unstaged changes: working tree vs index |
| 4 | **B** | `git show <rev>:<path>` prints a file at that revision |
| 5 | **B** | The pickaxe `-S` finds when the occurrence count changed |
| 6 | **C** | `s` splits; `e` edits manually |
| 7 | **B** | `git add -N` registers intent to add, enabling patch mode |
| 8 | **B** | `--staged` restores the index from HEAD and leaves the working tree alone |
| 9 | **B** | Amending creates a replacement commit with a new hash |
| 10 | **A** | `--soft` leaves the index untouched, so the changes are staged |
| 11 | **C** | `revert` adds a new commit and does not rewrite history |
| 12 | **B** | `-m 1` picks the parent to keep |
| 13 | **B** | The reflog records the previous position of HEAD |
| 14 | **C** | Git never stored never-staged edits |
| 15 | **B** | Nearest tag, commits since, and the abbreviated hash |

**Scoring:** 13–15 Excellent · 10–12 Good, review the missed lessons · below 10, revisit Lessons 01, 05, 07 and 08.
</details>
