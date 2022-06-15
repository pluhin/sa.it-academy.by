# Homework report for 04.Git.Ops by Siarhei Kaliuha

---

## Repository URL:

* [Github](https://github.com/s-kalyuga/04.GitOps)
* [Test actions](https://github.com/s-kalyuga/04.GitOps/actions/runs/2497872313)

## Brief solution description:
* pipeline runs on pull request.
* consists of two `jobs`: 
    - `prepare` - collects list of changed files,
    - `check` - scan changed files in parallel and upload artifacts.
* `check` job uses dynamic creation `strategy.matrix` based on `outputs` from `prepare` job so it starts after `prepare` succeeded to perform adaptive checking for changed files in parallel.
* list of changed files and result of found TABs for each build stored inside artifacts.

## Pipeline log:

`prepare` job:
```
Current runner version: '2.292.0'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
Download action repository 'tj-actions/changed-files@v23' (SHA:fb1fe28aa9ff24afc553b37545437005a4cf2115)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
Getting action download info
Download action repository 'tj-actions/glob@v9.2' (SHA:8852971095f57bebf1912233304340b43a79d3e3)

Run actions/checkout@v3
Syncing repository: s-kalyuga/04.GitOps
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/03379a99-368b-46a0-beab-92b0c528896f' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'faf669e87d664e451c304dcac349d8d2b5b5129b'

Run tj-actions/changed-files@v23
Run # "Set base sha..."
Run # "Calculating the previous and current SHA..."
changed-files-diff-sha
Run tj-actions/glob@v9.2
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/04.GitOps/04.GitOps
/usr/bin/git diff --diff-filter=D --name-only c9f7413692dcfbb220aaa7a6d7ec7ec886d0db31 faf669e87d664e451c304dcac349d8d2b5b5129b
Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files

Run echo "datefile.txt route.txt tabs-and-spaces.txt" >> changed-files-list.log

Run sudo apt-get install jq
Reading package lists...
Building dependency tree...
Reading state information...
jq is already the newest version (1.6-1ubuntu0.20.04.1).
0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.

Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 43 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!
The raw size of all the files that were specified for upload is 43 bytes
The size of all the files that were uploaded is 43 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads
Artifact artifact has been successfully uploaded!

Post job cleanup.
Post job cleanup.

Post job cleanup.
/usr/bin/git version
git version 2.36.1
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/585c5204-3301-4bb6-8d03-48cee783f7bc/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/585c5204-3301-4bb6-8d03-48cee783f7bc' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :

Evaluate and set job outputs
Set output 'all-changed-files'
Cleaning up orphan processes
```

`check` job for **datefile.txt** file:
```
Current runner version: '2.292.0'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)

Run actions/checkout@v2
Syncing repository: s-kalyuga/04.GitOps
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/d63e8ba1-92b9-4d75-8261-a3ddb0108c5d' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'faf669e87d664e451c304dcac349d8d2b5b5129b'

Run tab_str=`grep -P '\t' datefile.txt | wc -l`

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

Post job cleanup.
/usr/bin/git version
git version 2.36.1
Temporarily overriding HOME='/home/runner/work/_temp/8a94ec12-aa6c-40b2-bdb9-6e523ed45f06' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :

Cleaning up orphan processes
```

`check` job for **route.txt** file:
```
Current runner version: '2.292.0'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)

Run actions/checkout@v2
Syncing repository: s-kalyuga/04.GitOps
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/1a17b308-5487-4702-b84b-4b99fe4173df' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'faf669e87d664e451c304dcac349d8d2b5b5129b'

Run tab_str=`grep -P '\t' route.txt | wc -l`

Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 47 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!
The raw size of all the files that were specified for upload is 47 bytes
The size of all the files that were uploaded is 47 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads
Artifact artifact has been successfully uploaded!

Post job cleanup.
/usr/bin/git version
git version 2.36.1
Temporarily overriding HOME='/home/runner/work/_temp/a5632c0b-a119-4aef-93ac-1b9ce93082e4' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :

Cleaning up orphan processes
```

`check` job for **tabs-and-spaces.txt.txt** file:
```
Current runner version: '2.292.0'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)

Run actions/checkout@v2
Syncing repository: s-kalyuga/04.GitOps
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/8fa374a3-95db-4945-869e-e13283fbee9f' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'faf669e87d664e451c304dcac349d8d2b5b5129b'

Run tab_str=`grep -P '\t' tabs-and-spaces.txt | wc -l`

Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 57 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!
The raw size of all the files that were specified for upload is 57 bytes
The size of all the files that were uploaded is 57 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads
Artifact artifact has been successfully uploaded!

Post job cleanup.
/usr/bin/git version
git version 2.36.1
Temporarily overriding HOME='/home/runner/work/_temp/d964129e-bcfc-4da0-b447-2c6af6eb050d' before making global git config changes
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