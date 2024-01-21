## 02.Git

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
  git config user.name "Danila Borovskiy"
  git config user.email "borovski.danila00@gmail.com"
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
  echo "Welcome to my first Git project! This repository serves as a starting point for my journey into version control and collaboration." >> README.md
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
  commit 1465d39de2ed1a264adc263b0e28234094ddd479 (HEAD -> master, feature-branch)
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 13:22:06 2024 +0300
  
      Add a brief description about the project to the README file
  
  commit fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 12:29:57 2024 +0300

    Add README.md file to the project
  ```

- Try using different formatting options for git log to customize the output.

  ```bash
  git log --pretty=oneline
  git log --pretty=short
  git log --pretty=full
  git log --pretty=fuller
  git log --pretty=format:"%h - %an, %ar : %s"
  git log --pretty=oneline --graph
  git log --pretty=oneline --stat
  ```

- Use `git show <commit-hash>` to view the details of a specific commit.

  ```bash
  git show fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
  ```

### 4. Creating and Applying Tags

---
- Create a tag named `v1.0` on a specific commit in your repository's history.

  ```bash
  git tag -a v1.0 1465d39de2ed1a264adc263b0e28234094ddd479 -m "Version 1.0"
  ```

- Verify that the tag has been created successfully.
  ```bash
  git log 
  ```

  ```
  commit 1465d39de2ed1a264adc263b0e28234094ddd479 (HEAD -> master, tag: v1.0, feature-branch)
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 13:22:06 2024 +0300
  
      Add a brief description about the project to the README file
  
  commit fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 12:29:57 2024 +0300
  
      Add README.md file to the project
  ```

- Make some additional changes to the `README.md` file and commit them.

  ```bash
  echo "" >> README.md
  echo "### Contributing" >> README.md
  echo "" >> README.md
  echo "If you are interested in contributing or have suggestions for improvement, please fork the repository and create a pull request." >> README.md
  ```

  ```bash
  git add README.md
  git commit -m "Add Contributing block to the README file"
  ```

- Create a new tag named `v2.0` on the latest commit.

  ```bash
  git tag -a v2.0 -m "Version 2.0"
  ```
  
  ```
  commit 5d579edf9ac6d8bc18ea7f2ef7ac520db39a6de5 (HEAD -> master, tag: v2.0)
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 14:13:34 2024 +0300
  
      Add Contributing block to the README file
  
  commit 1465d39de2ed1a264adc263b0e28234094ddd479 (tag: v1.0, feature-branch)
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 13:22:06 2024 +0300
  
      Add a brief description about the project to the README file
  
  commit fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
  Author: Danila Borovskiy <borovski.danila00@gmail.com>
  Date:   Sat Jan 20 12:29:57 2024 +0300
  
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
  echo "" >> README.md
  echo "## License" >> README.md
  echo "This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details." >> README.md
  ```

  ```bash
  git add README.md
  git commit -m "Add License block to the README.md file"
  ```

- Make another change and commit it.

  ```bash
  echo "" >> README.md
  echo "## License" >> README.md
  echo "This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details." >> README.md
  ```

  ```bash
  git add README.md
  git commit -m "Add License block to the README.md file"
  ```

- Use `git reset` to undo the most recent commit while keeping the changes.

  ```bash
  git reset --hard HEAD~
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
  echo "" >> README.md
  echo "Good Bye" >> README.md
  ```

- Use `git stash` to temporarily store your changes.

  ```bash
  git stash
  ```

- Switch to another branch and make a different set of changes.

  ```bash
  git checkout master
  git checkout -b another-experimental-feature
  ```

  ```bash
  echo "" >> README.md
  echo "Happy coding! 🚀✨" >> README.md
  ```

  ```bash
  git add README.md
  git commit -m "Add Happy codding text to the README.md file"
  ```

  ```bash
  git checkout master
  git merge another-experimental-feature
  ```
  
- Apply the changes from the stash to the experimental-feature branch.

  ```bash
  git checkout experimental-feature
  git rebase master
  git stash apply
  ```

  ```bash
  #Resolve conflicts
  nano README.md
  ```

  ```bash
  git add README.md
  git commit -m "Add Good Bye text to the README.md file"
  ```

  ```bash
  git checkout master
  git merge experimental-feature
  ```

### 7. Git Aliases and Configuration

---
- Configure your Git username and email globally.

  ```bash
  git config --global user.name "Danila Borovskiy"
  git config --global user.email "borovski.danila00@gmail.com"
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
    name = Danila Borovskiy
    email = borovski.danila00@gmail.com
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
commit 010158a4d5ef0f91d9dbe1a11fb58700a36abc56 (HEAD -> master, experimental-feature)
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 20:01:48 2024 +0300

    Add Good Bye text to the README.md file

commit c48b2a10632208c7a35395d223a1cc04b475131b (another-experimental-feature)
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 19:57:16 2024 +0300

    Add Happy codding text to the README.md file

commit c314e3192c76d39700042a39e224a1742e0a9562 (bug-fix)
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 15:10:19 2024 +0300

    Add License block to the README.md file

commit 5d579edf9ac6d8bc18ea7f2ef7ac520db39a6de5 (tag: v2.0)
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 14:13:34 2024 +0300

    Add Contributing block to the README file

commit 1465d39de2ed1a264adc263b0e28234094ddd479 (tag: v1.0, feature-branch)
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 13:22:06 2024 +0300

    Add a brief description about the project to the README file

commit fe7052fa546ef4a39db4f8a3b38921eb36ed32c9
Author: Danila Borovskiy <borovski.danila00@gmail.com>
Date:   Sat Jan 20 12:29:57 2024 +0300

    Add README.md file to the project
```
