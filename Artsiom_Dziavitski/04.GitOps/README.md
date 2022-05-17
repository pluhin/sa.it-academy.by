# 04.GitOps
**##Link to repo:**
	[04.GitOps](https://github.com/artem-devitsky/04.GitOps)

**##Link to file:** 
	[find_tabs_pr.yaml](https://github.com/artem-devitsky/04.GitOps/blob/dev/find_tabs_pr.yaml)

**##Pipeline Log:**

```bash
2022-05-15T13:00:11.1270881Z Requested labels: ubuntu-latest
2022-05-15T13:00:11.1270960Z Job defined at: artem-devitsky/04.GitOps/.github/workflows/find_tabs_pr.yaml@refs/pull/1/merge
2022-05-15T13:00:11.1270997Z Waiting for a runner to pick up this job...
2022-05-15T13:00:11.7053787Z Job is waiting for a hosted runner to come online.
2022-05-15T13:00:15.1273109Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-15T13:00:17.4723024Z Current runner version: '2.291.1'
2022-05-15T13:00:17.4755499Z ##[group]Operating System
2022-05-15T13:00:17.4756196Z Ubuntu
2022-05-15T13:00:17.4756506Z 20.04.4
2022-05-15T13:00:17.4756941Z LTS
2022-05-15T13:00:17.4757295Z ##[endgroup]
2022-05-15T13:00:17.4757654Z ##[group]Virtual Environment
2022-05-15T13:00:17.4758102Z Environment: ubuntu-20.04
2022-05-15T13:00:17.4758571Z Version: 20220508.1
2022-05-15T13:00:17.4759273Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220508.1/images/linux/Ubuntu2004-Readme.md
2022-05-15T13:00:17.4760072Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220508.1
2022-05-15T13:00:17.4760611Z ##[endgroup]
2022-05-15T13:00:17.4760996Z ##[group]Virtual Environment Provisioner
2022-05-15T13:00:17.4761489Z 1.0.0.0-main-20220421-1
2022-05-15T13:00:17.4761885Z ##[endgroup]
2022-05-15T13:00:17.4762753Z ##[group]GITHUB_TOKEN Permissions
2022-05-15T13:00:17.4763431Z Contents: read
2022-05-15T13:00:17.4764102Z Metadata: read
2022-05-15T13:00:17.4764550Z ##[endgroup]
2022-05-15T13:00:17.4768867Z Secret source: Actions
2022-05-15T13:00:17.4769465Z Prepare workflow directory
2022-05-15T13:00:17.5947300Z Prepare all required actions
2022-05-15T13:00:17.6181902Z Getting action download info
2022-05-15T13:00:17.8738002Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-05-15T13:00:18.5457859Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-05-15T13:00:18.9819841Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-15T13:00:19.5734443Z Getting action download info
2022-05-15T13:00:19.8239745Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-05-15T13:00:20.5095778Z ##[group]Run actions/checkout@v2
2022-05-15T13:00:20.5096685Z with:
2022-05-15T13:00:20.5097522Z   fetch-depth: 0
2022-05-15T13:00:20.5098281Z   repository: artem-devitsky/04.GitOps
2022-05-15T13:00:20.5099570Z   token: ***
2022-05-15T13:00:20.5100380Z   ssh-strict: true
2022-05-15T13:00:20.5101225Z   persist-credentials: true
2022-05-15T13:00:20.5101930Z   clean: true
2022-05-15T13:00:20.5102534Z   lfs: false
2022-05-15T13:00:20.5103197Z   submodules: false
2022-05-15T13:00:20.5104120Z   set-safe-directory: true
2022-05-15T13:00:20.5104439Z ##[endgroup]
2022-05-15T13:00:20.8604856Z Syncing repository: artem-devitsky/04.GitOps
2022-05-15T13:00:20.8606974Z ##[group]Getting Git version info
2022-05-15T13:00:20.8607599Z Working directory is '/home/runner/work/04.GitOps/04.GitOps'
2022-05-15T13:00:20.8623538Z [command]/usr/bin/git version
2022-05-15T13:00:20.8815468Z git version 2.36.1
2022-05-15T13:00:20.8875952Z ##[endgroup]
2022-05-15T13:00:20.8901858Z Temporarily overriding HOME='/home/runner/work/_temp/46c93510-61cb-409a-b766-86e5f359e862' before making global git config changes
2022-05-15T13:00:20.8903043Z Adding repository directory to the temporary git global config as a safe directory
2022-05-15T13:00:20.8912883Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
2022-05-15T13:00:20.8977756Z Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
2022-05-15T13:00:20.8983657Z ##[group]Initializing the repository
2022-05-15T13:00:20.8987840Z [command]/usr/bin/git init /home/runner/work/04.GitOps/04.GitOps
2022-05-15T13:00:20.9109228Z Initialized empty Git repository in /home/runner/work/04.GitOps/04.GitOps/.git/
2022-05-15T13:00:20.9114157Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-15T13:00:20.9116173Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-15T13:00:20.9118977Z hint: of your new repositories, which will suppress this warning, call:
2022-05-15T13:00:20.9120891Z hint: 
2022-05-15T13:00:20.9123848Z hint: 	git config --global init.defaultBranch <name>
2022-05-15T13:00:20.9125611Z hint: 
2022-05-15T13:00:20.9129041Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-15T13:00:20.9131198Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-15T13:00:20.9133301Z hint: 
2022-05-15T13:00:20.9135380Z hint: 	git branch -m <name>
2022-05-15T13:00:20.9138402Z [command]/usr/bin/git remote add origin https://github.com/artem-devitsky/04.GitOps
2022-05-15T13:00:20.9181452Z ##[endgroup]
2022-05-15T13:00:20.9182756Z ##[group]Disabling automatic garbage collection
2022-05-15T13:00:20.9187500Z [command]/usr/bin/git config --local gc.auto 0
2022-05-15T13:00:20.9223656Z ##[endgroup]
2022-05-15T13:00:20.9224714Z ##[group]Setting up auth
2022-05-15T13:00:20.9239844Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-15T13:00:20.9286350Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-15T13:00:20.9696864Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-15T13:00:20.9726293Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-15T13:00:20.9978996Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-15T13:00:21.0028265Z ##[endgroup]
2022-05-15T13:00:21.0029584Z ##[group]Fetching the repository
2022-05-15T13:00:21.0039746Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +4c9d33c8a0112a18d006297018592f5a51097c7e:refs/remotes/pull/1/merge
2022-05-15T13:00:21.5035230Z remote: Enumerating objects: 24, done.        
2022-05-15T13:00:21.5268057Z remote: Counting objects:   4% (1/24)        
2022-05-15T13:00:21.5268415Z remote: Counting objects:   8% (2/24)        
2022-05-15T13:00:21.5268703Z remote: Counting objects:  12% (3/24)        
2022-05-15T13:00:21.5268989Z remote: Counting objects:  16% (4/24)        
2022-05-15T13:00:21.5269258Z remote: Counting objects:  20% (5/24)        
2022-05-15T13:00:21.5269540Z remote: Counting objects:  25% (6/24)        
2022-05-15T13:00:21.5269823Z remote: Counting objects:  29% (7/24)        
2022-05-15T13:00:21.5270092Z remote: Counting objects:  33% (8/24)        
2022-05-15T13:00:21.5270368Z remote: Counting objects:  37% (9/24)        
2022-05-15T13:00:21.5270652Z remote: Counting objects:  41% (10/24)        
2022-05-15T13:00:21.5270974Z remote: Counting objects:  45% (11/24)        
2022-05-15T13:00:21.5271259Z remote: Counting objects:  50% (12/24)        
2022-05-15T13:00:21.5271551Z remote: Counting objects:  54% (13/24)        
2022-05-15T13:00:21.5271829Z remote: Counting objects:  58% (14/24)        
2022-05-15T13:00:21.5272120Z remote: Counting objects:  62% (15/24)        
2022-05-15T13:00:21.5272407Z remote: Counting objects:  66% (16/24)        
2022-05-15T13:00:21.5272687Z remote: Counting objects:  70% (17/24)        
2022-05-15T13:00:21.5272959Z remote: Counting objects:  75% (18/24)        
2022-05-15T13:00:21.5273234Z remote: Counting objects:  79% (19/24)        
2022-05-15T13:00:21.5273513Z remote: Counting objects:  83% (20/24)        
2022-05-15T13:00:21.5273785Z remote: Counting objects:  87% (21/24)        
2022-05-15T13:00:21.5274061Z remote: Counting objects:  91% (22/24)        
2022-05-15T13:00:21.5274336Z remote: Counting objects:  95% (23/24)        
2022-05-15T13:00:21.5274601Z remote: Counting objects: 100% (24/24)        
2022-05-15T13:00:21.5274886Z remote: Counting objects: 100% (24/24), done.        
2022-05-15T13:00:21.5275199Z remote: Compressing objects:   5% (1/18)        
2022-05-15T13:00:21.5275494Z remote: Compressing objects:  11% (2/18)        
2022-05-15T13:00:21.5275897Z remote: Compressing objects:  16% (3/18)        
2022-05-15T13:00:21.5276501Z remote: Compressing objects:  22% (4/18)        
2022-05-15T13:00:21.5276793Z remote: Compressing objects:  27% (5/18)        
2022-05-15T13:00:21.5277079Z remote: Compressing objects:  33% (6/18)        
2022-05-15T13:00:21.5277366Z remote: Compressing objects:  38% (7/18)        
2022-05-15T13:00:21.5277659Z remote: Compressing objects:  44% (8/18)        
2022-05-15T13:00:21.5277948Z remote: Compressing objects:  50% (9/18)        
2022-05-15T13:00:21.5278236Z remote: Compressing objects:  55% (10/18)        
2022-05-15T13:00:21.5278532Z remote: Compressing objects:  61% (11/18)        
2022-05-15T13:00:21.5278833Z remote: Compressing objects:  66% (12/18)        
2022-05-15T13:00:21.5279118Z remote: Compressing objects:  72% (13/18)        
2022-05-15T13:00:21.5279414Z remote: Compressing objects:  77% (14/18)        
2022-05-15T13:00:21.5279712Z remote: Compressing objects:  83% (15/18)        
2022-05-15T13:00:21.5279997Z remote: Compressing objects:  88% (16/18)        
2022-05-15T13:00:21.5280291Z remote: Compressing objects:  94% (17/18)        
2022-05-15T13:00:21.5280583Z remote: Compressing objects: 100% (18/18)        
2022-05-15T13:00:21.5280881Z remote: Compressing objects: 100% (18/18), done.        
2022-05-15T13:00:21.5281563Z remote: Total 24 (delta 2), reused 22 (delta 1), pack-reused 0        
2022-05-15T13:00:21.5321922Z From https://github.com/artem-devitsky/04.GitOps
2022-05-15T13:00:21.5322425Z  * [new branch]      dev                                      -> origin/dev
2022-05-15T13:00:21.5325203Z  * [new branch]      main                                     -> origin/main
2022-05-15T13:00:21.5328153Z  * [new ref]         4c9d33c8a0112a18d006297018592f5a51097c7e -> pull/1/merge
2022-05-15T13:00:21.5365136Z ##[endgroup]
2022-05-15T13:00:21.5366080Z ##[group]Determining the checkout info
2022-05-15T13:00:21.5367314Z ##[endgroup]
2022-05-15T13:00:21.5367770Z ##[group]Checking out the ref
2022-05-15T13:00:21.5372933Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/1/merge
2022-05-15T13:00:21.5419703Z Note: switching to 'refs/remotes/pull/1/merge'.
2022-05-15T13:00:21.5421003Z 
2022-05-15T13:00:21.5422071Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-15T13:00:21.5422648Z changes and commit them, and you can discard any commits you make in this
2022-05-15T13:00:21.5423637Z state without impacting any branches by switching back to a branch.
2022-05-15T13:00:21.5424543Z 
2022-05-15T13:00:21.5428609Z If you want to create a new branch to retain commits you create, you may
2022-05-15T13:00:21.5429643Z do so (now or later) by using -c with the switch command. Example:
2022-05-15T13:00:21.5430297Z 
2022-05-15T13:00:21.5430766Z   git switch -c <new-branch-name>
2022-05-15T13:00:21.5430951Z 
2022-05-15T13:00:21.5431637Z Or undo this operation with:
2022-05-15T13:00:21.5431949Z 
2022-05-15T13:00:21.5432054Z   git switch -
2022-05-15T13:00:21.5432216Z 
2022-05-15T13:00:21.5432405Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-15T13:00:21.5432653Z 
2022-05-15T13:00:21.5432912Z HEAD is now at 4c9d33c Merge d29752cacbe9fa48726d3d0cd1bd7890c3c0b9e0 into c7f797dd682b4992c94df18605b7faeb1856a439
2022-05-15T13:00:21.5440498Z ##[endgroup]
2022-05-15T13:00:21.5502845Z [command]/usr/bin/git log -1 --format='%H'
2022-05-15T13:00:21.5538576Z '4c9d33c8a0112a18d006297018592f5a51097c7e'
2022-05-15T13:00:21.5967680Z ##[group]Run tj-actions/changed-files@v19
2022-05-15T13:00:21.5968007Z with:
2022-05-15T13:00:21.5968677Z   token: ***
2022-05-15T13:00:21.5969170Z   separator:  
2022-05-15T13:00:21.5969608Z   files_separator: 

2022-05-15T13:00:21.5969904Z   files_ignore_separator: 

2022-05-15T13:00:21.5970427Z   sha: 4c9d33c8a0112a18d006297018592f5a51097c7e
2022-05-15T13:00:21.5970901Z   since_last_remote_commit: false
2022-05-15T13:00:21.5971217Z   use_fork_point: false
2022-05-15T13:00:21.5971685Z   quotepath: true
2022-05-15T13:00:21.5971918Z ##[endgroup]
2022-05-15T13:00:21.6367652Z ##[group]Run # "Set base sha..."
2022-05-15T13:00:21.6368395Z [36;1m# "Set base sha..."[0m
2022-05-15T13:00:21.6368628Z [36;1mif [[ -n "" ]]; then[0m
2022-05-15T13:00:21.6368900Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-15T13:00:21.6369218Z [36;1melif [[ "false" == "true" && "" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-15T13:00:21.6369692Z [36;1m    echo "::set-output name=base_sha::"[0m
2022-05-15T13:00:21.6369939Z [36;1mfi[0m
2022-05-15T13:00:21.6433091Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-15T13:00:21.6433389Z ##[endgroup]
2022-05-15T13:00:21.6660924Z ##[group]Run # "Calculating the previous and current SHA..."
2022-05-15T13:00:21.6661308Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-05-15T13:00:21.6661729Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-05-15T13:00:21.6711211Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-15T13:00:21.6711513Z env:
2022-05-15T13:00:21.6711771Z   GITHUB_SERVER_URL: https://github.com
2022-05-15T13:00:21.6712091Z   GITHUB_REPOSITORY: artem-devitsky/04.GitOps
2022-05-15T13:00:21.6712347Z   GITHUB_BASE_REF: main
2022-05-15T13:00:21.6712580Z   GITHUB_HEAD_REF: dev
2022-05-15T13:00:21.6712898Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-15T13:00:21.6713350Z   INPUT_SHA: 4c9d33c8a0112a18d006297018592f5a51097c7e
2022-05-15T13:00:21.6713724Z   INPUT_BASE_SHA: 
2022-05-15T13:00:21.6714182Z   INPUT_TOKEN: ***
2022-05-15T13:00:21.6714405Z   INPUT_PATH: 
2022-05-15T13:00:21.6714620Z   INPUT_USE_FORK_POINT: false
2022-05-15T13:00:21.6714857Z ##[endgroup]
2022-05-15T13:00:21.6805041Z ##[group]changed-files-diff-sha
2022-05-15T13:00:21.6806582Z Resolving repository path...
2022-05-15T13:00:21.6835993Z Setting up 'temp_changed_files' remote...
2022-05-15T13:00:21.6876053Z No 'temp_changed_files' remote found
2022-05-15T13:00:21.6876736Z Creating 'temp_changed_files' remote...
2022-05-15T13:00:21.6912484Z Getting HEAD SHA...
2022-05-15T13:00:22.1682692Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-15T13:00:22.1702799Z From https://github.com/artem-devitsky/04.GitOps
2022-05-15T13:00:22.1703431Z  * [new branch]      main       -> main
2022-05-15T13:00:22.1703830Z  * [new branch]      main       -> temp_changed_files/main
2022-05-15T13:00:22.1731489Z Verifying commit SHA...
2022-05-15T13:00:22.1773952Z ##[endgroup]
2022-05-15T13:00:22.1821615Z ##[group]Run tj-actions/glob@v7.16
2022-05-15T13:00:22.1821873Z with:
2022-05-15T13:00:22.1822096Z   files-separator: 

2022-05-15T13:00:22.1822332Z   escape-paths: true
2022-05-15T13:00:22.1822599Z   excluded-files-separator: 

2022-05-15T13:00:22.1822910Z   base-sha: c7f797dd682b4992c94df18605b7faeb1856a439
2022-05-15T13:00:22.1823220Z   sha: 4c9d33c8a0112a18d006297018592f5a51097c7e
2022-05-15T13:00:22.1823490Z   include-deleted-files: true
2022-05-15T13:00:22.1823738Z   separator: |
2022-05-15T13:00:22.1824010Z   files-from-source-file-separator: 

2022-05-15T13:00:22.1824359Z   excluded-files-from-source-file-separator: 

2022-05-15T13:00:22.1824703Z   follow-symbolic-links: true
2022-05-15T13:00:22.1824978Z   strip-top-level-dir: true
2022-05-15T13:00:22.1825211Z ##[endgroup]
2022-05-15T13:00:22.2644070Z [command]/usr/bin/git rev-parse --show-toplevel
2022-05-15T13:00:22.2690779Z /home/runner/work/04.GitOps/04.GitOps
2022-05-15T13:00:22.2732808Z [command]/usr/bin/git diff --diff-filter=D --name-only c7f797dd682b4992c94df18605b7faeb1856a439 4c9d33c8a0112a18d006297018592f5a51097c7e
2022-05-15T13:00:22.2775956Z 
2022-05-15T13:00:22.2849068Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-15T13:00:22.2849468Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-15T13:00:22.2905553Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-15T13:00:22.2905851Z env:
2022-05-15T13:00:22.2906286Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-15T13:00:22.2906620Z   INPUT_FILES_PATTERN_FILE: 
2022-05-15T13:00:22.2906850Z   INPUT_SEPARATOR:  
2022-05-15T13:00:22.2907262Z   INPUT_PATH: 
2022-05-15T13:00:22.2907553Z   INPUT_PREVIOUS_SHA: c7f797dd682b4992c94df18605b7faeb1856a439
2022-05-15T13:00:22.2907882Z   INPUT_CURRENT_SHA: 4c9d33c8a0112a18d006297018592f5a51097c7e
2022-05-15T13:00:22.2908169Z   INPUT_TARGET_BRANCH: main
2022-05-15T13:00:22.2908417Z   INPUT_CURRENT_BRANCH: dev
2022-05-15T13:00:22.2908656Z   INPUT_QUOTEPATH: true
2022-05-15T13:00:22.2908888Z ##[endgroup]
2022-05-15T13:00:22.3039416Z ##[group]changed-files
2022-05-15T13:00:22.3039903Z Resolving repository path...
2022-05-15T13:00:22.3041270Z Retrieving changes between c7f797dd682b4992c94df18605b7faeb1856a439 (main) → 4c9d33c8a0112a18d006297018592f5a51097c7e (dev)
2022-05-15T13:00:22.3041822Z Getting diff...
2022-05-15T13:00:22.6141394Z Added files: .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml find_tabs_pr.yaml
2022-05-15T13:00:22.6146343Z Copied files: 
2022-05-15T13:00:22.6147254Z Deleted files: 
2022-05-15T13:00:22.6150677Z Modified files: README.md
2022-05-15T13:00:22.6150936Z Renamed files: 
2022-05-15T13:00:22.6151152Z Type Changed files: 
2022-05-15T13:00:22.6151350Z Unmerged files: 
2022-05-15T13:00:22.6151556Z Unknown files: 
2022-05-15T13:00:22.6151934Z All changed and modified files: .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml README.md find_tabs_pr.yaml
2022-05-15T13:00:22.6152466Z All changed files: .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml README.md find_tabs_pr.yaml
2022-05-15T13:00:22.6152936Z All modified files: .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml README.md find_tabs_pr.yaml
2022-05-15T13:00:22.6157574Z ##[endgroup]
2022-05-15T13:00:22.6282565Z ##[group]Run for file_name in .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml README.md find_tabs_pr.yaml
2022-05-15T13:00:22.6283254Z [36;1mfor file_name in .github/workflows/find_tabs_pr.yaml .github/workflows/find_tabs_push.yaml README.md find_tabs_pr.yaml[0m
2022-05-15T13:00:22.6283601Z [36;1mdo[0m
2022-05-15T13:00:22.6283874Z [36;1m  tabs_count=$(grep -P "\t" "${file_name}"|wc -l)[0m
2022-05-15T13:00:22.6284257Z [36;1m  echo "File: ${file_name} changed and content ${tabs_count} of tabs"|tee -a report.log[0m
2022-05-15T13:00:22.6284559Z [36;1mdone[0m
2022-05-15T13:00:22.6336596Z shell: /usr/bin/bash -e {0}
2022-05-15T13:00:22.6336817Z ##[endgroup]
2022-05-15T13:00:22.6445755Z File: .github/workflows/find_tabs_pr.yaml changed and content 0 of tabs
2022-05-15T13:00:22.6474650Z File: .github/workflows/find_tabs_push.yaml changed and content 0 of tabs
2022-05-15T13:00:22.6504723Z File: README.md changed and content 5 of tabs
2022-05-15T13:00:22.6536208Z File: find_tabs_pr.yaml changed and content 0 of tabs
2022-05-15T13:00:22.6570441Z ##[group]Run actions/upload-artifact@v2
2022-05-15T13:00:22.6570703Z with:
2022-05-15T13:00:22.6570895Z   path: report.log
2022-05-15T13:00:22.6571082Z   name: artifact
2022-05-15T13:00:22.6571294Z   if-no-files-found: warn
2022-05-15T13:00:22.6571526Z ##[endgroup]
2022-05-15T13:00:22.7200572Z With the provided path, there will be 1 file uploaded
2022-05-15T13:00:22.7204594Z Starting artifact upload
2022-05-15T13:00:22.7205653Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-15T13:00:22.7206464Z Artifact name is valid!
2022-05-15T13:00:23.0453541Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-15T13:00:23.1792052Z Total size of all the files uploaded is 116 bytes
2022-05-15T13:00:23.1792442Z File upload process has finished. Finalizing the artifact upload
2022-05-15T13:00:23.2634246Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-15T13:00:23.2634491Z 
2022-05-15T13:00:23.2634667Z The raw size of all the files that were specified for upload is 246 bytes
2022-05-15T13:00:23.2635301Z The size of all the files that were uploaded is 116 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-15T13:00:23.2635921Z 
2022-05-15T13:00:23.2636731Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-15T13:00:23.2637074Z 
2022-05-15T13:00:23.2637211Z Artifact artifact has been successfully uploaded!
2022-05-15T13:00:23.2786376Z Post job cleanup.
2022-05-15T13:00:23.2825476Z Post job cleanup.
2022-05-15T13:00:23.3418910Z Post job cleanup.
2022-05-15T13:00:23.4908507Z [command]/usr/bin/git version
2022-05-15T13:00:23.4963948Z git version 2.36.1
2022-05-15T13:00:23.5013212Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/6f0ecdb2-7c7c-4277-94f8-6f5ca07db9d5/.gitconfig'
2022-05-15T13:00:23.5028651Z Temporarily overriding HOME='/home/runner/work/_temp/6f0ecdb2-7c7c-4277-94f8-6f5ca07db9d5' before making global git config changes
2022-05-15T13:00:23.5029475Z Adding repository directory to the temporary git global config as a safe directory
2022-05-15T13:00:23.5033274Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
2022-05-15T13:00:23.5078373Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-15T13:00:23.5117619Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-15T13:00:23.5421152Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-15T13:00:23.5461301Z http.https://github.com/.extraheader
2022-05-15T13:00:23.5504412Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-15T13:00:23.5544672Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-15T13:00:23.6132877Z Cleaning up orphan processes
```	
