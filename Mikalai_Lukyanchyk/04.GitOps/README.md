# **04.GitOps**

## **Links to projects**

[Github](https://github.com/Lukyanchyk/03.-GIT.-Hosting)<br>
[Link to yaml](https://github.com/Lukyanchyk/03.-GIT.-Hosting/tree/master/.github/workflows)

## **YAML** ##
```bash
name: 'tab count in modified files'
on:
  push:
  pull_request:
jobs:
  checkfile:
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@v3
    - id: files
      uses: jitterbit/get-changed-files@v1
      with:
        format: 'csv'
    - run: |
        mapfile -d ',' -t added_modified_files < <(printf '%s,' '${{ steps.files.outputs.added_modified }}')
        Tabs=0
        for added_modified_file in "${added_modified_files[@]}" 
        do
        echo "File ${added_modified_file} has $(grep -o $'\t' ${added_modified_file} | wc -l)" >> test_tab.log 2>&1
        Tabs=$(( ${Tabs} + $(grep -o $'\t' ${added_modified_file} | wc -l) ))
        done
        echo "Total tabs = ${Tabs}" >> test_tab.log
    - name: Upload artifact
      uses: actions/upload-artifact@v3
      with:
        path: test_tab.log
```

## **LOGS** ##
```bash
2023-02-26T12:04:11.8012259Z Requested labels: ubuntu-latest
2023-02-26T12:04:11.8012307Z Job defined at: Lukyanchyk/03.-GIT.-Hosting/.github/workflows/found_tabss2.yaml@refs/heads/master
2023-02-26T12:04:11.8012332Z Waiting for a runner to pick up this job...
2023-02-26T12:04:12.3696159Z Job is waiting for a hosted runner to come online.
2023-02-26T12:04:16.6779864Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2023-02-26T12:04:18.9482921Z Current runner version: '2.301.1'
2023-02-26T12:04:18.9510064Z ##[group]Operating System
2023-02-26T12:04:18.9510655Z Ubuntu
2023-02-26T12:04:18.9510953Z 22.04.2
2023-02-26T12:04:18.9511187Z LTS
2023-02-26T12:04:18.9511577Z ##[endgroup]
2023-02-26T12:04:18.9511907Z ##[group]Runner Image
2023-02-26T12:04:18.9512231Z Image: ubuntu-22.04
2023-02-26T12:04:18.9512561Z Version: 20230219.1
2023-02-26T12:04:18.9513072Z Included Software: https://github.com/actions/runner-images/blob/ubuntu22/20230219.1/images/linux/Ubuntu2204-Readme.md
2023-02-26T12:04:18.9513702Z Image Release: https://github.com/actions/runner-images/releases/tag/ubuntu22%2F20230219.1
2023-02-26T12:04:18.9514162Z ##[endgroup]
2023-02-26T12:04:18.9514510Z ##[group]Runner Image Provisioner
2023-02-26T12:04:18.9514804Z 2.0.117.1
2023-02-26T12:04:18.9515097Z ##[endgroup]
2023-02-26T12:04:18.9515832Z ##[group]GITHUB_TOKEN Permissions
2023-02-26T12:04:18.9516400Z Contents: read
2023-02-26T12:04:18.9516676Z Metadata: read
2023-02-26T12:04:18.9517214Z Packages: read
2023-02-26T12:04:18.9517567Z ##[endgroup]
2023-02-26T12:04:18.9521225Z Secret source: Actions
2023-02-26T12:04:18.9521740Z Prepare workflow directory
2023-02-26T12:04:19.0328940Z Prepare all required actions
2023-02-26T12:04:19.0513755Z Getting action download info
2023-02-26T12:04:19.3657745Z Download action repository 'actions/checkout@v3' (SHA:ac593985615ec2ede58e132d2e21d2b1cbd6127c)
2023-02-26T12:04:20.0250075Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2023-02-26T12:04:20.4401628Z Download action repository 'actions/upload-artifact@v3' (SHA:0b7f8abb1508181956e8e162db84b466c27e18ce)
2023-02-26T12:04:21.0637832Z Complete job name: checkfile
2023-02-26T12:04:21.1510655Z ##[group]Run actions/checkout@v3
2023-02-26T12:04:21.1510971Z with:
2023-02-26T12:04:21.1511220Z   repository: Lukyanchyk/03.-GIT.-Hosting
2023-02-26T12:04:21.1511717Z   token: ***
2023-02-26T12:04:21.1511927Z   ssh-strict: true
2023-02-26T12:04:21.1512166Z   persist-credentials: true
2023-02-26T12:04:21.1512415Z   clean: true
2023-02-26T12:04:21.1512608Z   fetch-depth: 1
2023-02-26T12:04:21.1512811Z   lfs: false
2023-02-26T12:04:21.1513023Z   submodules: false
2023-02-26T12:04:21.1513253Z   set-safe-directory: true
2023-02-26T12:04:21.1513485Z ##[endgroup]
2023-02-26T12:04:21.4300450Z Syncing repository: Lukyanchyk/03.-GIT.-Hosting
2023-02-26T12:04:21.4351815Z ##[group]Getting Git version info
2023-02-26T12:04:21.4352430Z Working directory is '/home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting'
2023-02-26T12:04:21.4353018Z [command]/usr/bin/git version
2023-02-26T12:04:21.4391612Z git version 2.39.2
2023-02-26T12:04:21.4424937Z ##[endgroup]
2023-02-26T12:04:21.4443835Z Temporarily overriding HOME='/home/runner/work/_temp/ea73a0a1-0d02-498a-b271-7c7b15a916ad' before making global git config changes
2023-02-26T12:04:21.4444335Z Adding repository directory to the temporary git global config as a safe directory
2023-02-26T12:04:21.4444877Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting
2023-02-26T12:04:21.4492844Z Deleting the contents of '/home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting'
2023-02-26T12:04:21.4498491Z ##[group]Initializing the repository
2023-02-26T12:04:21.4502407Z [command]/usr/bin/git init /home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting
2023-02-26T12:04:21.4576133Z hint: Using 'master' as the name for the initial branch. This default branch name
2023-02-26T12:04:21.4577284Z hint: is subject to change. To configure the initial branch name to use in all
2023-02-26T12:04:21.4577787Z hint: of your new repositories, which will suppress this warning, call:
2023-02-26T12:04:21.4578056Z hint: 
2023-02-26T12:04:21.4578526Z hint: 	git config --global init.defaultBranch <name>
2023-02-26T12:04:21.4578783Z hint: 
2023-02-26T12:04:21.4579122Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2023-02-26T12:04:21.4579581Z hint: 'development'. The just-created branch can be renamed via this command:
2023-02-26T12:04:21.4580131Z hint: 
2023-02-26T12:04:21.4580384Z hint: 	git branch -m <name>
2023-02-26T12:04:21.4587960Z Initialized empty Git repository in /home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting/.git/
2023-02-26T12:04:21.4601739Z [command]/usr/bin/git remote add origin https://github.com/Lukyanchyk/03.-GIT.-Hosting
2023-02-26T12:04:21.4643036Z ##[endgroup]
2023-02-26T12:04:21.4643507Z ##[group]Disabling automatic garbage collection
2023-02-26T12:04:21.4648849Z [command]/usr/bin/git config --local gc.auto 0
2023-02-26T12:04:21.4682979Z ##[endgroup]
2023-02-26T12:04:21.4683591Z ##[group]Setting up auth
2023-02-26T12:04:21.4690606Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2023-02-26T12:04:21.4725564Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2023-02-26T12:04:21.5077776Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2023-02-26T12:04:21.5119554Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2023-02-26T12:04:21.5352128Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2023-02-26T12:04:21.5386542Z ##[endgroup]
2023-02-26T12:04:21.5387340Z ##[group]Fetching the repository
2023-02-26T12:04:21.5397882Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +f27a355b153fc55244b4166888e776c22198312b:refs/remotes/origin/master
2023-02-26T12:04:21.9128097Z remote: Enumerating objects: 18, done.        
2023-02-26T12:04:21.9128565Z remote: Counting objects:   5% (1/18)        
2023-02-26T12:04:21.9128856Z remote: Counting objects:  11% (2/18)        
2023-02-26T12:04:21.9129166Z remote: Counting objects:  16% (3/18)        
2023-02-26T12:04:21.9129423Z remote: Counting objects:  22% (4/18)        
2023-02-26T12:04:21.9129695Z remote: Counting objects:  27% (5/18)        
2023-02-26T12:04:21.9129965Z remote: Counting objects:  33% (6/18)        
2023-02-26T12:04:21.9130220Z remote: Counting objects:  38% (7/18)        
2023-02-26T12:04:21.9130488Z remote: Counting objects:  44% (8/18)        
2023-02-26T12:04:21.9130756Z remote: Counting objects:  50% (9/18)        
2023-02-26T12:04:21.9131012Z remote: Counting objects:  55% (10/18)        
2023-02-26T12:04:21.9131284Z remote: Counting objects:  61% (11/18)        
2023-02-26T12:04:21.9131559Z remote: Counting objects:  66% (12/18)        
2023-02-26T12:04:21.9131827Z remote: Counting objects:  72% (13/18)        
2023-02-26T12:04:21.9132080Z remote: Counting objects:  77% (14/18)        
2023-02-26T12:04:21.9132345Z remote: Counting objects:  83% (15/18)        
2023-02-26T12:04:21.9132609Z remote: Counting objects:  88% (16/18)        
2023-02-26T12:04:21.9132861Z remote: Counting objects:  94% (17/18)        
2023-02-26T12:04:21.9133121Z remote: Counting objects: 100% (18/18)        
2023-02-26T12:04:21.9133401Z remote: Counting objects: 100% (18/18), done.        
2023-02-26T12:04:21.9133690Z remote: Compressing objects:   9% (1/11)        
2023-02-26T12:04:21.9133977Z remote: Compressing objects:  18% (2/11)        
2023-02-26T12:04:21.9134257Z remote: Compressing objects:  27% (3/11)        
2023-02-26T12:04:21.9134522Z remote: Compressing objects:  36% (4/11)        
2023-02-26T12:04:21.9134802Z remote: Compressing objects:  45% (5/11)        
2023-02-26T12:04:21.9135075Z remote: Compressing objects:  54% (6/11)        
2023-02-26T12:04:21.9135352Z remote: Compressing objects:  63% (7/11)        
2023-02-26T12:04:21.9135610Z remote: Compressing objects:  72% (8/11)        
2023-02-26T12:04:21.9135881Z remote: Compressing objects:  81% (9/11)        
2023-02-26T12:04:21.9136167Z remote: Compressing objects:  90% (10/11)        
2023-02-26T12:04:21.9136685Z remote: Compressing objects: 100% (11/11)        
2023-02-26T12:04:21.9136979Z remote: Compressing objects: 100% (11/11), done.        
2023-02-26T12:04:21.9137616Z remote: Total 18 (delta 0), reused 13 (delta 0), pack-reused 0        
2023-02-26T12:04:21.9213825Z From https://github.com/Lukyanchyk/03.-GIT.-Hosting
2023-02-26T12:04:21.9214760Z  * [new ref]         f27a355b153fc55244b4166888e776c22198312b -> origin/master
2023-02-26T12:04:21.9242077Z ##[endgroup]
2023-02-26T12:04:21.9242714Z ##[group]Determining the checkout info
2023-02-26T12:04:21.9243698Z ##[endgroup]
2023-02-26T12:04:21.9244306Z ##[group]Checking out the ref
2023-02-26T12:04:21.9252616Z [command]/usr/bin/git checkout --progress --force -B master refs/remotes/origin/master
2023-02-26T12:04:21.9373145Z Reset branch 'master'
2023-02-26T12:04:21.9373548Z branch 'master' set up to track 'origin/master'.
2023-02-26T12:04:21.9374528Z ##[endgroup]
2023-02-26T12:04:21.9422669Z [command]/usr/bin/git log -1 --format='%H'
2023-02-26T12:04:21.9456287Z 'f27a355b153fc55244b4166888e776c22198312b'
2023-02-26T12:04:21.9792695Z ##[group]Run jitterbit/get-changed-files@v1
2023-02-26T12:04:21.9792966Z with:
2023-02-26T12:04:21.9793154Z   format: csv
2023-02-26T12:04:21.9793525Z   token: ***
2023-02-26T12:04:21.9793709Z ##[endgroup]
2023-02-26T12:04:23.9594150Z Base commit: 56c5a48a0c0cbe11cddcce316d0b0a0c3f61df20
2023-02-26T12:04:23.9594870Z Head commit: f27a355b153fc55244b4166888e776c22198312b
2023-02-26T12:04:24.3441163Z All: action_test.txt,second_master.txt,test1.txt
2023-02-26T12:04:24.3441883Z Added: 
2023-02-26T12:04:24.3443040Z Modified: second_master.txt,test1.txt
2023-02-26T12:04:24.3443463Z Removed: action_test.txt
2023-02-26T12:04:24.3443841Z Renamed: 
2023-02-26T12:04:24.3496478Z Added or modified: second_master.txt,test1.txt
2023-02-26T12:04:24.3525023Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3552183Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3554510Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3556615Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3558688Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3560770Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3562825Z ##[warning]The `set-output` command is deprecated and will be disabled soon. Please upgrade to using Environment Files. For more information see: https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/
2023-02-26T12:04:24.3677401Z ##[group]Run mapfile -d ',' -t added_modified_files < <(printf '%s,' 'second_master.txt,test1.txt')
2023-02-26T12:04:24.3677905Z [36;1mmapfile -d ',' -t added_modified_files < <(printf '%s,' 'second_master.txt,test1.txt')[0m
2023-02-26T12:04:24.3678209Z [36;1mTabs=0[0m
2023-02-26T12:04:24.3678655Z [36;1mfor added_modified_file in "${added_modified_files[@]}" [0m
2023-02-26T12:04:24.3678909Z [36;1mdo[0m
2023-02-26T12:04:24.3679224Z [36;1mecho "File ${added_modified_file} has $(grep -o $'\t' ${added_modified_file} | wc -l)" >> test_tab.log 2>&1[0m
2023-02-26T12:04:24.3679612Z [36;1mTabs=$(( ${Tabs} + $(grep -o $'\t' ${added_modified_file} | wc -l) ))[0m
2023-02-26T12:04:24.3679879Z [36;1mdone[0m
2023-02-26T12:04:24.3680103Z [36;1mecho "Total tabs = ${Tabs}" >> test_tab.log[0m
2023-02-26T12:04:24.3734879Z shell: /usr/bin/bash -e {0}
2023-02-26T12:04:24.3735125Z ##[endgroup]
2023-02-26T12:04:24.4023410Z ##[group]Run actions/upload-artifact@v3
2023-02-26T12:04:24.4023661Z with:
2023-02-26T12:04:24.4023857Z   path: test_tab.log
2023-02-26T12:04:24.4024050Z   name: artifact
2023-02-26T12:04:24.4024266Z   if-no-files-found: warn
2023-02-26T12:04:24.4024484Z ##[endgroup]
2023-02-26T12:04:24.4765595Z With the provided path, there will be 1 file uploaded
2023-02-26T12:04:24.4768414Z Starting artifact upload
2023-02-26T12:04:24.4769569Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2023-02-26T12:04:24.4770904Z Artifact name is valid!
2023-02-26T12:04:24.5654215Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2023-02-26T12:04:24.6635992Z Total size of all the files uploaded is 68 bytes
2023-02-26T12:04:24.6636475Z File upload process has finished. Finalizing the artifact upload
2023-02-26T12:04:24.8095005Z Artifact has been finalized. All files have been successfully uploaded!
2023-02-26T12:04:24.8097268Z 
2023-02-26T12:04:24.8097479Z The raw size of all the files that were specified for upload is 68 bytes
2023-02-26T12:04:24.8097994Z The size of all the files that were uploaded is 68 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2023-02-26T12:04:24.8098332Z 
2023-02-26T12:04:24.8099096Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2023-02-26T12:04:24.8099495Z 
2023-02-26T12:04:24.8102498Z Artifact artifact has been successfully uploaded!
2023-02-26T12:04:24.8202021Z Post job cleanup.
2023-02-26T12:04:24.9510664Z [command]/usr/bin/git version
2023-02-26T12:04:24.9561951Z git version 2.39.2
2023-02-26T12:04:24.9613446Z Temporarily overriding HOME='/home/runner/work/_temp/10a0e2d0-838d-4a42-8403-6c161535f424' before making global git config changes
2023-02-26T12:04:24.9614787Z Adding repository directory to the temporary git global config as a safe directory
2023-02-26T12:04:24.9620717Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03.-GIT.-Hosting/03.-GIT.-Hosting
2023-02-26T12:04:24.9663459Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2023-02-26T12:04:24.9700776Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2023-02-26T12:04:24.9933229Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2023-02-26T12:04:24.9963631Z http.https://github.com/.extraheader
2023-02-26T12:04:24.9974994Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2023-02-26T12:04:25.0013910Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2023-02-26T12:04:25.0445950Z Cleaning up orphan processes
```