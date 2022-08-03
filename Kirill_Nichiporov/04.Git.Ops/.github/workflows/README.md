## Repository

[TestRepo](https://github.com/KirillNichiporov/03)

## Action

```bash
name: Scan all changed files

on: pull_request

jobs:
  checkfiles:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v3
    
      - id: files
        uses: Ana06/get-changed-files@v2.1.0
        with:
          format: 'csv'
          filter: '*'
      - run: |
          mapfile -d ',' -t added_modified_files < <(printf '%s,' '${{ steps.files.outputs.added_modified }}')
          for added_modified_file in "${added_modified_files[@]}"; do
          echo $(grep -o $'\t' ${added_modified_file} | wc -l) tabs - ${added_modified_file} >> 04gitops.log 2>&1 
          done

        name: Upload gitops  
      - uses: actions/upload-artifact@v3
        with:
          path: 04gitops.log

```

## Logs

```bash

2022-08-03T12:59:15.0803512Z Requested labels: ubuntu-latest
2022-08-03T12:59:15.0803543Z Job defined at: KirillNichiporov/03/.github/workflows/04gitops.yml@refs/pull/7/merge
2022-08-03T12:59:15.0803559Z Waiting for a runner to pick up this job...
2022-08-03T12:59:15.6966538Z Job is waiting for a hosted runner to come online.
2022-08-03T12:59:19.0475050Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-08-03T12:59:21.4317655Z Current runner version: '2.294.0'
2022-08-03T12:59:21.4344672Z ##[group]Operating System
2022-08-03T12:59:21.4345209Z Ubuntu
2022-08-03T12:59:21.4345490Z 20.04.4
2022-08-03T12:59:21.4345790Z LTS
2022-08-03T12:59:21.4346320Z ##[endgroup]
2022-08-03T12:59:21.4346661Z ##[group]Virtual Environment
2022-08-03T12:59:21.4346982Z Environment: ubuntu-20.04
2022-08-03T12:59:21.4347318Z Version: 20220729.1
2022-08-03T12:59:21.4347875Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
2022-08-03T12:59:21.4348525Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
2022-08-03T12:59:21.4348918Z ##[endgroup]
2022-08-03T12:59:21.4349260Z ##[group]Virtual Environment Provisioner
2022-08-03T12:59:21.4349653Z 1.0.0.0-main-20220725-1
2022-08-03T12:59:21.4349924Z ##[endgroup]
2022-08-03T12:59:21.4350844Z ##[group]GITHUB_TOKEN Permissions
2022-08-03T12:59:21.4351446Z Actions: write
2022-08-03T12:59:21.4351924Z Checks: write
2022-08-03T12:59:21.4352267Z Contents: write
2022-08-03T12:59:21.4352581Z Deployments: write
2022-08-03T12:59:21.4352848Z Discussions: write
2022-08-03T12:59:21.4353178Z Issues: write
2022-08-03T12:59:21.4353480Z Metadata: read
2022-08-03T12:59:21.4353739Z Packages: write
2022-08-03T12:59:21.4354037Z Pages: write
2022-08-03T12:59:21.4354342Z PullRequests: write
2022-08-03T12:59:21.4354727Z RepositoryProjects: write
2022-08-03T12:59:21.4355023Z SecurityEvents: write
2022-08-03T12:59:21.4355341Z Statuses: write
2022-08-03T12:59:21.4355635Z ##[endgroup]
2022-08-03T12:59:21.4359269Z Secret source: Actions
2022-08-03T12:59:21.4359799Z Prepare workflow directory
2022-08-03T12:59:21.5205024Z Prepare all required actions
2022-08-03T12:59:21.5388410Z Getting action download info
2022-08-03T12:59:21.7589597Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-08-03T12:59:22.1192116Z Download action repository 'Ana06/get-changed-files@v2.1.0' (SHA:a6591c950d92e67595be3ccd71324cef32c4b7ab)
2022-08-03T12:59:22.4190561Z Download action repository 'actions/upload-artifact@v3' (SHA:3cea5372237819ed00197afe530f5a7ea3e805c8)
2022-08-03T12:59:22.8512821Z ##[group]Run actions/checkout@v3
2022-08-03T12:59:22.8513144Z with:
2022-08-03T12:59:22.8513396Z   repository: KirillNichiporov/03
2022-08-03T12:59:22.8513913Z   token: ***
2022-08-03T12:59:22.8514136Z   ssh-strict: true
2022-08-03T12:59:22.8514395Z   persist-credentials: true
2022-08-03T12:59:22.8514641Z   clean: true
2022-08-03T12:59:22.8514855Z   fetch-depth: 1
2022-08-03T12:59:22.8515057Z   lfs: false
2022-08-03T12:59:22.8515267Z   submodules: false
2022-08-03T12:59:22.8515510Z   set-safe-directory: true
2022-08-03T12:59:22.8515741Z ##[endgroup]
2022-08-03T12:59:23.1114515Z Syncing repository: KirillNichiporov/03
2022-08-03T12:59:23.1117759Z ##[group]Getting Git version info
2022-08-03T12:59:23.1118296Z Working directory is '/home/runner/work/03/03'
2022-08-03T12:59:23.1134382Z [command]/usr/bin/git version
2022-08-03T12:59:23.1256733Z git version 2.37.1
2022-08-03T12:59:23.1283135Z ##[endgroup]
2022-08-03T12:59:23.1300522Z Temporarily overriding HOME='/home/runner/work/_temp/99c5ccb4-3b61-40f2-9bda-fb5c70e86857' before making global git config changes
2022-08-03T12:59:23.1302346Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T12:59:23.1307826Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03/03
2022-08-03T12:59:23.1351326Z Deleting the contents of '/home/runner/work/03/03'
2022-08-03T12:59:23.1356418Z ##[group]Initializing the repository
2022-08-03T12:59:23.1360121Z [command]/usr/bin/git init /home/runner/work/03/03
2022-08-03T12:59:23.1433527Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-08-03T12:59:23.1434246Z hint: is subject to change. To configure the initial branch name to use in all
2022-08-03T12:59:23.1435354Z hint: of your new repositories, which will suppress this warning, call:
2022-08-03T12:59:23.1435968Z hint: 
2022-08-03T12:59:23.1436877Z hint: 	git config --global init.defaultBranch <name>
2022-08-03T12:59:23.1437262Z hint: 
2022-08-03T12:59:23.1438097Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-08-03T12:59:23.1438683Z hint: 'development'. The just-created branch can be renamed via this command:
2022-08-03T12:59:23.1439099Z hint: 
2022-08-03T12:59:23.1439831Z hint: 	git branch -m <name>
2022-08-03T12:59:23.1451949Z Initialized empty Git repository in /home/runner/work/03/03/.git/
2022-08-03T12:59:23.1461745Z [command]/usr/bin/git remote add origin https://github.com/KirillNichiporov/03
2022-08-03T12:59:23.1503975Z ##[endgroup]
2022-08-03T12:59:23.1504579Z ##[group]Disabling automatic garbage collection
2022-08-03T12:59:23.1510499Z [command]/usr/bin/git config --local gc.auto 0
2022-08-03T12:59:23.1540767Z ##[endgroup]
2022-08-03T12:59:23.1541319Z ##[group]Setting up auth
2022-08-03T12:59:23.1550849Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T12:59:23.1585263Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T12:59:23.1906269Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T12:59:23.1929925Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T12:59:23.2154356Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-08-03T12:59:23.2185239Z ##[endgroup]
2022-08-03T12:59:23.2186524Z ##[group]Fetching the repository
2022-08-03T12:59:23.2197155Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +c3fee811dc59df1e2a8cea1b4a5230883e27bd59:refs/remotes/pull/7/merge
2022-08-03T12:59:23.4099359Z remote: Enumerating objects: 11, done.        
2022-08-03T12:59:23.4151204Z remote: Counting objects:   9% (1/11)        
2022-08-03T12:59:23.4151824Z remote: Counting objects:  18% (2/11)        
2022-08-03T12:59:23.4152363Z remote: Counting objects:  27% (3/11)        
2022-08-03T12:59:23.4152892Z remote: Counting objects:  36% (4/11)        
2022-08-03T12:59:23.4153425Z remote: Counting objects:  45% (5/11)        
2022-08-03T12:59:23.4153950Z remote: Counting objects:  54% (6/11)        
2022-08-03T12:59:23.4154454Z remote: Counting objects:  63% (7/11)        
2022-08-03T12:59:23.4154965Z remote: Counting objects:  72% (8/11)        
2022-08-03T12:59:23.4155450Z remote: Counting objects:  81% (9/11)        
2022-08-03T12:59:23.4156464Z remote: Counting objects:  90% (10/11)        
2022-08-03T12:59:23.4156736Z remote: Counting objects: 100% (11/11)        
2022-08-03T12:59:23.4157022Z remote: Counting objects: 100% (11/11), done.        
2022-08-03T12:59:23.4157344Z remote: Compressing objects:  16% (1/6)        
2022-08-03T12:59:23.4157624Z remote: Compressing objects:  33% (2/6)        
2022-08-03T12:59:23.4157899Z remote: Compressing objects:  50% (3/6)        
2022-08-03T12:59:23.4158181Z remote: Compressing objects:  66% (4/6)        
2022-08-03T12:59:23.4158458Z remote: Compressing objects:  83% (5/6)        
2022-08-03T12:59:23.4158739Z remote: Compressing objects: 100% (6/6)        
2022-08-03T12:59:23.4159033Z remote: Compressing objects: 100% (6/6), done.        
2022-08-03T12:59:23.4159638Z remote: Total 11 (delta 1), reused 7 (delta 0), pack-reused 0        
2022-08-03T12:59:23.4213843Z From https://github.com/KirillNichiporov/03
2022-08-03T12:59:23.4214577Z  * [new ref]         c3fee811dc59df1e2a8cea1b4a5230883e27bd59 -> pull/7/merge
2022-08-03T12:59:23.4256921Z ##[endgroup]
2022-08-03T12:59:23.4257810Z ##[group]Determining the checkout info
2022-08-03T12:59:23.4258857Z ##[endgroup]
2022-08-03T12:59:23.4259434Z ##[group]Checking out the ref
2022-08-03T12:59:23.4260716Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/7/merge
2022-08-03T12:59:23.4306776Z Note: switching to 'refs/remotes/pull/7/merge'.
2022-08-03T12:59:23.4387768Z 
2022-08-03T12:59:23.4388224Z You are in 'detached HEAD' state. You can look around, make experimental
2022-08-03T12:59:23.4388666Z changes and commit them, and you can discard any commits you make in this
2022-08-03T12:59:23.4389059Z state without impacting any branches by switching back to a branch.
2022-08-03T12:59:23.4389285Z 
2022-08-03T12:59:23.4389453Z If you want to create a new branch to retain commits you create, you may
2022-08-03T12:59:23.4389917Z do so (now or later) by using -c with the switch command. Example:
2022-08-03T12:59:23.4390122Z 
2022-08-03T12:59:23.4390295Z   git switch -c <new-branch-name>
2022-08-03T12:59:23.4390462Z 
2022-08-03T12:59:23.4390572Z Or undo this operation with:
2022-08-03T12:59:23.4390722Z 
2022-08-03T12:59:23.4390807Z   git switch -
2022-08-03T12:59:23.4390996Z 
2022-08-03T12:59:23.4391196Z Turn off this advice by setting config variable advice.detachedHead to false
2022-08-03T12:59:23.4391867Z 
2022-08-03T12:59:23.4392135Z HEAD is now at c3fee81 Merge 8fe2201dbd2d568de30b92f04cff592b7985708b into e5720be48941a9be4401aee7c1ca14e9a702e3c2
2022-08-03T12:59:23.4392956Z ##[endgroup]
2022-08-03T12:59:23.4393293Z [command]/usr/bin/git log -1 --format='%H'
2022-08-03T12:59:23.4394110Z 'c3fee811dc59df1e2a8cea1b4a5230883e27bd59'
2022-08-03T12:59:23.4684418Z ##[group]Run Ana06/get-changed-files@v2.1.0
2022-08-03T12:59:23.4684706Z with:
2022-08-03T12:59:23.4684904Z   format: csv
2022-08-03T12:59:23.4685095Z   filter: *
2022-08-03T12:59:23.4685459Z   token: ***
2022-08-03T12:59:23.4685654Z ##[endgroup]
2022-08-03T12:59:23.6882887Z Base commit: e5720be48941a9be4401aee7c1ca14e9a702e3c2
2022-08-03T12:59:23.6883427Z Head commit: 8fe2201dbd2d568de30b92f04cff592b7985708b
2022-08-03T12:59:23.9517073Z All: .github/workflows/04gitops.yml
2022-08-03T12:59:23.9517430Z Added: 
2022-08-03T12:59:23.9517701Z Modified: .github/workflows/04gitops.yml
2022-08-03T12:59:23.9517967Z Removed: 
2022-08-03T12:59:23.9518192Z Renamed: 
2022-08-03T12:59:23.9518463Z Added or modified: .github/workflows/04gitops.yml
2022-08-03T12:59:23.9519546Z 
2022-08-03T12:59:23.9540510Z 
2022-08-03T12:59:23.9543419Z 
2022-08-03T12:59:23.9543735Z 
2022-08-03T12:59:23.9544021Z 
2022-08-03T12:59:23.9544274Z 
2022-08-03T12:59:23.9544545Z 
2022-08-03T12:59:23.9686485Z ##[group]Run mapfile -d ',' -t added_modified_files < <(printf '%s,' '.github/workflows/04gitops.yml')
2022-08-03T12:59:23.9687067Z [36;1mmapfile -d ',' -t added_modified_files < <(printf '%s,' '.github/workflows/04gitops.yml')[0m
2022-08-03T12:59:23.9687496Z [36;1mfor added_modified_file in "${added_modified_files[@]}"; do[0m
2022-08-03T12:59:23.9687930Z [36;1mecho $(grep -o $'\t' ${added_modified_file} | wc -l) tabs - ${added_modified_file} >> 04gitops.log 2>&1 [0m
2022-08-03T12:59:23.9688262Z [36;1mdone[0m
2022-08-03T12:59:23.9746240Z shell: /usr/bin/bash -e {0}
2022-08-03T12:59:23.9746517Z ##[endgroup]
2022-08-03T12:59:23.9965716Z ##[group]Run actions/upload-artifact@v3
2022-08-03T12:59:23.9965969Z with:
2022-08-03T12:59:23.9966167Z   path: 04gitops.log
2022-08-03T12:59:23.9966381Z   name: artifact
2022-08-03T12:59:23.9966598Z   if-no-files-found: warn
2022-08-03T12:59:23.9966817Z ##[endgroup]
2022-08-03T12:59:24.0604180Z With the provided path, there will be 1 file uploaded
2022-08-03T12:59:24.0608270Z Starting artifact upload
2022-08-03T12:59:24.0609335Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-08-03T12:59:24.0610544Z Artifact name is valid!
2022-08-03T12:59:24.1350094Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-08-03T12:59:24.2036925Z Total size of all the files uploaded is 40 bytes
2022-08-03T12:59:24.2037343Z File upload process has finished. Finalizing the artifact upload
2022-08-03T12:59:24.2530772Z Artifact has been finalized. All files have been successfully uploaded!
2022-08-03T12:59:24.2531038Z 
2022-08-03T12:59:24.2531217Z The raw size of all the files that were specified for upload is 40 bytes
2022-08-03T12:59:24.2531708Z The size of all the files that were uploaded is 40 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-08-03T12:59:24.2532188Z 
2022-08-03T12:59:24.2532884Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-08-03T12:59:24.2533271Z 
2022-08-03T12:59:24.2533420Z Artifact artifact has been successfully uploaded!
2022-08-03T12:59:24.2613025Z Post job cleanup.
2022-08-03T12:59:24.3802376Z [command]/usr/bin/git version
2022-08-03T12:59:24.3845475Z git version 2.37.1
2022-08-03T12:59:24.3890553Z Temporarily overriding HOME='/home/runner/work/_temp/a53e32f7-c9be-4857-8ede-0e0b2f04b039' before making global git config changes
2022-08-03T12:59:24.3891593Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T12:59:24.3896103Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03/03
2022-08-03T12:59:24.3933374Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T12:59:24.3967108Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T12:59:24.4258665Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T12:59:24.4334726Z http.https://github.com/.extraheader
2022-08-03T12:59:24.4347641Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-08-03T12:59:24.4389483Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T12:59:24.4833876Z Cleaning up orphan processes
```
