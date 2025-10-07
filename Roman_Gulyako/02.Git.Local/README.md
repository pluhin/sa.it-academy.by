## Homework Assignment 1: Initializing a Local Repository
```bash
mkdir -p Roman_Gulyako/02.Git.Local
cd Roman_Gulyako/02.Git.Local
git init
echo "Homework Assignment 1" > README.md
git add --all
git commit -m "Complete homework assignment 1"
```

## Homework Assignment 2: Basic Version Control
```bash
git checkout -b feature-branch
echo "Some description of my project" >> README.md
git add --all
git commit -m "Add description of project"
git checkout main
git merge feature-branch
```