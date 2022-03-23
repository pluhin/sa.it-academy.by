# 04.GitOps Task
## Repo
https://github.com/redman27/gitops_task/

## First Pull Request
```bash
Current runner version: '2.286.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
Download action repository 'tj-actions/changed-files@v13.1' (SHA:98bf782e42c61a52bfdedf673ca2643a251063da)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v3.3' (SHA:d21b174508b881515dc049b80871c281bc31e762)
Getting action download info
Download action repository 'actions/github-script@v5' (SHA:e3cbab99d3a9b271e1b79fc96d103a4a5534998c)
1s
Run actions/checkout@v2
Syncing repository: redman27/gitops_task
Getting Git version info
Deleting the contents of '/home/runner/work/gitops_task/gitops_task'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'db2806e17b5eccad732309cd91d4c063764922b7'
1s
Run tj-actions/changed-files@v13.1
Run # "Set base sha..."
Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
changed-files-from-source-file
Run tj-actions/glob@v3.3
Run actions/github-script@v5


Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run for file in file2.txt; do
0s
Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 45 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 45 bytes
The size of all the files that were uploaded is 45 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
1s
Post job cleanup.
/usr/bin/git version
git version 2.34.1
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```
## Second Pull Request

```bash
Current runner version: '2.286.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
Download action repository 'tj-actions/changed-files@v13.1' (SHA:98bf782e42c61a52bfdedf673ca2643a251063da)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v3.3' (SHA:d21b174508b881515dc049b80871c281bc31e762)
Getting action download info
Download action repository 'actions/github-script@v5' (SHA:e3cbab99d3a9b271e1b79fc96d103a4a5534998c)
1s
Run actions/checkout@v2
Syncing repository: redman27/gitops_task
Getting Git version info
Deleting the contents of '/home/runner/work/gitops_task/gitops_task'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'aeb7c08cf10bdcd041eed3abf4061abca1569b97'
0s
Run tj-actions/changed-files@v13.1
Run # "Set base sha..."
Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
changed-files-from-source-file
Run tj-actions/glob@v3.3
Run actions/github-script@v5


Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run for file in file3.txt; do
1s
Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 45 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 45 bytes
The size of all the files that were uploaded is 45 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
/usr/bin/git version
git version 2.34.1
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```
