# homework 04.GIT.Hosting  

## Link to action file
- [GitHub](https://github.com/Vlasik-Henadzi/demo_git/blob/master/.github/workflows/first.yaml)

## Link to testing repository
- [GitHub](https://github.com/Vlasik-Henadzi/demo_git)

##Log
``` bash
2022-05-10T14:08:58.0937151Z Requested labels: ubuntu-latest
2022-05-10T14:08:58.0937202Z Job defined at: Vlasik-Henadzi/demo_git/.github/workflows/first.yaml@refs/pull/3/merge
2022-05-10T14:08:58.0937221Z Waiting for a runner to pick up this job...
2022-05-10T14:08:58.6323558Z Job is waiting for a hosted runner to come online.
2022-05-10T14:09:02.1943482Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-10T14:09:04.8373059Z Current runner version: '2.291.1'
2022-05-10T14:09:04.8405577Z ##[group]Operating System
2022-05-10T14:09:04.8406210Z Ubuntu
2022-05-10T14:09:04.8406549Z 20.04.4
2022-05-10T14:09:04.8407007Z LTS
2022-05-10T14:09:04.8407328Z ##[endgroup]
2022-05-10T14:09:04.8407715Z ##[group]Virtual Environment
2022-05-10T14:09:04.8408152Z Environment: ubuntu-20.04
2022-05-10T14:09:04.8408495Z Version: 20220503.1
2022-05-10T14:09:04.8409158Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-10T14:09:04.8409944Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-10T14:09:04.8410421Z ##[endgroup]
2022-05-10T14:09:04.8410839Z ##[group]Virtual Environment Provisioner
2022-05-10T14:09:04.8411315Z 1.0.0.0-main-20220421-1
2022-05-10T14:09:04.8411701Z ##[endgroup]
2022-05-10T14:09:04.8412393Z ##[group]GITHUB_TOKEN Permissions
2022-05-10T14:09:04.8413035Z Contents: read
2022-05-10T14:09:04.8413668Z Metadata: read
2022-05-10T14:09:04.8414071Z ##[endgroup]
2022-05-10T14:09:04.8418575Z Secret source: Actions
2022-05-10T14:09:04.8419162Z Prepare workflow directory
2022-05-10T14:09:04.9579610Z Prepare all required actions
2022-05-10T14:09:04.9857972Z Getting action download info
2022-05-10T14:09:05.3749227Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-10T14:09:06.3338338Z Download action repository 'tj-actions/changed-files@v13.1' (SHA:2c85495a7bb72f2734cb5181e29b2ee5e08e61f7)
2022-05-10T14:09:06.7728421Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-10T14:09:07.4218950Z Getting action download info
2022-05-10T14:09:07.6676476Z Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
2022-05-10T14:09:08.3857705Z ##[group]Run actions/checkout@v3
2022-05-10T14:09:08.3858032Z with:
2022-05-10T14:09:08.3858258Z   fetch-depth: 0
2022-05-10T14:09:08.3858688Z   repository: Vlasik-Henadzi/demo_git
2022-05-10T14:09:08.3859186Z   token: ***
2022-05-10T14:09:08.3859406Z   ssh-strict: true
2022-05-10T14:09:08.3859646Z   persist-credentials: true
2022-05-10T14:09:08.3859877Z   clean: true
2022-05-10T14:09:08.3860084Z   lfs: false
2022-05-10T14:09:08.3860288Z   submodules: false
2022-05-10T14:09:08.3860913Z   set-safe-directory: true
2022-05-10T14:09:08.3861153Z ##[endgroup]
2022-05-10T14:09:08.8604020Z Syncing repository: Vlasik-Henadzi/demo_git
2022-05-10T14:09:08.8606154Z ##[group]Getting Git version info
2022-05-10T14:09:08.8606727Z Working directory is '/home/runner/work/demo_git/demo_git'
2022-05-10T14:09:08.8607432Z [command]/usr/bin/git version
2022-05-10T14:09:08.8945546Z git version 2.36.0
2022-05-10T14:09:08.8963626Z ##[endgroup]
2022-05-10T14:09:08.8987667Z Temporarily overriding HOME='/home/runner/work/_temp/d11f8a76-002b-4fb4-b9cd-3897d0c73894' before making global git config changes
2022-05-10T14:09:08.8988220Z Adding repository directory to the temporary git global config as a safe directory
2022-05-10T14:09:08.8992708Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/demo_git/demo_git
2022-05-10T14:09:08.9047299Z Deleting the contents of '/home/runner/work/demo_git/demo_git'
2022-05-10T14:09:08.9053478Z ##[group]Initializing the repository
2022-05-10T14:09:08.9057910Z [command]/usr/bin/git init /home/runner/work/demo_git/demo_git
2022-05-10T14:09:08.9142788Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-10T14:09:08.9143866Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-10T14:09:08.9145436Z hint: of your new repositories, which will suppress this warning, call:
2022-05-10T14:09:08.9146192Z hint: 
2022-05-10T14:09:08.9147723Z hint: 	git config --global init.defaultBranch <name>
2022-05-10T14:09:08.9148383Z hint: 
2022-05-10T14:09:08.9150097Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-10T14:09:08.9151139Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-10T14:09:08.9152675Z hint: 
2022-05-10T14:09:08.9153322Z hint: 	git branch -m <name>
2022-05-10T14:09:08.9160518Z Initialized empty Git repository in /home/runner/work/demo_git/demo_git/.git/
2022-05-10T14:09:08.9174326Z [command]/usr/bin/git remote add origin https://github.com/Vlasik-Henadzi/demo_git
2022-05-10T14:09:08.9283812Z ##[endgroup]
2022-05-10T14:09:08.9285043Z ##[group]Disabling automatic garbage collection
2022-05-10T14:09:08.9292237Z [command]/usr/bin/git config --local gc.auto 0
2022-05-10T14:09:08.9334359Z ##[endgroup]
2022-05-10T14:09:08.9335234Z ##[group]Setting up auth
2022-05-10T14:09:08.9344881Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-10T14:09:08.9389967Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-10T14:09:08.9941949Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-10T14:09:08.9988649Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-10T14:09:09.0294830Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-10T14:09:09.0344381Z ##[endgroup]
2022-05-10T14:09:09.0345647Z ##[group]Fetching the repository
2022-05-10T14:09:09.0358339Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +4c654c35a42d376b9ef477e503237f592ab69bb9:refs/remotes/pull/3/merge
2022-05-10T14:09:09.5815671Z remote: Enumerating objects: 77, done.        
2022-05-10T14:09:09.5831725Z remote: Counting objects:   1% (1/77)        
2022-05-10T14:09:09.5832054Z remote: Counting objects:   2% (2/77)        
2022-05-10T14:09:09.5832355Z remote: Counting objects:   3% (3/77)        
2022-05-10T14:09:09.5832647Z remote: Counting objects:   5% (4/77)        
2022-05-10T14:09:09.5832938Z remote: Counting objects:   6% (5/77)        
2022-05-10T14:09:09.5833210Z remote: Counting objects:   7% (6/77)        
2022-05-10T14:09:09.5833498Z remote: Counting objects:   9% (7/77)        
2022-05-10T14:09:09.5833788Z remote: Counting objects:  10% (8/77)        
2022-05-10T14:09:09.5834078Z remote: Counting objects:  11% (9/77)        
2022-05-10T14:09:09.5834352Z remote: Counting objects:  12% (10/77)        
2022-05-10T14:09:09.5834647Z remote: Counting objects:  14% (11/77)        
2022-05-10T14:09:09.5834933Z remote: Counting objects:  15% (12/77)        
2022-05-10T14:09:09.5835210Z remote: Counting objects:  16% (13/77)        
2022-05-10T14:09:09.5835496Z remote: Counting objects:  18% (14/77)        
2022-05-10T14:09:09.5836103Z remote: Counting objects:  19% (15/77)        
2022-05-10T14:09:09.5836388Z remote: Counting objects:  20% (16/77)        
2022-05-10T14:09:09.5836674Z remote: Counting objects:  22% (17/77)        
2022-05-10T14:09:09.5837198Z remote: Counting objects:  23% (18/77)        
2022-05-10T14:09:09.5837490Z remote: Counting objects:  24% (19/77)        
2022-05-10T14:09:09.5837775Z remote: Counting objects:  25% (20/77)        
2022-05-10T14:09:09.5838058Z remote: Counting objects:  27% (21/77)        
2022-05-10T14:09:09.5838344Z remote: Counting objects:  28% (22/77)        
2022-05-10T14:09:09.5838614Z remote: Counting objects:  29% (23/77)        
2022-05-10T14:09:09.5838897Z remote: Counting objects:  31% (24/77)        
2022-05-10T14:09:09.5839184Z remote: Counting objects:  32% (25/77)        
2022-05-10T14:09:09.5839448Z remote: Counting objects:  33% (26/77)        
2022-05-10T14:09:09.5839733Z remote: Counting objects:  35% (27/77)        
2022-05-10T14:09:09.5840016Z remote: Counting objects:  36% (28/77)        
2022-05-10T14:09:09.5840299Z remote: Counting objects:  37% (29/77)        
2022-05-10T14:09:09.5840810Z remote: Counting objects:  38% (30/77)        
2022-05-10T14:09:09.5841096Z remote: Counting objects:  40% (31/77)        
2022-05-10T14:09:09.5841525Z remote: Counting objects:  41% (32/77)        
2022-05-10T14:09:09.5841785Z remote: Counting objects:  42% (33/77)        
2022-05-10T14:09:09.5842056Z remote: Counting objects:  44% (34/77)        
2022-05-10T14:09:09.5842332Z remote: Counting objects:  45% (35/77)        
2022-05-10T14:09:09.5842591Z remote: Counting objects:  46% (36/77)        
2022-05-10T14:09:09.5842864Z remote: Counting objects:  48% (37/77)        
2022-05-10T14:09:09.5843134Z remote: Counting objects:  49% (38/77)        
2022-05-10T14:09:09.5843389Z remote: Counting objects:  50% (39/77)        
2022-05-10T14:09:09.5843663Z remote: Counting objects:  51% (40/77)        
2022-05-10T14:09:09.5845139Z remote: Counting objects:  53% (41/77)        
2022-05-10T14:09:09.5845477Z remote: Counting objects:  54% (42/77)        
2022-05-10T14:09:09.5845780Z remote: Counting objects:  55% (43/77)        
2022-05-10T14:09:09.5846069Z remote: Counting objects:  57% (44/77)        
2022-05-10T14:09:09.5846357Z remote: Counting objects:  58% (45/77)        
2022-05-10T14:09:09.5846633Z remote: Counting objects:  59% (46/77)        
2022-05-10T14:09:09.5846926Z remote: Counting objects:  61% (47/77)        
2022-05-10T14:09:09.5847217Z remote: Counting objects:  62% (48/77)        
2022-05-10T14:09:09.5847491Z remote: Counting objects:  63% (49/77)        
2022-05-10T14:09:09.5848096Z remote: Counting objects:  64% (50/77)        
2022-05-10T14:09:09.5848368Z remote: Counting objects:  66% (51/77)        
2022-05-10T14:09:09.5848622Z remote: Counting objects:  67% (52/77)        
2022-05-10T14:09:09.5848889Z remote: Counting objects:  68% (53/77)        
2022-05-10T14:09:09.5849338Z remote: Counting objects:  70% (54/77)        
2022-05-10T14:09:09.5849616Z remote: Counting objects:  71% (55/77)        
2022-05-10T14:09:09.5849889Z remote: Counting objects:  72% (56/77)        
2022-05-10T14:09:09.5850161Z remote: Counting objects:  74% (57/77)        
2022-05-10T14:09:09.5850431Z remote: Counting objects:  75% (58/77)        
2022-05-10T14:09:09.5851073Z remote: Counting objects:  76% (59/77)        
2022-05-10T14:09:09.5851372Z remote: Counting objects:  77% (60/77)        
2022-05-10T14:09:09.5851690Z remote: Counting objects:  79% (61/77)        
2022-05-10T14:09:09.5851949Z remote: Counting objects:  80% (62/77)        
2022-05-10T14:09:09.5852217Z remote: Counting objects:  81% (63/77)        
2022-05-10T14:09:09.5852496Z remote: Counting objects:  83% (64/77)        
2022-05-10T14:09:09.5852754Z remote: Counting objects:  84% (65/77)        
2022-05-10T14:09:09.5853045Z remote: Counting objects:  85% (66/77)        
2022-05-10T14:09:09.5853322Z remote: Counting objects:  87% (67/77)        
2022-05-10T14:09:09.5853595Z remote: Counting objects:  88% (68/77)        
2022-05-10T14:09:09.5853852Z remote: Counting objects:  89% (69/77)        
2022-05-10T14:09:09.5854129Z remote: Counting objects:  90% (70/77)        
2022-05-10T14:09:09.5854403Z remote: Counting objects:  92% (71/77)        
2022-05-10T14:09:09.5854675Z remote: Counting objects:  93% (72/77)        
2022-05-10T14:09:09.5854930Z remote: Counting objects:  94% (73/77)        
2022-05-10T14:09:09.5855201Z remote: Counting objects:  96% (74/77)        
2022-05-10T14:09:09.5855653Z remote: Counting objects:  97% (75/77)        
2022-05-10T14:09:09.5855918Z remote: Counting objects:  98% (76/77)        
2022-05-10T14:09:09.5856200Z remote: Counting objects: 100% (77/77)        
2022-05-10T14:09:09.5856494Z remote: Counting objects: 100% (77/77), done.        
2022-05-10T14:09:09.5856795Z remote: Compressing objects:   2% (1/40)        
2022-05-10T14:09:09.5857101Z remote: Compressing objects:   5% (2/40)        
2022-05-10T14:09:09.5857406Z remote: Compressing objects:   7% (3/40)        
2022-05-10T14:09:09.5857691Z remote: Compressing objects:  10% (4/40)        
2022-05-10T14:09:09.5858128Z remote: Compressing objects:  12% (5/40)        
2022-05-10T14:09:09.5858426Z remote: Compressing objects:  15% (6/40)        
2022-05-10T14:09:09.5858722Z remote: Compressing objects:  17% (7/40)        
2022-05-10T14:09:09.5859001Z remote: Compressing objects:  20% (8/40)        
2022-05-10T14:09:09.5859295Z remote: Compressing objects:  22% (9/40)        
2022-05-10T14:09:09.5859595Z remote: Compressing objects:  25% (10/40)        
2022-05-10T14:09:09.5859886Z remote: Compressing objects:  27% (11/40)        
2022-05-10T14:09:09.5860191Z remote: Compressing objects:  30% (12/40)        
2022-05-10T14:09:09.5860487Z remote: Compressing objects:  32% (13/40)        
2022-05-10T14:09:09.5860769Z remote: Compressing objects:  35% (14/40)        
2022-05-10T14:09:09.5861066Z remote: Compressing objects:  37% (15/40)        
2022-05-10T14:09:09.5861363Z remote: Compressing objects:  40% (16/40)        
2022-05-10T14:09:09.5861644Z remote: Compressing objects:  42% (17/40)        
2022-05-10T14:09:09.5861943Z remote: Compressing objects:  45% (18/40)        
2022-05-10T14:09:09.5862236Z remote: Compressing objects:  47% (19/40)        
2022-05-10T14:09:09.5862533Z remote: Compressing objects:  50% (20/40)        
2022-05-10T14:09:09.5862816Z remote: Compressing objects:  52% (21/40)        
2022-05-10T14:09:09.5863108Z remote: Compressing objects:  55% (22/40)        
2022-05-10T14:09:09.5863403Z remote: Compressing objects:  57% (23/40)        
2022-05-10T14:09:09.5863684Z remote: Compressing objects:  60% (24/40)        
2022-05-10T14:09:09.5863977Z remote: Compressing objects:  62% (25/40)        
2022-05-10T14:09:09.5864271Z remote: Compressing objects:  65% (26/40)        
2022-05-10T14:09:09.5864549Z remote: Compressing objects:  67% (27/40)        
2022-05-10T14:09:09.5864849Z remote: Compressing objects:  70% (28/40)        
2022-05-10T14:09:09.5865383Z remote: Compressing objects:  72% (29/40)        
2022-05-10T14:09:09.5865683Z remote: Compressing objects:  75% (30/40)        
2022-05-10T14:09:09.5865957Z remote: Compressing objects:  77% (31/40)        
2022-05-10T14:09:09.5866285Z remote: Compressing objects:  80% (32/40)        
2022-05-10T14:09:09.5866574Z remote: Compressing objects:  82% (33/40)        
2022-05-10T14:09:09.5866844Z remote: Compressing objects:  85% (34/40)        
2022-05-10T14:09:09.5867125Z remote: Compressing objects:  87% (35/40)        
2022-05-10T14:09:09.5867405Z remote: Compressing objects:  90% (36/40)        
2022-05-10T14:09:09.5867676Z remote: Compressing objects:  92% (37/40)        
2022-05-10T14:09:09.5867957Z remote: Compressing objects:  95% (38/40)        
2022-05-10T14:09:09.5868237Z remote: Compressing objects:  97% (39/40)        
2022-05-10T14:09:09.5868504Z remote: Compressing objects: 100% (40/40)        
2022-05-10T14:09:09.5868807Z remote: Compressing objects: 100% (40/40), done.        
2022-05-10T14:09:09.5927301Z remote: Total 77 (delta 30), reused 54 (delta 19), pack-reused 0        
2022-05-10T14:09:09.6143676Z From https://github.com/Vlasik-Henadzi/demo_git
2022-05-10T14:09:09.6144554Z  * [new branch]      dev                                      -> origin/dev
2022-05-10T14:09:09.6148769Z  * [new branch]      features/do_one                          -> origin/features/do_one
2022-05-10T14:09:09.6149742Z  * [new branch]      hotfix/we_gonna_die                      -> origin/hotfix/we_gonna_die
2022-05-10T14:09:09.6152217Z  * [new branch]      master                                   -> origin/master
2022-05-10T14:09:09.6155974Z  * [new ref]         4c654c35a42d376b9ef477e503237f592ab69bb9 -> pull/3/merge
2022-05-10T14:09:09.6198112Z ##[endgroup]
2022-05-10T14:09:09.6199215Z ##[group]Determining the checkout info
2022-05-10T14:09:09.6200058Z ##[endgroup]
2022-05-10T14:09:09.6201084Z ##[group]Checking out the ref
2022-05-10T14:09:09.6207258Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/3/merge
2022-05-10T14:09:09.6263152Z Note: switching to 'refs/remotes/pull/3/merge'.
2022-05-10T14:09:09.6263705Z 
2022-05-10T14:09:09.6266831Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-10T14:09:09.6267915Z changes and commit them, and you can discard any commits you make in this
2022-05-10T14:09:09.6268494Z state without impacting any branches by switching back to a branch.
2022-05-10T14:09:09.6269096Z 
2022-05-10T14:09:09.6269440Z If you want to create a new branch to retain commits you create, you may
2022-05-10T14:09:09.6270006Z do so (now or later) by using -c with the switch command. Example:
2022-05-10T14:09:09.6270264Z 
2022-05-10T14:09:09.6270462Z   git switch -c <new-branch-name>
2022-05-10T14:09:09.6270781Z 
2022-05-10T14:09:09.6271121Z Or undo this operation with:
2022-05-10T14:09:09.6271284Z 
2022-05-10T14:09:09.6271707Z   git switch -
2022-05-10T14:09:09.6272446Z 
2022-05-10T14:09:09.6272869Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-10T14:09:09.6273127Z 
2022-05-10T14:09:09.6273373Z HEAD is now at 4c654c3 Merge 23b66ef2b12087b42f8944812ef6b850ef3dec1d into 3166dac395d73f596122d17eecb2d5855af072af
2022-05-10T14:09:09.6278292Z ##[endgroup]
2022-05-10T14:09:09.6333485Z [command]/usr/bin/git log -1 --format='%H'
2022-05-10T14:09:09.6370638Z '4c654c35a42d376b9ef477e503237f592ab69bb9'
2022-05-10T14:09:09.6797794Z ##[group]Run tj-actions/changed-files@v13.1
2022-05-10T14:09:09.6798114Z with:
2022-05-10T14:09:09.6798533Z   token: ***
2022-05-10T14:09:09.6798756Z   separator:  
2022-05-10T14:09:09.6799003Z   sha: 4c654c35a42d376b9ef477e503237f592ab69bb9
2022-05-10T14:09:09.6799441Z   since_last_remote_commit: false
2022-05-10T14:09:09.6799675Z ##[endgroup]
2022-05-10T14:09:09.7181483Z ##[group]Run # "Set base sha..."
2022-05-10T14:09:09.7181825Z [36;1m# "Set base sha..."[0m
2022-05-10T14:09:09.7182060Z [36;1mif [[ -n "" ]]; then[0m
2022-05-10T14:09:09.7182309Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-10T14:09:09.7182582Z [36;1melif [[ "false" == "true" ]]; then[0m
2022-05-10T14:09:09.7182846Z [36;1m  if [[ "" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-10T14:09:09.7183127Z [36;1m    echo "::set-output name=base_sha::"[0m
2022-05-10T14:09:09.7183365Z [36;1m  else[0m
2022-05-10T14:09:09.7183705Z [36;1m    echo "::set-output name=base_sha::4c654c35a42d376b9ef477e503237f592ab69bb9"[0m
2022-05-10T14:09:09.7183980Z [36;1m  fi[0m
2022-05-10T14:09:09.7184172Z [36;1mfi[0m
2022-05-10T14:09:09.7244576Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-10T14:09:09.7244872Z ##[endgroup]
2022-05-10T14:09:09.7487023Z ##[group]Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
2022-05-10T14:09:09.7487729Z [36;1mbash $GITHUB_ACTION_PATH/sourcefiles.sh[0m
2022-05-10T14:09:09.7549372Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-10T14:09:09.7549883Z env:
2022-05-10T14:09:09.7550092Z   INPUT_FILES: 
2022-05-10T14:09:09.7550351Z   INPUT_FILES_FROM_SOURCE_FILE: 
2022-05-10T14:09:09.7550603Z ##[endgroup]
2022-05-10T14:09:09.7662277Z ##[group]changed-files-from-source-file
2022-05-10T14:09:09.7826952Z Input files: 
2022-05-10T14:09:09.7856392Z ##[endgroup]
2022-05-10T14:09:09.7910328Z ##[group]Run tj-actions/glob@v3.3
2022-05-10T14:09:09.7910578Z with:
2022-05-10T14:09:09.7910794Z   files-separator:  
2022-05-10T14:09:09.7911021Z   separator: |
2022-05-10T14:09:09.7911271Z   excluded-files-separator: 

2022-05-10T14:09:09.7911573Z   files-from-source-file-separator: 

2022-05-10T14:09:09.7912125Z   excluded-files-from-source-file-separator: 

2022-05-10T14:09:09.7912443Z   follow-symbolic-links: true
2022-05-10T14:09:09.7912724Z   strip-top-level-dir: true
2022-05-10T14:09:09.7913182Z   include-deleted-files: false
2022-05-10T14:09:09.7913465Z   sha: 4c654c35a42d376b9ef477e503237f592ab69bb9
2022-05-10T14:09:09.7914462Z   working-directory: /home/runner/work/demo_git/demo_git
2022-05-10T14:09:09.7914809Z ##[endgroup]
2022-05-10T14:09:10.1237746Z 
2022-05-10T14:09:10.1313145Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-10T14:09:10.1313539Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-10T14:09:10.1374970Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-10T14:09:10.1375249Z env:
2022-05-10T14:09:10.1375489Z   GITHUB_SERVER_URL: https://github.com
2022-05-10T14:09:10.1375810Z   GITHUB_REPOSITORY: Vlasik-Henadzi/demo_git
2022-05-10T14:09:10.1376084Z   GITHUB_BASE_REF: master
2022-05-10T14:09:10.1376341Z   INPUT_SHA: 4c654c35a42d376b9ef477e503237f592ab69bb9
2022-05-10T14:09:10.1376642Z   INPUT_BASE_SHA: 
2022-05-10T14:09:10.1377394Z   INPUT_TOKEN: ***
2022-05-10T14:09:10.1377807Z   INPUT_FILES: 
2022-05-10T14:09:10.1378022Z   INPUT_SEPARATOR:  
2022-05-10T14:09:10.1378257Z   INPUT_PATH: 
2022-05-10T14:09:10.1378482Z ##[endgroup]
2022-05-10T14:09:10.1479075Z ##[group]changed-files
2022-05-10T14:09:10.1479678Z Resolving repository path...
2022-05-10T14:09:10.1523921Z Setting up 'temp_changed_files' remote...
2022-05-10T14:09:10.1575197Z No 'temp_changed_files' remote found
2022-05-10T14:09:10.1576032Z Creating 'temp_changed_files' remote...
2022-05-10T14:09:10.1617728Z Getting HEAD info...
2022-05-10T14:09:10.7048526Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-10T14:09:10.7134833Z From https://github.com/Vlasik-Henadzi/demo_git
2022-05-10T14:09:10.7136522Z  * [new branch]      master     -> master
2022-05-10T14:09:10.7137446Z  * [new branch]      master     -> temp_changed_files/master
2022-05-10T14:09:10.7213139Z Retrieving changes between 3166dac395d73f596122d17eecb2d5855af072af (master) → 4c654c35a42d376b9ef477e503237f592ab69bb9 (dev)
2022-05-10T14:09:10.7214071Z Getting diff...
2022-05-10T14:09:10.7578945Z Added files: 
2022-05-10T14:09:10.7579706Z Copied files: 
2022-05-10T14:09:10.7581042Z Deleted files: 
2022-05-10T14:09:10.7581483Z Modified files: second.txt six.txt third.txt
2022-05-10T14:09:10.7582349Z Renamed files: 
2022-05-10T14:09:10.7582975Z Type Changed files: 
2022-05-10T14:09:10.7583428Z Unmerged files: 
2022-05-10T14:09:10.7585472Z Unknown files: 
2022-05-10T14:09:10.7586039Z All changed and modified files: second.txt six.txt third.txt
2022-05-10T14:09:10.7586571Z All changed files: second.txt six.txt third.txt
2022-05-10T14:09:10.7587050Z All modified files: second.txt six.txt third.txt
2022-05-10T14:09:10.7613849Z ##[endgroup]
2022-05-10T14:09:10.7779918Z ##[group]Run for file in second.txt six.txt third.txt; do
2022-05-10T14:09:10.7780346Z [36;1mfor file in second.txt six.txt third.txt; do[0m
2022-05-10T14:09:10.7780685Z [36;1m  echo "$file was changed" >> report.log 2>&1[0m
2022-05-10T14:09:10.7781051Z [36;1m  echo "Counted tabs in files: `grep -o "   " $file | wc -l`" >> report.log 2>&1 [0m
2022-05-10T14:09:10.7781370Z [36;1mdone[0m
2022-05-10T14:09:10.7850393Z shell: /usr/bin/bash -e {0}
2022-05-10T14:09:10.7850654Z ##[endgroup]
2022-05-10T14:09:10.8080733Z ##[group]Run actions/upload-artifact@v2
2022-05-10T14:09:10.8081030Z with:
2022-05-10T14:09:10.8081255Z   path: report.log
2022-05-10T14:09:10.8081494Z   name: artifact
2022-05-10T14:09:10.8081730Z   if-no-files-found: warn
2022-05-10T14:09:10.8081982Z ##[endgroup]
2022-05-10T14:09:10.8896191Z With the provided path, there will be 1 file uploaded
2022-05-10T14:09:10.8902472Z Starting artifact upload
2022-05-10T14:09:10.8903751Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-10T14:09:10.8904619Z Artifact name is valid!
2022-05-10T14:09:11.0270179Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-10T14:09:11.2199578Z Total size of all the files uploaded is 84 bytes
2022-05-10T14:09:11.2203923Z File upload process has finished. Finalizing the artifact upload
2022-05-10T14:09:11.3270625Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-10T14:09:11.3271468Z 
2022-05-10T14:09:11.3271907Z The raw size of all the files that were specified for upload is 140 bytes
2022-05-10T14:09:11.3273314Z The size of all the files that were uploaded is 84 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-10T14:09:11.3274487Z 
2022-05-10T14:09:11.3275910Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-10T14:09:11.3276556Z 
2022-05-10T14:09:11.3277612Z Artifact artifact has been successfully uploaded!
2022-05-10T14:09:11.3412099Z Post job cleanup.
2022-05-10T14:09:11.5043386Z [command]/usr/bin/git version
2022-05-10T14:09:11.5105032Z git version 2.36.0
2022-05-10T14:09:11.5174574Z Temporarily overriding HOME='/home/runner/work/_temp/056b9ee1-6d75-46f3-8234-b589736e1a3d' before making global git config changes
2022-05-10T14:09:11.5179106Z Adding repository directory to the temporary git global config as a safe directory
2022-05-10T14:09:11.5185716Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/demo_git/demo_git
2022-05-10T14:09:11.5240509Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-10T14:09:11.5318005Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-10T14:09:11.5631806Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-10T14:09:11.5690713Z http.https://github.com/.extraheader
2022-05-10T14:09:11.5691949Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-10T14:09:11.5747040Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-10T14:09:11.6347962Z Cleaning up orphan processes
```