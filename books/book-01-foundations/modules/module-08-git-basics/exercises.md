cat > exercises.md << 'EOF'
# Exercise Set — Git Basics

## Easy
- [ ] Initialize a new Git repository in an empty test folder.
- [ ] Create a file, stage it, and commit it with a clear commit message.
- [ ] Create a new branch called `test-branch` and switch to it.
- [ ] Explain, in your own words, the difference between Git and GitHub.

---

## Medium
- [ ] Create a branch, make a commit on it, switch back to `main`, and merge the branch in.
- [ ] Explain the difference between a fast-forward merge and a three-way merge.
- [ ] Stage only one of two modified files and commit just that one, leaving the other file's changes unstaged.
- [ ] Push a local repository to a new, empty GitHub repository for the first time (including `git remote add origin`).

---

## Hard
- [ ] Intentionally create a merge conflict (modify the same line on two branches), then resolve it manually.
- [ ] Write three example commit messages: one poor, one good, explaining what makes the good one better.
- [ ] Walk through the full Pull Request lifecycle from creating a branch to merging on GitHub, step by step.
- [ ] Explain what happens to your local repository's history if you delete the `.git` folder, versus deleting the project's regular files.

---

## Bonus
- [ ] Research and explain the difference between `git merge` and `git rebase` — when might a team prefer one over the other?
EOF