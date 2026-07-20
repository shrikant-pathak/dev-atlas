#!/bin/bash

echo "🚀 Setting up DevAtlas..."

# Root folders
mkdir -p .github/ISSUE_TEMPLATE
mkdir -p .github/workflows

mkdir -p assets/images
mkdir -p assets/diagrams
mkdir -p assets/icons

mkdir -p books/book-01-foundations
mkdir -p books/book-02-javascript
mkdir -p books/book-03-frontend
mkdir -p books/book-04-backend
mkdir -p books/book-05-devops
mkdir -p books/book-06-career

mkdir -p exercises
mkdir -p projects
mkdir -p cheatsheets
mkdir -p quizzes
mkdir -p interview
mkdir -p templates
mkdir -p resources

# Root files
touch ROADMAP.md
touch CHANGELOG.md
touch CONTRIBUTING.md
touch .gitignore

# First handbook chapter
touch books/book-01-foundations/01-computer-fundamentals.md

echo "✅ DevAtlas folder structure created successfully!"