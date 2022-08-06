# 04git
# This is log of action

<<<<<<< HEAD
```
Set up job
```

=======
Set up job

```
>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
Current runner version: '2.294.0'
Operating System
  Ubuntu
  20.04.4
  LTS
Virtual Environment
  Environment: ubuntu-20.04
  Version: 20220729.1
  Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
  Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
Virtual Environment Provisioner
  1.0.0.0-main-20220725-1
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
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v24' (SHA:6c44eb8294bb9c93d6118427f4ff8404b695e1d7)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v9.2' (SHA:8852971095f57bebf1912233304340b43a79d3e3)
<<<<<<< HEAD

```
Run Action
```

=======
```

Run Action

```
>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
Run actions/checkout@v3
  with:
    fetch-depth: 0
    repository: MigelAlfa/01Repo
    token: ***
    ssh-strict: true
    persist-credentials: true
    clean: true
    lfs: false
    submodules: false
    set-safe-directory: true
Syncing repository: MigelAlfa/01Repo
Getting Git version info
  Working directory is '/home/runner/work/01Repo/01Repo'
  /usr/bin/git version
  git version 2.37.1
Temporarily overriding HOME='/home/runner/work/_temp/636d38c5-53d8-4731-a682-9c8dd7e9e730' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/01Repo/01Repo
Deleting the contents of '/home/runner/work/01Repo/01Repo'
Initializing the repository
  /usr/bin/git init /home/runner/work/01Repo/01Repo
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
  Initialized empty Git repository in /home/runner/work/01Repo/01Repo/.git/
  /usr/bin/git remote add origin https://github.com/MigelAlfa/01Repo
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
  /usr/bin/git checkout --progress --force refs/remotes/pull/18/merge
  Note: switching to 'refs/remotes/pull/18/merge'.
  
  You are in 'detached HEAD' state. You can look around, make experimental
  changes and commit them, and you can discard any commits you make in this
  state without impacting any branches by switching back to a branch.
  
  If you want to create a new branch to retain commits you create, you may
  do so (now or later) by using -c with the switch command. Example:
  
    git switch -c <new-branch-name>
  
  Or undo this operation with:
  
    git switch -
  
  Turn off this advice by setting config variable advice.detachedHead to false
  
  HEAD is now at 46c8f88 Merge f62c2f3ade9424077102afd1fb91539b8dfe421e into b8da306dd3e1e01386c42ec67bf63ecdc6206694
/usr/bin/git log -1 --format='%H'
'46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24'
<<<<<<< HEAD

```
Get Files
```

=======
```

Get Files

```
>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
Run tj-actions/changed-files@v24
  with:
    token: ***
    separator:  
    include_all_old_new_renamed_files: false
    old_new_separator: ,
    old_new_files_separator:  
    files_separator: 
  
    files_ignore_separator: 
  
    sha: 46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24
    since_last_remote_commit: false
    path: .
    use_fork_point: false
    quotepath: true
    dir_names: false
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
    GITHUB_REPOSITORY: MigelAlfa/01Repo
    GITHUB_BASE_REF: dev
    GITHUB_HEAD_REF: master
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
    GITHUB_WORKSPACE: /home/runner/work/01Repo/01Repo
    INPUT_SHA: 46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24
    INPUT_BASE_SHA: 
    INPUT_TOKEN: ***
    INPUT_PATH: .
    INPUT_USE_FORK_POINT: false
changed-files-diff-sha
  remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
  From https://github.com/MigelAlfa/01Repo
   * [new branch]      dev        -> dev
Run tj-actions/glob@v9.2
  with:
    files-separator: 
  
    escape-paths: true
    excluded-files-separator: 
  
    working-directory: .
    base-sha: b8da306dd3e1e01386c42ec67bf63ecdc6206694
    sha: 46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24
    include-deleted-files: true
    separator: |
    files-from-source-file-separator: 
  
    excluded-files-from-source-file-separator: 
  
    follow-symbolic-links: true
    strip-top-level-dir: true
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/01Repo/01Repo
/usr/bin/git diff --diff-filter=D --name-only b8da306dd3e1e01386c42ec67bf63ecdc6206694 46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24
.github/workflows/main.yml

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
  bash $GITHUB_ACTION_PATH/entrypoint.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
  env:
    GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
    GITHUB_WORKSPACE: /home/runner/work/01Repo/01Repo
    INPUT_FILES_PATTERN_FILE: 
    INPUT_SEPARATOR:  
    INPUT_PATH: .
    INPUT_PREVIOUS_SHA: b8da306dd3e1e01386c42ec67bf63ecdc6206694
    INPUT_CURRENT_SHA: 46c8f8842d36a9fc5fb4c9f1f8cf16aad26f0a24
    INPUT_TARGET_BRANCH: dev
    INPUT_CURRENT_BRANCH: master
    INPUT_QUOTEPATH: true
    INPUT_INCLUDE_ALL_OLD_NEW_RENAMED_FILES: false
    INPUT_OLD_NEW_SEPARATOR: ,
    INPUT_OLD_NEW_FILES_SEPARATOR:  
    INPUT_DIFF_RELATIVE: 
    INPUT_DIR_NAMES: false
changed-files
<<<<<<< HEAD

```
List Files
=======
```

List Files

>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
```
Run for file in .github/workflows/changed_files.yaml; do
  for file in .github/workflows/changed_files.yaml; do
  
    echo "$file was changed" >> file.log 2>&1
    echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> file.log 2>&1
  
  done
<<<<<<< HEAD
  shell: /usr/bin/bash -e {0}
  
```
Upload report
=======
  shell: /usr/bin/bash -e {0}  
```

Upload report

>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
```

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
Total size of all the files uploaded is 71 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 71 bytes
The size of all the files that were uploaded is 71 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!  
<<<<<<< HEAD

```
Post Run
```

=======
```

Post Run

```
>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
 Post job cleanup.
/usr/bin/git version
git version 2.37.1
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/739719dd-a6fc-443d-8a29-a606963d50b5/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/739719dd-a6fc-443d-8a29-a606963d50b5' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/01Repo/01Repo
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
<<<<<<< HEAD
  
=======
```
>>>>>>> f2c0de33b5d724539eb368916039995c062c2442
