# 04.GitOPS

## [GitOPS](https://github.com/mnogosemok/04.GitOps)

## logs
```bash
Current runner version: '2.291.1'
Operating System
  Ubuntu
  20.04.4
  LTS
Virtual Environment
  Environment: ubuntu-20.04
  Version: 20220425.1
  Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220425.1/images/linux/Ubuntu2004-Readme.md
  Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220425.1
Virtual Environment Provisioner
  1.0.0.0-main-20220421-1
GITHUB_TOKEN Permissions
  Contents: read
  Metadata: read
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
Download action repository 'tj-actions/changed-files@v14.1' (SHA:be68c10267c4979ed30c9397041b052b2980f91f)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
1s
Run actions/checkout@v2
  with:
    fetch-depth: 0
    repository: mnogosemok/04.GitOps
    token: ***
    ssh-strict: true
    persist-credentials: true
    clean: true
    lfs: false
    submodules: false
    set-safe-directory: true
Syncing repository: mnogosemok/04.GitOps
Getting Git version info
  Working directory is '/home/runner/work/04.GitOps/04.GitOps'
  /usr/bin/git version
  git version 2.36.0
Temporarily overriding HOME='/home/runner/work/_temp/a7cb0c7b-4f00-4048-add3-072482898bd6' before making global git config changes
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
  /usr/bin/git remote add origin https://github.com/mnogosemok/04.GitOps
Disabling automatic garbage collection
  /usr/bin/git config --local gc.auto 0
Setting up auth
  /usr/bin/git config --local --name-only --get-regexp core\.sshCommand
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
  /usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
  /usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
Fetching the repository
  /usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
  remote: Enumerating objects: 63, done.        
  remote: Counting objects:   1% (1/63)        
  remote: Counting objects:   3% (2/63)        
  remote: Counting objects:   4% (3/63)        
  remote: Counting objects:   6% (4/63)        
  remote: Counting objects:   7% (5/63)        
  remote: Counting objects:   9% (6/63)        
  remote: Counting objects:  11% (7/63)        
  remote: Counting objects:  12% (8/63)        
  remote: Counting objects:  14% (9/63)        
  remote: Counting objects:  15% (10/63)        
  remote: Counting objects:  17% (11/63)        
  remote: Counting objects:  19% (12/63)        
  remote: Counting objects:  20% (13/63)        
  remote: Counting objects:  22% (14/63)        
  remote: Counting objects:  23% (15/63)        
  remote: Counting objects:  25% (16/63)        
  remote: Counting objects:  26% (17/63)        
  remote: Counting objects:  28% (18/63)        
  remote: Counting objects:  30% (19/63)        
  remote: Counting objects:  31% (20/63)        
  remote: Counting objects:  33% (21/63)        
  remote: Counting objects:  34% (22/63)        
  remote: Counting objects:  36% (23/63)        
  remote: Counting objects:  38% (24/63)        
  remote: Counting objects:  39% (25/63)        
  remote: Counting objects:  41% (26/63)        
  remote: Counting objects:  42% (27/63)        
  remote: Counting objects:  44% (28/63)        
  remote: Counting objects:  46% (29/63)        
  remote: Counting objects:  47% (30/63)        
  remote: Counting objects:  49% (31/63)        
  remote: Counting objects:  50% (32/63)        
  remote: Counting objects:  52% (33/63)        
  remote: Counting objects:  53% (34/63)        
  remote: Counting objects:  55% (35/63)        
  remote: Counting objects:  57% (36/63)        
  remote: Counting objects:  58% (37/63)        
  remote: Counting objects:  60% (38/63)        
  remote: Counting objects:  61% (39/63)        
  remote: Counting objects:  63% (40/63)        
  remote: Counting objects:  65% (41/63)        
  remote: Counting objects:  66% (42/63)        
  remote: Counting objects:  68% (43/63)        
  remote: Counting objects:  69% (44/63)        
  remote: Counting objects:  71% (45/63)        
  remote: Counting objects:  73% (46/63)        
  remote: Counting objects:  74% (47/63)        
  remote: Counting objects:  76% (48/63)        
  remote: Counting objects:  77% (49/63)        
  remote: Counting objects:  79% (50/63)        
  remote: Counting objects:  80% (51/63)        
  remote: Counting objects:  82% (52/63)        
  remote: Counting objects:  84% (53/63)        
  remote: Counting objects:  85% (54/63)        
  remote: Counting objects:  87% (55/63)        
  remote: Counting objects:  88% (56/63)        
  remote: Counting objects:  90% (57/63)        
  remote: Counting objects:  92% (58/63)        
  remote: Counting objects:  93% (59/63)        
  remote: Counting objects:  95% (60/63)        
  remote: Counting objects:  96% (61/63)        
  remote: Counting objects:  98% (62/63)        
  remote: Counting objects: 100% (63/63)        
  remote: Counting objects: 100% (63/63), done.        
  remote: Compressing objects:   2% (1/39)        
  remote: Compressing objects:   5% (2/39)        
  remote: Compressing objects:   7% (3/39)        
  remote: Compressing objects:  10% (4/39)        
  remote: Compressing objects:  12% (5/39)        
  remote: Compressing objects:  15% (6/39)        
  remote: Compressing objects:  17% (7/39)        
  remote: Compressing objects:  20% (8/39)        
  remote: Compressing objects:  23% (9/39)        
  remote: Compressing objects:  25% (10/39)        
  remote: Compressing objects:  28% (11/39)        
  remote: Compressing objects:  30% (12/39)        
  remote: Compressing objects:  33% (13/39)        
  remote: Compressing objects:  35% (14/39)        
  remote: Compressing objects:  38% (15/39)        
  remote: Compressing objects:  41% (16/39)        
  remote: Compressing objects:  43% (17/39)        
  remote: Compressing objects:  46% (18/39)        
  remote: Compressing objects:  48% (19/39)        
  remote: Compressing objects:  51% (20/39)        
  remote: Compressing objects:  53% (21/39)        
  remote: Compressing objects:  56% (22/39)        
  remote: Compressing objects:  58% (23/39)        
  remote: Compressing objects:  61% (24/39)        
  remote: Compressing objects:  64% (25/39)        
  remote: Compressing objects:  66% (26/39)        
  remote: Compressing objects:  69% (27/39)        
  remote: Compressing objects:  71% (28/39)        
  remote: Compressing objects:  74% (29/39)        
  remote: Compressing objects:  76% (30/39)        
  remote: Compressing objects:  79% (31/39)        
  remote: Compressing objects:  82% (32/39)        
  remote: Compressing objects:  84% (33/39)        
  remote: Compressing objects:  87% (34/39)        
  remote: Compressing objects:  89% (35/39)        
  remote: Compressing objects:  92% (36/39)        
  remote: Compressing objects:  94% (37/39)        
  remote: Compressing objects:  97% (38/39)        
  remote: Compressing objects: 100% (39/39)        
  remote: Compressing objects: 100% (39/39), done.        
  remote: Total 63 (delta 7), reused 7 (delta 0), pack-reused 0        
  From https://github.com/mnogosemok/04.GitOps
   * [new branch]      main       -> origin/main
  /usr/bin/git branch --list --remote origin/main
    origin/main
  /usr/bin/git rev-parse refs/remotes/origin/main
  1d2786733997beaa7d8a3da45652fcfc4db8b16c
Determining the checkout info
Checking out the ref
  /usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
  Switched to a new branch 'main'
  branch 'main' set up to track 'origin/main'.
/usr/bin/git log -1 --format='%H'
'1d2786733997beaa7d8a3da45652fcfc4db8b16c'
0s
Run tj-actions/changed-files@v14.1
  with:
    token: ***
    separator:  
    sha: 1d2786733997beaa7d8a3da45652fcfc4db8b16c
    since_last_remote_commit: false
Run # "Set base sha..."
  # "Set base sha..."
  if [[ -n "" ]]; then
    echo "::set-output name=base_sha::"
  elif [[ "false" == "true" ]]; then
    if [[ "d83e052da771987293ab52821d1aaabee9c3e9ee" != "0000000000000000000000000000000000000000" ]]; then
      echo "::set-output name=base_sha::d83e052da771987293ab52821d1aaabee9c3e9ee"
    else
      echo "::set-output name=base_sha::1d2786733997beaa7d8a3da45652fcfc4db8b16c"
    fi
  fi
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
  bash $GITHUB_ACTION_PATH/sourcefiles.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    INPUT_FILES: 
    INPUT_FILES_FROM_SOURCE_FILE: 
changed-files-from-source-file
  Input files: 
Run tj-actions/glob@v3.3
  with:
    files-separator:  
    separator: |
    excluded-files-separator: 
  
    files-from-source-file-separator: 
  
    excluded-files-from-source-file-separator: 
  
    follow-symbolic-links: true
    strip-top-level-dir: true
    include-deleted-files: false
    sha: 1d2786733997beaa7d8a3da45652fcfc4db8b16c
    working-directory: /home/runner/work/04.GitOps/04.GitOps

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
  bash $GITHUB_ACTION_PATH/entrypoint.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_SERVER_URL: https://github.com
    GITHUB_REPOSITORY: mnogosemok/04.GitOps
    GITHUB_BASE_REF: 
    INPUT_SHA: 1d2786733997beaa7d8a3da45652fcfc4db8b16c
    INPUT_BASE_SHA: 
    INPUT_TOKEN: ***
    INPUT_FILES_PATTERN: 
    INPUT_SEPARATOR:  
    INPUT_PATH: 
changed-files
  Resolving repository path...
  Setting up 'temp_changed_files' remote...
  No 'temp_changed_files' remote found
  Creating 'temp_changed_files' remote...
  Getting HEAD info...
  Retrieving changes between d83e052da771987293ab52821d1aaabee9c3e9ee (main) → 1d2786733997beaa7d8a3da45652fcfc4db8b16c (main)
  Getting diff...
  Added files: 
  Copied files: 
  Deleted files: 
  Modified files: .github/workflows/MySkript.yml
  Renamed files: 
  Type Changed files: 
  Unmerged files: 
  Unknown files: 
  All changed and modified files: .github/workflows/MySkript.yml
  All changed files: .github/workflows/MySkript.yml
  All modified files: .github/workflows/MySkript.yml
0s
Run for file in .github/workflows/MySkript.yml; do
  for file in .github/workflows/MySkript.yml; do
    echo "$files was changed" >> files.log 2>&1
    echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1
  done
  shell: /usr/bin/bash -e {0}
0s
Run actions/upload-artifact@v2
  with:
    path: files.log
    name: artifact
    if-no-files-found: warn
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 35 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 35 bytes
The size of all the files that were uploaded is 35 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.0
Temporarily overriding HOME='/home/runner/work/_temp/1c3b9934-1e90-4775-b1fd-57a8d8b9358f' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes

```