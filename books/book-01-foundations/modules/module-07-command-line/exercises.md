cat > exercises.md << 'EOF'
# Exercise Set — Command Line

## Easy
- [ ] Navigate to your home directory, then back to the previous directory you were in, using only `cd`.
- [ ] Create a file called `notes.txt` and write "Hello World" into it using `echo`.
- [ ] Create a nested folder structure `project/src/components` using a single `mkdir` command.
- [ ] Use `grep` to search for the word "TODO" in a single file.

---

## Medium
- [ ] Create a folder, copy it to a backup folder using one command, then delete the original using `rm -r`.
- [ ] Use `find` to locate every `.md` file in your `dev-atlas` repository.
- [ ] Given a file with permissions `-rw-r--r--`, write the `chmod` command to make it executable for the owner only.
- [ ] Initialize a new npm project and install `express` as a dependency and `nodemon` as a dev dependency.

---

## Hard
- [ ] Use `grep -r` combined with `--include` to search only `.js` files in a project for the word "console.log".
- [ ] Explain, step by step, what would happen if you ran `rm -rf ./` from inside the wrong folder, and why this command is considered dangerous.
- [ ] Convert the permission string `rwxrw-r--` into its numeric equivalent, showing your calculation.
- [ ] Explain the difference between `npm install` (no arguments) and `npm install <package-name>`.

---

## Bonus
- [ ] Research and explain what `xargs` does, and rewrite the example `find . -name "*.js" | xargs grep -l "useState"` in your own words.
EOF