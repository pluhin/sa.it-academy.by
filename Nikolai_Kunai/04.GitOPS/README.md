## Repositories's urls : 

- [GitHub](https://github.com/NikolaiKunai/DEMO.git)


## Log of pipeline
---
```bash
Current runner version: '2.291.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
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
Syncing repository: NikolaiKunai/DEMO
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/7a6d6a7f-e964-486e-8ac2-a8caf7cf80df' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/DEMO/DEMO
Deleting the contents of '/home/runner/work/DEMO/DEMO'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'3be213c3f8f9edd52cd9931dd864acfbdf7f0489'
1s
Run tj-actions/changed-files@v20
Run # "Set base sha..."
Run # "Calculating the previous and current SHA..."
changed-files-diff-sha
Run tj-actions/glob@v7.20
/usr/bin/git rev-parse --show-toplevel
/home/runner/work/DEMO/DEMO
/usr/bin/git diff --diff-filter=D --name-only 9c7d80536db6ae532ef7efda4ca5bc3d7e1891dd 3be213c3f8f9edd52cd9931dd864acfbdf7f0489

Run bash $GITHUB_ACTION_PATH/entrypoint.sh
changed-files
0s
Run sum=0
.github/workflows/ci.yaml was changed
test1.txt was changed
test2 was changed
0s
Run actions/upload-artifact@v2
With the provided path, there will be 1 file uploaded
Starting artifact upload
For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
Artifact name is valid!
Container for artifact "artifact" successfully created. Starting upload of file(s)
Total size of all the files uploaded is 3 bytes
File upload process has finished. Finalizing the artifact upload
Artifact has been finalized. All files have been successfully uploaded!

The raw size of all the files that were specified for upload is 3 bytes
The size of all the files that were uploaded is 3 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage

Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 

Artifact artifact has been successfully uploaded!
0s
Post job cleanup.
Post job cleanup.
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.1
Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/6b603f69-af48-4011-a622-ce29059abbb7/.gitconfig'
Temporarily overriding HOME='/home/runner/work/_temp/6b603f69-af48-4011-a622-ce29059abbb7' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/DEMO/DEMO
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```