## Repo 

[04.GitOps](https://github.com/DariaLeskavets/04.GitOps.git)

## Link to file

[main.yaml](https://github.com/DariaLeskavets/sa.it-academy.by/blob/md-sa2-20-22/Daria_Leskavets/04.GitOps/main.yaml)

## log

```
Run actions/checkout@v3
  with:
    repository: DariaLeskavets/04.GitOps
    token: ***
    ssh-strict: true
    persist-credentials: true
    clean: true
    fetch-depth: 1
    lfs: false
    submodules: false
    set-safe-directory: true
Syncing repository: DariaLeskavets/04.GitOps
Getting Git version info
  Working directory is '/home/runner/work/04.GitOps/04.GitOps'
  /usr/bin/git version
  git version 2.36.0
Temporarily overriding HOME='/home/runner/work/_temp/98e2af5f-3849-448c-9c73-4730e1128a98' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
Initializing the repository
  /usr/bin/git init /home/runner/work/04.GitOps/04.GitOps
  hint: Using 'master' as the name for the initial branch. This default branch name
  hint: is subject to change. To configure the initial branch name to use in all
  hint: of your new repositories, which will suppress this warning, call:
  hint: 
  hint: 	git config --global init.defaultBranch <name>
  hint: 
  hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
  hint: 'development'. The just-created branch can be renamed via this command:
  hint: 
  hint: 	git branch -m <name>
  Initialized empty Git repository in /home/runner/work/04.GitOps/04.GitOps/.git/
  /usr/bin/git remote add origin https://github.com/DariaLeskavets/04.GitOps
Disabling automatic garbage collection
  /usr/bin/git config --local gc.auto 0
Setting up auth
  /usr/bin/git config --local --name-only --get-regexp core\.sshCommand
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
  /usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
  /usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
Fetching the repository
  /usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +82fa9ec3fb061e1df5190d86f7b7ae41d730e424:refs/remotes/origin/main
  remote: Enumerating objects: 7, done.        
  remote: Counting objects:  14% (1/7)        
  remote: Counting objects:  28% (2/7)        
  remote: Counting objects:  42% (3/7)        
  remote: Counting objects:  57% (4/7)        
  remote: Counting objects:  71% (5/7)        
  remote: Counting objects:  85% (6/7)        
  remote: Counting objects: 100% (7/7)        
  remote: Counting objects: 100% (7/7), done.        
  remote: Compressing objects:  33% (1/3)        
  remote: Compressing objects:  66% (2/3)        
  remote: Compressing objects: 100% (3/3)        
  remote: Compressing objects: 100% (3/3), done.        
  remote: Total 7 (delta 0), reused 6 (delta 0), pack-reused 0        
  From https://github.com/DariaLeskavets/04.GitOps
   * [new ref]         82fa9ec3fb061e1df5190d86f7b7ae41d730e424 -> origin/main
Determining the checkout info
Checking out the ref
  /usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
  Switched to a new branch 'main'
  branch 'main' set up to track 'origin/main'.
/usr/bin/git log -1 --format='%H'
'82fa9ec3fb061e1df5190d86f7b7ae41d730e424'

Run tj-actions/changed-files@v19
  with:
    token: ***
    separator:  
    files_separator: 
  
    files_ignore_separator: 
  
    sha: 82fa9ec3fb061e1df5190d86f7b7ae41d730e424
    since_last_remote_commit: false
    use_fork_point: false
    quotepath: true
Run # "Set base sha..."
  # "Set base sha..."
  if [[ -n "" ]]; then
    echo "::set-output name=base_sha::"
  elif [[ "false" == "true" && "809fc1e8fc582fe0def5cb7675f9232c41cc26cf" != "0000000000000000000000000000000000000000" ]]; then
      echo "::set-output name=base_sha::809fc1e8fc582fe0def5cb7675f9232c41cc26cf"
  fi
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
Run # "Calculating the previous and current SHA..."
  # "Calculating the previous and current SHA..."
  bash $GITHUB_ACTION_PATH/diff-sha.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_SERVER_URL: https://github.com
    GITHUB_REPOSITORY: DariaLeskavets/04.GitOps
    GITHUB_BASE_REF: 
    GITHUB_HEAD_REF: 
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
    INPUT_SHA: 82fa9ec3fb061e1df5190d86f7b7ae41d730e424
    INPUT_BASE_SHA: 
    INPUT_TOKEN: ***
    INPUT_PATH: 
    INPUT_USE_FORK_POINT: false
changed-files-diff-sha
  Resolving repository path...
  Setting up 'temp_changed_files' remote...
  No 'temp_changed_files' remote found
  Creating 'temp_changed_files' remote...
  Getting HEAD SHA...
  remote: Enumerating objects: 13, done.        
  remote: Counting objects:   7% (1/13)        
  remote: Counting objects:  15% (2/13)        
  remote: Counting objects:  23% (3/13)        
  remote: Counting objects:  30% (4/13)        
  remote: Counting objects:  38% (5/13)        
  remote: Counting objects:  46% (6/13)        
  remote: Counting objects:  53% (7/13)        
  remote: Counting objects:  61% (8/13)        
  remote: Counting objects:  69% (9/13)        
  remote: Counting objects:  76% (10/13)        
  remote: Counting objects:  84% (11/13)        
  remote: Counting objects:  92% (12/13)        
  remote: Counting objects: 100% (13/13)        
  remote: Counting objects: 100% (13/13), done.        
  remote: Compressing objects:  33% (1/3)        
  remote: Compressing objects:  66% (2/3)        
  remote: Compressing objects: 100% (3/3)        
  remote: Compressing objects: 100% (3/3), done.        
  remote: Total 7 (delta 1), reused 6 (delta 0), pack-reused 0        
  From https://github.com/DariaLeskavets/04.GitOps
   * [new branch]      main       -> temp_changed_files/main
Run tj-actions/glob@v7.16
  with:
    files-separator: 
  
    escape-paths: true
    excluded-files-separator: 
  
    base-sha: 809fc1e8fc582fe0def5cb7675f9232c41cc26cf
    sha: 82fa9ec3fb061e1df5190d86f7b7ae41d730e424
    include-deleted-files: true
    separator: |
    files-from-source-file-separator: 
  
    excluded-files-from-source-file-separator: 
  
    follow-symbolic-links: true
    strip-top-level-dir: true
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/04.GitOps/04.GitOps
/usr/bin/git diff --diff-filter=D --name-only 809fc1e8fc582fe0def5cb7675f9232c41cc26cf 82fa9ec3fb061e1df5190d86f7b7ae41d730e424

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
  bash $GITHUB_ACTION_PATH/entrypoint.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
    INPUT_FILES_PATTERN_FILE: 
    INPUT_SEPARATOR:  
    INPUT_PATH: 
    INPUT_PREVIOUS_SHA: 809fc1e8fc582fe0def5cb7675f9232c41cc26cf
    INPUT_CURRENT_SHA: 82fa9ec3fb061e1df5190d86f7b7ae41d730e424
    INPUT_TARGET_BRANCH: main
    INPUT_CURRENT_BRANCH: main
    INPUT_QUOTEPATH: true
changed-files
  Resolving repository path...
  Retrieving changes between 809fc1e8fc582fe0def5cb7675f9232c41cc26cf (main) → 82fa9ec3fb061e1df5190d86f7b7ae41d730e424 (main)
  Getting diff...
  Added files: 
  Copied files: 
  Deleted files: 
  Modified files: .github/workflows/main.yaml file1.txt file2.txt
  Renamed files: 
  Type Changed files: 
  Unmerged files: 
  Unknown files: 
  All changed and modified files: .github/workflows/main.yaml file1.txt file2.txt
  All changed files: .github/workflows/main.yaml file1.txt file2.txt
  All modified files: .github/workflows/main.yaml file1.txt file2.txt

  Run for file in .github/workflows/main.yaml file1.txt file2.txt
  for file in .github/workflows/main.yaml file1.txt file2.txt
    do   
      if [[ "$file" != *"yaml"* ]]; then
       
        echo $file >> file.log
        grep $'\t' $file >> file.log 
      fi
    done
  shell: /usr/bin/bash -e {0}

  Run actions/upload-artifact@v2
  with:
    path: file.log
    name: artifact
    if-no-files-found: warn
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 88 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 88 bytes
The size of all the files that were uploaded is 88 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
```


