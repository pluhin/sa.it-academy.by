##04.GITops

##link to action file
https://github.com/voyager1122/04.Gitops/blob/main/.github/workflows/check_files.yaml

##link to testing repository
https://github.com/voyager1122/04.Gitops

##log of pipeline

``` bash
2022-04-28T13:04:17.2771863Z Requested labels: ubuntu-latest
2022-04-28T13:04:17.2771944Z Job defined at: voyager1122/04.Gitops/.github/workflows/check_files.yaml@refs/heads/main
2022-04-28T13:04:17.2771969Z Waiting for a runner to pick up this job...
2022-04-28T13:04:17.9912503Z Job is waiting for a hosted runner to come online.
2022-04-28T13:04:22.6667465Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-04-28T13:04:25.6007539Z Current runner version: '2.290.1'
2022-04-28T13:04:25.6033664Z ##[group]Operating System
2022-04-28T13:04:25.6034222Z Ubuntu
2022-04-28T13:04:25.6034470Z 20.04.4
2022-04-28T13:04:25.6034758Z LTS
2022-04-28T13:04:25.6035058Z ##[endgroup]
2022-04-28T13:04:25.6035392Z ##[group]Virtual Environment
2022-04-28T13:04:25.6035781Z Environment: ubuntu-20.04
2022-04-28T13:04:25.6036128Z Version: 20220425.1
2022-04-28T13:04:25.6036614Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220425.1/images/linux/Ubuntu2004-Readme.md
2022-04-28T13:04:25.6037295Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220425.1
2022-04-28T13:04:25.6037807Z ##[endgroup]
2022-04-28T13:04:25.6038124Z ##[group]Virtual Environment Provisioner
2022-04-28T13:04:25.6038504Z 1.0.0.0-main-20220421-1
2022-04-28T13:04:25.6038849Z ##[endgroup]
2022-04-28T13:04:25.6039487Z ##[group]GITHUB_TOKEN Permissions
2022-04-28T13:04:25.6040025Z Contents: read
2022-04-28T13:04:25.6040517Z Metadata: read
2022-04-28T13:04:25.6040823Z ##[endgroup]
2022-04-28T13:04:25.6044492Z Secret source: Actions
2022-04-28T13:04:25.6044994Z Prepare workflow directory
2022-04-28T13:04:25.6891990Z Prepare all required actions
2022-04-28T13:04:25.7074628Z Getting action download info
2022-04-28T13:04:25.9069274Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-04-28T13:04:26.2388000Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-04-28T13:04:26.4751462Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-04-28T13:04:26.8110345Z Getting action download info
2022-04-28T13:04:26.9864195Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-04-28T13:04:27.3628647Z ##[group]Run actions/checkout@v2
2022-04-28T13:04:27.3628940Z with:
2022-04-28T13:04:27.3629129Z   fetch-depth: 0
2022-04-28T13:04:27.3629382Z   repository: voyager1122/04.Gitops
2022-04-28T13:04:27.3629875Z   token: ***
2022-04-28T13:04:27.3630070Z   ssh-strict: true
2022-04-28T13:04:27.3630313Z   persist-credentials: true
2022-04-28T13:04:27.3630536Z   clean: true
2022-04-28T13:04:27.3630714Z   lfs: false
2022-04-28T13:04:27.3630908Z   submodules: false
2022-04-28T13:04:27.3631145Z   set-safe-directory: true
2022-04-28T13:04:27.3631362Z ##[endgroup]
2022-04-28T13:04:27.5980282Z Syncing repository: voyager1122/04.Gitops
2022-04-28T13:04:27.5982169Z ##[group]Getting Git version info
2022-04-28T13:04:27.5982678Z Working directory is '/home/runner/work/04.Gitops/04.Gitops'
2022-04-28T13:04:27.5983189Z [command]/usr/bin/git version
2022-04-28T13:04:27.6154798Z git version 2.36.0
2022-04-28T13:04:27.6155746Z ##[endgroup]
2022-04-28T13:04:27.6170069Z Temporarily overriding HOME='/home/runner/work/_temp/22edb06c-8b35-422c-8de6-064e9f3e3843' before making global git config changes
2022-04-28T13:04:27.6170598Z Adding repository directory to the temporary git global config as a safe directory
2022-04-28T13:04:27.6171164Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.Gitops/04.Gitops
2022-04-28T13:04:27.6177685Z Deleting the contents of '/home/runner/work/04.Gitops/04.Gitops'
2022-04-28T13:04:27.6180640Z ##[group]Initializing the repository
2022-04-28T13:04:27.6184038Z [command]/usr/bin/git init /home/runner/work/04.Gitops/04.Gitops
2022-04-28T13:04:27.6245029Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-04-28T13:04:27.6245773Z hint: is subject to change. To configure the initial branch name to use in all
2022-04-28T13:04:27.6247261Z hint: of your new repositories, which will suppress this warning, call:
2022-04-28T13:04:27.6247736Z hint: 
2022-04-28T13:04:27.6248625Z hint: 	git config --global init.defaultBranch <name>
2022-04-28T13:04:27.6248981Z hint: 
2022-04-28T13:04:27.6249801Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-04-28T13:04:27.6250634Z hint: 'development'. The just-created branch can be renamed via this command:
2022-04-28T13:04:27.6251042Z hint: 
2022-04-28T13:04:27.6251324Z hint: 	git branch -m <name>
2022-04-28T13:04:27.6257303Z Initialized empty Git repository in /home/runner/work/04.Gitops/04.Gitops/.git/
2022-04-28T13:04:27.6309095Z [command]/usr/bin/git remote add origin https://github.com/voyager1122/04.Gitops
2022-04-28T13:04:27.6348350Z ##[endgroup]
2022-04-28T13:04:27.6349095Z ##[group]Disabling automatic garbage collection
2022-04-28T13:04:27.6352965Z [command]/usr/bin/git config --local gc.auto 0
2022-04-28T13:04:27.6383889Z ##[endgroup]
2022-04-28T13:04:27.6384864Z ##[group]Setting up auth
2022-04-28T13:04:27.6391968Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-04-28T13:04:27.6425583Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-04-28T13:04:27.6783527Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-04-28T13:04:27.6852478Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-04-28T13:04:27.7049238Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-04-28T13:04:27.7077919Z ##[endgroup]
2022-04-28T13:04:27.7078698Z ##[group]Fetching the repository
2022-04-28T13:04:27.7086789Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-04-28T13:04:27.9681225Z remote: Enumerating objects: 11, done.        
2022-04-28T13:04:27.9685597Z remote: Counting objects:   9% (1/11)        
2022-04-28T13:04:27.9686765Z remote: Counting objects:  18% (2/11)        
2022-04-28T13:04:27.9687313Z remote: Counting objects:  27% (3/11)        
2022-04-28T13:04:27.9688045Z remote: Counting objects:  36% (4/11)        
2022-04-28T13:04:27.9688545Z remote: Counting objects:  45% (5/11)        
2022-04-28T13:04:27.9689267Z remote: Counting objects:  54% (6/11)        
2022-04-28T13:04:27.9689760Z remote: Counting objects:  63% (7/11)        
2022-04-28T13:04:27.9690473Z remote: Counting objects:  72% (8/11)        
2022-04-28T13:04:27.9690948Z remote: Counting objects:  81% (9/11)        
2022-04-28T13:04:27.9691676Z remote: Counting objects:  90% (10/11)        
2022-04-28T13:04:27.9692175Z remote: Counting objects: 100% (11/11)        
2022-04-28T13:04:27.9692906Z remote: Counting objects: 100% (11/11), done.        
2022-04-28T13:04:27.9693411Z remote: Compressing objects:  20% (1/5)        
2022-04-28T13:04:27.9694153Z remote: Compressing objects:  40% (2/5)        
2022-04-28T13:04:27.9694665Z remote: Compressing objects:  60% (3/5)        
2022-04-28T13:04:27.9695391Z remote: Compressing objects:  80% (4/5)        
2022-04-28T13:04:27.9695890Z remote: Compressing objects: 100% (5/5)        
2022-04-28T13:04:27.9696659Z remote: Compressing objects: 100% (5/5), done.        
2022-04-28T13:04:27.9697903Z remote: Total 11 (delta 0), reused 11 (delta 0), pack-reused 0        
2022-04-28T13:04:27.9774321Z From https://github.com/voyager1122/04.Gitops
2022-04-28T13:04:27.9775040Z  * [new branch]      main       -> origin/main
2022-04-28T13:04:27.9813657Z [command]/usr/bin/git branch --list --remote origin/main
2022-04-28T13:04:27.9844403Z   origin/main
2022-04-28T13:04:27.9853851Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-04-28T13:04:27.9880855Z 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:27.9886027Z ##[endgroup]
2022-04-28T13:04:27.9886709Z ##[group]Determining the checkout info
2022-04-28T13:04:27.9888305Z ##[endgroup]
2022-04-28T13:04:27.9888980Z ##[group]Checking out the ref
2022-04-28T13:04:27.9893111Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-04-28T13:04:27.9939092Z Switched to a new branch 'main'
2022-04-28T13:04:27.9942931Z branch 'main' set up to track 'origin/main'.
2022-04-28T13:04:27.9945559Z ##[endgroup]
2022-04-28T13:04:27.9987606Z [command]/usr/bin/git log -1 --format='%H'
2022-04-28T13:04:28.0015009Z '31a2cf44a18d68f866275cbed15b9f3d74ffe1c9'
2022-04-28T13:04:28.0366945Z ##[group]Run tj-actions/changed-files@v19
2022-04-28T13:04:28.0367207Z with:
2022-04-28T13:04:28.0367631Z   token: ***
2022-04-28T13:04:28.0367815Z   separator:  
2022-04-28T13:04:28.0368026Z   files_separator: 

2022-04-28T13:04:28.0368254Z   files_ignore_separator: 

2022-04-28T13:04:28.0368503Z   sha: 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:28.0368774Z   since_last_remote_commit: false
2022-04-28T13:04:28.0369001Z   use_fork_point: false
2022-04-28T13:04:28.0369198Z   quotepath: true
2022-04-28T13:04:28.0369392Z ##[endgroup]
2022-04-28T13:04:28.0661452Z ##[group]Run # "Set base sha..."
2022-04-28T13:04:28.0661760Z [36;1m# "Set base sha..."[0m
2022-04-28T13:04:28.0662004Z [36;1mif [[ -n "" ]]; then[0m
2022-04-28T13:04:28.0662260Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-04-28T13:04:28.0662606Z [36;1melif [[ "false" == "true" && "ff2336e95085cc51b18be14363dfda036837e3ba" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-04-28T13:04:28.0663018Z [36;1m    echo "::set-output name=base_sha::ff2336e95085cc51b18be14363dfda036837e3ba"[0m
2022-04-28T13:04:28.0663293Z [36;1mfi[0m
2022-04-28T13:04:28.0718453Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-04-28T13:04:28.0718743Z ##[endgroup]
2022-04-28T13:04:28.0920690Z ##[group]Run # "Calculating the previous and current SHA..."
2022-04-28T13:04:28.0921122Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-04-28T13:04:28.0921580Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-04-28T13:04:28.0970746Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-04-28T13:04:28.0971117Z env:
2022-04-28T13:04:28.0971512Z   GITHUB_SERVER_URL: https://github.com
2022-04-28T13:04:28.0971850Z   GITHUB_REPOSITORY: voyager1122/04.Gitops
2022-04-28T13:04:28.0972169Z   GITHUB_BASE_REF: 
2022-04-28T13:04:28.0972445Z   GITHUB_HEAD_REF: 
2022-04-28T13:04:28.0972766Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-04-28T13:04:28.0973356Z   INPUT_SHA: 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:28.0973685Z   INPUT_BASE_SHA: 
2022-04-28T13:04:28.0974195Z   INPUT_TOKEN: ***
2022-04-28T13:04:28.0974474Z   INPUT_PATH: 
2022-04-28T13:04:28.0974746Z   INPUT_USE_FORK_POINT: false
2022-04-28T13:04:28.0975050Z ##[endgroup]
2022-04-28T13:04:28.1068860Z ##[group]changed-files-diff-sha
2022-04-28T13:04:28.1112831Z Resolving repository path...
2022-04-28T13:04:28.1139785Z Setting up 'temp_changed_files' remote...
2022-04-28T13:04:28.1178612Z No 'temp_changed_files' remote found
2022-04-28T13:04:28.1179164Z Creating 'temp_changed_files' remote...
2022-04-28T13:04:28.1213944Z Getting HEAD SHA...
2022-04-28T13:04:28.3658531Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-04-28T13:04:28.3682722Z From https://github.com/voyager1122/04.Gitops
2022-04-28T13:04:28.3683586Z  * [new branch]      main       -> temp_changed_files/main
2022-04-28T13:04:28.3789900Z ##[endgroup]
2022-04-28T13:04:28.3841207Z ##[group]Run tj-actions/glob@v7.16
2022-04-28T13:04:28.3841525Z with:
2022-04-28T13:04:28.3841805Z   files-separator: 

2022-04-28T13:04:28.3842090Z   escape-paths: true
2022-04-28T13:04:28.3842401Z   excluded-files-separator: 

2022-04-28T13:04:28.3842777Z   base-sha: ff2336e95085cc51b18be14363dfda036837e3ba
2022-04-28T13:04:28.3843094Z   sha: 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:28.3843432Z   include-deleted-files: true
2022-04-28T13:04:28.3843757Z   separator: |
2022-04-28T13:04:28.3844077Z   files-from-source-file-separator: 

2022-04-28T13:04:28.3844440Z   excluded-files-from-source-file-separator: 

2022-04-28T13:04:28.3844810Z   follow-symbolic-links: true
2022-04-28T13:04:28.3845269Z   strip-top-level-dir: true
2022-04-28T13:04:28.3845520Z ##[endgroup]
2022-04-28T13:04:28.4515433Z [command]/usr/bin/git rev-parse --show-toplevel
2022-04-28T13:04:28.4553206Z /home/runner/work/04.Gitops/04.Gitops
2022-04-28T13:04:28.4583931Z [command]/usr/bin/git diff --diff-filter=D --name-only ff2336e95085cc51b18be14363dfda036837e3ba 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:28.4617225Z 
2022-04-28T13:04:28.4709453Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-04-28T13:04:28.4709806Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-04-28T13:04:28.4760605Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-04-28T13:04:28.4760937Z env:
2022-04-28T13:04:28.4761272Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-04-28T13:04:28.4761716Z   INPUT_FILES_PATTERN_FILE: 
2022-04-28T13:04:28.4761975Z   INPUT_SEPARATOR:  
2022-04-28T13:04:28.4762245Z   INPUT_PATH: 
2022-04-28T13:04:28.4762561Z   INPUT_PREVIOUS_SHA: ff2336e95085cc51b18be14363dfda036837e3ba
2022-04-28T13:04:28.4877613Z   INPUT_CURRENT_SHA: 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9
2022-04-28T13:04:28.4877999Z   INPUT_TARGET_BRANCH: main
2022-04-28T13:04:28.4878242Z   INPUT_CURRENT_BRANCH: main
2022-04-28T13:04:28.4878463Z   INPUT_QUOTEPATH: true
2022-04-28T13:04:28.4878692Z ##[endgroup]
2022-04-28T13:04:28.4988756Z ##[group]changed-files
2022-04-28T13:04:28.4989360Z Resolving repository path...
2022-04-28T13:04:28.4990686Z Retrieving changes between ff2336e95085cc51b18be14363dfda036837e3ba (main) → 31a2cf44a18d68f866275cbed15b9f3d74ffe1c9 (main)
2022-04-28T13:04:28.4991225Z Getting diff...
2022-04-28T13:04:28.7924851Z Added files: 
2022-04-28T13:04:28.7925684Z Copied files: 
2022-04-28T13:04:28.7925954Z Deleted files: 
2022-04-28T13:04:28.7926190Z Modified files: firts.txt second.txt
2022-04-28T13:04:28.7926431Z Renamed files: 
2022-04-28T13:04:28.7926642Z Type Changed files: 
2022-04-28T13:04:28.7926842Z Unmerged files: 
2022-04-28T13:04:28.7927048Z Unknown files: 
2022-04-28T13:04:28.7927330Z All changed and modified files: firts.txt second.txt
2022-04-28T13:04:28.7927603Z All changed files: firts.txt second.txt
2022-04-28T13:04:28.7927873Z All modified files: firts.txt second.txt
2022-04-28T13:04:28.7932228Z ##[endgroup]
2022-04-28T13:04:28.8046092Z ##[group]Run for file in firts.txt second.txt; do
2022-04-28T13:04:28.8046407Z [36;1mfor file in firts.txt second.txt; do[0m
2022-04-28T13:04:28.8046693Z [36;1m  echo "$file was changed" >> report.txt 2>&1[0m
2022-04-28T13:04:28.8047028Z [36;1m  echo "Tabs quantity: `grep -P '\t' $file | wc -l`" >> report.txt 2>&1 [0m
2022-04-28T13:04:28.8047294Z [36;1mdone[0m
2022-04-28T13:04:28.8096655Z shell: /usr/bin/bash -e {0}
2022-04-28T13:04:28.8096879Z ##[endgroup]
2022-04-28T13:04:28.8243593Z ##[group]Run actions/upload-artifact@v2
2022-04-28T13:04:28.8243830Z with:
2022-04-28T13:04:28.8244030Z   path: report.txt
2022-04-28T13:04:28.8244235Z   name: artifact
2022-04-28T13:04:28.8244441Z   if-no-files-found: warn
2022-04-28T13:04:28.8244671Z ##[endgroup]
2022-04-28T13:04:28.8807567Z With the provided path, there will be 1 file uploaded
2022-04-28T13:04:28.8810819Z Starting artifact upload
2022-04-28T13:04:28.8811987Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-04-28T13:04:28.8813089Z Artifact name is valid!
2022-04-28T13:04:28.9340006Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-04-28T13:04:29.0431880Z Total size of all the files uploaded is 69 bytes
2022-04-28T13:04:29.0449032Z File upload process has finished. Finalizing the artifact upload
2022-04-28T13:04:29.0760216Z Artifact has been finalized. All files have been successfully uploaded!
2022-04-28T13:04:29.0762091Z 
2022-04-28T13:04:29.0762500Z The raw size of all the files that were specified for upload is 79 bytes
2022-04-28T13:04:29.0763453Z The size of all the files that were uploaded is 69 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-04-28T13:04:29.0764303Z 
2022-04-28T13:04:29.0765491Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-04-28T13:04:29.0766103Z 
2022-04-28T13:04:29.0767793Z Artifact artifact has been successfully uploaded!
2022-04-28T13:04:29.0928062Z Post job cleanup.
2022-04-28T13:04:29.0964326Z Post job cleanup.
2022-04-28T13:04:29.1478603Z Post job cleanup.
2022-04-28T13:04:29.2675086Z [command]/usr/bin/git version
2022-04-28T13:04:29.2718781Z git version 2.36.0
2022-04-28T13:04:29.2753016Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/f7f431cc-22e1-4797-b628-65819d00cf04/.gitconfig'
2022-04-28T13:04:29.2762944Z Temporarily overriding HOME='/home/runner/work/_temp/f7f431cc-22e1-4797-b628-65819d00cf04' before making global git config changes
2022-04-28T13:04:29.2763712Z Adding repository directory to the temporary git global config as a safe directory
2022-04-28T13:04:29.2767431Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.Gitops/04.Gitops
2022-04-28T13:04:29.2808141Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-04-28T13:04:29.2895381Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-04-28T13:04:29.3137002Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-04-28T13:04:29.3200031Z http.https://github.com/.extraheader
2022-04-28T13:04:29.3208793Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-04-28T13:04:29.3246181Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-04-28T13:04:29.3681269Z Cleaning up orphan processes
``` 


