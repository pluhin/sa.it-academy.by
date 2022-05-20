## 04.GitOps

### action file

tabs.yaml is in 04.GitOps directory (also it was published here: https://github.com/BB8312/git_test/blob/main/.github/workflows/tabs.yaml)

### testing repository

https://github.com/BB8312/git_test/

### log of pipeline

```bash
Current runner version: '2.291.1'
Operating System
  Ubuntu
  20.04.4
  LTS
Virtual Environment
  Environment: ubuntu-20.04
  Version: 20220515.1
  Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220515.1/images/linux/Ubuntu2004-Readme.md
  Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220515.1
Virtual Environment Provisioner
  1.0.0.0-main-20220421-1
GITHUB_TOKEN Permissions
  Contents: read
  Metadata: read
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v20' (SHA:581eef0495dd5b75a3dd93047ff9f0d42dc09370)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v7.20' (SHA:95ff4236144967424139d2fb9776bb79d93afdca)
0s
Run actions/checkout@v3
  with:
    fetch-depth: 0
    repository: BB8312/git_test
    token: ***
    ssh-strict: true
    persist-credentials: true
    clean: true
    lfs: false
    submodules: false
    set-safe-directory: true
Syncing repository: BB8312/git_test
Getting Git version info
  Working directory is '/home/runner/work/git_test/git_test'
  /usr/bin/git version
  git version 2.36.1
Temporarily overriding HOME='/home/runner/work/_temp/ab6aa794-acd9-4fc6-865b-7b1aa6afdcd0' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/git_test/git_test
Deleting the contents of '/home/runner/work/git_test/git_test'
Initializing the repository
  /usr/bin/git init /home/runner/work/git_test/git_test
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
  Initialized empty Git repository in /home/runner/work/git_test/git_test/.git/
  /usr/bin/git remote add origin https://github.com/BB8312/git_test
Disabling automatic garbage collection
  /usr/bin/git config --local gc.auto 0
Setting up auth
  /usr/bin/git config --local --name-only --get-regexp core\.sshCommand
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
  /usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
  /usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
Fetching the repository
  /usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +571883ce3aaab17883325b589755677589bcc10d:refs/remotes/pull/2/merge
  remote: Enumerating objects: 39, done.        
  remote: Counting objects:   2% (1/39)        
  remote: Counting objects:   5% (2/39)        
  remote: Counting objects:   7% (3/39)        
  remote: Counting objects:  10% (4/39)        
  remote: Counting objects:  12% (5/39)        
  remote: Counting objects:  15% (6/39)        
  remote: Counting objects:  17% (7/39)        
  remote: Counting objects:  20% (8/39)        
  remote: Counting objects:  23% (9/39)        
  remote: Counting objects:  25% (10/39)        
  remote: Counting objects:  28% (11/39)        
  remote: Counting objects:  30% (12/39)        
  remote: Counting objects:  33% (13/39)        
  remote: Counting objects:  35% (14/39)        
  remote: Counting objects:  38% (15/39)        
  remote: Counting objects:  41% (16/39)        
  remote: Counting objects:  43% (17/39)        
  remote: Counting objects:  46% (18/39)        
  remote: Counting objects:  48% (19/39)        
  remote: Counting objects:  51% (20/39)        
  remote: Counting objects:  53% (21/39)        
  remote: Counting objects:  56% (22/39)        
  remote: Counting objects:  58% (23/39)        
  remote: Counting objects:  61% (24/39)        
  remote: Counting objects:  64% (25/39)        
  remote: Counting objects:  66% (26/39)        
  remote: Counting objects:  69% (27/39)        
  remote: Counting objects:  71% (28/39)        
  remote: Counting objects:  74% (29/39)        
  remote: Counting objects:  76% (30/39)        
  remote: Counting objects:  79% (31/39)        
  remote: Counting objects:  82% (32/39)        
  remote: Counting objects:  84% (33/39)        
  remote: Counting objects:  87% (34/39)        
  remote: Counting objects:  89% (35/39)        
  remote: Counting objects:  92% (36/39)        
  remote: Counting objects:  94% (37/39)        
  remote: Counting objects:  97% (38/39)        
  remote: Counting objects: 100% (39/39)        
  remote: Counting objects: 100% (39/39), done.        
  remote: Compressing objects:   4% (1/21)        
  remote: Compressing objects:   9% (2/21)        
  remote: Compressing objects:  14% (3/21)        
  remote: Compressing objects:  19% (4/21)        
  remote: Compressing objects:  23% (5/21)        
  remote: Compressing objects:  28% (6/21)        
  remote: Compressing objects:  33% (7/21)        
  remote: Compressing objects:  38% (8/21)        
  remote: Compressing objects:  42% (9/21)        
  remote: Compressing objects:  47% (10/21)        
  remote: Compressing objects:  52% (11/21)        
  remote: Compressing objects:  57% (12/21)        
  remote: Compressing objects:  61% (13/21)        
  remote: Compressing objects:  66% (14/21)        
  remote: Compressing objects:  71% (15/21)        
  remote: Compressing objects:  76% (16/21)        
  remote: Compressing objects:  80% (17/21)        
  remote: Compressing objects:  85% (18/21)        
  remote: Compressing objects:  90% (19/21)        
  remote: Compressing objects:  95% (20/21)        
  remote: Compressing objects: 100% (21/21)        
  remote: Compressing objects: 100% (21/21), done.        
  remote: Total 39 (delta 12), reused 36 (delta 10), pack-reused 0        
  From https://github.com/BB8312/git_test
   * [new branch]      dev                                      -> origin/dev
   * [new branch]      features/do_one                          -> origin/features/do_one
   * [new branch]      hotfix/we_gonna_die                      -> origin/hotfix/we_gonna_die
   * [new branch]      main                                     -> origin/main
   * [new ref]         571883ce3aaab17883325b589755677589bcc10d -> pull/2/merge
Determining the checkout info
Checking out the ref
  /usr/bin/git checkout --progress --force refs/remotes/pull/2/merge
  Note: switching to 'refs/remotes/pull/2/merge'.
  
  You are in 'detached HEAD' state. You can look around, make experimental
  changes and commit them, and you can discard any commits you make in this
  state without impacting any branches by switching back to a branch.
  
  If you want to create a new branch to retain commits you create, you may
  do so (now or later) by using -c with the switch command. Example:
  
    git switch -c <new-branch-name>
  
  Or undo this operation with:
  
    git switch -
  
  Turn off this advice by setting config variable advice.detachedHead to false
  
  HEAD is now at 571883c Merge 455e0f4f86c634054089cac3bd30a0367b999d0a into d2450e93b3e9cc421c6336c26e43139eed218835
/usr/bin/git log -1 --format='%H'
'571883ce3aaab17883325b589755677589bcc10d'
0s
Run tj-actions/changed-files@v20
  with:
    token: ***
    separator:  
    old_new_separator: ,
    old_new_files_separator:  
    files_separator: 
  
    files_ignore_separator: 
  
    sha: 571883ce3aaab17883325b589755677589bcc10d
    since_last_remote_commit: false
    use_fork_point: false
    quotepath: true
Run # "Set base sha..."
  # "Set base sha..."
  if [[ -n "" ]]; then
    echo "::set-output name=base_sha::"
  elif [[ "false" == "true" && "" != "0000000000000000000000000000000000000000" ]]; then
      echo "::set-output name=base_sha::"
  fi
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
Run # "Calculating the previous and current SHA..."
  # "Calculating the previous and current SHA..."
  bash $GITHUB_ACTION_PATH/diff-sha.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_SERVER_URL: https://github.com
    GITHUB_REPOSITORY: BB8312/git_test
    GITHUB_BASE_REF: dev
    GITHUB_HEAD_REF: main
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v20
    INPUT_SHA: 571883ce3aaab17883325b589755677589bcc10d
    INPUT_BASE_SHA: 
    INPUT_TOKEN: ***
    INPUT_PATH: 
    INPUT_USE_FORK_POINT: false
changed-files-diff-sha
  Resolving repository path...
  Getting HEAD SHA...
  remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
  From https://github.com/BB8312/git_test
   * [new branch]      dev        -> dev
  Verifying commit SHA...
Run tj-actions/glob@v7.20
  with:
    files-separator: 
  
    escape-paths: true
    excluded-files-separator: 
  
    base-sha: d2450e93b3e9cc421c6336c26e43139eed218835
    sha: 571883ce3aaab17883325b589755677589bcc10d
    include-deleted-files: true
    separator: |
    files-from-source-file-separator: 
  
    excluded-files-from-source-file-separator: 
  
    follow-symbolic-links: true
    strip-top-level-dir: true
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/git_test/git_test
/usr/bin/git diff --diff-filter=D --name-only d2450e93b3e9cc421c6336c26e43139eed218835 571883ce3aaab17883325b589755677589bcc10d

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
  bash $GITHUB_ACTION_PATH/entrypoint.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v20
    INPUT_FILES_PATTERN_FILE: 
    INPUT_SEPARATOR:  
    INPUT_PATH: 
    INPUT_PREVIOUS_SHA: d2450e93b3e9cc421c6336c26e43139eed218835
    INPUT_CURRENT_SHA: 571883ce3aaab17883325b589755677589bcc10d
    INPUT_TARGET_BRANCH: dev
    INPUT_CURRENT_BRANCH: main
    INPUT_QUOTEPATH: true
    INPUT_OLD_NEW_SEPARATOR: ,
    INPUT_OLD_NEW_FILES_SEPARATOR:  
changed-files
  Resolving repository path...
  Retrieving changes between d2450e93b3e9cc421c6336c26e43139eed218835 (dev) > 571883ce3aaab17883325b589755677589bcc10d (main)
  Getting diff...
  Added files: .github/workflows/tabs.yaml readme.status run.sh tabs.txt
  Copied files: 
  Deleted files: 
  Modified files: README.md
  Renamed files: 
  Type Changed files: 
  Unmerged files: 
  Unknown files: 
  All changed and modified files: .github/workflows/tabs.yaml README.md readme.status run.sh tabs.txt
  All changed files: .github/workflows/tabs.yaml README.md readme.status run.sh tabs.txt
  All modified files: .github/workflows/tabs.yaml README.md readme.status run.sh tabs.txt
  All old & new renamed files: 
0s
Run for file in .github/workflows/tabs.yaml README.md readme.status run.sh tabs.txt; do
  for file in .github/workflows/tabs.yaml README.md readme.status run.sh tabs.txt; do
    echo "$changed!" >> investigate.log 2>&1
    echo "Tabs: `grep -P '\t' $file | wc -l`" >> investigate.log 2>&1 
  done
  shell: /usr/bin/bash -e {0}
0s
Run actions/upload-artifact@v2
  with:
    path: investigate.log
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

The raw size of all the files that were specified for upload is 50 bytes
The size of all the files that were uploaded is 35 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
Post job cleanup.
1s
Post job cleanup.
/usr/bin/git version
git version 2.36.1
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/71852274-aa10-4c48-9ee6-39cb11753b40/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/71852274-aa10-4c48-9ee6-39cb11753b40' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/git_test/git_test
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```