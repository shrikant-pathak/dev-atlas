# 📄 Cheat Sheet — Command Line

## Navigation

| Command | Effect |
|---|---|
| `pwd` | Show current directory |
| `cd folder` | Move into a folder |
| `cd ..` | Move up one level |
| `cd ~` | Go to home directory |
| `cd -` | Go to previous directory |

## Files

| Command | Effect |
|---|---|
| `touch file.txt` | Create an empty file |
| `cat file.txt` | Print file contents |
| `echo "text" > file.txt` | Write to a file (overwrite) |
| `echo "text" >> file.txt` | Append to a file |
| `cp source dest` | Copy a file |
| `mv source dest` | Move or rename a file |
| `rm file.txt` | Delete a file |

## Directories

| Command | Effect |
|---|---|
| `mkdir folder` | Create a directory |
| `mkdir -p a/b/c` | Create nested directories |
| `cp -r source dest` | Copy a directory recursively |
| `rmdir folder` | Delete an EMPTY directory |
| `rm -r folder` | Delete a directory and its contents |
| `rm -rf folder` | Force-delete, no confirmation (⚠️ dangerous) |

## Search

| Command | Effect |
|---|---|
| `find . -name "*.js"` | Find files by name pattern |
| `grep "text" file` | Search for text in a file |
| `grep -r "text" .` | Search recursively |
| `grep -rn "text" .` | Search recursively with line numbers |

## Permissions

| Symbol | Numeric | Meaning |
|---|---|---|
| `r` | 4 | Read |
| `w` | 2 | Write |
| `x` | 1 | Execute |
| `rwxr-xr-x` | 755 | Owner: all, Group/Others: read+execute |

| Command | Effect |
|---|---|
| `chmod 755 file` | Set permissions numerically |
| `chmod +x file` | Add execute permission |
| `chown user file` | Change file owner |

## Package Managers (npm)

| Command | Effect |
|---|---|
| `npm init` | Start a new project |
| `npm install pkg` | Install a dependency |
| `npm install --save-dev pkg` | Install a dev-only dependency |
| `npm install -g pkg` | Install globally |
| `npm uninstall pkg` | Remove a dependency |
| `npm update` | Update dependencies |
