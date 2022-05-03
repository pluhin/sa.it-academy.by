# 04.GitOps by Igor Golubovich

## Repository

- [GitHub](https://github.com/igor-golubovich/ci_git)


## Logs of pipelines:

### First PR
```
Current runner version: '2.290.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
1s
Run actions/checkout@v3
Syncing repository: igor-golubovich/ci_git
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/3c753175-d413-4758-9929-2ca2ad646e1a' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
Deleting the contents of '/home/runner/work/ci_git/ci_git'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'8f3f063d8db2f0d49e70016edc5749ded8677218'
0s
Run tj-actions/changed-files@v19
Run # "Set base sha..."
Run # "Calculating the previous and current SHA..."
changed-files-diff-sha
Run tj-actions/glob@v7.16
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/ci_git/ci_git
/usr/bin/git diff --diff-filter=D --name-only 8f3f063d8db2f0d49e70016edc5749ded8677218 8f3f063d8db2f0d49e70016edc5749ded8677218

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run for file in ; do
0s
Run actions/upload-artifact@v2
Warning: No files were found with the provided path: changed_files.log. No artifacts will be uploaded.
0s
Post job cleanup.
Post job cleanup.
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.0
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/2d703545-8e09-4d06-b7ae-6ac193c8f9fa/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/2d703545-8e09-4d06-b7ae-6ac193c8f9fa' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```

### Second PR
```
Current runner version: '2.290.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
0s
Run actions/checkout@v3
Syncing repository: igor-golubovich/ci_git
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/2169c0b5-9e22-46fd-8f83-d5d1b25085c2' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
Deleting the contents of '/home/runner/work/ci_git/ci_git'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'08a36aa3e37c9df4d82bc9d72ff92f290f7d0f23'
1s
Run tj-actions/changed-files@v19
Run # "Set base sha..."
Run # "Calculating the previous and current SHA..."
changed-files-diff-sha
Run tj-actions/glob@v7.16
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/ci_git/ci_git
/usr/bin/git diff --diff-filter=D --name-only 8f3f063d8db2f0d49e70016edc5749ded8677218 08a36aa3e37c9df4d82bc9d72ff92f290f7d0f23

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run for file in test_file_1.txt; do
0s
Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 50 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 50 bytes
The size of all the files that were uploaded is 50 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
Post job cleanup.
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.0
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/bf49d15e-b788-45e2-a887-66d68456c807/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/bf49d15e-b788-45e2-a887-66d68456c807' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```

### Third PR
```
Current runner version: '2.290.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
0s
Run actions/checkout@v3
Syncing repository: igor-golubovich/ci_git
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/425c51b7-8352-4ee8-a2a9-f554a5ced205' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
Deleting the contents of '/home/runner/work/ci_git/ci_git'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'c01c749e31370307a85e8a0da6f9306dc8de0f75'
0s
Run tj-actions/changed-files@v19
Run # "Set base sha..."
Run # "Calculating the previous and current SHA..."
changed-files-diff-sha
Run tj-actions/glob@v7.16
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/ci_git/ci_git
/usr/bin/git diff --diff-filter=D --name-only 08a36aa3e37c9df4d82bc9d72ff92f290f7d0f23 c01c749e31370307a85e8a0da6f9306dc8de0f75

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run for file in test_file_2.txt test_file_3.txt; do
0s
Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 76 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 100 bytes
The size of all the files that were uploaded is 76 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
Post job cleanup.
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.0
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/9646b73a-f617-43cb-a032-8210e4893fab/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/9646b73a-f617-43cb-a032-8210e4893fab' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/ci_git/ci_git
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```
