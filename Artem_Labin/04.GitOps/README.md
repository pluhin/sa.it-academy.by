## 04.GitOps

### Repository 

https://github.com/artjom132007/github_action

### Logs
```
Current runner version: '2.286.1'
Operating System
  Ubuntu
  20.04.3
  LTS
Virtual Environment
  Environment: ubuntu-20.04
  Version: 20220123.1
  Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220123.1/images/linux/Ubuntu2004-Readme.md
  Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220123.1
Virtual Environment Provisioner
  1.0.0.0-main-20220120-1
GITHUB_TOKEN Permissions
  Actions: write
  Checks: write
  Contents: write
  Deployments: write
  Discussions: write
  Issues: write
  Metadata: read
  Packages: write
  Pages: write
  PullRequests: write
  RepositoryProjects: write
  SecurityEvents: write
  Statuses: write
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
Download action repository 'tj-actions/changed-files@v14.1' (SHA:445bbefc90b76c794710efc73b01e1438611cad3)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v3.3' (SHA:d21b174508b881515dc049b80871c281bc31e762)
Getting action download info
Download action repository 'actions/github-script@v5' (SHA:e3cbab99d3a9b271e1b79fc96d103a4a5534998c)

Run actions/checkout@v2
  with:
    fetch-depth: 0
    repository: artjom132007/github_action
    token: ***
    ssh-strict: true
    persist-credentials: true
    clean: true
    lfs: false
    submodules: false
Syncing repository: artjom132007/github_action
Getting Git version info
  Working directory is '/home/runner/work/github_action/github_action'
  /usr/bin/git version
  git version 2.34.1
Deleting the contents of '/home/runner/work/github_action/github_action'
Initializing the repository
  /usr/bin/git init /home/runner/work/github_action/github_action
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
  Initialized empty Git repository in /home/runner/work/github_action/github_action/.git/
  /usr/bin/git remote add origin https://github.com/artjom132007/github_action
Disabling automatic garbage collection
  /usr/bin/git config --local gc.auto 0
Setting up auth
  /usr/bin/git config --local --name-only --get-regexp core\.sshCommand
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
  /usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
  /usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
  /usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'878ee3a157b5e515faddeb3a86ad7eab257c6de4'

Run tj-actions/changed-files@v14.1
  with:
    token: ***
    separator:  
    sha: 878ee3a157b5e515faddeb3a86ad7eab257c6de4
    since_last_remote_commit: false
Run # "Set base sha..."
  # "Set base sha..."
  if [[ -n "" ]]; then
    echo "::set-output name=base_sha::"
  elif [[ "false" == "true" ]]; then
    if [[ "d9b32842319664cd3f8717f53c782ddd81b1003c" != "0000000000000000000000000000000000000000" ]]; then
      echo "::set-output name=base_sha::d9b32842319664cd3f8717f53c782ddd81b1003c"
    else
      echo "::set-output name=base_sha::878ee3a157b5e515faddeb3a86ad7eab257c6de4"
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
    token: ***
    follow-symbolic-links: true
    strip-top-level-dir: true
Run actions/github-script@v5
  with:
    github-token: ***
    script: const path = require("path");
  
  const { GITHUB_ACTION_PATH } = process.env
  const ACTION_PATH = path.join(GITHUB_ACTION_PATH, "main.js")
  
  const main = require(ACTION_PATH)
  await main({ core, glob })
  
    debug: false
    user-agent: actions/github-script
    result-encoding: json
  env:
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/glob/v3.3
    GITHUB_WORKSPACE: /home/runner/work/github_action/github_action
    INPUT_FILES: 
    INPUT_FILES_SEPARATOR:  
    INPUT_FOLLOW_SYMBOLIC_LINKS: true
    INPUT_SEPARATOR: |
    INPUT_STRIP_TOP_LEVEL_DIR: true


Run bash $GITHUB_ACTION_PATH/entrypoint.sh
  bash $GITHUB_ACTION_PATH/entrypoint.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_SERVER_URL: https://github.com
    GITHUB_REPOSITORY: artjom132007/github_action
    GITHUB_BASE_REF: 
    INPUT_SHA: 878ee3a157b5e515faddeb3a86ad7eab257c6de4
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
  Retrieving changes between d9b32842319664cd3f8717f53c782ddd81b1003c (main) → 878ee3a157b5e515faddeb3a86ad7eab257c6de4 (main)
  Getting diff...
  Added files: file.txt file2.txt
  Copied files: 
  Deleted files: 
  Modified files: 
  Renamed files: 
  Type Changed files: 
  Unmerged files: 
  Unknown files: 
  All changed and modified files: file.txt file2.txt
  All changed files: file.txt file2.txt
  All modified files: file.txt file2.txt

  Run for file in file.txt file2.txt; do
  for file in file.txt file2.txt; do
    echo "$files was changed" >> files.log 2>&1
    echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1 
  done
  shell: /usr/bin/bash -e {0}

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
Total size of all the files uploaded is 60 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 70 bytes
The size of all the files that were uploaded is 60 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!

Post job cleanup.
/usr/bin/git version
git version 2.34.1
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :

Cleaning up orphan processes
```