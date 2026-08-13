cat > lesson-07-pull-request.md << 'EOF'
# Lesson 07: Pull Request

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a Pull Request (PR) is and why it exists as a workflow step.
- Walk through the full lifecycle of creating, reviewing, and merging a PR.
- Understand how PRs support code review and team collaboration.

---

# Introduction

This final lesson of Module 08 covers **Pull Requests (PRs)** — a GitHub feature (not a core Git concept itself) that has become the standard way real teams collaborate on code, layering structured review and discussion on top of the merging you learned in the last lesson.

---

# What Is a Pull Request?

A **Pull Request** is a request to merge changes from one branch into another, opened on GitHub, that enables discussion, review, and automated checks *before* the merge actually happens. Despite the name suggesting "pulling," it's really a proposal: "here are my changes on this branch — please review them, then merge them into the target branch."

(GitLab uses the equivalent term "Merge Request" — same concept, different name.)

---

# The Full Pull Request Lifecycle

1. **Create a branch** and make your changes, committing as you go (Lessons 04–05).
2. **Push the branch** to GitHub:
```bash
   git push origin feature/dark-mode
```
3. **Open a Pull Request** on GitHub, comparing your branch against the target branch (usually `main`), with a title and description explaining the change.
4. **Review** — collaborators can comment on specific lines, request changes, or approve the PR.
5. **Automated checks** (if configured) — tests, linting, or build processes run automatically against the proposed changes.
6. **Address feedback** — push additional commits to the same branch; they automatically appear in the same PR.
7. **Merge** — once approved, the PR is merged into the target branch (using the same merge concepts from Lesson 06, just performed through GitHub's interface).
8. **Delete the branch** — commonly done after merging, since its work is now part of the main branch's history.

---

# Why Pull Requests Matter

- **Code review** — a second set of eyes catches bugs, suggests improvements, and spreads knowledge of the codebase across a team.
- **Discussion trail** — the reasoning behind a change is preserved alongside the code itself, valuable for future reference.
- **Quality gate** — automated checks (tests, linting) can block a PR from merging until they pass, protecting the main branch's stability.
- **Even for solo projects** — many solo developers still use PRs against their own repos, as a way to review their own work with fresh eyes before merging, and to keep a clean historical record of features.

---

# Practical Example

```bash
git checkout -b feature/quiz-improvements
# ...make changes, commit...
git push origin feature/quiz-improvements
# Then on GitHub: click "Compare & pull request" → add title/description → Create Pull Request
# After review/approval: click "Merge pull request" on GitHub
```

---

# Revision Questions

1. What is a Pull Request, and how does it relate to merging?
2. What does GitLab call the equivalent feature?
3. Name two benefits of using Pull Requests, even on a solo project.

<details><summary>Answers</summary>

1. A request to merge changes from one branch into another, opened on GitHub, enabling review and discussion before the actual merge happens.
2. Merge Request.
3. Any two of: reviewing your own work with fresh eyes before merging, keeping a clean historical record with documented reasoning, and (if configured) running automated checks before allowing the merge.

</details>

---

# 🏁 Module 08 Checkpoint

Before moving to Module 09, you should be able to:
- [ ] Explain the difference between Git and GitHub clearly
- [ ] Understand what a repository and the `.git` folder actually are
- [ ] Make deliberate, well-described commits using the staging area
- [ ] Create, switch between, and merge branches confidently
- [ ] Resolve a basic merge conflict
- [ ] Walk through the full Pull Request lifecycle

**Next up:** Module 09 — Problem Solving
EOF