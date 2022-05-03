# 04.GitOps report

## Link to action file
- [GitHub](https://github.com/ivan-nemkovich/sa.it-academy.by/tree/md-sa2-20-22/Ivan_Nemkovich/04.GitOps/tab_counter.yml)

## Link to testing repository
- [GitHub](https://github.com/ivan-nemkovich/it-academy.by)

## Pipeline log
```bash
2022-05-03T20:42:39.0269385Z Requested labels: ubuntu-latest
2022-05-03T20:42:39.0269590Z Job defined at: ivan-nemkovich/it-academy.by/.github/workflows/tab_counter.yml@refs/pull/13/merge
2022-05-03T20:42:39.0269762Z Waiting for a runner to pick up this job...
2022-05-03T20:42:39.6715225Z Job is waiting for a hosted runner to come online.
2022-05-03T20:42:42.3664632Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-03T20:42:46.2224718Z Current runner version: '2.290.1'
2022-05-03T20:42:46.2255609Z ##[group]Operating System
2022-05-03T20:42:46.2256176Z Ubuntu
2022-05-03T20:42:46.2256440Z 20.04.4
2022-05-03T20:42:46.2256832Z LTS
2022-05-03T20:42:46.2257137Z ##[endgroup]
2022-05-03T20:42:46.2257434Z ##[group]Virtual Environment
2022-05-03T20:42:46.2257815Z Environment: ubuntu-20.04
2022-05-03T20:42:46.2258181Z Version: 20220425.1
2022-05-03T20:42:46.2258703Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220425.1/images/linux/Ubuntu2004-Readme.md
2022-05-03T20:42:46.2259391Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220425.1
2022-05-03T20:42:46.2259868Z ##[endgroup]
2022-05-03T20:42:46.2260245Z ##[group]Virtual Environment Provisioner
2022-05-03T20:42:46.2260587Z 1.0.0.0-main-20220421-1
2022-05-03T20:42:46.2260957Z ##[endgroup]
2022-05-03T20:42:46.2261951Z ##[group]GITHUB_TOKEN Permissions
2022-05-03T20:42:46.2262674Z Actions: write
2022-05-03T20:42:46.2263172Z Checks: write
2022-05-03T20:42:46.2263513Z Contents: write
2022-05-03T20:42:46.2263861Z Deployments: write
2022-05-03T20:42:46.2264203Z Discussions: write
2022-05-03T20:42:46.2264533Z Issues: write
2022-05-03T20:42:46.2264850Z Metadata: read
2022-05-03T20:42:46.2265127Z Packages: write
2022-05-03T20:42:46.2265462Z Pages: write
2022-05-03T20:42:46.2265792Z PullRequests: write
2022-05-03T20:42:46.2266135Z RepositoryProjects: write
2022-05-03T20:42:46.2266513Z SecurityEvents: write
2022-05-03T20:42:46.2266863Z Statuses: write
2022-05-03T20:42:46.2267137Z ##[endgroup]
2022-05-03T20:42:46.2271164Z Secret source: Actions
2022-05-03T20:42:46.2271775Z Prepare workflow directory
2022-05-03T20:42:46.3125178Z Prepare all required actions
2022-05-03T20:42:46.3314482Z Getting action download info
2022-05-03T20:42:46.5416442Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-03T20:42:46.8492353Z Download action repository 'actions/upload-artifact@v3.0.0' (SHA:6673cd052c4cd6fcf4b4e6e60ea986c889389535)
2022-05-03T20:42:47.2332082Z ##[group]Run actions/checkout@v3
2022-05-03T20:42:47.2332427Z with:
2022-05-03T20:42:47.2332681Z   fetch-depth: 0
2022-05-03T20:42:47.2333001Z   repository: ivan-nemkovich/it-academy.by
2022-05-03T20:42:47.2333589Z   token: ***
2022-05-03T20:42:47.2333845Z   ssh-strict: true
2022-05-03T20:42:47.2334138Z   persist-credentials: true
2022-05-03T20:42:47.2334407Z   clean: true
2022-05-03T20:42:47.2334644Z   lfs: false
2022-05-03T20:42:47.2334890Z   submodules: false
2022-05-03T20:42:47.2335158Z   set-safe-directory: true
2022-05-03T20:42:47.2335438Z ##[endgroup]
2022-05-03T20:42:47.5254619Z Syncing repository: ivan-nemkovich/it-academy.by
2022-05-03T20:42:47.5256578Z ##[group]Getting Git version info
2022-05-03T20:42:47.5257237Z Working directory is '/home/runner/work/it-academy.by/it-academy.by'
2022-05-03T20:42:47.5257980Z [command]/usr/bin/git version
2022-05-03T20:42:47.5389328Z git version 2.36.0
2022-05-03T20:42:47.5414531Z ##[endgroup]
2022-05-03T20:42:47.5432213Z Temporarily overriding HOME='/home/runner/work/_temp/69bc65d7-004c-4cff-81d2-434da0617fc1' before making global git config changes
2022-05-03T20:42:47.5433396Z Adding repository directory to the temporary git global config as a safe directory
2022-05-03T20:42:47.5438229Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/it-academy.by/it-academy.by
2022-05-03T20:42:47.5481946Z Deleting the contents of '/home/runner/work/it-academy.by/it-academy.by'
2022-05-03T20:42:47.5486194Z ##[group]Initializing the repository
2022-05-03T20:42:47.5489573Z [command]/usr/bin/git init /home/runner/work/it-academy.by/it-academy.by
2022-05-03T20:42:47.5576569Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-03T20:42:47.5577522Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-03T20:42:47.5579068Z hint: of your new repositories, which will suppress this warning, call:
2022-05-03T20:42:47.5579533Z hint: 
2022-05-03T20:42:47.5580546Z hint: 	git config --global init.defaultBranch <name>
2022-05-03T20:42:47.5581607Z hint: 
2022-05-03T20:42:47.5582317Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-03T20:42:47.5583499Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-03T20:42:47.5584062Z hint: 
2022-05-03T20:42:47.5584972Z hint: 	git branch -m <name>
2022-05-03T20:42:47.5591404Z Initialized empty Git repository in /home/runner/work/it-academy.by/it-academy.by/.git/
2022-05-03T20:42:47.5600416Z [command]/usr/bin/git remote add origin https://github.com/ivan-nemkovich/it-academy.by
2022-05-03T20:42:47.5650056Z ##[endgroup]
2022-05-03T20:42:47.5650786Z ##[group]Disabling automatic garbage collection
2022-05-03T20:42:47.5656725Z [command]/usr/bin/git config --local gc.auto 0
2022-05-03T20:42:47.5691430Z ##[endgroup]
2022-05-03T20:42:47.5692106Z ##[group]Setting up auth
2022-05-03T20:42:47.5701484Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-03T20:42:47.5740132Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-03T20:42:47.6131761Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-03T20:42:47.6160039Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-03T20:42:47.6404426Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-03T20:42:47.6436118Z ##[endgroup]
2022-05-03T20:42:47.6436899Z ##[group]Fetching the repository
2022-05-03T20:42:47.6450972Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +c22e32ada2cc5302e95ea207ca66a54f2467e240:refs/remotes/pull/13/merge
2022-05-03T20:42:47.9268782Z remote: Enumerating objects: 237, done.        
2022-05-03T20:42:47.9269850Z remote: Counting objects:   1% (1/62)        
2022-05-03T20:42:47.9276452Z remote: Counting objects:   3% (2/62)        
2022-05-03T20:42:47.9277107Z remote: Counting objects:   4% (3/62)        
2022-05-03T20:42:47.9278118Z remote: Counting objects:   6% (4/62)        
2022-05-03T20:42:47.9278618Z remote: Counting objects:   8% (5/62)        
2022-05-03T20:42:47.9281610Z remote: Counting objects:   9% (6/62)        
2022-05-03T20:42:47.9282178Z remote: Counting objects:  11% (7/62)        
2022-05-03T20:42:47.9283030Z remote: Counting objects:  12% (8/62)        
2022-05-03T20:42:47.9283528Z remote: Counting objects:  14% (9/62)        
2022-05-03T20:42:47.9284366Z remote: Counting objects:  16% (10/62)        
2022-05-03T20:42:47.9284858Z remote: Counting objects:  17% (11/62)        
2022-05-03T20:42:47.9285693Z remote: Counting objects:  19% (12/62)        
2022-05-03T20:42:47.9286347Z remote: Counting objects:  20% (13/62)        
2022-05-03T20:42:47.9287195Z remote: Counting objects:  22% (14/62)        
2022-05-03T20:42:47.9287922Z remote: Counting objects:  24% (15/62)        
2022-05-03T20:42:47.9288793Z remote: Counting objects:  25% (16/62)        
2022-05-03T20:42:47.9289291Z remote: Counting objects:  27% (17/62)        
2022-05-03T20:42:47.9290149Z remote: Counting objects:  29% (18/62)        
2022-05-03T20:42:47.9290673Z remote: Counting objects:  30% (19/62)        
2022-05-03T20:42:47.9291551Z remote: Counting objects:  32% (20/62)        
2022-05-03T20:42:47.9292319Z remote: Counting objects:  33% (21/62)        
2022-05-03T20:42:47.9292905Z remote: Counting objects:  35% (22/62)        
2022-05-03T20:42:47.9293479Z remote: Counting objects:  37% (23/62)        
2022-05-03T20:42:47.9294091Z remote: Counting objects:  38% (24/62)        
2022-05-03T20:42:47.9294877Z remote: Counting objects:  40% (25/62)        
2022-05-03T20:42:47.9296030Z remote: Counting objects:  41% (26/62)        
2022-05-03T20:42:47.9297013Z remote: Counting objects:  43% (27/62)        
2022-05-03T20:42:47.9297559Z remote: Counting objects:  45% (28/62)        
2022-05-03T20:42:47.9298682Z remote: Counting objects:  46% (29/62)        
2022-05-03T20:42:47.9299169Z remote: Counting objects:  48% (30/62)        
2022-05-03T20:42:47.9300049Z remote: Counting objects:  50% (31/62)        
2022-05-03T20:42:47.9300727Z remote: Counting objects:  51% (32/62)        
2022-05-03T20:42:47.9301319Z remote: Counting objects:  53% (33/62)        
2022-05-03T20:42:47.9301908Z remote: Counting objects:  54% (34/62)        
2022-05-03T20:42:47.9302620Z remote: Counting objects:  56% (35/62)        
2022-05-03T20:42:47.9303198Z remote: Counting objects:  58% (36/62)        
2022-05-03T20:42:47.9304089Z remote: Counting objects:  59% (37/62)        
2022-05-03T20:42:47.9304823Z remote: Counting objects:  61% (38/62)        
2022-05-03T20:42:47.9305422Z remote: Counting objects:  62% (39/62)        
2022-05-03T20:42:47.9305976Z remote: Counting objects:  64% (40/62)        
2022-05-03T20:42:47.9306573Z remote: Counting objects:  66% (41/62)        
2022-05-03T20:42:47.9307154Z remote: Counting objects:  67% (42/62)        
2022-05-03T20:42:47.9309583Z remote: Counting objects:  69% (43/62)        
2022-05-03T20:42:47.9310013Z remote: Counting objects:  70% (44/62)        
2022-05-03T20:42:47.9310312Z remote: Counting objects:  72% (45/62)        
2022-05-03T20:42:47.9310626Z remote: Counting objects:  74% (46/62)        
2022-05-03T20:42:47.9310935Z remote: Counting objects:  75% (47/62)        
2022-05-03T20:42:47.9311245Z remote: Counting objects:  77% (48/62)        
2022-05-03T20:42:47.9311603Z remote: Counting objects:  79% (49/62)        
2022-05-03T20:42:47.9311910Z remote: Counting objects:  80% (50/62)        
2022-05-03T20:42:47.9312222Z remote: Counting objects:  82% (51/62)        
2022-05-03T20:42:47.9312635Z remote: Counting objects:  83% (52/62)        
2022-05-03T20:42:47.9340379Z remote: Counting objects:  85% (53/62)        
2022-05-03T20:42:47.9340977Z remote: Counting objects:  87% (54/62)        
2022-05-03T20:42:47.9341700Z remote: Counting objects:  88% (55/62)        
2022-05-03T20:42:47.9342196Z remote: Counting objects:  90% (56/62)        
2022-05-03T20:42:47.9342888Z remote: Counting objects:  91% (57/62)        
2022-05-03T20:42:47.9343697Z remote: Counting objects:  93% (58/62)        
2022-05-03T20:42:47.9345258Z remote: Counting objects:  95% (59/62)        
2022-05-03T20:42:47.9345566Z remote: Counting objects:  96% (60/62)        
2022-05-03T20:42:47.9346108Z remote: Counting objects:  98% (61/62)        
2022-05-03T20:42:47.9346428Z remote: Counting objects: 100% (62/62)        
2022-05-03T20:42:47.9346758Z remote: Counting objects: 100% (62/62), done.        
2022-05-03T20:42:47.9347092Z remote: Compressing objects:   2% (1/46)        
2022-05-03T20:42:47.9347426Z remote: Compressing objects:   4% (2/46)        
2022-05-03T20:42:47.9347773Z remote: Compressing objects:   6% (3/46)        
2022-05-03T20:42:47.9348111Z remote: Compressing objects:   8% (4/46)        
2022-05-03T20:42:47.9348425Z remote: Compressing objects:  10% (5/46)        
2022-05-03T20:42:47.9348748Z remote: Compressing objects:  13% (6/46)        
2022-05-03T20:42:47.9349069Z remote: Compressing objects:  15% (7/46)        
2022-05-03T20:42:47.9349376Z remote: Compressing objects:  17% (8/46)        
2022-05-03T20:42:47.9349697Z remote: Compressing objects:  19% (9/46)        
2022-05-03T20:42:47.9350023Z remote: Compressing objects:  21% (10/46)        
2022-05-03T20:42:47.9350338Z remote: Compressing objects:  23% (11/46)        
2022-05-03T20:42:47.9350663Z remote: Compressing objects:  26% (12/46)        
2022-05-03T20:42:47.9350987Z remote: Compressing objects:  28% (13/46)        
2022-05-03T20:42:47.9351310Z remote: Compressing objects:  30% (14/46)        
2022-05-03T20:42:47.9351621Z remote: Compressing objects:  32% (15/46)        
2022-05-03T20:42:47.9352101Z remote: Compressing objects:  34% (16/46)        
2022-05-03T20:42:47.9352427Z remote: Compressing objects:  36% (17/46)        
2022-05-03T20:42:47.9352737Z remote: Compressing objects:  39% (18/46)        
2022-05-03T20:42:47.9353058Z remote: Compressing objects:  41% (19/46)        
2022-05-03T20:42:47.9353379Z remote: Compressing objects:  43% (20/46)        
2022-05-03T20:42:47.9353686Z remote: Compressing objects:  45% (21/46)        
2022-05-03T20:42:47.9354011Z remote: Compressing objects:  47% (22/46)        
2022-05-03T20:42:47.9354332Z remote: Compressing objects:  50% (23/46)        
2022-05-03T20:42:47.9354638Z remote: Compressing objects:  52% (24/46)        
2022-05-03T20:42:47.9354964Z remote: Compressing objects:  54% (25/46)        
2022-05-03T20:42:47.9355286Z remote: Compressing objects:  56% (26/46)        
2022-05-03T20:42:47.9355604Z remote: Compressing objects:  58% (27/46)        
2022-05-03T20:42:47.9355912Z remote: Compressing objects:  60% (28/46)        
2022-05-03T20:42:47.9356238Z remote: Compressing objects:  63% (29/46)        
2022-05-03T20:42:47.9356560Z remote: Compressing objects:  65% (30/46)        
2022-05-03T20:42:47.9356869Z remote: Compressing objects:  67% (31/46)        
2022-05-03T20:42:47.9357190Z remote: Compressing objects:  69% (32/46)        
2022-05-03T20:42:47.9357507Z remote: Compressing objects:  71% (33/46)        
2022-05-03T20:42:47.9357810Z remote: Compressing objects:  73% (34/46)        
2022-05-03T20:42:47.9358128Z remote: Compressing objects:  76% (35/46)        
2022-05-03T20:42:47.9358445Z remote: Compressing objects:  78% (36/46)        
2022-05-03T20:42:47.9358750Z remote: Compressing objects:  80% (37/46)        
2022-05-03T20:42:47.9359073Z remote: Compressing objects:  82% (38/46)        
2022-05-03T20:42:47.9359389Z remote: Compressing objects:  84% (39/46)        
2022-05-03T20:42:47.9359707Z remote: Compressing objects:  86% (40/46)        
2022-05-03T20:42:47.9360012Z remote: Compressing objects:  89% (41/46)        
2022-05-03T20:42:47.9360406Z remote: Compressing objects:  91% (42/46)        
2022-05-03T20:42:47.9360873Z remote: Compressing objects:  93% (43/46)        
2022-05-03T20:42:47.9361179Z remote: Compressing objects:  95% (44/46)        
2022-05-03T20:42:47.9361501Z remote: Compressing objects:  97% (45/46)        
2022-05-03T20:42:47.9361824Z remote: Compressing objects: 100% (46/46)        
2022-05-03T20:42:47.9362150Z remote: Compressing objects: 100% (46/46), done.        
2022-05-03T20:42:47.9362467Z Receiving objects:   0% (1/237)
2022-05-03T20:42:47.9362749Z Receiving objects:   1% (3/237)
2022-05-03T20:42:47.9363024Z Receiving objects:   2% (5/237)
2022-05-03T20:42:47.9363284Z Receiving objects:   3% (8/237)
2022-05-03T20:42:47.9363560Z Receiving objects:   4% (10/237)
2022-05-03T20:42:47.9364224Z remote: Total 237 (delta 14), reused 25 (delta 6), pack-reused 175        
2022-05-03T20:42:47.9364557Z Receiving objects:   5% (12/237)
2022-05-03T20:42:47.9364842Z Receiving objects:   6% (15/237)
2022-05-03T20:42:47.9365127Z Receiving objects:   7% (17/237)
2022-05-03T20:42:47.9365401Z Receiving objects:   8% (19/237)
2022-05-03T20:42:47.9365676Z Receiving objects:   9% (22/237)
2022-05-03T20:42:47.9365953Z Receiving objects:  10% (24/237)
2022-05-03T20:42:47.9366213Z Receiving objects:  11% (27/237)
2022-05-03T20:42:47.9366485Z Receiving objects:  12% (29/237)
2022-05-03T20:42:47.9366760Z Receiving objects:  13% (31/237)
2022-05-03T20:42:47.9367018Z Receiving objects:  14% (34/237)
2022-05-03T20:42:47.9367289Z Receiving objects:  15% (36/237)
2022-05-03T20:42:47.9367563Z Receiving objects:  16% (38/237)
2022-05-03T20:42:47.9367822Z Receiving objects:  17% (41/237)
2022-05-03T20:42:47.9368190Z Receiving objects:  18% (43/237)
2022-05-03T20:42:47.9368465Z Receiving objects:  19% (46/237)
2022-05-03T20:42:47.9368721Z Receiving objects:  20% (48/237)
2022-05-03T20:42:47.9368995Z Receiving objects:  21% (50/237)
2022-05-03T20:42:47.9369266Z Receiving objects:  22% (53/237)
2022-05-03T20:42:47.9369537Z Receiving objects:  23% (55/237)
2022-05-03T20:42:47.9369900Z Receiving objects:  24% (57/237)
2022-05-03T20:42:47.9370178Z Receiving objects:  25% (60/237)
2022-05-03T20:42:47.9370454Z Receiving objects:  26% (62/237)
2022-05-03T20:42:47.9370718Z Receiving objects:  27% (64/237)
2022-05-03T20:42:47.9370995Z Receiving objects:  28% (67/237)
2022-05-03T20:42:47.9371272Z Receiving objects:  29% (69/237)
2022-05-03T20:42:47.9371532Z Receiving objects:  30% (72/237)
2022-05-03T20:42:47.9371809Z Receiving objects:  31% (74/237)
2022-05-03T20:42:47.9372086Z Receiving objects:  32% (76/237)
2022-05-03T20:42:47.9372346Z Receiving objects:  33% (79/237)
2022-05-03T20:42:47.9372621Z Receiving objects:  34% (81/237)
2022-05-03T20:42:47.9372896Z Receiving objects:  35% (83/237)
2022-05-03T20:42:47.9373153Z Receiving objects:  36% (86/237)
2022-05-03T20:42:47.9373423Z Receiving objects:  37% (88/237)
2022-05-03T20:42:47.9373694Z Receiving objects:  38% (91/237)
2022-05-03T20:42:47.9373953Z Receiving objects:  39% (93/237)
2022-05-03T20:42:47.9375512Z Receiving objects:  40% (95/237)
2022-05-03T20:42:47.9376169Z Receiving objects:  41% (98/237)
2022-05-03T20:42:47.9376459Z Receiving objects:  42% (100/237)
2022-05-03T20:42:47.9376729Z Receiving objects:  43% (102/237)
2022-05-03T20:42:47.9377012Z Receiving objects:  44% (105/237)
2022-05-03T20:42:47.9377292Z Receiving objects:  45% (107/237)
2022-05-03T20:42:47.9377556Z Receiving objects:  46% (110/237)
2022-05-03T20:42:47.9377833Z Receiving objects:  47% (112/237)
2022-05-03T20:42:47.9378111Z Receiving objects:  48% (114/237)
2022-05-03T20:42:47.9378376Z Receiving objects:  49% (117/237)
2022-05-03T20:42:47.9378650Z Receiving objects:  50% (119/237)
2022-05-03T20:42:47.9378926Z Receiving objects:  51% (121/237)
2022-05-03T20:42:47.9379183Z Receiving objects:  52% (124/237)
2022-05-03T20:42:47.9379460Z Receiving objects:  53% (126/237)
2022-05-03T20:42:47.9379729Z Receiving objects:  54% (128/237)
2022-05-03T20:42:47.9380003Z Receiving objects:  55% (131/237)
2022-05-03T20:42:47.9380264Z Receiving objects:  56% (133/237)
2022-05-03T20:42:47.9380654Z Receiving objects:  57% (136/237)
2022-05-03T20:42:47.9380940Z Receiving objects:  58% (138/237)
2022-05-03T20:42:47.9381201Z Receiving objects:  59% (140/237)
2022-05-03T20:42:47.9381475Z Receiving objects:  60% (143/237)
2022-05-03T20:42:47.9381748Z Receiving objects:  61% (145/237)
2022-05-03T20:42:47.9382010Z Receiving objects:  62% (147/237)
2022-05-03T20:42:47.9382284Z Receiving objects:  63% (150/237)
2022-05-03T20:42:47.9382558Z Receiving objects:  64% (152/237)
2022-05-03T20:42:47.9382817Z Receiving objects:  65% (155/237)
2022-05-03T20:42:47.9383091Z Receiving objects:  66% (157/237)
2022-05-03T20:42:47.9383360Z Receiving objects:  67% (159/237)
2022-05-03T20:42:47.9383623Z Receiving objects:  68% (162/237)
2022-05-03T20:42:47.9383892Z Receiving objects:  69% (164/237)
2022-05-03T20:42:47.9384162Z Receiving objects:  70% (166/237)
2022-05-03T20:42:47.9384419Z Receiving objects:  71% (169/237)
2022-05-03T20:42:47.9384696Z Receiving objects:  72% (171/237)
2022-05-03T20:42:47.9384972Z Receiving objects:  73% (174/237)
2022-05-03T20:42:47.9385244Z Receiving objects:  74% (176/237)
2022-05-03T20:42:47.9385505Z Receiving objects:  75% (178/237)
2022-05-03T20:42:47.9385775Z Receiving objects:  76% (181/237)
2022-05-03T20:42:47.9386048Z Receiving objects:  77% (183/237)
2022-05-03T20:42:47.9386307Z Receiving objects:  78% (185/237)
2022-05-03T20:42:47.9386578Z Receiving objects:  79% (188/237)
2022-05-03T20:42:47.9386851Z Receiving objects:  80% (190/237)
2022-05-03T20:42:47.9387111Z Receiving objects:  81% (192/237)
2022-05-03T20:42:47.9387382Z Receiving objects:  82% (195/237)
2022-05-03T20:42:47.9387679Z Receiving objects:  83% (197/237)
2022-05-03T20:42:47.9387953Z Receiving objects:  84% (200/237)
2022-05-03T20:42:47.9388226Z Receiving objects:  85% (202/237)
2022-05-03T20:42:47.9389069Z Receiving objects:  86% (204/237)
2022-05-03T20:42:47.9389702Z Receiving objects:  87% (207/237)
2022-05-03T20:42:47.9389984Z Receiving objects:  88% (209/237)
2022-05-03T20:42:47.9390354Z Receiving objects:  89% (211/237)
2022-05-03T20:42:47.9390630Z Receiving objects:  90% (214/237)
2022-05-03T20:42:47.9390907Z Receiving objects:  91% (216/237)
2022-05-03T20:42:47.9391168Z Receiving objects:  92% (219/237)
2022-05-03T20:42:47.9391446Z Receiving objects:  93% (221/237)
2022-05-03T20:42:47.9391723Z Receiving objects:  94% (223/237)
2022-05-03T20:42:47.9391998Z Receiving objects:  95% (226/237)
2022-05-03T20:42:47.9392258Z Receiving objects:  96% (228/237)
2022-05-03T20:42:47.9392535Z Receiving objects:  97% (230/237)
2022-05-03T20:42:47.9392805Z Receiving objects:  98% (233/237)
2022-05-03T20:42:47.9393062Z Receiving objects:  99% (235/237)
2022-05-03T20:42:47.9393335Z Receiving objects: 100% (237/237)
2022-05-03T20:42:47.9393650Z Receiving objects: 100% (237/237), 36.95 KiB | 4.62 MiB/s, done.
2022-05-03T20:42:47.9393948Z Resolving deltas:   0% (0/49)
2022-05-03T20:42:47.9394224Z Resolving deltas:   2% (1/49)
2022-05-03T20:42:47.9394497Z Resolving deltas:   4% (2/49)
2022-05-03T20:42:47.9394758Z Resolving deltas:   6% (3/49)
2022-05-03T20:42:47.9395035Z Resolving deltas:   8% (4/49)
2022-05-03T20:42:47.9395309Z Resolving deltas:  10% (5/49)
2022-05-03T20:42:47.9396019Z Resolving deltas:  12% (6/49)
2022-05-03T20:42:47.9396623Z Resolving deltas:  14% (7/49)
2022-05-03T20:42:47.9396900Z Resolving deltas:  16% (8/49)
2022-05-03T20:42:47.9397174Z Resolving deltas:  18% (9/49)
2022-05-03T20:42:47.9397433Z Resolving deltas:  20% (10/49)
2022-05-03T20:42:47.9397713Z Resolving deltas:  22% (11/49)
2022-05-03T20:42:47.9397990Z Resolving deltas:  24% (12/49)
2022-05-03T20:42:47.9398251Z Resolving deltas:  26% (13/49)
2022-05-03T20:42:47.9398527Z Resolving deltas:  28% (14/49)
2022-05-03T20:42:47.9398799Z Resolving deltas:  30% (15/49)
2022-05-03T20:42:47.9399057Z Resolving deltas:  32% (16/49)
2022-05-03T20:42:47.9399325Z Resolving deltas:  34% (17/49)
2022-05-03T20:42:47.9399599Z Resolving deltas:  36% (18/49)
2022-05-03T20:42:47.9400263Z Resolving deltas:  38% (19/49)
2022-05-03T20:42:47.9401135Z Resolving deltas:  40% (20/49)
2022-05-03T20:42:47.9401417Z Resolving deltas:  42% (21/49)
2022-05-03T20:42:47.9401676Z Resolving deltas:  44% (22/49)
2022-05-03T20:42:47.9401953Z Resolving deltas:  46% (23/49)
2022-05-03T20:42:47.9402224Z Resolving deltas:  48% (24/49)
2022-05-03T20:42:47.9402501Z Resolving deltas:  51% (25/49)
2022-05-03T20:42:47.9402758Z Resolving deltas:  53% (26/49)
2022-05-03T20:42:47.9403430Z Resolving deltas:  55% (27/49)
2022-05-03T20:42:47.9404036Z Resolving deltas:  57% (28/49)
2022-05-03T20:42:47.9404298Z Resolving deltas:  59% (29/49)
2022-05-03T20:42:47.9404571Z Resolving deltas:  61% (30/49)
2022-05-03T20:42:47.9404846Z Resolving deltas:  63% (31/49)
2022-05-03T20:42:47.9405443Z Resolving deltas:  65% (32/49)
2022-05-03T20:42:47.9405720Z Resolving deltas:  67% (33/49)
2022-05-03T20:42:47.9406304Z Resolving deltas:  69% (34/49)
2022-05-03T20:42:47.9406883Z Resolving deltas:  71% (35/49)
2022-05-03T20:42:47.9407474Z Resolving deltas:  73% (36/49)
2022-05-03T20:42:47.9408074Z Resolving deltas:  75% (37/49)
2022-05-03T20:42:47.9408671Z Resolving deltas:  77% (38/49)
2022-05-03T20:42:47.9409552Z Resolving deltas:  79% (39/49)
2022-05-03T20:42:47.9409831Z Resolving deltas:  81% (40/49)
2022-05-03T20:42:47.9410481Z Resolving deltas:  83% (41/49)
2022-05-03T20:42:47.9410738Z Resolving deltas:  85% (42/49)
2022-05-03T20:42:47.9411311Z Resolving deltas:  87% (43/49)
2022-05-03T20:42:47.9411906Z Resolving deltas:  89% (44/49)
2022-05-03T20:42:47.9412472Z Resolving deltas:  91% (45/49)
2022-05-03T20:42:47.9413072Z Resolving deltas:  93% (46/49)
2022-05-03T20:42:47.9413659Z Resolving deltas:  95% (47/49)
2022-05-03T20:42:47.9414230Z Resolving deltas:  97% (48/49)
2022-05-03T20:42:47.9417032Z Resolving deltas: 100% (49/49)
2022-05-03T20:42:47.9418392Z Resolving deltas: 100% (49/49), done.
2022-05-03T20:42:47.9519961Z From https://github.com/ivan-nemkovich/it-academy.by
2022-05-03T20:42:47.9521206Z  * [new branch]      master                                   -> origin/master
2022-05-03T20:42:47.9522353Z  * [new branch]      yml_changes                              -> origin/yml_changes
2022-05-03T20:42:47.9523352Z  * [new ref]         c22e32ada2cc5302e95ea207ca66a54f2467e240 -> pull/13/merge
2022-05-03T20:42:47.9550971Z ##[endgroup]
2022-05-03T20:42:47.9551886Z ##[group]Determining the checkout info
2022-05-03T20:42:47.9553303Z ##[endgroup]
2022-05-03T20:42:47.9553969Z ##[group]Checking out the ref
2022-05-03T20:42:47.9555796Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/13/merge
2022-05-03T20:42:47.9598623Z Note: switching to 'refs/remotes/pull/13/merge'.
2022-05-03T20:42:47.9599003Z 
2022-05-03T20:42:47.9599442Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-03T20:42:47.9599880Z changes and commit them, and you can discard any commits you make in this
2022-05-03T20:42:47.9600835Z state without impacting any branches by switching back to a branch.
2022-05-03T20:42:47.9601087Z 
2022-05-03T20:42:47.9601306Z If you want to create a new branch to retain commits you create, you may
2022-05-03T20:42:47.9601813Z do so (now or later) by using -c with the switch command. Example:
2022-05-03T20:42:47.9602042Z 
2022-05-03T20:42:47.9602235Z   git switch -c <new-branch-name>
2022-05-03T20:42:47.9602422Z 
2022-05-03T20:42:47.9602544Z Or undo this operation with:
2022-05-03T20:42:47.9602721Z 
2022-05-03T20:42:47.9602819Z   git switch -
2022-05-03T20:42:47.9602968Z 
2022-05-03T20:42:47.9603318Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-03T20:42:47.9603677Z 
2022-05-03T20:42:47.9604064Z HEAD is now at c22e32a Merge 8f7fde3ace4011c100adbd60511e2f2371fca559 into d03179bb7357951d85f4bd6a167293acf3d353f6
2022-05-03T20:42:47.9611527Z ##[endgroup]
2022-05-03T20:42:47.9657564Z [command]/usr/bin/git log -1 --format='%H'
2022-05-03T20:42:47.9690358Z 'c22e32ada2cc5302e95ea207ca66a54f2467e240'
2022-05-03T20:42:47.9995902Z ##[group]Run for changed_file in $(git diff --name-only HEAD^ HEAD); do echo $changed_file >> tab.log; if [ ! "$(grep $'\t' $changed_file)"]; then echo "Doesn't contain tabs" >> tab.log; else grep $'\t' $changed_file >> tab.log; fi; done
2022-05-03T20:42:47.9996866Z [36;1mfor changed_file in $(git diff --name-only HEAD^ HEAD); do echo $changed_file >> tab.log; if [ ! "$(grep $'\t' $changed_file)"]; then echo "Doesn't contain tabs" >> tab.log; else grep $'\t' $changed_file >> tab.log; fi; done[0m
2022-05-03T20:42:48.0051720Z shell: /usr/bin/bash -e {0}
2022-05-03T20:42:48.0052039Z ##[endgroup]
2022-05-03T20:42:48.0244701Z /home/runner/work/_temp/da1eebd2-beaa-43dd-9d0a-b349a3268f08.sh: line 1: [: missing `]'
2022-05-03T20:42:48.0273712Z /home/runner/work/_temp/da1eebd2-beaa-43dd-9d0a-b349a3268f08.sh: line 1: [: missing `]'
2022-05-03T20:42:48.0328892Z ##[group]Run actions/upload-artifact@v3.0.0
2022-05-03T20:42:48.0329192Z with:
2022-05-03T20:42:48.0329419Z   path: tab.log
2022-05-03T20:42:48.0329653Z   name: artifact
2022-05-03T20:42:48.0329895Z   if-no-files-found: warn
2022-05-03T20:42:48.0330150Z ##[endgroup]
2022-05-03T20:42:48.0943633Z With the provided path, there will be 1 file uploaded
2022-05-03T20:42:48.0946760Z Starting artifact upload
2022-05-03T20:42:48.1005845Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-03T20:42:48.1006574Z Artifact name is valid!
2022-05-03T20:42:48.1777019Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-03T20:42:48.2874630Z Total size of all the files uploaded is 156 bytes
2022-05-03T20:42:48.2875184Z File upload process has finished. Finalizing the artifact upload
2022-05-03T20:42:48.3738134Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-03T20:42:48.3738494Z 
2022-05-03T20:42:48.3738720Z The raw size of all the files that were specified for upload is 210 bytes
2022-05-03T20:42:48.3739337Z The size of all the files that were uploaded is 156 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-03T20:42:48.3740084Z 
2022-05-03T20:42:48.3741013Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-03T20:42:48.3741522Z 
2022-05-03T20:42:48.3741709Z Artifact artifact has been successfully uploaded!
2022-05-03T20:42:48.3862094Z Post job cleanup.
2022-05-03T20:42:48.5089085Z [command]/usr/bin/git version
2022-05-03T20:42:48.5136684Z git version 2.36.0
2022-05-03T20:42:48.5181391Z Temporarily overriding HOME='/home/runner/work/_temp/8191af98-6a11-40e1-a69a-b4abcac264c2' before making global git config changes
2022-05-03T20:42:48.5182388Z Adding repository directory to the temporary git global config as a safe directory
2022-05-03T20:42:48.5186964Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/it-academy.by/it-academy.by
2022-05-03T20:42:48.5227338Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-03T20:42:48.5263932Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-03T20:42:48.5543013Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-03T20:42:48.5587217Z http.https://github.com/.extraheader
2022-05-03T20:42:48.5598750Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-03T20:42:48.5639994Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-03T20:42:48.6112113Z Cleaning up orphan processes

```