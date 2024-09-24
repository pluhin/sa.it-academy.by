02.GIT.Local
=====================
Homework Assignment 1: Initializing a Local Repository
-----------------------------------
1. Create a new directory on your local machine.

        mkdir homework


2. Navigate to the newly created directory using the command line.

        cd homework/

3. Initialize a new Git repository in this directory.

        git init

4. Create a new file named README.md and add some content to it.

       touch README.md
       echo 'Content' >> README.md

5. Stage and commit the README.md file to the repository.

        git add --all
        git commit -m "Init commit"

Homework Assignment 2: Basic Version Control
-----------------------------------
1. Create a new branch named feature-branch.

        git branch -b feature-branch

2. Edit the README.md file to add a brief description of your project.

        echo 'Descripton of project' >> README.md

3. Commit your changes to the feature-branch.

        git add --all
        git commit -m "Feature branch"

4. Switch back to the main branch (usually master or main).

        git checkout master

5. Merge the changes from feature-branch into the main branch.

        git merge future-branch

          Updating 1aeb1f8..3d750ab
          Fast-forward
           README.md | 1 +
           1 file changed, 1 insertion(+)




Homework Assignment 3: Exploring Git History
-----------------------------------
1. Use the git log command to view the commit history of your repository.

        git log

          commit 3d750abcddcb40479845f4f8191fb9f322dd72ab (HEAD -> master, feature-branch)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 13:59:53 2024 +0300
  
           Feature branch
  
          commit 1aeb1f8f82a9efac3aafb7e7b4505bb3f9e6d526 (HEAD -> master)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 13:52:30 2024 +0300
  
           Init commit

2. Identify the commit hashes, dates, and commit messages.

        git log --binary

          commit 3d750abcddcb40479845f4f8191fb9f322dd72ab (tag: v1.0)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 13:59:53 2024 +0300
          
              Feature branch
          diff --git a/README.md b/README.md
          index 39c9f36..94bbe7b 100644
          --- a/README.md
          +++ b/README.md
          @@ -1 +1,2 @@
          
           Content
          +Descripton of project
          
          commit 1aeb1f8f82a9efac3aafb7e7b4505bb3f9e6d526
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 13:52:30 2024 +0300
          
          
              Init commit
          diff --git a/README.md b/README.md
          new file mode 100644
          index 0000000..39c9f36
          --- /dev/null
          +++ b/README.md
          @@ -0,0 +1 @@
          +Content


3. Try using different formatting options for git log to customize the output.

        git log --oneline
        
          3d750ab (HEAD -> master, feature-branch) Feature branch
          1aeb1f8 Init commit

        git log --format=full

          commit 3d750abcddcb40479845f4f8191fb9f322dd72ab (HEAD -> master, feature-branch)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Commit: Victor Trush <victorhilinsky@gmail.com>
  
              Feature branch
  
          commit 1aeb1f8f82a9efac3aafb7e7b4505bb3f9e6d526
          Author: Victor Trush <victorhilinsky@gmail.com>
          Commit: Victor Trush <victorhilinsky@gmail.com>
  
              Init commit
  
          git log --format=fuller
          commit 3d750abcddcb40479845f4f8191fb9f322dd72ab (HEAD -> master, feature-branch)
          Author:     Victor Trush <victorhilinsky@gmail.com>
          AuthorDate: Tue Sep 24 13:59:53 2024 +0300
          Commit:     Victor Trush <victorhilinsky@gmail.com>
          CommitDate: Tue Sep 24 13:59:53 2024 +0300
  
              Feature branch
  
          commit 1aeb1f8f82a9efac3aafb7e7b4505bb3f9e6d526
          Author:     Victor Trush <victorhilinsky@gmail.com>
          AuthorDate: Tue Sep 24 13:52:30 2024 +0300
          Commit:     Victor Trush <victorhilinsky@gmail.com>
          CommitDate: Tue Sep 24 13:52:30 2024 +0300
  
              Init commit

4. Use git show <commit-hash> to view the details of a specific commit.

        git show 1aeb1f8

          commit 1aeb1f8f82a9efac3aafb7e7b4505bb3f9e6d526
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 13:52:30 2024 +0300
  
              Init commit
  
          diff --git a/README.md b/README.md
          new file mode 100644
          index 0000000..39c9f36
          --- /dev/null
          +++ b/README.md
          @@ -0,0 +1 @@
          +Content

Homework Assignment 4: Creating and Applying Tags
-----------------------------------
1. Create a tag named v1.0 on a specific commit in your repository's history.

        git tag -a v1.0 -m "Release 1.0"

2. Verify that the tag has been created successfully.

        git log --oneline

          3d750ab (HEAD -> master, tag: v1.0, feature-branch) Feature branch
          1aeb1f8 Init commit


3. Make some additional changes to the README.md file and commit them.

        echo 'tag v2.0' >> README.md
        git add --all
        git commit -m "Create tag v2.0"

4. Create a new tag named v2.0 on the latest commit.

        git tag -a v2.0 430d326 -m "Release 2.0"

        git log --oneline

          430d326 (HEAD -> feature-branch, tag: v2.0) Create tag v2.0
          3d750ab (tag: v1.0, master) Feature branch
          1aeb1f8 Init commit

5. Explore the difference between annotated and lightweight tags.

        git tag v2.0-lw

        git tag
         
          v1.0
          v2.0
          v2.0-lw

        git show v2.0

          tag v2.0
          Tagger: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 14:20:25 2024 +0300
          
          Release 2.0
          
          commit 430d32695f3181164ec811e52e52cf12eea7a8e8 (tag: v2.0)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 14:19:05 2024 +0300
          
              Create tag v2.0
          
          diff --git a/README.md b/README.md
          index 94bbe7b..552ebea 100644
          --- a/README.md
          +++ b/README.md
          @@ -1,2 +1,4 @@
           Content
           Description of project
          +tag v2.0
          +

        git show v2.0-lw

          commit 430d32695f3181164ec811e52e52cf12eea7a8e8 (HEAD -> master, tag: v2.0-lw, tag: v2.0, feature-branch)
          Author: Victor Trush <victorhilinsky@gmail.com>
          Date:   Tue Sep 24 14:19:05 2024 +0300
          
              Create tag v2.0
          
          diff --git a/README.md b/README.md
          index 94bbe7b..552ebea 100644
          --- a/README.md
          +++ b/README.md
          @@ -1,2 +1,4 @@
           Content
           Description of project
          +tag v2.0
          +

        Annotated tags store extra meta data such as: the tagger 
        name, email, and date. This is important data for a public
        release. Lightweight tags are essentially 'bookmarks' to a
        commit, they are just a name and a pointer to a commit,
        useful for creating quick links to relevant commits.

Homework Assignment 5: Undoing Changes
-----------------------------------
1. Create a new branch named bug-fix.

        git checkout -b bug-fix

2. Make a change to the README.md file and commit it.

        echo 'bug-fix' >> README.md
        git add --all
        git commit -m "Bug-fix branch"

3. Make another change and commit it.

        echo 'bug-fix-second' >> README.md
        git add --all
        git commit -m "Bug-fix-second"

        git log --oneline

          a82462c (HEAD -> bug-fix) Bug-fix-second
          dcc14c6 Bug-fix branch
          430d326 (tag: v2.0-lw, tag: v2.0, master, feature-branch) Create tag v2.0
          3d750ab (tag: v1.0) Feature branch
          1aeb1f8 Init commit

4. Use git reset to undo the most recent commit while keeping the changes.

        git reset

5. Explore the effects of git reset with different options (soft, mixed, hard).

  * git reset --hard

        echo 'new file content' > file1.txt
        echo 'bug-fix-third' >> README.md

        git status

          On branch bug-fix
          Changes not staged for commit:
            (use "git add <file>..." to update what will be committed)
            (use "git restore <file>..." to discard changes in working directory)
                  modified:   README.md
          
          Untracked files:
            (use "git add <file>..." to include in what will be committed)
                  file1.txt
          
          no changes added to commit (use "git add" and/or "git commit -a")

        git add README.md

        git status

          On branch bug-fix
          Changes to be committed:
            (use "git restore --staged <file>..." to unstage)
                  modified:   README.md
          
          Untracked files:
            (use "git add <file>..." to include in what will be committed)
                  file1.txt

        git ls-files -s
         100644 77b37579860c0987cc18eed281202696e9d4032c 0       README.md

        git add file1.txt

        git ls-files -s
         100644 77b37579860c0987cc18eed281202696e9d4032c 0       README.md
         100644 8e66654a5477b1bf4765946147c49509a431f963 0       file1.txt

        git reset --hard
          HEAD is now at a82462c Bug-fix-second

        git ls-files -s
          100644 8cdae6b8aa73f0373796bd2161c61ed6ee06d3e0 0       README.md

        Here we have executed a "hard reset" using the --hard option.
        Git displays output indicating that HEAD is pointing to the
        latest commit. Next, we check the state of the repo with
        git status. Git indicates there are no pending changes. 
        We also examine the state of the Staging Index and see that
        it has been reset to a point before new_file was added. 
        Our modifications to README.md and the addition of file1.txt
        have been destroyed. 

  * git reset --mixed

        echo 'new file content' > new_file
        echo 'bug-fix-third' >> README.md
        git add --all

        git status

          On branch bug-fix
          Changes to be committed:
            (use "git restore --staged <file>..." to unstage)
                  modified:   README.md
                  new file:   new_file

        git ls-files -s

          100644 77b37579860c0987cc18eed281202696e9d4032c 0       README.md
          100644 8e66654a5477b1bf4765946147c49509a431f963 0       new_file

        git reset --mixed
          Unstaged changes after reset:
          M       README.md

        git status

          On branch bug-fix
          Changes not staged for commit:
            (use "git add <file>..." to update what will be committed)
            (use "git restore <file>..." to discard changes in working directory)
                  modified:   README.md
          
          Untracked files:
            (use "git add <file>..." to include in what will be committed)
                  new_file
          
          no changes added to commit (use "git add" and/or "git commit -a")

        git ls-files -s
          100644 8cdae6b8aa73f0373796bd2161c61ed6ee06d3e0 0       README.md
        
        ls -la
          total 6
          drwxr-xr-x 1 Administrator 197121  0 Sep 24 15:02 ./
          drwxr-xr-x 1 Administrator 197121  0 Sep 24 13:44 ../
          drwxr-xr-x 1 Administrator 197121  0 Sep 24 15:04 .git/
          -rw-r--r-- 1 Administrator 197121 74 Sep 24 15:02 README.md
          -rw-r--r-- 1 Administrator 197121 17 Sep 24 15:02 new_file

        

        Here we have executed a "mixed reset". Examining the output
        from git status and git ls-files, shows that the Staging
        Index has been reset to a state where README.md is the only
        file in the index. The object SHA for README.md has been
        reset to the previous version.
        Also git status shows us that there are modifications to
        README.md and there is an untracked file: new_file. This is
        the explicit --mixed behavior. The Staging Index has been
        reset and the pending changes have been moved into the 
        Working Directory. Compare this to the --hard reset case
        where the Staging Index was reset and the Working
        Directory was reset as well, losing these updates.


  * git reset --soft

        git add README.md
        rm new_file

        git status
          On branch bug-fix
          Changes to be committed:
            (use "git restore --staged <file>..." to unstage)
                  modified:   README.md

        git ls-files -s
          100644 77b37579860c0987cc18eed281202696e9d4032c 0       README.md

        git commit -m "Prepend bug-fix-third to soft reset"

          [bug-fix 4876525] Prepend bug-fix-third to soft reset
           1 file changed, 1 insertion(+)

         git log --oneline

          4876525 (HEAD -> bug-fix) Prepend bug-fix-third to soft reset
          a82462c Bug-fix-second
          dcc14c6 Bug-fix branch
          430d326 (tag: v2.0-lw, tag: v2.0, master, feature-branch) Create tag v2.0
          3d750ab (tag: v1.0) Feature branch
          1aeb1f8 Init commit

        git reset --soft dcc14c6

        git log --oneline
          dcc14c6 (HEAD -> bug-fix) Bug-fix branch
          430d326 (tag: v2.0-lw, tag: v2.0, master, feature-branch) Create tag v2.0
          3d750ab (tag: v1.0) Feature branch
          1aeb1f8 Init commit

        Our previous examples with --hard and --mixed have both been 
        against the HEAD and have not moved the Commit Tree back in 
        time. During a soft reset, this is all that happens. --soft 
        does not touch the Staging Index, so the updates to our 
        Staging Index followed us back in time through the commit 
        history.

Homework Assignment 6: Stashing Changes
-----------------------------------
1. Create a new branch named experimental-feature.

        git checkout -b experimental-feature

2. Make some changes to the README.md file but do not commit them.

        echo 'experimental-content' > README.md

3. Use git stash to temporarily store your changes.

        git stash
          Saved working directory and index state WIP on experimental-feature: 430d326 Create tag v2.0

        git status
          On branch experimental-feature
          nothing to commit, working tree clean

        git stash list
          stash@{0}: WIP on experimental-feature: 430d326 Create tag v2.0

4. Switch to another branch and make a different set of changes.

        git checkout feature-branch

        echo 'feature-branch experimental-content' > README.md

        git add --all

        git commit -m "Experimental content for feature branch"

          [feature-branch e88413e] Experimental content for feature branch
           1 file changed, 1 insertion(+), 1 deletion(-)

        git log --oneline

          430d326 (HEAD -> master, tag: v2.0-lw, tag: v2.0, experimental-feature) Create tag v2.0
          3d750ab (tag: v1.0) Feature branch
          1aeb1f8 Init commit

5. Apply the changes from the stash to the experimental-feature branch.

        git checkout experimental-feature

        git stash apply
          On branch experimental-feature
          Changes not staged for commit:
            (use "git add <file>..." to update what will be committed)
            (use "git restore <file>..." to discard changes in working directory)
                  modified:   README.md
          
          no changes added to commit (use "git add" and/or "git commit -a")

        cat README.md
          Content
          Description of project
          tag v2.0
          experimantal content

Homework Assignment 7: Git Aliases and Configuration
-----------------------------------
1. Configure your Git username and email globally.

        git config --global user.name "Victor Trush"

        git config --global user.email "victorhilinsky@gmail.com"


2. Set up a custom alias for a frequently used Git command.

        git config --global alias.co checkout

        git config --global alias.br branch

        git config --global alias.ci commit

        git config --global alias.st status

        cat ~/.gitconfig

          [core]
                  editor = \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Microsoft VS Code\\bin\\code\" --wait
          [init]
                  defaultBranch = master
          [user]
                  name = Victor Trush
                  email = victorhilinsky@gmail.com
          [alias]
                  co = checkout
                  br = branch
                  ci = commit
                  st = status

3. Use the git config command to verify your configuration changes.

        git st
          On branch master
          Changes not staged for commit:
            (use "git add <file>..." to update what will be committed)
            (use "git restore <file>..." to discard changes in working directory)
                  modified:   README.md
          
          no changes added to commit (use "git add" and/or "git commit -a")


