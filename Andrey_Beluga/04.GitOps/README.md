# GIT
## 04.GitOps

### [URL Github](https://github.com/bonvoyajer/04.GitOps/actions)

### Pipeline Log
```bash
2022-06-22T14:04:39.0225005Z Requested labels: ubuntu-latest
2022-06-22T14:04:39.0225058Z Job defined at: bonvoyajer/04.GitOps/.github/workflows/first.yaml@refs/heads/main
2022-06-22T14:04:39.0225083Z Waiting for a runner to pick up this job...
2022-06-22T14:04:40.0076826Z Job is waiting for a hosted runner to come online.
2022-06-22T14:04:43.2033626Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-06-22T14:04:47.2829897Z Current runner version: '2.293.0'
2022-06-22T14:04:47.2858654Z ##[group]Operating System
2022-06-22T14:04:47.2859235Z Ubuntu
2022-06-22T14:04:47.2859575Z 20.04.4
2022-06-22T14:04:47.2859886Z LTS
2022-06-22T14:04:47.2860194Z ##[endgroup]
2022-06-22T14:04:47.2860495Z ##[group]Virtual Environment
2022-06-22T14:04:47.2860877Z Environment: ubuntu-20.04
2022-06-22T14:04:47.2861259Z Version: 20220619.1
2022-06-22T14:04:47.2861764Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220619.1/images/linux/Ubuntu2004-Readme.md
2022-06-22T14:04:47.2862437Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220619.1
2022-06-22T14:04:47.2862902Z ##[endgroup]
2022-06-22T14:04:47.2863218Z ##[group]Virtual Environment Provisioner
2022-06-22T14:04:47.2863651Z 1.0.0.0-main-20220531-1
2022-06-22T14:04:47.2863973Z ##[endgroup]
2022-06-22T14:04:47.2864907Z ##[group]GITHUB_TOKEN Permissions
2022-06-22T14:04:47.2865605Z Actions: write
2022-06-22T14:04:47.2866096Z Checks: write
2022-06-22T14:04:47.2866442Z Contents: write
2022-06-22T14:04:47.2866776Z Deployments: write
2022-06-22T14:04:47.2867135Z Discussions: write
2022-06-22T14:04:47.2867465Z Issues: write
2022-06-22T14:04:47.2867736Z Metadata: read
2022-06-22T14:04:47.2868053Z Packages: write
2022-06-22T14:04:47.2868370Z Pages: write
2022-06-22T14:04:47.2868688Z PullRequests: write
2022-06-22T14:04:47.2869048Z RepositoryProjects: write
2022-06-22T14:04:47.2869410Z SecurityEvents: write
2022-06-22T14:04:47.2869702Z Statuses: write
2022-06-22T14:04:47.2870026Z ##[endgroup]
2022-06-22T14:04:47.2873849Z Secret source: Actions
2022-06-22T14:04:47.2874309Z Prepare workflow directory
2022-06-22T14:04:47.3719782Z Prepare all required actions
2022-06-22T14:04:47.3905488Z Getting action download info
2022-06-22T14:04:47.6637467Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-06-22T14:04:48.3366958Z Download action repository 'tj-actions/changed-files@v13.1' (SHA:2c85495a7bb72f2734cb5181e29b2ee5e08e61f7)
2022-06-22T14:04:48.8522052Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-06-22T14:04:49.4356514Z Getting action download info
2022-06-22T14:04:49.7702829Z Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
2022-06-22T14:04:50.3764962Z ##[group]Run actions/checkout@v2
2022-06-22T14:04:50.3765231Z with:
2022-06-22T14:04:50.3765421Z   fetch-depth: 0
2022-06-22T14:04:50.3765633Z   repository: bonvoyajer/04.GitOps
2022-06-22T14:04:50.3766085Z   token: ***
2022-06-22T14:04:50.3766265Z   ssh-strict: true
2022-06-22T14:04:50.3766472Z   persist-credentials: true
2022-06-22T14:04:50.3766810Z   clean: true
2022-06-22T14:04:50.3766981Z   lfs: false
2022-06-22T14:04:50.3767159Z   submodules: false
2022-06-22T14:04:50.3767373Z   set-safe-directory: true
2022-06-22T14:04:50.3767562Z ##[endgroup]
2022-06-22T14:04:50.6434203Z Syncing repository: bonvoyajer/04.GitOps
2022-06-22T14:04:50.6435966Z ##[group]Getting Git version info
2022-06-22T14:04:50.6436529Z Working directory is '/home/runner/work/04.GitOps/04.GitOps'
2022-06-22T14:04:50.6437038Z [command]/usr/bin/git version
2022-06-22T14:04:50.6565664Z git version 2.36.1
2022-06-22T14:04:50.6586168Z ##[endgroup]
2022-06-22T14:04:50.6606102Z Temporarily overriding HOME='/home/runner/work/_temp/a925e73e-3e65-421a-b4f4-8b2b50d1f58b' before making global git config changes
2022-06-22T14:04:50.6607501Z Adding repository directory to the temporary git global config as a safe directory
2022-06-22T14:04:50.6608067Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
2022-06-22T14:04:50.6651123Z Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
2022-06-22T14:04:50.6656242Z ##[group]Initializing the repository
2022-06-22T14:04:50.6704271Z [command]/usr/bin/git init /home/runner/work/04.GitOps/04.GitOps
2022-06-22T14:04:50.6774598Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-06-22T14:04:50.6775442Z hint: is subject to change. To configure the initial branch name to use in all
2022-06-22T14:04:50.6775913Z hint: of your new repositories, which will suppress this warning, call:
2022-06-22T14:04:50.6776524Z hint: 
2022-06-22T14:04:50.6777431Z hint: 	git config --global init.defaultBranch <name>
2022-06-22T14:04:50.6777746Z hint: 
2022-06-22T14:04:50.6779044Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-06-22T14:04:50.6779685Z hint: 'development'. The just-created branch can be renamed via this command:
2022-06-22T14:04:50.6780061Z hint: 
2022-06-22T14:04:50.6780732Z hint: 	git branch -m <name>
2022-06-22T14:04:50.6785031Z Initialized empty Git repository in /home/runner/work/04.GitOps/04.GitOps/.git/
2022-06-22T14:04:50.6793403Z [command]/usr/bin/git remote add origin https://github.com/bonvoyajer/04.GitOps
2022-06-22T14:04:50.6834277Z ##[endgroup]
2022-06-22T14:04:50.6835033Z ##[group]Disabling automatic garbage collection
2022-06-22T14:04:50.6837835Z [command]/usr/bin/git config --local gc.auto 0
2022-06-22T14:04:50.6868366Z ##[endgroup]
2022-06-22T14:04:50.6869082Z ##[group]Setting up auth
2022-06-22T14:04:50.6875182Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-06-22T14:04:50.6907293Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-06-22T14:04:50.7262666Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-06-22T14:04:50.7287463Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-06-22T14:04:50.7511215Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-06-22T14:04:50.7552524Z ##[endgroup]
2022-06-22T14:04:50.7553425Z ##[group]Fetching the repository
2022-06-22T14:04:50.7557664Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-06-22T14:04:51.1494928Z remote: Enumerating objects: 44, done.        
2022-06-22T14:04:51.1499613Z remote: Counting objects:   2% (1/44)        
2022-06-22T14:04:51.1500580Z remote: Counting objects:   4% (2/44)        
2022-06-22T14:04:51.1501369Z remote: Counting objects:   6% (3/44)        
2022-06-22T14:04:51.1502135Z remote: Counting objects:   9% (4/44)        
2022-06-22T14:04:51.1502631Z remote: Counting objects:  11% (5/44)        
2022-06-22T14:04:51.1503333Z remote: Counting objects:  13% (6/44)        
2022-06-22T14:04:51.1503825Z remote: Counting objects:  15% (7/44)        
2022-06-22T14:04:51.1504812Z remote: Counting objects:  18% (8/44)        
2022-06-22T14:04:51.1505287Z remote: Counting objects:  20% (9/44)        
2022-06-22T14:04:51.1506033Z remote: Counting objects:  22% (10/44)        
2022-06-22T14:04:51.1506527Z remote: Counting objects:  25% (11/44)        
2022-06-22T14:04:51.1507258Z remote: Counting objects:  27% (12/44)        
2022-06-22T14:04:51.1507732Z remote: Counting objects:  29% (13/44)        
2022-06-22T14:04:51.1508449Z remote: Counting objects:  31% (14/44)        
2022-06-22T14:04:51.1508939Z remote: Counting objects:  34% (15/44)        
2022-06-22T14:04:51.1509646Z remote: Counting objects:  36% (16/44)        
2022-06-22T14:04:51.1510111Z remote: Counting objects:  38% (17/44)        
2022-06-22T14:04:51.1510813Z remote: Counting objects:  40% (18/44)        
2022-06-22T14:04:51.1511324Z remote: Counting objects:  43% (19/44)        
2022-06-22T14:04:51.1512786Z remote: Counting objects:  45% (20/44)        
2022-06-22T14:04:51.1513224Z remote: Counting objects:  47% (21/44)        
2022-06-22T14:04:51.1514030Z remote: Counting objects:  50% (22/44)        
2022-06-22T14:04:51.1514742Z remote: Counting objects:  52% (23/44)        
2022-06-22T14:04:51.1515481Z remote: Counting objects:  54% (24/44)        
2022-06-22T14:04:51.1516330Z remote: Counting objects:  56% (25/44)        
2022-06-22T14:04:51.1517267Z remote: Counting objects:  59% (26/44)        
2022-06-22T14:04:51.1517707Z remote: Counting objects:  61% (27/44)        
2022-06-22T14:04:51.1518095Z remote: Counting objects:  63% (28/44)        
2022-06-22T14:04:51.1518670Z remote: Counting objects:  65% (29/44)        
2022-06-22T14:04:51.1519084Z remote: Counting objects:  68% (30/44)        
2022-06-22T14:04:51.1519471Z remote: Counting objects:  70% (31/44)        
2022-06-22T14:04:51.1519840Z remote: Counting objects:  72% (32/44)        
2022-06-22T14:04:51.1520227Z remote: Counting objects:  75% (33/44)        
2022-06-22T14:04:51.1520992Z remote: Counting objects:  77% (34/44)        
2022-06-22T14:04:51.1521358Z remote: Counting objects:  79% (35/44)        
2022-06-22T14:04:51.1521862Z remote: Counting objects:  81% (36/44)        
2022-06-22T14:04:51.1522227Z remote: Counting objects:  84% (37/44)        
2022-06-22T14:04:51.1522698Z remote: Counting objects:  86% (38/44)        
2022-06-22T14:04:51.1523151Z remote: Counting objects:  88% (39/44)        
2022-06-22T14:04:51.1523716Z remote: Counting objects:  90% (40/44)        
2022-06-22T14:04:51.1524279Z remote: Counting objects:  93% (41/44)        
2022-06-22T14:04:51.1524645Z remote: Counting objects:  95% (42/44)        
2022-06-22T14:04:51.1525085Z remote: Counting objects:  97% (43/44)        
2022-06-22T14:04:51.1525633Z remote: Counting objects: 100% (44/44)        
2022-06-22T14:04:51.1525997Z remote: Counting objects: 100% (44/44), done.        
2022-06-22T14:04:51.1526386Z remote: Compressing objects:   4% (1/22)        
2022-06-22T14:04:51.1526924Z remote: Compressing objects:   9% (2/22)        
2022-06-22T14:04:51.1527296Z remote: Compressing objects:  13% (3/22)        
2022-06-22T14:04:51.1527906Z remote: Compressing objects:  18% (4/22)        
2022-06-22T14:04:51.1528285Z remote: Compressing objects:  22% (5/22)        
2022-06-22T14:04:51.1528631Z remote: Compressing objects:  27% (6/22)        
2022-06-22T14:04:51.1529220Z remote: Compressing objects:  31% (7/22)        
2022-06-22T14:04:51.1529594Z remote: Compressing objects:  36% (8/22)        
2022-06-22T14:04:51.1530283Z remote: Compressing objects:  40% (9/22)        
2022-06-22T14:04:51.1530673Z remote: Compressing objects:  45% (10/22)        
2022-06-22T14:04:51.1531048Z remote: Compressing objects:  50% (11/22)        
2022-06-22T14:04:51.1531408Z remote: Compressing objects:  54% (12/22)        
2022-06-22T14:04:51.1532020Z remote: Compressing objects:  59% (13/22)        
2022-06-22T14:04:51.1532378Z remote: Compressing objects:  63% (14/22)        
2022-06-22T14:04:51.1532982Z remote: Compressing objects:  68% (15/22)        
2022-06-22T14:04:51.1533355Z remote: Compressing objects:  72% (16/22)        
2022-06-22T14:04:51.1533976Z remote: Compressing objects:  77% (17/22)        
2022-06-22T14:04:51.1534327Z remote: Compressing objects:  81% (18/22)        
2022-06-22T14:04:51.1534712Z remote: Compressing objects:  86% (19/22)        
2022-06-22T14:04:51.1535262Z remote: Compressing objects:  90% (20/22)        
2022-06-22T14:04:51.1535821Z remote: Compressing objects:  95% (21/22)        
2022-06-22T14:04:51.1536207Z remote: Compressing objects: 100% (22/22)        
2022-06-22T14:04:51.1536822Z remote: Compressing objects: 100% (22/22), done.        
2022-06-22T14:04:51.1537635Z remote: Total 44 (delta 7), reused 43 (delta 7), pack-reused 0        
2022-06-22T14:04:51.1648617Z From https://github.com/bonvoyajer/04.GitOps
2022-06-22T14:04:51.1649648Z  * [new branch]      main       -> origin/main
2022-06-22T14:04:51.1822126Z [command]/usr/bin/git branch --list --remote origin/main
2022-06-22T14:04:51.1852365Z   origin/main
2022-06-22T14:04:51.1860516Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-06-22T14:04:51.1887247Z f5fbeac10fc8fb956d618f1c632ae7ca04d3e361
2022-06-22T14:04:51.1891601Z ##[endgroup]
2022-06-22T14:04:51.1892590Z ##[group]Determining the checkout info
2022-06-22T14:04:51.1893853Z ##[endgroup]
2022-06-22T14:04:51.1894416Z ##[group]Checking out the ref
2022-06-22T14:04:51.1896389Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-06-22T14:04:51.1940735Z Switched to a new branch 'main'
2022-06-22T14:04:51.1942760Z branch 'main' set up to track 'origin/main'.
2022-06-22T14:04:51.1947879Z ##[endgroup]
2022-06-22T14:04:51.1986225Z [command]/usr/bin/git log -1 --format='%H'
2022-06-22T14:04:51.2014351Z 'f5fbeac10fc8fb956d618f1c632ae7ca04d3e361'
2022-06-22T14:04:51.2313478Z ##[group]Run tj-actions/changed-files@v13.1
2022-06-22T14:04:51.2313711Z with:
2022-06-22T14:04:51.2314085Z   token: ***
2022-06-22T14:04:51.2314265Z   separator:  
2022-06-22T14:04:51.2314482Z   sha: f5fbeac10fc8fb956d618f1c632ae7ca04d3e361
2022-06-22T14:04:51.2314726Z   since_last_remote_commit: false
2022-06-22T14:04:51.2314927Z ##[endgroup]
2022-06-22T14:04:51.2585363Z ##[group]Run # "Set base sha..."
2022-06-22T14:04:51.2585783Z [36;1m# "Set base sha..."[0m
2022-06-22T14:04:51.2586172Z [36;1mif [[ -n "" ]]; then[0m
2022-06-22T14:04:51.2586445Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-06-22T14:04:51.2586753Z [36;1melif [[ "false" == "true" ]]; then[0m
2022-06-22T14:04:51.2587107Z [36;1m  if [[ "5af979974ecd007614b836644174dadd8481c34d" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-06-22T14:04:51.2587456Z [36;1m    echo "::set-output name=base_sha::5af979974ecd007614b836644174dadd8481c34d"[0m
2022-06-22T14:04:51.2587932Z [36;1m  else[0m
2022-06-22T14:04:51.2588341Z [36;1m    echo "::set-output name=base_sha::f5fbeac10fc8fb956d618f1c632ae7ca04d3e361"[0m
2022-06-22T14:04:51.2588623Z [36;1m  fi[0m
2022-06-22T14:04:51.2588849Z [36;1mfi[0m
2022-06-22T14:04:51.2642287Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-22T14:04:51.2642594Z ##[endgroup]
2022-06-22T14:04:51.2838634Z ##[group]Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
2022-06-22T14:04:51.2839065Z [36;1mbash $GITHUB_ACTION_PATH/sourcefiles.sh[0m
2022-06-22T14:04:51.2886746Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-22T14:04:51.2887150Z env:
2022-06-22T14:04:51.2887369Z   INPUT_FILES: 
2022-06-22T14:04:51.2887645Z   INPUT_FILES_FROM_SOURCE_FILE: 
2022-06-22T14:04:51.2887917Z ##[endgroup]
2022-06-22T14:04:51.2975411Z ##[group]changed-files-from-source-file
2022-06-22T14:04:51.3096169Z Input files: 
2022-06-22T14:04:51.3119001Z ##[endgroup]
2022-06-22T14:04:51.3165671Z ##[group]Run tj-actions/glob@v3.3
2022-06-22T14:04:51.3165935Z with:
2022-06-22T14:04:51.3166235Z   files-separator:  
2022-06-22T14:04:51.3166523Z   separator: |
2022-06-22T14:04:51.3166825Z   excluded-files-separator: 

2022-06-22T14:04:51.3167181Z   files-from-source-file-separator: 

2022-06-22T14:04:51.3167587Z   excluded-files-from-source-file-separator: 

2022-06-22T14:04:51.3167987Z   follow-symbolic-links: true
2022-06-22T14:04:51.3168260Z   strip-top-level-dir: true
2022-06-22T14:04:51.3168625Z   include-deleted-files: false
2022-06-22T14:04:51.3168980Z   sha: f5fbeac10fc8fb956d618f1c632ae7ca04d3e361
2022-06-22T14:04:51.3169331Z   working-directory: /home/runner/work/04.GitOps/04.GitOps
2022-06-22T14:04:51.3169663Z ##[endgroup]
2022-06-22T14:04:51.3774936Z 
2022-06-22T14:04:51.3852912Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-06-22T14:04:51.3853302Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-06-22T14:04:51.4029226Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-22T14:04:51.4029508Z env:
2022-06-22T14:04:51.4029761Z   GITHUB_SERVER_URL: https://github.com
2022-06-22T14:04:51.4030030Z   GITHUB_REPOSITORY: bonvoyajer/04.GitOps
2022-06-22T14:04:51.4030267Z   GITHUB_BASE_REF: 
2022-06-22T14:04:51.4030532Z   INPUT_SHA: f5fbeac10fc8fb956d618f1c632ae7ca04d3e361
2022-06-22T14:04:51.4030781Z   INPUT_BASE_SHA: 
2022-06-22T14:04:51.4031315Z   INPUT_TOKEN: ***
2022-06-22T14:04:51.4031518Z   INPUT_FILES: 
2022-06-22T14:04:51.4031719Z   INPUT_SEPARATOR:  
2022-06-22T14:04:51.4032055Z   INPUT_PATH: 
2022-06-22T14:04:51.4032257Z ##[endgroup]
2022-06-22T14:04:51.4123880Z ##[group]changed-files
2022-06-22T14:04:51.4124676Z Resolving repository path...
2022-06-22T14:04:51.4154296Z Setting up 'temp_changed_files' remote...
2022-06-22T14:04:51.4192398Z No 'temp_changed_files' remote found
2022-06-22T14:04:51.4193071Z Creating 'temp_changed_files' remote...
2022-06-22T14:04:51.4230411Z Getting HEAD info...
2022-06-22T14:04:51.4288109Z Retrieving changes between 5af979974ecd007614b836644174dadd8481c34d (main) → f5fbeac10fc8fb956d618f1c632ae7ca04d3e361 (main)
2022-06-22T14:04:51.4288771Z Getting diff...
2022-06-22T14:04:51.4632411Z Added files: 
2022-06-22T14:04:51.4633179Z Copied files: 
2022-06-22T14:04:51.4635115Z Deleted files: 
2022-06-22T14:04:51.4635535Z Modified files: .github/workflows/first.yaml
2022-06-22T14:04:51.4636009Z Renamed files: 
2022-06-22T14:04:51.4636419Z Type Changed files: 
2022-06-22T14:04:51.4636810Z Unmerged files: 
2022-06-22T14:04:51.4637213Z Unknown files: 
2022-06-22T14:04:51.4637710Z All changed and modified files: .github/workflows/first.yaml
2022-06-22T14:04:51.4638204Z All changed files: .github/workflows/first.yaml
2022-06-22T14:04:51.4638596Z All modified files: .github/workflows/first.yaml
2022-06-22T14:04:51.4667959Z ##[endgroup]
2022-06-22T14:04:51.4775200Z ##[group]Run for file in .github/workflows/first.yaml; do
2022-06-22T14:04:51.4775507Z [36;1mfor file in .github/workflows/first.yaml; do[0m
2022-06-22T14:04:51.4775779Z [36;1m  echo "$file was changed" >> files.log 2>&1[0m
2022-06-22T14:04:51.4776084Z [36;1m  echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1 [0m
2022-06-22T14:04:51.4776340Z [36;1mdone[0m
2022-06-22T14:04:51.4824621Z shell: /usr/bin/bash -e {0}
2022-06-22T14:04:51.4824832Z ##[endgroup]
2022-06-22T14:04:51.4954929Z ##[group]Run actions/upload-artifact@v2
2022-06-22T14:04:51.4955149Z with:
2022-06-22T14:04:51.4955320Z   path: files.log
2022-06-22T14:04:51.4955498Z   name: artifact
2022-06-22T14:04:51.4955697Z   if-no-files-found: warn
2022-06-22T14:04:51.4955889Z ##[endgroup]
2022-06-22T14:04:51.5477906Z With the provided path, there will be 1 file uploaded
2022-06-22T14:04:51.5481765Z Starting artifact upload
2022-06-22T14:04:51.5482908Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-06-22T14:04:51.5484377Z Artifact name is valid!
2022-06-22T14:04:51.7783125Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-06-22T14:04:52.0716338Z Total size of all the files uploaded is 63 bytes
2022-06-22T14:04:52.0719516Z File upload process has finished. Finalizing the artifact upload
2022-06-22T14:04:52.1566480Z Artifact has been finalized. All files have been successfully uploaded!
2022-06-22T14:04:52.1568815Z 
2022-06-22T14:04:52.1570095Z The raw size of all the files that were specified for upload is 63 bytes
2022-06-22T14:04:52.1570767Z The size of all the files that were uploaded is 63 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-06-22T14:04:52.1571580Z 
2022-06-22T14:04:52.1620361Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-06-22T14:04:52.1621355Z 
2022-06-22T14:04:52.1621767Z Artifact artifact has been successfully uploaded!
2022-06-22T14:04:52.1686151Z Post job cleanup.
2022-06-22T14:04:52.2833085Z [command]/usr/bin/git version
2022-06-22T14:04:52.2875663Z git version 2.36.1
2022-06-22T14:04:52.2914168Z Temporarily overriding HOME='/home/runner/work/_temp/2d5a5194-1fce-4783-9307-55486f605d8e' before making global git config changes
2022-06-22T14:04:52.2914886Z Adding repository directory to the temporary git global config as a safe directory
2022-06-22T14:04:52.2919665Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
2022-06-22T14:04:52.2961710Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-06-22T14:04:52.2995612Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-06-22T14:04:52.3254532Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-06-22T14:04:52.3282702Z http.https://github.com/.extraheader
2022-06-22T14:04:52.3338414Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-06-22T14:04:52.3392433Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-06-22T14:04:52.3890236Z Cleaning up orphan processes
```
