## 02.Git. Local

---

### 1. Initializing a Local Repository

---
- Create a new directory on your local machine.

  ```bash
  mkdir 02.Git.Local
  ```

- Navigate to the newly created directory using the command line.

  ```bash
  cd 02.Git.Local
  ```

- Initialize a new Git repository in this directory.

  ```bash
  git init
  git config user.name "Vitaliy Shvedov"
  git config user.email "patsa_vatsa@tut.by"
  ```

- Create a new file named `README.md` and add some content to it.

  ```bash
  touch README.md
  echo "## 02.Git.Local" >> README.md
  ```

- Stage and commit the `README.md` file to the repository.

  ```bash
  git add README.md
  git commit -m "Add README file to the project"
  ```

### 2. Basic Version Control

---
- Create a new branch named `feature-branch` and switch to it.

  ```bash
  git checkout -b "feature-branch"
  ```

- Edit the `README.md` file to add a brief description of your project.

  ```bash
  echo "- Edit the README file to add a brief description of your project" >> README.md
  ```

- Commit your changes to the `feature-branch`.

  ```bash
  git add README.md
  git commit -m "Add a brief description about the project to the README file"
  ```

- Switch back to the main branch (usually `master` or `main`).

  ```bash
  git checkout master
  ```

- Merge the changes from `feature-branch` into the main branch.

  ```bash
  git merge feature-branch
  ```

### 3. Exploring Git History

---
- Use the `git log` command to view the commit history of your repository.

  ```bash
  git log
  ```

- Identify the commit hashes, dates, and commit messages.

  ```
  commit 4899278900eba0a87f45dfcf1ae3f99ddf409259 (HEAD -> master, feature-branch)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:44:05 2024 +0000

    Add a brief description about the project to the README file

  commit d79b2d6821e9d4c3a81c65be6b811ae76a940d6a
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:04:24 2024 +0000

    Add README file to the project
  ```

- Try using different formatting options for git log to customize the output.

  ```bash
  git log --oneline
  git log --pretty=oneline
  git log --pretty=short
  git log --pretty=full
  git log --pretty=oneline --graph
  git log --pretty=oneline --stat
  ```

- Use `git show <commit-hash>` to view the details of a specific commit.

  ```bash
  git show 4899278900eba0a87f45dfcf1ae3f99ddf409259
  ```

### 4. Creating and Applying Tags

---
- Create a tag named `v1.0` on a specific commit in your repository's history.

  ```bash
  git tag -a v1.0 4899278900eba0a87f45dfcf1ae3f99ddf409259 -m "Version 1.0"
  ```

- Verify that the tag has been created successfully.
  ```bash
  git log 
  ```

  ```
  commit 4899278900eba0a87f45dfcf1ae3f99ddf409259 (HEAD -> master, tag: v1.0, feature-branch)
   Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
   Date:   Thu May 23 06:44:05 2024 +0000

    Add a brief description about the project to the README file

  commit d79b2d6821e9d4c3a81c65be6b811ae76a940d6a
   Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
   Date:   Thu May 23 06:04:24 2024 +0000

    Add README file to the project
  ```

- Make some additional changes to the `README.md` file and commit them.

  ```bash
  echo "- Make some additional changes to the README file and commit them" >> README.md
  ```

  ```bash
  git add README.md
  git commit -m "Make some additional changes to the README"
  ```

- Create a new tag named `v2.0` on the latest commit.

  ```bash
  git tag -a v2.0 -m "Version 2.0"
  ```
  
  ```
  commit 1f5d808c17f6b1f6be8468ddf8c296e834373101 (tag: v2.0)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 07:09:12 2024 +0000

  
      Add Contributing block to the README file
  
  commit 4899278900eba0a87f45dfcf1ae3f99ddf409259 (tag: v1.0)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:44:05 2024 +0000

  
      Add a brief description about the project to the README file
  
  commit d79b2d6821e9d4c3a81c65be6b811ae76a940d6a
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:04:24 2024 +0000

  
      Add README.md file to the project
  ```

- Explore the difference between annotated and lightweight tags.

  > Annotated tags include metadata and tagging messages, while lightweight tags are minimal and point directly to a specific commit.

### 5. Undoing Changes

---
- Create a new branch named `bug-fix` and switch to it.

  ```bash
  git checkout -b bug-fix
  ```

- Make a change to the `README.md` file and commit it.

  ```bash
  echo "First change to task 5" >> README.md
  git add README.md
  git commit -m "First commit to task 5"
  ```

- Make another change and commit it.

  ```bash
  echo "Second change to task 5" >> README.md
  git add README.md
  git commit -m "Second commit to task 5"
  ```

- Use `git reset` to undo the most recent commit while keeping the changes.

  ```bash
  git reset --hard HEAD~
  git reset --hard d01afc5dd85d4cfa6257167ce09882920db6ec47
  git add README.md
  git log git commit -m "README.md - ch-reset-2"
  git commit -m "README.md - ch-reset-2"
  git reset --mixed d01afc5dd85d4cfa6257167ce09882920db6ec47
  ```

- Switch back to the main branch (usually `master` or `main`).

  ```bash
  git checkout master
  ```

- Merge the changes from `bug-fix` into the main branch.

  ```bash
  git merge bug-fix
  ```

- Explore the effects of `git reset` with different options (`soft`, `mixed`, `hard`).

  > Soft: Moves the branch pointer to the specified commit.
    Does not modify the staging area or working directory.
    Leaves changes from the specified commit to the current HEAD in the staging area.

  > Mixed: Moves the branch pointer to the specified commit.
    Resets the staging area to match the specified commit.
    Does not modify the working directory.
  
  > Hard: Moves the branch pointer to the specified commit.
    Resets the staging area to match the specified commit.
    Discards changes in the working directory.

### 6. Stashing Changes

---
- Create a new branch named `experimental-feature` and switch to it.

  ```bash
  git checkout -b experimental-feature
  ```

- Make some changes to the `README.md` file but do not commit them.

  ```bash
  echo "- Make some changes to the README file but do not commit them" >> README.md
  ```

- Use `git stash` to temporarily store your changes.

  ```bash
  git stash
  ```

- Switch to another branch and make a different set of changes.

  ```bash
  git checkout bug-fix
  echo "Changes in task 6 for the feature-branch" >> README.md
  git add README.md
  git commit -m "Commit for the feature branch of task 6"
  git checkout master
  git merge bug-fix
  ```
  
- Apply the changes from the stash to the experimental-feature branch.

  ```bash
  git checkout experimental-feature
  echo "- Make some changes to the README file but do not commit them" >> README.md
  git stash pop
  git add -A
  git commit -m "Stash and commit in experimental feature"
  git checkout master
  git merge experimental-feature
  ```

### 7. Git Aliases and Configuration

---
- Configure your Git username and email globally.

  ```bash
  git config --global user.name "Vitaliy Shvedov"
  git config --global user.email "patsa_vatsa@tut.by"
  ```

- Set up a custom alias for a frequently used Git command.

  ```bash
  git config --global alias.co checkout
  ```

- Use the `git config` command to verify your configuration changes.

  ```bash
  git config --global --edit

  ```

  ```
  [user]
        name = Vitaliy Shvedov
        email = patsa_vatsa@tut.by

  [alias]
        co = checkout
  ```

- Unset up a custom alias for a frequently used Git command.

  ```bash
  git config --global --unset alias.co
  ```

---

## Git commit History

  ```
  commit ab0b6ab24e41b42646bf9017d26268154616b16c (HEAD -> master, experimental-feature)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 07:42:28 2024 +0000

      Stash and commit in experimental feature

  commit d01afc5dd85d4cfa6257167ce09882920db6ec47 (bug-fix)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 07:16:42 2024 +0000

      First commit to task 5

  commit 1f5d808c17f6b1f6be8468ddf8c296e834373101 (tag: v2.0)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 07:09:12 2024 +0000

      Make some additional changes to the README

  commit 4899278900eba0a87f45dfcf1ae3f99ddf409259 (tag: v1.0)
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:44:05 2024 +0000

      Add a brief description about the project to the README file

  commit d79b2d6821e9d4c3a81c65be6b811ae76a940d6a
  Author: Vitaliy Shvedov <patsa_vatsa@tut.by>
  Date:   Thu May 23 06:04:24 2024 +0000


      Add a brief description about the project to the README file

  commit fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 12:29:57 2024 +0300

      Add README.md file to the project
  ```