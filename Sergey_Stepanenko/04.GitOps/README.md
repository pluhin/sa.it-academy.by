## 04.GITOPS HOMEWORK
### My action file
```bash
https://github.com/S-Stepanenko/Homework_04/blob/main/.github/workflows/tab_counter.yml
```
## Testing repository
https://github.com/S-Stepanenko/Homework_04

## Artifact file output
```bash
Tabs in file .github/workflows/tab_counter.yml: 0
Tabs in file test.txt: 12
```

## My pipeline log
```bash
2022-08-04T10:26:21.0479317Z Requested labels: ubuntu-latest
2022-08-04T10:26:21.0479355Z Job defined at: S-Stepanenko/Homework_04/.github/workflows/tab_counter.yml@refs/pull/1/merge
2022-08-04T10:26:21.0479374Z Waiting for a runner to pick up this job...
2022-08-04T10:26:21.3895598Z Job is waiting for a hosted runner to come online.
2022-08-04T10:26:25.2384674Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-08-04T10:26:29.1500161Z Current runner version: '2.294.0'
2022-08-04T10:26:29.1528324Z ##[group]Operating System
2022-08-04T10:26:29.1528894Z Ubuntu
2022-08-04T10:26:29.1529282Z 20.04.4
2022-08-04T10:26:29.1529523Z LTS
2022-08-04T10:26:29.1529820Z ##[endgroup]
2022-08-04T10:26:29.1530175Z ##[group]Virtual Environment
2022-08-04T10:26:29.1530565Z Environment: ubuntu-20.04
2022-08-04T10:26:29.1530905Z Version: 20220729.1
2022-08-04T10:26:29.1531448Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
2022-08-04T10:26:29.1532125Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
2022-08-04T10:26:29.1532563Z ##[endgroup]
2022-08-04T10:26:29.1532925Z ##[group]Virtual Environment Provisioner
2022-08-04T10:26:29.1533340Z 1.0.0.0-main-20220725-1
2022-08-04T10:26:29.1533628Z ##[endgroup]
2022-08-04T10:26:29.1534637Z ##[group]GITHUB_TOKEN Permissions
2022-08-04T10:26:29.1535239Z Actions: write
2022-08-04T10:26:29.1535734Z Checks: write
2022-08-04T10:26:29.1536066Z Contents: write
2022-08-04T10:26:29.1536397Z Deployments: write
2022-08-04T10:26:29.1536786Z Discussions: write
2022-08-04T10:26:29.1537062Z Issues: write
2022-08-04T10:26:29.1537386Z Metadata: read
2022-08-04T10:26:29.1537701Z Packages: write
2022-08-04T10:26:29.1537973Z Pages: write
2022-08-04T10:26:29.1538319Z PullRequests: write
2022-08-04T10:26:29.1538676Z RepositoryProjects: write
2022-08-04T10:26:29.1539011Z SecurityEvents: write
2022-08-04T10:26:29.1539341Z Statuses: write
2022-08-04T10:26:29.1539653Z ##[endgroup]
2022-08-04T10:26:29.1543199Z Secret source: Actions
2022-08-04T10:26:29.1543716Z Prepare workflow directory
2022-08-04T10:26:29.2399292Z Prepare all required actions
2022-08-04T10:26:29.2583306Z Getting action download info
2022-08-04T10:26:29.5097080Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-08-04T10:26:30.4295415Z Download action repository 'tj-actions/changed-files@v24' (SHA:6c44eb8294bb9c93d6118427f4ff8404b695e1d7)
2022-08-04T10:26:30.9613122Z Download action repository 'actions/upload-artifact@v3' (SHA:3cea5372237819ed00197afe530f5a7ea3e805c8)
2022-08-04T10:26:31.7939324Z Getting action download info
2022-08-04T10:26:31.9678355Z Download action repository 'tj-actions/glob@v9.2' (SHA:8852971095f57bebf1912233304340b43a79d3e3)
2022-08-04T10:26:32.7144520Z ##[group]Run actions/checkout@v3
2022-08-04T10:26:32.7144792Z with:
2022-08-04T10:26:32.7144987Z   fetch-depth: 0
2022-08-04T10:26:32.7145233Z   repository: S-Stepanenko/Homework_04
2022-08-04T10:26:32.7145724Z   token: ***
2022-08-04T10:26:32.7145911Z   ssh-strict: true
2022-08-04T10:26:32.7146134Z   persist-credentials: true
2022-08-04T10:26:32.7146344Z   clean: true
2022-08-04T10:26:32.7146516Z   lfs: false
2022-08-04T10:26:32.7146703Z   submodules: false
2022-08-04T10:26:32.7146917Z   set-safe-directory: true
2022-08-04T10:26:32.7147121Z ##[endgroup]
2022-08-04T10:26:32.9902830Z Syncing repository: S-Stepanenko/Homework_04
2022-08-04T10:26:32.9904734Z ##[group]Getting Git version info
2022-08-04T10:26:32.9905206Z Working directory is '/home/runner/work/Homework_04/Homework_04'
2022-08-04T10:26:32.9905704Z [command]/usr/bin/git version
2022-08-04T10:26:32.9970802Z git version 2.37.1
2022-08-04T10:26:33.0000296Z ##[endgroup]
2022-08-04T10:26:33.0022214Z Temporarily overriding HOME='/home/runner/work/_temp/fb2f239c-78a0-4fad-8f79-b50a085d8280' before making global git config changes
2022-08-04T10:26:33.0022690Z Adding repository directory to the temporary git global config as a safe directory
2022-08-04T10:26:33.0023206Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:33.0070333Z Deleting the contents of '/home/runner/work/Homework_04/Homework_04'
2022-08-04T10:26:33.0074054Z ##[group]Initializing the repository
2022-08-04T10:26:33.0077768Z [command]/usr/bin/git init /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:33.0155655Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-08-04T10:26:33.0156724Z hint: is subject to change. To configure the initial branch name to use in all
2022-08-04T10:26:33.0157139Z hint: of your new repositories, which will suppress this warning, call:
2022-08-04T10:26:33.0157405Z hint: 
2022-08-04T10:26:33.0157844Z hint: 	git config --global init.defaultBranch <name>
2022-08-04T10:26:33.0158076Z hint: 
2022-08-04T10:26:33.0158420Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-08-04T10:26:33.0158856Z hint: 'development'. The just-created branch can be renamed via this command:
2022-08-04T10:26:33.0159116Z hint: 
2022-08-04T10:26:33.0159353Z hint: 	git branch -m <name>
2022-08-04T10:26:33.0177051Z Initialized empty Git repository in /home/runner/work/Homework_04/Homework_04/.git/
2022-08-04T10:26:33.0194410Z [command]/usr/bin/git remote add origin https://github.com/S-Stepanenko/Homework_04
2022-08-04T10:26:33.0239457Z ##[endgroup]
2022-08-04T10:26:33.0239897Z ##[group]Disabling automatic garbage collection
2022-08-04T10:26:33.0250085Z [command]/usr/bin/git config --local gc.auto 0
2022-08-04T10:26:33.0274479Z ##[endgroup]
2022-08-04T10:26:33.0274900Z ##[group]Setting up auth
2022-08-04T10:26:33.0284616Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-04T10:26:33.0319838Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-04T10:26:33.0664066Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-04T10:26:33.0687977Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-04T10:26:33.0938746Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-08-04T10:26:33.0992539Z ##[endgroup]
2022-08-04T10:26:33.0992975Z ##[group]Fetching the repository
2022-08-04T10:26:33.0996097Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +10d9194010c2c113d2c4d07461e3e2a87f49813d:refs/remotes/pull/1/merge
2022-08-04T10:26:33.5896428Z remote: Enumerating objects: 15, done.        
2022-08-04T10:26:33.5897287Z remote: Counting objects:   6% (1/15)        
2022-08-04T10:26:33.5898052Z remote: Counting objects:  13% (2/15)        
2022-08-04T10:26:33.5898360Z remote: Counting objects:  20% (3/15)        
2022-08-04T10:26:33.5898607Z remote: Counting objects:  26% (4/15)        
2022-08-04T10:26:33.5898869Z remote: Counting objects:  33% (5/15)        
2022-08-04T10:26:33.5899120Z remote: Counting objects:  40% (6/15)        
2022-08-04T10:26:33.5899350Z remote: Counting objects:  46% (7/15)        
2022-08-04T10:26:33.5899593Z remote: Counting objects:  53% (8/15)        
2022-08-04T10:26:33.5899848Z remote: Counting objects:  60% (9/15)        
2022-08-04T10:26:33.5900078Z remote: Counting objects:  66% (10/15)        
2022-08-04T10:26:33.5900325Z remote: Counting objects:  73% (11/15)        
2022-08-04T10:26:33.5901252Z remote: Counting objects:  80% (12/15)        
2022-08-04T10:26:33.5901505Z remote: Counting objects:  86% (13/15)        
2022-08-04T10:26:33.5901750Z remote: Counting objects:  93% (14/15)        
2022-08-04T10:26:33.5902015Z remote: Counting objects: 100% (15/15)        
2022-08-04T10:26:33.5902274Z remote: Counting objects: 100% (15/15), done.        
2022-08-04T10:26:33.5902551Z remote: Compressing objects:  11% (1/9)        
2022-08-04T10:26:33.5902811Z remote: Compressing objects:  22% (2/9)        
2022-08-04T10:26:33.5903058Z remote: Compressing objects:  33% (3/9)        
2022-08-04T10:26:33.5903299Z remote: Compressing objects:  44% (4/9)        
2022-08-04T10:26:33.5903541Z remote: Compressing objects:  55% (5/9)        
2022-08-04T10:26:33.5904040Z remote: Compressing objects:  66% (6/9)        
2022-08-04T10:26:33.5904277Z remote: Compressing objects:  77% (7/9)        
2022-08-04T10:26:33.5904533Z remote: Compressing objects:  88% (8/9)        
2022-08-04T10:26:33.5904784Z remote: Compressing objects: 100% (9/9)        
2022-08-04T10:26:33.5905051Z remote: Compressing objects: 100% (9/9), done.        
2022-08-04T10:26:33.5905600Z remote: Total 15 (delta 1), reused 14 (delta 1), pack-reused 0        
2022-08-04T10:26:33.6030853Z From https://github.com/S-Stepanenko/Homework_04
2022-08-04T10:26:33.6031289Z  * [new branch]      dev                                      -> origin/dev
2022-08-04T10:26:33.6032323Z  * [new branch]      main                                     -> origin/main
2022-08-04T10:26:33.6032729Z  * [new ref]         10d9194010c2c113d2c4d07461e3e2a87f49813d -> pull/1/merge
2022-08-04T10:26:33.6164868Z ##[endgroup]
2022-08-04T10:26:33.6167866Z ##[group]Determining the checkout info
2022-08-04T10:26:33.6168275Z ##[endgroup]
2022-08-04T10:26:33.6168654Z ##[group]Checking out the ref
2022-08-04T10:26:33.6169207Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/1/merge
2022-08-04T10:26:33.6207400Z Note: switching to 'refs/remotes/pull/1/merge'.
2022-08-04T10:26:33.6207624Z 
2022-08-04T10:26:33.6207892Z You are in 'detached HEAD' state. You can look around, make experimental
2022-08-04T10:26:33.6208256Z changes and commit them, and you can discard any commits you make in this
2022-08-04T10:26:33.6208601Z state without impacting any branches by switching back to a branch.
2022-08-04T10:26:33.6208791Z 
2022-08-04T10:26:33.6208938Z If you want to create a new branch to retain commits you create, you may
2022-08-04T10:26:33.6209337Z do so (now or later) by using -c with the switch command. Example:
2022-08-04T10:26:33.6209520Z 
2022-08-04T10:26:33.6209679Z   git switch -c <new-branch-name>
2022-08-04T10:26:33.6209828Z 
2022-08-04T10:26:33.6209924Z Or undo this operation with:
2022-08-04T10:26:33.6210062Z 
2022-08-04T10:26:33.6210139Z   git switch -
2022-08-04T10:26:33.6210256Z 
2022-08-04T10:26:33.6210433Z Turn off this advice by setting config variable advice.detachedHead to false
2022-08-04T10:26:33.6210638Z 
2022-08-04T10:26:33.6214962Z HEAD is now at 10d9194 Merge 1c504df880a6e2467b0ce9d3ba55e9766a6457f0 into bc964b3f87b822cfde66e9ad9ac106ea2c3b92e7
2022-08-04T10:26:33.6235600Z ##[endgroup]
2022-08-04T10:26:33.6291464Z [command]/usr/bin/git log -1 --format='%H'
2022-08-04T10:26:33.6321307Z '10d9194010c2c113d2c4d07461e3e2a87f49813d'
2022-08-04T10:26:33.6690044Z ##[group]Run tj-actions/changed-files@v24
2022-08-04T10:26:33.6690280Z with:
2022-08-04T10:26:33.6690582Z   token: ***
2022-08-04T10:26:33.6690752Z   separator:  
2022-08-04T10:26:33.6690967Z   include_all_old_new_renamed_files: false
2022-08-04T10:26:33.6691194Z   old_new_separator: ,
2022-08-04T10:26:33.6691388Z   old_new_files_separator:  
2022-08-04T10:26:33.6691591Z   files_separator: 

2022-08-04T10:26:33.6691793Z   files_ignore_separator: 

2022-08-04T10:26:33.6692032Z   sha: 10d9194010c2c113d2c4d07461e3e2a87f49813d
2022-08-04T10:26:33.6692268Z   since_last_remote_commit: false
2022-08-04T10:26:33.6692466Z   path: .
2022-08-04T10:26:33.6692639Z   use_fork_point: false
2022-08-04T10:26:33.6692829Z   quotepath: true
2022-08-04T10:26:33.6693028Z   dir_names: false
2022-08-04T10:26:33.6693205Z ##[endgroup]
2022-08-04T10:26:33.6992892Z ##[group]Run # "Set base sha..."
2022-08-04T10:26:33.6993203Z [36;1m# "Set base sha..."[0m
2022-08-04T10:26:33.6993456Z [36;1mif [[ -n "" ]]; then[0m
2022-08-04T10:26:33.6993691Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-08-04T10:26:33.6993972Z [36;1melif [[ "false" == "true" && "" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-08-04T10:26:33.6994247Z [36;1m    echo "::set-output name=base_sha::"[0m
2022-08-04T10:26:33.6994461Z [36;1mfi[0m
2022-08-04T10:26:33.7054025Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-04T10:26:33.7054298Z ##[endgroup]
2022-08-04T10:26:33.7256148Z ##[group]Run # "Calculating the previous and current SHA..."
2022-08-04T10:26:33.7256481Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-08-04T10:26:33.7256769Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-08-04T10:26:33.7309003Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-04T10:26:33.7309273Z env:
2022-08-04T10:26:33.7309507Z   GITHUB_SERVER_URL: https://github.com
2022-08-04T10:26:33.7309980Z   GITHUB_REPOSITORY: S-Stepanenko/Homework_04
2022-08-04T10:26:33.7310234Z   GITHUB_BASE_REF: main
2022-08-04T10:26:33.7310429Z   GITHUB_HEAD_REF: dev
2022-08-04T10:26:33.7310720Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
2022-08-04T10:26:33.7311072Z   GITHUB_WORKSPACE: /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:33.7311361Z   INPUT_SHA: 10d9194010c2c113d2c4d07461e3e2a87f49813d
2022-08-04T10:26:33.7311591Z   INPUT_BASE_SHA: 
2022-08-04T10:26:33.7311927Z   INPUT_TOKEN: ***
2022-08-04T10:26:33.7312122Z   INPUT_PATH: .
2022-08-04T10:26:33.7312324Z   INPUT_USE_FORK_POINT: false
2022-08-04T10:26:33.7312525Z ##[endgroup]
2022-08-04T10:26:33.7400802Z ##[group]changed-files-diff-sha
2022-08-04T10:26:34.1895374Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-08-04T10:26:34.1940467Z From https://github.com/S-Stepanenko/Homework_04
2022-08-04T10:26:34.1941117Z  * [new branch]      main       -> main
2022-08-04T10:26:34.2017742Z ##[endgroup]
2022-08-04T10:26:34.2056600Z ##[group]Run tj-actions/glob@v9.2
2022-08-04T10:26:34.2056809Z with:
2022-08-04T10:26:34.2057000Z   files-separator: 

2022-08-04T10:26:34.2057209Z   escape-paths: true
2022-08-04T10:26:34.2057422Z   excluded-files-separator: 

2022-08-04T10:26:34.2057651Z   working-directory: .
2022-08-04T10:26:34.2057907Z   base-sha: bc964b3f87b822cfde66e9ad9ac106ea2c3b92e7
2022-08-04T10:26:34.2058172Z   sha: 10d9194010c2c113d2c4d07461e3e2a87f49813d
2022-08-04T10:26:34.2058414Z   include-deleted-files: true
2022-08-04T10:26:34.2058627Z   separator: |
2022-08-04T10:26:34.2058859Z   files-from-source-file-separator: 

2022-08-04T10:26:34.2059155Z   excluded-files-from-source-file-separator: 

2022-08-04T10:26:34.2059428Z   follow-symbolic-links: true
2022-08-04T10:26:34.2059643Z   strip-top-level-dir: true
2022-08-04T10:26:34.2059848Z ##[endgroup]
2022-08-04T10:26:34.3764409Z [command]/usr/bin/git rev-parse --show-toplevel
2022-08-04T10:26:34.3803960Z /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:34.3835376Z [command]/usr/bin/git diff --diff-filter=D --name-only bc964b3f87b822cfde66e9ad9ac106ea2c3b92e7 10d9194010c2c113d2c4d07461e3e2a87f49813d
2022-08-04T10:26:34.3879887Z 
2022-08-04T10:26:34.3924419Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-08-04T10:26:34.3924718Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-08-04T10:26:34.3978966Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-04T10:26:34.3979205Z env:
2022-08-04T10:26:34.3979472Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
2022-08-04T10:26:34.3979825Z   GITHUB_WORKSPACE: /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:34.3980083Z   INPUT_FILES_PATTERN_FILE: 
2022-08-04T10:26:34.3980304Z   INPUT_SEPARATOR:  
2022-08-04T10:26:34.3980499Z   INPUT_PATH: .
2022-08-04T10:26:34.3980750Z   INPUT_PREVIOUS_SHA: bc964b3f87b822cfde66e9ad9ac106ea2c3b92e7
2022-08-04T10:26:34.3981057Z   INPUT_CURRENT_SHA: 10d9194010c2c113d2c4d07461e3e2a87f49813d
2022-08-04T10:26:34.3981309Z   INPUT_TARGET_BRANCH: main
2022-08-04T10:26:34.3981527Z   INPUT_CURRENT_BRANCH: dev
2022-08-04T10:26:34.3981727Z   INPUT_QUOTEPATH: true
2022-08-04T10:26:34.3981971Z   INPUT_INCLUDE_ALL_OLD_NEW_RENAMED_FILES: false
2022-08-04T10:26:34.3982208Z   INPUT_OLD_NEW_SEPARATOR: ,
2022-08-04T10:26:34.3982429Z   INPUT_OLD_NEW_FILES_SEPARATOR:  
2022-08-04T10:26:34.3982654Z   INPUT_DIFF_RELATIVE: 
2022-08-04T10:26:34.3982857Z   INPUT_DIR_NAMES: false
2022-08-04T10:26:34.3983047Z ##[endgroup]
2022-08-04T10:26:34.4095120Z ##[group]changed-files
2022-08-04T10:26:34.6951588Z ##[endgroup]
2022-08-04T10:26:34.7064065Z ##[group]Run for file in .github/workflows/tab_counter.yml test.txt; do
2022-08-04T10:26:34.7064434Z [36;1mfor file in .github/workflows/tab_counter.yml test.txt; do[0m
2022-08-04T10:26:34.7064702Z [36;1m  echo "$file was changed"[0m
2022-08-04T10:26:34.7065011Z [36;1m  echo "Tabs in file $file: $(grep -P -o '\t' $file | wc -l)" >> count_tabs.txt 2>&1[0m
2022-08-04T10:26:34.7065271Z [36;1mdone[0m
2022-08-04T10:26:34.7119513Z shell: /usr/bin/bash -e {0}
2022-08-04T10:26:34.7119724Z ##[endgroup]
2022-08-04T10:26:34.7190269Z .github/workflows/tab_counter.yml was changed
2022-08-04T10:26:34.7221127Z test.txt was changed
2022-08-04T10:26:34.7266770Z ##[group]Run actions/upload-artifact@v3
2022-08-04T10:26:34.7266999Z with:
2022-08-04T10:26:34.7267169Z   name: artifact
2022-08-04T10:26:34.7267355Z   path: count_tabs.txt
2022-08-04T10:26:34.7267566Z   if-no-files-found: warn
2022-08-04T10:26:34.7267774Z ##[endgroup]
2022-08-04T10:26:34.7912664Z With the provided path, there will be 1 file uploaded
2022-08-04T10:26:34.7918071Z Starting artifact upload
2022-08-04T10:26:34.7919030Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-08-04T10:26:34.7920997Z Artifact name is valid!
2022-08-04T10:26:34.9938681Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-08-04T10:26:35.1383638Z Total size of all the files uploaded is 76 bytes
2022-08-04T10:26:35.1384113Z File upload process has finished. Finalizing the artifact upload
2022-08-04T10:26:35.2140941Z Artifact has been finalized. All files have been successfully uploaded!
2022-08-04T10:26:35.2141248Z 
2022-08-04T10:26:35.2141485Z The raw size of all the files that were specified for upload is 76 bytes
2022-08-04T10:26:35.2141912Z The size of all the files that were uploaded is 76 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-08-04T10:26:35.2142196Z 
2022-08-04T10:26:35.2142917Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-08-04T10:26:35.2143328Z 
2022-08-04T10:26:35.2143561Z Artifact artifact has been successfully uploaded!
2022-08-04T10:26:35.2297517Z Post job cleanup.
2022-08-04T10:26:35.2330659Z Post job cleanup.
2022-08-04T10:26:35.2840073Z Post job cleanup.
2022-08-04T10:26:35.4075105Z [command]/usr/bin/git version
2022-08-04T10:26:35.4121696Z git version 2.37.1
2022-08-04T10:26:35.4164773Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/f34c3bfa-f84f-4ed2-8471-b97318649d68/.gitconfig'
2022-08-04T10:26:35.4177152Z Temporarily overriding HOME='/home/runner/work/_temp/f34c3bfa-f84f-4ed2-8471-b97318649d68' before making global git config changes
2022-08-04T10:26:35.4178762Z Adding repository directory to the temporary git global config as a safe directory
2022-08-04T10:26:35.4185309Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Homework_04/Homework_04
2022-08-04T10:26:35.4247691Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-04T10:26:35.4310681Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-04T10:26:35.4552144Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-04T10:26:35.4574464Z http.https://github.com/.extraheader
2022-08-04T10:26:35.4583918Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-08-04T10:26:35.4616978Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-04T10:26:35.5052808Z Cleaning up orphan processes
```

