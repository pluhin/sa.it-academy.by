### Link to Rep
[Git-Actions](https://github.com/Buharevich/Git-Actions/blob/main/.github/workflows/Git-AA.yml)
### Piplene Log
```Piplene
2022-01-29T13:52:07.7565979Z Waiting for a runner to pick up this job...
2022-01-29T13:52:08.1626242Z Job is waiting for a hosted runner to come online.
2022-01-29T13:52:12.0367283Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-01-29T13:52:16.0204441Z Current runner version: '2.286.1'
2022-01-29T13:52:16.0233663Z ##[group]Operating System
2022-01-29T13:52:16.0234374Z Ubuntu
2022-01-29T13:52:16.0234708Z 20.04.3
2022-01-29T13:52:16.0234976Z LTS
2022-01-29T13:52:16.0235335Z ##[endgroup]
2022-01-29T13:52:16.0235668Z ##[group]Virtual Environment
2022-01-29T13:52:16.0236139Z Environment: ubuntu-20.04
2022-01-29T13:52:16.0236481Z Version: 20220123.1
2022-01-29T13:52:16.0237091Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220123.1/images/linux/Ubuntu2004-Readme.md
2022-01-29T13:52:16.0237889Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220123.1
2022-01-29T13:52:16.0238371Z ##[endgroup]
2022-01-29T13:52:16.0238821Z ##[group]Virtual Environment Provisioner
2022-01-29T13:52:16.0239201Z 1.0.0.0-main-20220120-1
2022-01-29T13:52:16.0239589Z ##[endgroup]
2022-01-29T13:52:16.0240686Z ##[group]GITHUB_TOKEN Permissions
2022-01-29T13:52:16.0241459Z Actions: write
2022-01-29T13:52:16.0241959Z Checks: write
2022-01-29T13:52:16.0242350Z Contents: write
2022-01-29T13:52:16.0242731Z Deployments: write
2022-01-29T13:52:16.0243130Z Discussions: write
2022-01-29T13:52:16.0243446Z Issues: write
2022-01-29T13:52:16.0243814Z Metadata: read
2022-01-29T13:52:16.0244124Z Packages: write
2022-01-29T13:52:16.0244483Z Pages: write
2022-01-29T13:52:16.0244799Z PullRequests: write
2022-01-29T13:52:16.0245236Z RepositoryProjects: write
2022-01-29T13:52:16.0245599Z SecurityEvents: write
2022-01-29T13:52:16.0245993Z Statuses: write
2022-01-29T13:52:16.0246353Z ##[endgroup]
2022-01-29T13:52:16.0250366Z Secret source: Actions
2022-01-29T13:52:16.0251014Z Prepare workflow directory
2022-01-29T13:52:16.1173398Z Prepare all required actions
2022-01-29T13:52:16.1374634Z Getting action download info
2022-01-29T13:52:16.3295589Z Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
2022-01-29T13:52:17.2390608Z ##[group]Run actions/checkout@v2
2022-01-29T13:52:17.2391006Z with:
2022-01-29T13:52:17.2391370Z   repository: Buharevich/Git-Actions
2022-01-29T13:52:17.2392039Z   token: ***
2022-01-29T13:52:17.2392329Z   ssh-strict: true
2022-01-29T13:52:17.2392686Z   persist-credentials: true
2022-01-29T13:52:17.2393012Z   clean: true
2022-01-29T13:52:17.2393316Z   fetch-depth: 1
2022-01-29T13:52:17.2393694Z   lfs: false
2022-01-29T13:52:17.2393970Z   submodules: false
2022-01-29T13:52:17.2394241Z ##[endgroup]
2022-01-29T13:52:17.5346246Z Syncing repository: Buharevich/Git-Actions
2022-01-29T13:52:17.5349451Z ##[group]Getting Git version info
2022-01-29T13:52:17.5350140Z Working directory is '/home/runner/work/Git-Actions/Git-Actions'
2022-01-29T13:52:17.5350883Z [command]/usr/bin/git version
2022-01-29T13:52:17.5484205Z git version 2.34.1
2022-01-29T13:52:17.5486044Z ##[endgroup]
2022-01-29T13:52:17.5496133Z Deleting the contents of '/home/runner/work/Git-Actions/Git-Actions'
2022-01-29T13:52:17.5498153Z ##[group]Initializing the repository
2022-01-29T13:52:17.5499250Z [command]/usr/bin/git init /home/runner/work/Git-Actions/Git-Actions
2022-01-29T13:52:17.5584928Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-01-29T13:52:17.5585997Z hint: is subject to change. To configure the initial branch name to use in all
2022-01-29T13:52:17.5587706Z hint: of your new repositories, which will suppress this warning, call:
2022-01-29T13:52:17.5588245Z hint: 
2022-01-29T13:52:17.5589248Z hint: 	git config --global init.defaultBranch <name>
2022-01-29T13:52:17.5589728Z hint: 
2022-01-29T13:52:17.5590963Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-01-29T13:52:17.5591725Z hint: 'development'. The just-created branch can be renamed via this command:
2022-01-29T13:52:17.5592215Z hint: 
2022-01-29T13:52:17.5593018Z hint: 	git branch -m <name>
2022-01-29T13:52:17.5601309Z Initialized empty Git repository in /home/runner/work/Git-Actions/Git-Actions/.git/
2022-01-29T13:52:17.5612234Z [command]/usr/bin/git remote add origin https://github.com/Buharevich/Git-Actions
2022-01-29T13:52:17.5658767Z ##[endgroup]
2022-01-29T13:52:17.5659875Z ##[group]Disabling automatic garbage collection
2022-01-29T13:52:17.5664124Z [command]/usr/bin/git config --local gc.auto 0
2022-01-29T13:52:17.5705290Z ##[endgroup]
2022-01-29T13:52:17.5727422Z ##[group]Setting up auth
2022-01-29T13:52:17.5728948Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-29T13:52:17.5758338Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-29T13:52:17.6139334Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-29T13:52:17.6167434Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-29T13:52:17.6463313Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-01-29T13:52:17.6500367Z ##[endgroup]
2022-01-29T13:52:17.6588542Z ##[group]Fetching the repository
2022-01-29T13:52:17.6597104Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +eb2d6ac457b7c368d498246508a788a41d762d62:refs/remotes/origin/main
2022-01-29T13:52:17.9610589Z remote: Enumerating objects: 7, done.        
2022-01-29T13:52:17.9611709Z remote: Counting objects:  14% (1/7)        
2022-01-29T13:52:17.9612478Z remote: Counting objects:  28% (2/7)        
2022-01-29T13:52:17.9613176Z remote: Counting objects:  42% (3/7)        
2022-01-29T13:52:17.9665468Z remote: Counting objects:  57% (4/7)        
2022-01-29T13:52:17.9665894Z remote: Counting objects:  71% (5/7)        
2022-01-29T13:52:17.9666601Z remote: Counting objects:  85% (6/7)        
2022-01-29T13:52:17.9667261Z remote: Counting objects: 100% (7/7)        
2022-01-29T13:52:17.9667692Z remote: Counting objects: 100% (7/7), done.        
2022-01-29T13:52:17.9668112Z remote: Compressing objects:  20% (1/5)        
2022-01-29T13:52:17.9668526Z remote: Compressing objects:  40% (2/5)        
2022-01-29T13:52:17.9668933Z remote: Compressing objects:  60% (3/5)        
2022-01-29T13:52:17.9669322Z remote: Compressing objects:  80% (4/5)        
2022-01-29T13:52:17.9669720Z remote: Compressing objects: 100% (5/5)        
2022-01-29T13:52:17.9670128Z remote: Compressing objects: 100% (5/5), done.        
2022-01-29T13:52:17.9830131Z remote: Total 7 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-01-29T13:52:17.9878505Z From https://github.com/Buharevich/Git-Actions
2022-01-29T13:52:17.9879428Z  * [new ref]         eb2d6ac457b7c368d498246508a788a41d762d62 -> origin/main
2022-01-29T13:52:17.9912602Z ##[endgroup]
2022-01-29T13:52:17.9913479Z ##[group]Determining the checkout info
2022-01-29T13:52:17.9914854Z ##[endgroup]
2022-01-29T13:52:17.9915377Z ##[group]Checking out the ref
2022-01-29T13:52:17.9919667Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-01-29T13:52:17.9971474Z Switched to a new branch 'main'
2022-01-29T13:52:17.9977535Z Branch 'main' set up to track remote branch 'main' from 'origin'.
2022-01-29T13:52:17.9980623Z ##[endgroup]
2022-01-29T13:52:18.0025785Z [command]/usr/bin/git log -1 --format='%H'
2022-01-29T13:52:18.0058876Z 'eb2d6ac457b7c368d498246508a788a41d762d62'
2022-01-29T13:52:18.0279895Z ##[group]Run echo Hello, world!
2022-01-29T13:52:18.0280256Z [36;1mecho Hello, world![0m
2022-01-29T13:52:18.0334256Z shell: /usr/bin/bash -e {0}
2022-01-29T13:52:18.0334557Z ##[endgroup]
2022-01-29T13:52:18.0699176Z Hello, world!
2022-01-29T13:52:18.0737024Z ##[group]Run echo Add other actions to build,
2022-01-29T13:52:18.0737580Z [36;1mecho Add other actions to build,[0m
2022-01-29T13:52:18.0738055Z [36;1mecho test, and deploy your project.[0m
2022-01-29T13:52:18.0789018Z shell: /usr/bin/bash -e {0}
2022-01-29T13:52:18.0789445Z ##[endgroup]
2022-01-29T13:52:18.0865656Z Add other actions to build,
2022-01-29T13:52:18.0865958Z test, and deploy your project.
2022-01-29T13:52:18.0917595Z Post job cleanup.
2022-01-29T13:52:18.2270713Z [command]/usr/bin/git version
2022-01-29T13:52:18.2347516Z git version 2.34.1
2022-01-29T13:52:18.2395440Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-29T13:52:18.2440687Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-29T13:52:18.2715577Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-29T13:52:18.2738277Z http.https://github.com/.extraheader
2022-01-29T13:52:18.2749845Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-01-29T13:52:18.2788968Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-29T13:52:18.3241854Z Cleaning up orphan processes
```
