# 04.GitOps homework
## Need to create CI pipeline to find tabs in code
### Requirements:
* run on PR
* should scan all changed files
* checking all changed files in parallel
* result of found tabs should be inside artefacts of each build
## Testing repository
* [NEM1GA/HTPrep](https://github.com/NEM1GA/HTPrep)
### Pipeline log
```bash
2022-05-08T18:38:44.9420929Z Requested labels: ubuntu-latest
2022-05-08T18:38:44.9420975Z Job defined at: NEM1GA/HTPrep/.github/workflows/GitOps_CI.yaml@refs/heads/master
2022-05-08T18:38:44.9420993Z Waiting for a runner to pick up this job...
2022-05-08T18:38:45.6928973Z Job is waiting for a hosted runner to come online.
2022-05-08T18:38:48.4905932Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-08T18:38:50.2882345Z Current runner version: '2.291.1'
2022-05-08T18:38:50.2907074Z ##[group]Operating System
2022-05-08T18:38:50.2907720Z Ubuntu
2022-05-08T18:38:50.2907969Z 20.04.4
2022-05-08T18:38:50.2908262Z LTS
2022-05-08T18:38:50.2908576Z ##[endgroup]
2022-05-08T18:38:50.2908867Z ##[group]Virtual Environment
2022-05-08T18:38:50.2909297Z Environment: ubuntu-20.04
2022-05-08T18:38:50.2909639Z Version: 20220503.1
2022-05-08T18:38:50.2910129Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-08T18:38:50.2910802Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-08T18:38:50.2911277Z ##[endgroup]
2022-05-08T18:38:50.2911671Z ##[group]Virtual Environment Provisioner
2022-05-08T18:38:50.2912004Z 1.0.0.0-main-20220421-1
2022-05-08T18:38:50.2912322Z ##[endgroup]
2022-05-08T18:38:50.2912930Z ##[group]GITHUB_TOKEN Permissions
2022-05-08T18:38:50.2913473Z Contents: read
2022-05-08T18:38:50.2913951Z Metadata: read
2022-05-08T18:38:50.2914287Z ##[endgroup]
2022-05-08T18:38:50.2917688Z Secret source: Actions
2022-05-08T18:38:50.2918289Z Prepare workflow directory
2022-05-08T18:38:50.3729616Z Prepare all required actions
2022-05-08T18:38:50.3910252Z Getting action download info
2022-05-08T18:38:50.5687941Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-08T18:38:50.8959818Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-05-08T18:38:51.0981790Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-08T18:38:51.4141638Z Getting action download info
2022-05-08T18:38:51.5315687Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-05-08T18:38:51.8440105Z ##[group]Run actions/checkout@v3
2022-05-08T18:38:51.8440437Z with:
2022-05-08T18:38:51.8440681Z   fetch-depth: 0
2022-05-08T18:38:51.8440965Z   repository: NEM1GA/HTPrep
2022-05-08T18:38:51.8441468Z   token: ***
2022-05-08T18:38:51.8441701Z   ssh-strict: true
2022-05-08T18:38:51.8441984Z   persist-credentials: true
2022-05-08T18:38:51.8442258Z   clean: true
2022-05-08T18:38:51.8442471Z   lfs: false
2022-05-08T18:38:51.8442720Z   submodules: false
2022-05-08T18:38:51.8442996Z   set-safe-directory: true
2022-05-08T18:38:51.8443259Z ##[endgroup]
2022-05-08T18:38:52.0964333Z Syncing repository: NEM1GA/HTPrep
2022-05-08T18:38:52.0966084Z ##[group]Getting Git version info
2022-05-08T18:38:52.0966628Z Working directory is '/home/runner/work/HTPrep/HTPrep'
2022-05-08T18:38:52.0967228Z [command]/usr/bin/git version
2022-05-08T18:38:52.1094837Z git version 2.36.0
2022-05-08T18:38:52.1112233Z ##[endgroup]
2022-05-08T18:38:52.1132419Z Temporarily overriding HOME='/home/runner/work/_temp/fc2b522e-5b77-4521-a385-6d8e5f02269e' before making global git config changes
2022-05-08T18:38:52.1133217Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T18:38:52.1133848Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/HTPrep/HTPrep
2022-05-08T18:38:52.1169746Z Deleting the contents of '/home/runner/work/HTPrep/HTPrep'
2022-05-08T18:38:52.1174110Z ##[group]Initializing the repository
2022-05-08T18:38:52.1177457Z [command]/usr/bin/git init /home/runner/work/HTPrep/HTPrep
2022-05-08T18:38:52.1231492Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-08T18:38:52.1232292Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-08T18:38:52.1233009Z hint: of your new repositories, which will suppress this warning, call:
2022-05-08T18:38:52.1233778Z hint: 
2022-05-08T18:38:52.1234431Z hint: 	git config --global init.defaultBranch <name>
2022-05-08T18:38:52.1234764Z hint: 
2022-05-08T18:38:52.1235233Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-08T18:38:52.1235764Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-08T18:38:52.1236325Z hint: 
2022-05-08T18:38:52.1236623Z hint: 	git branch -m <name>
2022-05-08T18:38:52.1248535Z Initialized empty Git repository in /home/runner/work/HTPrep/HTPrep/.git/
2022-05-08T18:38:52.1259523Z [command]/usr/bin/git remote add origin https://github.com/NEM1GA/HTPrep
2022-05-08T18:38:52.1305901Z ##[endgroup]
2022-05-08T18:38:52.1306471Z ##[group]Disabling automatic garbage collection
2022-05-08T18:38:52.1312341Z [command]/usr/bin/git config --local gc.auto 0
2022-05-08T18:38:52.1344801Z ##[endgroup]
2022-05-08T18:38:52.1345689Z ##[group]Setting up auth
2022-05-08T18:38:52.1353491Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T18:38:52.1387318Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T18:38:52.1702937Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T18:38:52.1734851Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T18:38:52.1953499Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-08T18:38:52.1989828Z ##[endgroup]
2022-05-08T18:38:52.1990655Z ##[group]Fetching the repository
2022-05-08T18:38:52.1998753Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-05-08T18:38:52.4378945Z remote: Enumerating objects: 26, done.        
2022-05-08T18:38:52.4455396Z remote: Counting objects:   3% (1/26)        
2022-05-08T18:38:52.4455801Z remote: Counting objects:   7% (2/26)        
2022-05-08T18:38:52.4456239Z remote: Counting objects:  11% (3/26)        
2022-05-08T18:38:52.4456598Z remote: Counting objects:  15% (4/26)        
2022-05-08T18:38:52.4456929Z remote: Counting objects:  19% (5/26)        
2022-05-08T18:38:52.4457270Z remote: Counting objects:  23% (6/26)        
2022-05-08T18:38:52.4457608Z remote: Counting objects:  26% (7/26)        
2022-05-08T18:38:52.4457936Z remote: Counting objects:  30% (8/26)        
2022-05-08T18:38:52.4458274Z remote: Counting objects:  34% (9/26)        
2022-05-08T18:38:52.4458615Z remote: Counting objects:  38% (10/26)        
2022-05-08T18:38:52.4458965Z remote: Counting objects:  42% (11/26)        
2022-05-08T18:38:52.4459298Z remote: Counting objects:  46% (12/26)        
2022-05-08T18:38:52.4459635Z remote: Counting objects:  50% (13/26)        
2022-05-08T18:38:52.4459971Z remote: Counting objects:  53% (14/26)        
2022-05-08T18:38:52.4460301Z remote: Counting objects:  57% (15/26)        
2022-05-08T18:38:52.4460636Z remote: Counting objects:  61% (16/26)        
2022-05-08T18:38:52.4460973Z remote: Counting objects:  65% (17/26)        
2022-05-08T18:38:52.4461300Z remote: Counting objects:  69% (18/26)        
2022-05-08T18:38:52.4461633Z remote: Counting objects:  73% (19/26)        
2022-05-08T18:38:52.4462042Z remote: Counting objects:  76% (20/26)        
2022-05-08T18:38:52.4462321Z remote: Counting objects:  80% (21/26)        
2022-05-08T18:38:52.4462952Z remote: Counting objects:  84% (22/26)        
2022-05-08T18:38:52.4463257Z remote: Counting objects:  88% (23/26)        
2022-05-08T18:38:52.4463549Z remote: Counting objects:  92% (24/26)        
2022-05-08T18:38:52.4463865Z remote: Counting objects:  96% (25/26)        
2022-05-08T18:38:52.4464158Z remote: Counting objects: 100% (26/26)        
2022-05-08T18:38:52.4464468Z remote: Counting objects: 100% (26/26), done.        
2022-05-08T18:38:52.4464795Z remote: Compressing objects:   6% (1/15)        
2022-05-08T18:38:52.4465142Z remote: Compressing objects:  13% (2/15)        
2022-05-08T18:38:52.4465462Z remote: Compressing objects:  20% (3/15)        
2022-05-08T18:38:52.4465914Z remote: Compressing objects:  26% (4/15)        
2022-05-08T18:38:52.4466223Z remote: Compressing objects:  33% (5/15)        
2022-05-08T18:38:52.4466533Z remote: Compressing objects:  40% (6/15)        
2022-05-08T18:38:52.4466832Z remote: Compressing objects:  46% (7/15)        
2022-05-08T18:38:52.4467150Z remote: Compressing objects:  53% (8/15)        
2022-05-08T18:38:52.4467460Z remote: Compressing objects:  60% (9/15)        
2022-05-08T18:38:52.4467774Z remote: Compressing objects:  66% (10/15)        
2022-05-08T18:38:52.4468077Z remote: Compressing objects:  73% (11/15)        
2022-05-08T18:38:52.4468390Z remote: Compressing objects:  80% (12/15)        
2022-05-08T18:38:52.4468704Z remote: Compressing objects:  86% (13/15)        
2022-05-08T18:38:52.4469010Z remote: Compressing objects:  93% (14/15)        
2022-05-08T18:38:52.4469322Z remote: Compressing objects: 100% (15/15)        
2022-05-08T18:38:52.4469653Z remote: Compressing objects: 100% (15/15), done.        
2022-05-08T18:38:52.4470329Z remote: Total 26 (delta 2), reused 23 (delta 2), pack-reused 0        
2022-05-08T18:38:52.4517660Z From https://github.com/NEM1GA/HTPrep
2022-05-08T18:38:52.4518209Z  * [new branch]      master     -> origin/master
2022-05-08T18:38:52.4642199Z [command]/usr/bin/git branch --list --remote origin/master
2022-05-08T18:38:52.4643144Z   origin/master
2022-05-08T18:38:52.4643556Z [command]/usr/bin/git rev-parse refs/remotes/origin/master
2022-05-08T18:38:52.4643918Z d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:52.4644543Z ##[endgroup]
2022-05-08T18:38:52.4645005Z ##[group]Determining the checkout info
2022-05-08T18:38:52.4645962Z ##[endgroup]
2022-05-08T18:38:52.4646735Z ##[group]Checking out the ref
2022-05-08T18:38:52.4647827Z [command]/usr/bin/git checkout --progress --force -B master refs/remotes/origin/master
2022-05-08T18:38:52.4699235Z Reset branch 'master'
2022-05-08T18:38:52.4706737Z branch 'master' set up to track 'origin/master'.
2022-05-08T18:38:52.4708654Z ##[endgroup]
2022-05-08T18:38:52.4746804Z [command]/usr/bin/git log -1 --format='%H'
2022-05-08T18:38:52.4774953Z 'd3ea930288f80ff2f83227fbf1e398dc06564333'
2022-05-08T18:38:52.5137896Z ##[group]Run tj-actions/changed-files@v19
2022-05-08T18:38:52.5138189Z with:
2022-05-08T18:38:52.5138652Z   token: ***
2022-05-08T18:38:52.5138860Z   separator:  
2022-05-08T18:38:52.5139099Z   files_separator: 

2022-05-08T18:38:52.5139355Z   files_ignore_separator: 

2022-05-08T18:38:52.5139648Z   sha: d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:52.5139954Z   since_last_remote_commit: false
2022-05-08T18:38:52.5140213Z   use_fork_point: false
2022-05-08T18:38:52.5140437Z   quotepath: true
2022-05-08T18:38:52.5140657Z ##[endgroup]
2022-05-08T18:38:52.5429976Z ##[group]Run # "Set base sha..."
2022-05-08T18:38:52.5430301Z [36;1m# "Set base sha..."[0m
2022-05-08T18:38:52.5430553Z [36;1mif [[ -n "" ]]; then[0m
2022-05-08T18:38:52.5430836Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-08T18:38:52.5431222Z [36;1melif [[ "false" == "true" && "6c921112152a593a523329a0ab16218f7637b892" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-08T18:38:52.5431653Z [36;1m    echo "::set-output name=base_sha::6c921112152a593a523329a0ab16218f7637b892"[0m
2022-05-08T18:38:52.5432185Z [36;1mfi[0m
2022-05-08T18:38:52.5487453Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-08T18:38:52.5487849Z ##[endgroup]
2022-05-08T18:38:52.5683625Z ##[group]Run # "Calculating the previous and current SHA..."
2022-05-08T18:38:52.5684100Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-05-08T18:38:52.5684472Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-05-08T18:38:52.5728864Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-08T18:38:52.5729258Z env:
2022-05-08T18:38:52.5729635Z   GITHUB_SERVER_URL: https://github.com
2022-05-08T18:38:52.5730019Z   GITHUB_REPOSITORY: NEM1GA/HTPrep
2022-05-08T18:38:52.5730374Z   GITHUB_BASE_REF: 
2022-05-08T18:38:52.5730801Z   GITHUB_HEAD_REF: 
2022-05-08T18:38:52.5731228Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-08T18:38:52.5731668Z   INPUT_SHA: d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:52.5732025Z   INPUT_BASE_SHA: 
2022-05-08T18:38:52.5732636Z   INPUT_TOKEN: ***
2022-05-08T18:38:52.5733094Z   INPUT_PATH: 
2022-05-08T18:38:52.5733430Z   INPUT_USE_FORK_POINT: false
2022-05-08T18:38:52.5733747Z ##[endgroup]
2022-05-08T18:38:52.5818217Z ##[group]changed-files-diff-sha
2022-05-08T18:38:52.5819054Z Resolving repository path...
2022-05-08T18:38:52.5859937Z Setting up 'temp_changed_files' remote...
2022-05-08T18:38:52.5886506Z No 'temp_changed_files' remote found
2022-05-08T18:38:52.5887346Z Creating 'temp_changed_files' remote...
2022-05-08T18:38:52.5921200Z Getting HEAD SHA...
2022-05-08T18:38:52.8288411Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-08T18:38:52.8339508Z From https://github.com/NEM1GA/HTPrep
2022-05-08T18:38:52.8340414Z  * [new branch]      master     -> temp_changed_files/master
2022-05-08T18:38:52.8435436Z ##[endgroup]
2022-05-08T18:38:52.8487512Z ##[group]Run tj-actions/glob@v7.16
2022-05-08T18:38:52.8487854Z with:
2022-05-08T18:38:52.8488106Z   files-separator: 

2022-05-08T18:38:52.8488435Z   escape-paths: true
2022-05-08T18:38:52.8488847Z   excluded-files-separator: 

2022-05-08T18:38:52.8489193Z   base-sha: 6c921112152a593a523329a0ab16218f7637b892
2022-05-08T18:38:52.8489596Z   sha: d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:52.8489979Z   include-deleted-files: true
2022-05-08T18:38:52.8490263Z   separator: |
2022-05-08T18:38:52.8490660Z   files-from-source-file-separator: 

2022-05-08T18:38:52.8491148Z   excluded-files-from-source-file-separator: 

2022-05-08T18:38:52.8491540Z   follow-symbolic-links: true
2022-05-08T18:38:52.8491898Z   strip-top-level-dir: true
2022-05-08T18:38:52.8492222Z ##[endgroup]
2022-05-08T18:38:53.0014474Z [command]/usr/bin/git rev-parse --show-toplevel
2022-05-08T18:38:53.0052241Z /home/runner/work/HTPrep/HTPrep
2022-05-08T18:38:53.0082977Z [command]/usr/bin/git diff --diff-filter=D --name-only 6c921112152a593a523329a0ab16218f7637b892 d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:53.0117328Z 
2022-05-08T18:38:53.0289469Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-08T18:38:53.0289844Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-08T18:38:53.0339914Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-08T18:38:53.0340225Z env:
2022-05-08T18:38:53.0340535Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-08T18:38:53.0340895Z   INPUT_FILES_PATTERN_FILE: 
2022-05-08T18:38:53.0341155Z   INPUT_SEPARATOR:  
2022-05-08T18:38:53.0341378Z   INPUT_PATH: 
2022-05-08T18:38:53.0341674Z   INPUT_PREVIOUS_SHA: 6c921112152a593a523329a0ab16218f7637b892
2022-05-08T18:38:53.0342041Z   INPUT_CURRENT_SHA: d3ea930288f80ff2f83227fbf1e398dc06564333
2022-05-08T18:38:53.0342367Z   INPUT_TARGET_BRANCH: master
2022-05-08T18:38:53.0342631Z   INPUT_CURRENT_BRANCH: master
2022-05-08T18:38:53.0342892Z   INPUT_QUOTEPATH: true
2022-05-08T18:38:53.0343130Z ##[endgroup]
2022-05-08T18:38:53.0450620Z ##[group]changed-files
2022-05-08T18:38:53.0450926Z Resolving repository path...
2022-05-08T18:38:53.0453952Z Retrieving changes between 6c921112152a593a523329a0ab16218f7637b892 (master) → d3ea930288f80ff2f83227fbf1e398dc06564333 (master)
2022-05-08T18:38:53.0454599Z Getting diff...
2022-05-08T18:38:53.3291122Z Added files: 
2022-05-08T18:38:53.3291891Z Copied files: 
2022-05-08T18:38:53.3292602Z Deleted files: 
2022-05-08T18:38:53.3294410Z Modified files: .github/workflows/GitOps_CI.yaml
2022-05-08T18:38:53.3294746Z Renamed files: 
2022-05-08T18:38:53.3294968Z Type Changed files: 
2022-05-08T18:38:53.3295182Z Unmerged files: 
2022-05-08T18:38:53.3295374Z Unknown files: 
2022-05-08T18:38:53.3295659Z All changed and modified files: .github/workflows/GitOps_CI.yaml
2022-05-08T18:38:53.3295990Z All changed files: .github/workflows/GitOps_CI.yaml
2022-05-08T18:38:53.3296505Z All modified files: .github/workflows/GitOps_CI.yaml
2022-05-08T18:38:53.3300432Z ##[endgroup]
2022-05-08T18:38:53.3414294Z ##[group]Run for file in .github/workflows/GitOps_CI.yaml; do
2022-05-08T18:38:53.3414656Z [36;1mfor file in .github/workflows/GitOps_CI.yaml; do[0m
2022-05-08T18:38:53.3414981Z [36;1m  echo "$file was changed" >> list_of_changed_files.log 2>&1[0m
2022-05-08T18:38:53.3415368Z [36;1m  echo "Count Tab in files: `awk '{print gsub(/\t/,"")}' $file | awk '{s+=$1} END { print s }'`" >> list_of_changed_files.log 2>&1[0m
2022-05-08T18:38:53.3415699Z [36;1mdone[0m
2022-05-08T18:38:53.3464910Z shell: /usr/bin/bash -e {0}
2022-05-08T18:38:53.3465151Z ##[endgroup]
2022-05-08T18:38:53.3587962Z ##[group]Run actions/upload-artifact@v2
2022-05-08T18:38:53.3588201Z with:
2022-05-08T18:38:53.3588425Z   path: list_of_changed_files.log
2022-05-08T18:38:53.3588656Z   name: artifact
2022-05-08T18:38:53.3588865Z   if-no-files-found: warn
2022-05-08T18:38:53.3589103Z ##[endgroup]
2022-05-08T18:38:53.4163560Z With the provided path, there will be 1 file uploaded
2022-05-08T18:38:53.4167186Z Starting artifact upload
2022-05-08T18:38:53.4168396Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-08T18:38:53.4169193Z Artifact name is valid!
2022-05-08T18:38:53.4874323Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-08T18:38:53.5803217Z Total size of all the files uploaded is 67 bytes
2022-05-08T18:38:53.5803850Z File upload process has finished. Finalizing the artifact upload
2022-05-08T18:38:53.6358034Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-08T18:38:53.6358557Z 
2022-05-08T18:38:53.6358906Z The raw size of all the files that were specified for upload is 67 bytes
2022-05-08T18:38:53.6359544Z The size of all the files that were uploaded is 67 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-08T18:38:53.6359977Z 
2022-05-08T18:38:53.6361032Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-08T18:38:53.6361556Z 
2022-05-08T18:38:53.6361972Z Artifact artifact has been successfully uploaded!
2022-05-08T18:38:53.6520377Z Post job cleanup.
2022-05-08T18:38:53.6554298Z Post job cleanup.
2022-05-08T18:38:53.7072822Z Post job cleanup.
2022-05-08T18:38:53.8265409Z [command]/usr/bin/git version
2022-05-08T18:38:53.8315290Z git version 2.36.0
2022-05-08T18:38:53.8354857Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/4b7c6468-bff5-4801-9b17-73bcb9b7752b/.gitconfig'
2022-05-08T18:38:53.8366208Z Temporarily overriding HOME='/home/runner/work/_temp/4b7c6468-bff5-4801-9b17-73bcb9b7752b' before making global git config changes
2022-05-08T18:38:53.8366983Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T18:38:53.8372407Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/HTPrep/HTPrep
2022-05-08T18:38:53.8411935Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T18:38:53.8447001Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T18:38:53.8674824Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T18:38:53.8693241Z http.https://github.com/.extraheader
2022-05-08T18:38:53.8703548Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-08T18:38:53.8773820Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T18:38:53.9270463Z Cleaning up orphan processes
```