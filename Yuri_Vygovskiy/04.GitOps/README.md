##### Report_04.GitOps

---

### My Git Repository link

[my_github_actions](https://github.com/Vigovskiyy/git_demo)

### Log of pipeline:

```bash

2022-05-16T12:48:07.4577279Z Requested labels: ubuntu-latest
2022-05-16T12:48:07.4577330Z Job defined at: Vigovskiyy/git_demo/.github/workflows/tabs_scan.yaml@refs/heads/main
2022-05-16T12:48:07.4577351Z Waiting for a runner to pick up this job...
2022-05-16T12:48:08.2397595Z Job is waiting for a hosted runner to come online.
2022-05-16T12:48:12.2308622Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-16T12:48:15.2916750Z Current runner version: '2.291.1'
2022-05-16T12:48:15.2946423Z ##[group]Operating System
2022-05-16T12:48:15.2947095Z Ubuntu
2022-05-16T12:48:15.2947345Z 20.04.4
2022-05-16T12:48:15.2947640Z LTS
2022-05-16T12:48:15.2947950Z ##[endgroup]
2022-05-16T12:48:15.2948242Z ##[group]Virtual Environment
2022-05-16T12:48:15.2948652Z Environment: ubuntu-20.04
2022-05-16T12:48:15.2949013Z Version: 20220508.1
2022-05-16T12:48:15.2949498Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220508.1/images/linux/Ubuntu2004-Readme.md
2022-05-16T12:48:15.2950191Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220508.1
2022-05-16T12:48:15.2950655Z ##[endgroup]
2022-05-16T12:48:15.2950999Z ##[group]Virtual Environment Provisioner
2022-05-16T12:48:15.2951409Z 1.0.0.0-main-20220421-1
2022-05-16T12:48:15.2951741Z ##[endgroup]
2022-05-16T12:48:15.2952349Z ##[group]GITHUB_TOKEN Permissions
2022-05-16T12:48:15.2952905Z Contents: read
2022-05-16T12:48:15.2953418Z Metadata: read
2022-05-16T12:48:15.2953750Z ##[endgroup]
2022-05-16T12:48:15.2957556Z Secret source: Actions
2022-05-16T12:48:15.2958189Z Prepare workflow directory
2022-05-16T12:48:15.3746268Z Prepare all required actions
2022-05-16T12:48:15.3915143Z Getting action download info
2022-05-16T12:48:15.5688340Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-05-16T12:48:15.8956050Z Download action repository 'tj-actions/changed-files@v13.1' (SHA:2c85495a7bb72f2734cb5181e29b2ee5e08e61f7)
2022-05-16T12:48:16.0429746Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-16T12:48:16.3569921Z Getting action download info
2022-05-16T12:48:16.5079758Z Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
2022-05-16T12:48:16.8074911Z ##[group]Run actions/checkout@v2
2022-05-16T12:48:16.8075175Z with:
2022-05-16T12:48:16.8075359Z   fetch-depth: 0
2022-05-16T12:48:16.8075584Z   repository: Vigovskiyy/git_demo
2022-05-16T12:48:16.8076052Z   token: ***
2022-05-16T12:48:16.8076238Z   ssh-strict: true
2022-05-16T12:48:16.8076444Z   persist-credentials: true
2022-05-16T12:48:16.8076642Z   clean: true
2022-05-16T12:48:16.8076812Z   lfs: false
2022-05-16T12:48:16.8076990Z   submodules: false
2022-05-16T12:48:16.8077177Z   set-safe-directory: true
2022-05-16T12:48:16.8077382Z ##[endgroup]
2022-05-16T12:48:17.0402202Z Syncing repository: Vigovskiyy/git_demo
2022-05-16T12:48:17.0404029Z ##[group]Getting Git version info
2022-05-16T12:48:17.0404630Z Working directory is '/home/runner/work/git_demo/git_demo'
2022-05-16T12:48:17.0405149Z [command]/usr/bin/git version
2022-05-16T12:48:17.0464039Z git version 2.36.1
2022-05-16T12:48:17.0477424Z ##[endgroup]
2022-05-16T12:48:17.0496867Z Temporarily overriding HOME='/home/runner/work/_temp/36b18e7c-cddd-4626-9142-117676932334' before making global git config changes
2022-05-16T12:48:17.0499640Z Adding repository directory to the temporary git global config as a safe directory
2022-05-16T12:48:17.0504534Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/git_demo/git_demo
2022-05-16T12:48:17.0545548Z Deleting the contents of '/home/runner/work/git_demo/git_demo'
2022-05-16T12:48:17.0550145Z ##[group]Initializing the repository
2022-05-16T12:48:17.0554148Z [command]/usr/bin/git init /home/runner/work/git_demo/git_demo
2022-05-16T12:48:17.0615663Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-16T12:48:17.0616796Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-16T12:48:17.0617266Z hint: of your new repositories, which will suppress this warning, call:
2022-05-16T12:48:17.0617556Z hint: 
2022-05-16T12:48:17.0618091Z hint: 	git config --global init.defaultBranch <name>
2022-05-16T12:48:17.0618371Z hint: 
2022-05-16T12:48:17.0618740Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-16T12:48:17.0619205Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-16T12:48:17.0619769Z hint: 
2022-05-16T12:48:17.0624278Z hint: 	git branch -m <name>
2022-05-16T12:48:17.0624625Z Initialized empty Git repository in /home/runner/work/git_demo/git_demo/.git/
2022-05-16T12:48:17.0634472Z [command]/usr/bin/git remote add origin https://github.com/Vigovskiyy/git_demo
2022-05-16T12:48:17.0717433Z ##[endgroup]
2022-05-16T12:48:17.0718280Z ##[group]Disabling automatic garbage collection
2022-05-16T12:48:17.0721553Z [command]/usr/bin/git config --local gc.auto 0
2022-05-16T12:48:17.0752562Z ##[endgroup]
2022-05-16T12:48:17.0753270Z ##[group]Setting up auth
2022-05-16T12:48:17.0760039Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-16T12:48:17.0794271Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-16T12:48:17.1131965Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-16T12:48:17.1160072Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-16T12:48:17.1394636Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-16T12:48:17.1426402Z ##[endgroup]
2022-05-16T12:48:17.1426931Z ##[group]Fetching the repository
2022-05-16T12:48:17.1436753Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-05-16T12:48:17.3936044Z remote: Enumerating objects: 41, done.        
2022-05-16T12:48:17.3997073Z remote: Counting objects:   2% (1/41)        
2022-05-16T12:48:17.3997391Z remote: Counting objects:   4% (2/41)        
2022-05-16T12:48:17.3997624Z remote: Counting objects:   7% (3/41)        
2022-05-16T12:48:17.3997881Z remote: Counting objects:   9% (4/41)        
2022-05-16T12:48:17.3998121Z remote: Counting objects:  12% (5/41)        
2022-05-16T12:48:17.3998345Z remote: Counting objects:  14% (6/41)        
2022-05-16T12:48:17.3998581Z remote: Counting objects:  17% (7/41)        
2022-05-16T12:48:17.3998817Z remote: Counting objects:  19% (8/41)        
2022-05-16T12:48:17.3999037Z remote: Counting objects:  21% (9/41)        
2022-05-16T12:48:17.3999274Z remote: Counting objects:  24% (10/41)        
2022-05-16T12:48:17.3999513Z remote: Counting objects:  26% (11/41)        
2022-05-16T12:48:17.3999734Z remote: Counting objects:  29% (12/41)        
2022-05-16T12:48:17.3999965Z remote: Counting objects:  31% (13/41)        
2022-05-16T12:48:17.4000209Z remote: Counting objects:  34% (14/41)        
2022-05-16T12:48:17.4000441Z remote: Counting objects:  36% (15/41)        
2022-05-16T12:48:17.4000661Z remote: Counting objects:  39% (16/41)        
2022-05-16T12:48:17.4000898Z remote: Counting objects:  41% (17/41)        
2022-05-16T12:48:17.4001127Z remote: Counting objects:  43% (18/41)        
2022-05-16T12:48:17.4001345Z remote: Counting objects:  46% (19/41)        
2022-05-16T12:48:17.4001574Z remote: Counting objects:  48% (20/41)        
2022-05-16T12:48:17.4001811Z remote: Counting objects:  51% (21/41)        
2022-05-16T12:48:17.4002030Z remote: Counting objects:  53% (22/41)        
2022-05-16T12:48:17.4002259Z remote: Counting objects:  56% (23/41)        
2022-05-16T12:48:17.4002490Z remote: Counting objects:  58% (24/41)        
2022-05-16T12:48:17.4002705Z remote: Counting objects:  60% (25/41)        
2022-05-16T12:48:17.4002935Z remote: Counting objects:  63% (26/41)        
2022-05-16T12:48:17.4003165Z remote: Counting objects:  65% (27/41)        
2022-05-16T12:48:17.4003398Z remote: Counting objects:  68% (28/41)        
2022-05-16T12:48:17.4003627Z remote: Counting objects:  70% (29/41)        
2022-05-16T12:48:17.4003854Z remote: Counting objects:  73% (30/41)        
2022-05-16T12:48:17.4004205Z remote: Counting objects:  75% (31/41)        
2022-05-16T12:48:17.4004422Z remote: Counting objects:  78% (32/41)        
2022-05-16T12:48:17.4004652Z remote: Counting objects:  80% (33/41)        
2022-05-16T12:48:17.4004890Z remote: Counting objects:  82% (34/41)        
2022-05-16T12:48:17.4005105Z remote: Counting objects:  85% (35/41)        
2022-05-16T12:48:17.4005335Z remote: Counting objects:  87% (36/41)        
2022-05-16T12:48:17.4005573Z remote: Counting objects:  90% (37/41)        
2022-05-16T12:48:17.4005788Z remote: Counting objects:  92% (38/41)        
2022-05-16T12:48:17.4006022Z remote: Counting objects:  95% (39/41)        
2022-05-16T12:48:17.4006255Z remote: Counting objects:  97% (40/41)        
2022-05-16T12:48:17.4006489Z remote: Counting objects: 100% (41/41)        
2022-05-16T12:48:17.4006720Z remote: Counting objects: 100% (41/41), done.        
2022-05-16T12:48:17.4006983Z remote: Compressing objects:   3% (1/26)        
2022-05-16T12:48:17.4007241Z remote: Compressing objects:   7% (2/26)        
2022-05-16T12:48:17.4007477Z remote: Compressing objects:  11% (3/26)        
2022-05-16T12:48:17.4007718Z remote: Compressing objects:  15% (4/26)        
2022-05-16T12:48:17.4007965Z remote: Compressing objects:  19% (5/26)        
2022-05-16T12:48:17.4008198Z remote: Compressing objects:  23% (6/26)        
2022-05-16T12:48:17.4008444Z remote: Compressing objects:  26% (7/26)        
2022-05-16T12:48:17.4008690Z remote: Compressing objects:  30% (8/26)        
2022-05-16T12:48:17.4008919Z remote: Compressing objects:  34% (9/26)        
2022-05-16T12:48:17.4009166Z remote: Compressing objects:  38% (10/26)        
2022-05-16T12:48:17.4009422Z remote: Compressing objects:  42% (11/26)        
2022-05-16T12:48:17.4009734Z remote: Compressing objects:  46% (12/26)        
2022-05-16T12:48:17.4009974Z remote: Compressing objects:  50% (13/26)        
2022-05-16T12:48:17.4010218Z remote: Compressing objects:  53% (14/26)        
2022-05-16T12:48:17.4010465Z remote: Compressing objects:  57% (15/26)        
2022-05-16T12:48:17.4010694Z remote: Compressing objects:  61% (16/26)        
2022-05-16T12:48:17.4010935Z remote: Compressing objects:  65% (17/26)        
2022-05-16T12:48:17.4011177Z remote: Compressing objects:  69% (18/26)        
2022-05-16T12:48:17.4011413Z remote: Compressing objects:  73% (19/26)        
2022-05-16T12:48:17.4011657Z remote: Compressing objects:  76% (20/26)        
2022-05-16T12:48:17.4011898Z remote: Compressing objects:  80% (21/26)        
2022-05-16T12:48:17.4012140Z remote: Compressing objects:  84% (22/26)        
2022-05-16T12:48:17.4012373Z remote: Compressing objects:  88% (23/26)        
2022-05-16T12:48:17.4012627Z remote: Compressing objects:  92% (24/26)        
2022-05-16T12:48:17.4012872Z remote: Compressing objects:  96% (25/26)        
2022-05-16T12:48:17.4013115Z remote: Compressing objects: 100% (26/26)        
2022-05-16T12:48:17.4013357Z remote: Compressing objects: 100% (26/26), done.        
2022-05-16T12:48:17.4013972Z remote: Total 41 (delta 8), reused 38 (delta 5), pack-reused 0        
2022-05-16T12:48:17.4098107Z From https://github.com/Vigovskiyy/git_demo
2022-05-16T12:48:17.4099573Z  * [new branch]      main       -> origin/main
2022-05-16T12:48:17.4100436Z  * [new branch]      second     -> origin/second
2022-05-16T12:48:17.4131149Z [command]/usr/bin/git branch --list --remote origin/main
2022-05-16T12:48:17.4235379Z   origin/main
2022-05-16T12:48:17.4236045Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-05-16T12:48:17.4236359Z d784cbc7032e3999d05bd6903d3c5cc9455bb021
2022-05-16T12:48:17.4237209Z ##[endgroup]
2022-05-16T12:48:17.4237629Z ##[group]Determining the checkout info
2022-05-16T12:48:17.4238014Z ##[endgroup]
2022-05-16T12:48:17.4238388Z ##[group]Checking out the ref
2022-05-16T12:48:17.4238850Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-05-16T12:48:17.4282147Z Switched to a new branch 'main'
2022-05-16T12:48:17.4282885Z branch 'main' set up to track 'origin/main'.
2022-05-16T12:48:17.4283959Z ##[endgroup]
2022-05-16T12:48:17.4313321Z [command]/usr/bin/git log -1 --format='%H'
2022-05-16T12:48:17.4342489Z 'd784cbc7032e3999d05bd6903d3c5cc9455bb021'
2022-05-16T12:48:17.4692325Z ##[group]Run tj-actions/changed-files@v13.1
2022-05-16T12:48:17.4692598Z with:
2022-05-16T12:48:17.4693025Z   token: ***
2022-05-16T12:48:17.4693228Z   separator:  
2022-05-16T12:48:17.4693467Z   sha: d784cbc7032e3999d05bd6903d3c5cc9455bb021
2022-05-16T12:48:17.4693735Z   since_last_remote_commit: false
2022-05-16T12:48:17.4693955Z ##[endgroup]
2022-05-16T12:48:17.5025140Z ##[group]Run # "Set base sha..."
2022-05-16T12:48:17.5025507Z [36;1m# "Set base sha..."[0m
2022-05-16T12:48:17.5025726Z [36;1mif [[ -n "" ]]; then[0m
2022-05-16T12:48:17.5025980Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-16T12:48:17.5026252Z [36;1melif [[ "false" == "true" ]]; then[0m
2022-05-16T12:48:17.5026575Z [36;1m  if [[ "dcbe1dccb3cc94bce9ce84d3e43f038dc9b523c9" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-16T12:48:17.5027001Z [36;1m    echo "::set-output name=base_sha::dcbe1dccb3cc94bce9ce84d3e43f038dc9b523c9"[0m
2022-05-16T12:48:17.5027356Z [36;1m  else[0m
2022-05-16T12:48:17.5027645Z [36;1m    echo "::set-output name=base_sha::d784cbc7032e3999d05bd6903d3c5cc9455bb021"[0m
2022-05-16T12:48:17.5027911Z [36;1m  fi[0m
2022-05-16T12:48:17.5028100Z [36;1mfi[0m
2022-05-16T12:48:17.5085215Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-16T12:48:17.5085545Z ##[endgroup]
2022-05-16T12:48:17.5283705Z ##[group]Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
2022-05-16T12:48:17.5284104Z [36;1mbash $GITHUB_ACTION_PATH/sourcefiles.sh[0m
2022-05-16T12:48:17.5328552Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-16T12:48:17.5328968Z env:
2022-05-16T12:48:17.5329172Z   INPUT_FILES: 
2022-05-16T12:48:17.5329445Z   INPUT_FILES_FROM_SOURCE_FILE: 
2022-05-16T12:48:17.5329726Z ##[endgroup]
2022-05-16T12:48:17.5413493Z ##[group]changed-files-from-source-file
2022-05-16T12:48:17.5547421Z Input files: 
2022-05-16T12:48:17.5569806Z ##[endgroup]
2022-05-16T12:48:17.5617785Z ##[group]Run tj-actions/glob@v3.3
2022-05-16T12:48:17.5618119Z with:
2022-05-16T12:48:17.5618380Z   files-separator:  
2022-05-16T12:48:17.5618637Z   separator: |
2022-05-16T12:48:17.5618915Z   excluded-files-separator: 

2022-05-16T12:48:17.5619193Z   files-from-source-file-separator: 

2022-05-16T12:48:17.5619591Z   excluded-files-from-source-file-separator: 

2022-05-16T12:48:17.5619948Z   follow-symbolic-links: true
2022-05-16T12:48:17.5620190Z   strip-top-level-dir: true
2022-05-16T12:48:17.5620477Z   include-deleted-files: false
2022-05-16T12:48:17.5620787Z   sha: d784cbc7032e3999d05bd6903d3c5cc9455bb021
2022-05-16T12:48:17.5621123Z   working-directory: /home/runner/work/git_demo/git_demo
2022-05-16T12:48:17.5621427Z ##[endgroup]
2022-05-16T12:48:17.6241327Z 
2022-05-16T12:48:17.6296965Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-16T12:48:17.6297406Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-16T12:48:17.6344415Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-16T12:48:17.6344758Z env:
2022-05-16T12:48:17.6345026Z   GITHUB_SERVER_URL: https://github.com
2022-05-16T12:48:17.6345460Z   GITHUB_REPOSITORY: Vigovskiyy/git_demo
2022-05-16T12:48:17.6345762Z   GITHUB_BASE_REF: 
2022-05-16T12:48:17.6346019Z   INPUT_SHA: d784cbc7032e3999d05bd6903d3c5cc9455bb021
2022-05-16T12:48:17.6346322Z   INPUT_BASE_SHA: 
2022-05-16T12:48:17.6347025Z   INPUT_TOKEN: ***
2022-05-16T12:48:17.6347302Z   INPUT_FILES: 
2022-05-16T12:48:17.6347512Z   INPUT_SEPARATOR:  
2022-05-16T12:48:17.6347778Z   INPUT_PATH: 
2022-05-16T12:48:17.6348022Z ##[endgroup]
2022-05-16T12:48:17.6439493Z ##[group]changed-files
2022-05-16T12:48:17.6439895Z Resolving repository path...
2022-05-16T12:48:17.6624562Z Setting up 'temp_changed_files' remote...
2022-05-16T12:48:17.6625263Z No 'temp_changed_files' remote found
2022-05-16T12:48:17.6626493Z Creating 'temp_changed_files' remote...
2022-05-16T12:48:17.6626778Z Getting HEAD info...
2022-05-16T12:48:17.6648134Z Retrieving changes between dcbe1dccb3cc94bce9ce84d3e43f038dc9b523c9 (main) → d784cbc7032e3999d05bd6903d3c5cc9455bb021 (main)
2022-05-16T12:48:17.6648819Z Getting diff...
2022-05-16T12:48:17.7125609Z Added files: .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt
2022-05-16T12:48:17.7126695Z Copied files: 
2022-05-16T12:48:17.7126937Z Deleted files: 
2022-05-16T12:48:17.7127127Z Modified files: 
2022-05-16T12:48:17.7127299Z Renamed files: 
2022-05-16T12:48:17.7127486Z Type Changed files: 
2022-05-16T12:48:17.7127677Z Unmerged files: 
2022-05-16T12:48:17.7127848Z Unknown files: 
2022-05-16T12:48:17.7128141Z All changed and modified files: .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt
2022-05-16T12:48:17.7128513Z All changed files: .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt
2022-05-16T12:48:17.7128840Z All modified files: .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt
2022-05-16T12:48:17.7157031Z ##[endgroup]
2022-05-16T12:48:17.7283094Z ##[group]Run for file in .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt; do
2022-05-16T12:48:17.7283536Z [36;1mfor file in .github/workflows/tabs_scan.yaml test_tabs1.txt test_tabs2.txt; do[0m
2022-05-16T12:48:17.7283882Z [36;1m  echo "$file was changed" >> report.txt 2>&1[0m
2022-05-16T12:48:17.7284225Z [36;1m  echo "Tabs quantity: `grep -P '\t' $file | wc -l`" >> report.txt 2>&1 [0m
2022-05-16T12:48:17.7284490Z [36;1mdone[0m
2022-05-16T12:48:17.7335679Z shell: /usr/bin/bash -e {0}
2022-05-16T12:48:17.7335931Z ##[endgroup]
2022-05-16T12:48:17.7523226Z ##[group]Run actions/upload-artifact@v2
2022-05-16T12:48:17.7523497Z with:
2022-05-16T12:48:17.7523703Z   path: report.txt
2022-05-16T12:48:17.7523902Z   name: artifact
2022-05-16T12:48:17.7524132Z   if-no-files-found: warn
2022-05-16T12:48:17.7524354Z ##[endgroup]
2022-05-16T12:48:17.8147645Z With the provided path, there will be 1 file uploaded
2022-05-16T12:48:17.8154357Z Starting artifact upload
2022-05-16T12:48:17.8155489Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-16T12:48:17.8158505Z Artifact name is valid!
2022-05-16T12:48:17.8897320Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-16T12:48:18.0031335Z Total size of all the files uploaded is 101 bytes
2022-05-16T12:48:18.0035461Z File upload process has finished. Finalizing the artifact upload
2022-05-16T12:48:18.0373154Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-16T12:48:18.0373437Z 
2022-05-16T12:48:18.0373628Z The raw size of all the files that were specified for upload is 150 bytes
2022-05-16T12:48:18.0374160Z The size of all the files that were uploaded is 101 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-16T12:48:18.0374498Z 
2022-05-16T12:48:18.0375318Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-16T12:48:18.0375724Z 
2022-05-16T12:48:18.0378774Z Artifact artifact has been successfully uploaded!
2022-05-16T12:48:18.0472810Z Post job cleanup.
2022-05-16T12:48:18.1578402Z [command]/usr/bin/git version
2022-05-16T12:48:18.1621859Z git version 2.36.1
2022-05-16T12:48:18.1659798Z Temporarily overriding HOME='/home/runner/work/_temp/93404c4f-f1e2-4343-96dc-40c93e452648' before making global git config changes
2022-05-16T12:48:18.1660459Z Adding repository directory to the temporary git global config as a safe directory
2022-05-16T12:48:18.1664719Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/git_demo/git_demo
2022-05-16T12:48:18.1704500Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-16T12:48:18.1736343Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-16T12:48:18.1943075Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-16T12:48:18.2003488Z http.https://github.com/.extraheader
2022-05-16T12:48:18.2012279Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-16T12:48:18.2046453Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-16T12:48:18.2508385Z Cleaning up orphan processes
```
