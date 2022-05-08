## 04.GIT.OPS
---
[GitHub](https://github.com/alexfiz/my_demo_git)
---
## Log
```bash
2022-05-08T21:14:06.1444806Z Requested labels: ubuntu-latest
2022-05-08T21:14:06.1444849Z Job defined at: alexfiz/my_demo_git/.github/workflows/blank2.yml@refs/pull/25/merge
2022-05-08T21:14:06.1444871Z Waiting for a runner to pick up this job...
2022-05-08T21:14:06.6449673Z Job is waiting for a hosted runner to come online.
2022-05-08T21:14:09.5915335Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-08T21:14:13.1628471Z Current runner version: '2.291.1'

2022-05-08T21:14:13.1656458Z ##[group]Operating System
2022-05-08T21:14:13.1657027Z Ubuntu
2022-05-08T21:14:13.1657321Z 20.04.4
2022-05-08T21:14:13.1657642Z LTS
2022-05-08T21:14:13.1657944Z ##[endgroup]

2022-05-08T21:14:13.1658279Z ##[group]Virtual Environment
2022-05-08T21:14:13.1658626Z Environment: ubuntu-20.04
2022-05-08T21:14:13.1658970Z Version: 20220503.1
2022-05-08T21:14:13.1659551Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-08T21:14:13.1660188Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-08T21:14:13.1660668Z ##[endgroup]

2022-05-08T21:14:13.1661032Z ##[group]Virtual Environment Provisioner
2022-05-08T21:14:13.1661445Z 1.0.0.0-main-20220421-1
2022-05-08T21:14:13.1661719Z ##[endgroup]

2022-05-08T21:14:13.1662383Z ##[group]GITHUB_TOKEN Permissions
2022-05-08T21:14:13.1662894Z Contents: read
2022-05-08T21:14:13.1663362Z Metadata: read
2022-05-08T21:14:13.1663698Z ##[endgroup]

2022-05-08T21:14:13.1667303Z Secret source: Actions
2022-05-08T21:14:13.1667803Z Prepare workflow directory
2022-05-08T21:14:13.2489644Z Prepare all required actions
2022-05-08T21:14:13.2672559Z Getting action download info
2022-05-08T21:14:13.4980535Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-08T21:14:14.1609346Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2022-05-08T21:14:14.6243868Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-08T21:14:15.2711756Z ##[group]Run actions/checkout@v3
2022-05-08T21:14:15.2712076Z with:
2022-05-08T21:14:15.2712285Z   fetch-depth: 0
2022-05-08T21:14:15.2712702Z   repository: alexfiz/my_demo_git
2022-05-08T21:14:15.2713188Z   token: ***
2022-05-08T21:14:15.2713382Z   ssh-strict: true
2022-05-08T21:14:15.2713613Z   persist-credentials: true
2022-05-08T21:14:15.2713868Z   clean: true
2022-05-08T21:14:15.2714048Z   lfs: false
2022-05-08T21:14:15.2714249Z   submodules: false
2022-05-08T21:14:15.2714475Z   set-safe-directory: true
2022-05-08T21:14:15.2714699Z ##[endgroup]

2022-05-08T21:14:15.5169858Z Syncing repository: alexfiz/my_demo_git
2022-05-08T21:14:15.5172263Z ##[group]Getting Git version info
2022-05-08T21:14:15.5173255Z Working directory is '/home/runner/work/my_demo_git/my_demo_git'
2022-05-08T21:14:15.5174307Z [command]/usr/bin/git version
2022-05-08T21:14:15.5306508Z git version 2.36.0
2022-05-08T21:14:15.5307457Z ##[endgroup]

2022-05-08T21:14:15.5323586Z Temporarily overriding HOME='/home/runner/work/_temp/9b2d092f-de35-40f4-b7af-f4f67656d4e8' before making global git config changes
2022-05-08T21:14:15.5324072Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T21:14:15.5324620Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:14:15.5358552Z Deleting the contents of '/home/runner/work/my_demo_git/my_demo_git'
2022-05-08T21:14:15.5361830Z ##[group]Initializing the repository
2022-05-08T21:14:15.5365532Z [command]/usr/bin/git init /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:14:15.5421477Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-08T21:14:15.5422155Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-08T21:14:15.5422953Z hint: of your new repositories, which will suppress this warning, call:
2022-05-08T21:14:15.5423433Z hint: 
2022-05-08T21:14:15.5424237Z hint: 	git config --global init.defaultBranch <name>
2022-05-08T21:14:15.5424668Z hint: 
2022-05-08T21:14:15.5425512Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-08T21:14:15.5430466Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-08T21:14:15.5431198Z hint: 
2022-05-08T21:14:15.5431955Z hint: 	git branch -m <name>
2022-05-08T21:14:15.5432813Z Initialized empty Git repository in /home/runner/work/my_demo_git/my_demo_git/.git/
2022-05-08T21:14:15.5438571Z [command]/usr/bin/git remote add origin https://github.com/alexfiz/my_demo_git
2022-05-08T21:14:15.5477785Z ##[endgroup]

2022-05-08T21:14:15.5479293Z ##[group]Disabling automatic garbage collection
2022-05-08T21:14:15.5482998Z [command]/usr/bin/git config --local gc.auto 0
2022-05-08T21:14:15.5514620Z ##[endgroup]

2022-05-08T21:14:15.5515371Z ##[group]Setting up auth
2022-05-08T21:14:15.5523331Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T21:14:15.5557617Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T21:14:15.5876885Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T21:14:15.5910136Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T21:14:15.6143250Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-08T21:14:15.6175818Z ##[endgroup]

2022-05-08T21:14:15.6176666Z ##[group]Fetching the repository
2022-05-08T21:14:15.6185913Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +89bcbdcc1d7c0baef73891299a3cd7356b2fbc4c:refs/remotes/pull/25/merge
2022-05-08T21:14:15.9779714Z remote: Enumerating objects: 205, done.        
2022-05-08T21:14:15.9787447Z remote: Counting objects:   2% (1/38)        
2022-05-08T21:14:15.9787917Z remote: Counting objects:   5% (2/38)        
2022-05-08T21:14:15.9788231Z remote: Counting objects:   7% (3/38)        
2022-05-08T21:14:15.9840646Z remote: Counting objects:  10% (4/38)        
2022-05-08T21:14:15.9840950Z remote: Counting objects:  13% (5/38)        
2022-05-08T21:14:15.9841216Z remote: Counting objects:  15% (6/38)        
2022-05-08T21:14:15.9841476Z remote: Counting objects:  18% (7/38)        
2022-05-08T21:14:15.9841719Z remote: Counting objects:  21% (8/38)        
2022-05-08T21:14:15.9841980Z remote: Counting objects:  23% (9/38)        
2022-05-08T21:14:15.9842240Z remote: Counting objects:  26% (10/38)        
2022-05-08T21:14:15.9842488Z remote: Counting objects:  28% (11/38)        
2022-05-08T21:14:15.9842744Z remote: Counting objects:  31% (12/38)        
2022-05-08T21:14:15.9843161Z remote: Counting objects:  34% (13/38)        
2022-05-08T21:14:15.9843450Z remote: Counting objects:  36% (14/38)        
2022-05-08T21:14:15.9843972Z remote: Counting objects:  39% (15/38)        
2022-05-08T21:14:15.9844330Z remote: Counting objects:  42% (16/38)        
2022-05-08T21:14:15.9844670Z remote: Counting objects:  44% (17/38)        
2022-05-08T21:14:15.9845014Z remote: Counting objects:  47% (18/38)        
2022-05-08T21:14:15.9845340Z remote: Counting objects:  50% (19/38)        
2022-05-08T21:14:15.9845679Z remote: Counting objects:  52% (20/38)        
2022-05-08T21:14:15.9846012Z remote: Counting objects:  55% (21/38)        
2022-05-08T21:14:15.9846333Z remote: Counting objects:  57% (22/38)        
2022-05-08T21:14:15.9846665Z remote: Counting objects:  60% (23/38)        
2022-05-08T21:14:15.9846999Z remote: Counting objects:  63% (24/38)        
2022-05-08T21:14:15.9847333Z remote: Counting objects:  65% (25/38)        
2022-05-08T21:14:15.9847656Z remote: Counting objects:  68% (26/38)        
2022-05-08T21:14:15.9847992Z remote: Counting objects:  71% (27/38)        
2022-05-08T21:14:15.9848322Z remote: Counting objects:  73% (28/38)        
2022-05-08T21:14:15.9848719Z remote: Counting objects:  76% (29/38)        
2022-05-08T21:14:15.9849055Z remote: Counting objects:  78% (30/38)        
2022-05-08T21:14:15.9849391Z remote: Counting objects:  81% (31/38)        
2022-05-08T21:14:15.9849932Z remote: Counting objects:  84% (32/38)        
2022-05-08T21:14:15.9850252Z remote: Counting objects:  86% (33/38)        
2022-05-08T21:14:15.9850592Z remote: Counting objects:  89% (34/38)        
2022-05-08T21:14:15.9850946Z remote: Counting objects:  92% (35/38)        
2022-05-08T21:14:15.9851281Z remote: Counting objects:  94% (36/38)        
2022-05-08T21:14:15.9851602Z remote: Counting objects:  97% (37/38)        
2022-05-08T21:14:15.9851936Z remote: Counting objects: 100% (38/38)        
2022-05-08T21:14:15.9852285Z remote: Counting objects: 100% (38/38), done.        
2022-05-08T21:14:15.9852670Z remote: Compressing objects:   3% (1/30)        
2022-05-08T21:14:15.9853016Z remote: Compressing objects:   6% (2/30)        
2022-05-08T21:14:15.9853371Z remote: Compressing objects:  10% (3/30)        
2022-05-08T21:14:15.9853726Z remote: Compressing objects:  13% (4/30)        
2022-05-08T21:14:15.9854074Z remote: Compressing objects:  16% (5/30)        
2022-05-08T21:14:15.9854416Z remote: Compressing objects:  20% (6/30)        
2022-05-08T21:14:15.9854764Z remote: Compressing objects:  23% (7/30)        
2022-05-08T21:14:15.9855109Z remote: Compressing objects:  26% (8/30)        
2022-05-08T21:14:16.0045479Z remote: Compressing objects:  30% (9/30)        
2022-05-08T21:14:16.0045873Z remote: Compressing objects:  33% (10/30)        
2022-05-08T21:14:16.0046194Z remote: Compressing objects:  36% (11/30)        
2022-05-08T21:14:16.0046512Z remote: Compressing objects:  40% (12/30)        
2022-05-08T21:14:16.0046810Z remote: Compressing objects:  43% (13/30)        
2022-05-08T21:14:16.0047303Z remote: Compressing objects:  46% (14/30)        
2022-05-08T21:14:16.0047621Z remote: Compressing objects:  50% (15/30)        
2022-05-08T21:14:16.0047914Z remote: Compressing objects:  53% (16/30)        
2022-05-08T21:14:16.0048218Z remote: Compressing objects:  56% (17/30)        
2022-05-08T21:14:16.0048525Z remote: Compressing objects:  60% (18/30)        
2022-05-08T21:14:16.0048838Z remote: Compressing objects:  63% (19/30)        
2022-05-08T21:14:16.0049136Z remote: Compressing objects:  66% (20/30)        
2022-05-08T21:14:16.0049444Z remote: Compressing objects:  70% (21/30)        
2022-05-08T21:14:16.0049748Z remote: Compressing objects:  73% (22/30)        
2022-05-08T21:14:16.0050041Z remote: Compressing objects:  76% (23/30)        
2022-05-08T21:14:16.0050344Z remote: Compressing objects:  80% (24/30)        
2022-05-08T21:14:16.0050648Z remote: Compressing objects:  83% (25/30)        
2022-05-08T21:14:16.0050944Z remote: Compressing objects:  86% (26/30)        
2022-05-08T21:14:16.0051255Z remote: Compressing objects:  90% (27/30)        
2022-05-08T21:14:16.0051561Z remote: Compressing objects:  93% (28/30)        
2022-05-08T21:14:16.0051853Z remote: Compressing objects:  96% (29/30)        
2022-05-08T21:14:16.0052314Z remote: Compressing objects: 100% (30/30)        
2022-05-08T21:14:16.0052640Z remote: Compressing objects: 100% (30/30), done.        
2022-05-08T21:14:16.0174263Z Receiving objects:   0% (1/205)
2022-05-08T21:14:16.0175782Z Receiving objects:   1% (3/205)
2022-05-08T21:14:16.0176049Z Receiving objects:   2% (5/205)
2022-05-08T21:14:16.0176317Z Receiving objects:   3% (7/205)
2022-05-08T21:14:16.0176652Z Receiving objects:   4% (9/205)
2022-05-08T21:14:16.0176904Z Receiving objects:   5% (11/205)
2022-05-08T21:14:16.0177181Z Receiving objects:   6% (13/205)
2022-05-08T21:14:16.0177445Z Receiving objects:   7% (15/205)
2022-05-08T21:14:16.0177712Z Receiving objects:   8% (17/205)
2022-05-08T21:14:16.0177962Z Receiving objects:   9% (19/205)
2022-05-08T21:14:16.0178239Z Receiving objects:  10% (21/205)
2022-05-08T21:14:16.0178506Z Receiving objects:  11% (23/205)
2022-05-08T21:14:16.0178755Z Receiving objects:  12% (25/205)
2022-05-08T21:14:16.0179015Z Receiving objects:  13% (27/205)
2022-05-08T21:14:16.0179281Z Receiving objects:  14% (29/205)
2022-05-08T21:14:16.0179527Z Receiving objects:  15% (31/205)
2022-05-08T21:14:16.0179952Z Receiving objects:  16% (33/205)
2022-05-08T21:14:16.0180217Z Receiving objects:  17% (35/205)
2022-05-08T21:14:16.0180462Z Receiving objects:  18% (37/205)
2022-05-08T21:14:16.0180722Z Receiving objects:  19% (39/205)
2022-05-08T21:14:16.0180984Z Receiving objects:  20% (41/205)
2022-05-08T21:14:16.0181229Z Receiving objects:  21% (44/205)
2022-05-08T21:14:16.0181486Z Receiving objects:  22% (46/205)
2022-05-08T21:14:16.0181752Z Receiving objects:  23% (48/205)
2022-05-08T21:14:16.0181995Z Receiving objects:  24% (50/205)
2022-05-08T21:14:16.0182252Z Receiving objects:  25% (52/205)
2022-05-08T21:14:16.0182516Z Receiving objects:  26% (54/205)
2022-05-08T21:14:16.0182765Z Receiving objects:  27% (56/205)
2022-05-08T21:14:16.0183028Z Receiving objects:  28% (58/205)
2022-05-08T21:14:16.0183290Z Receiving objects:  29% (60/205)
2022-05-08T21:14:16.0183548Z Receiving objects:  30% (62/205)
2022-05-08T21:14:16.0183793Z Receiving objects:  31% (64/205)
2022-05-08T21:14:16.0184053Z Receiving objects:  32% (66/205)
2022-05-08T21:14:16.0184311Z Receiving objects:  33% (68/205)
2022-05-08T21:14:16.0184556Z Receiving objects:  34% (70/205)
2022-05-08T21:14:16.0184817Z Receiving objects:  35% (72/205)
2022-05-08T21:14:16.0185076Z Receiving objects:  36% (74/205)
2022-05-08T21:14:16.0185320Z Receiving objects:  37% (76/205)
2022-05-08T21:14:16.0185575Z Receiving objects:  38% (78/205)
2022-05-08T21:14:16.0185833Z Receiving objects:  39% (80/205)
2022-05-08T21:14:16.0186078Z Receiving objects:  40% (82/205)
2022-05-08T21:14:16.0186333Z Receiving objects:  41% (85/205)
2022-05-08T21:14:16.0186588Z Receiving objects:  42% (87/205)
2022-05-08T21:14:16.0186911Z Receiving objects:  43% (89/205)
2022-05-08T21:14:16.0187174Z Receiving objects:  44% (91/205)
2022-05-08T21:14:16.0187432Z Receiving objects:  45% (93/205)
2022-05-08T21:14:16.0187673Z Receiving objects:  46% (95/205)
2022-05-08T21:14:16.0187927Z Receiving objects:  47% (97/205)
2022-05-08T21:14:16.0188187Z Receiving objects:  48% (99/205)
2022-05-08T21:14:16.0188443Z Receiving objects:  49% (101/205)
2022-05-08T21:14:16.0188716Z Receiving objects:  50% (103/205)
2022-05-08T21:14:16.0188980Z Receiving objects:  51% (105/205)
2022-05-08T21:14:16.0189244Z Receiving objects:  52% (107/205)
2022-05-08T21:14:16.0189488Z Receiving objects:  53% (109/205)
2022-05-08T21:14:16.0189747Z Receiving objects:  54% (111/205)
2022-05-08T21:14:16.0190008Z Receiving objects:  55% (113/205)
2022-05-08T21:14:16.0190255Z Receiving objects:  56% (115/205)
2022-05-08T21:14:16.0190512Z Receiving objects:  57% (117/205)
2022-05-08T21:14:16.0190770Z Receiving objects:  58% (119/205)
2022-05-08T21:14:16.0191014Z Receiving objects:  59% (121/205)
2022-05-08T21:14:16.0191275Z Receiving objects:  60% (123/205)
2022-05-08T21:14:16.0191533Z Receiving objects:  61% (126/205)
2022-05-08T21:14:16.0398720Z Receiving objects:  62% (128/205)
2022-05-08T21:14:16.0399016Z Receiving objects:  63% (130/205)
2022-05-08T21:14:16.0399240Z Receiving objects:  64% (132/205)
2022-05-08T21:14:16.0399479Z Receiving objects:  65% (134/205)
2022-05-08T21:14:16.0399723Z Receiving objects:  66% (136/205)
2022-05-08T21:14:16.0399941Z Receiving objects:  67% (138/205)
2022-05-08T21:14:16.0400169Z Receiving objects:  68% (140/205)
2022-05-08T21:14:16.0400398Z Receiving objects:  69% (142/205)
2022-05-08T21:14:16.0400615Z Receiving objects:  70% (144/205)
2022-05-08T21:14:16.0400846Z Receiving objects:  71% (146/205)
2022-05-08T21:14:16.0401074Z Receiving objects:  72% (148/205)
2022-05-08T21:14:16.0401301Z Receiving objects:  73% (150/205)
2022-05-08T21:14:16.0401518Z Receiving objects:  74% (152/205)
2022-05-08T21:14:16.0401747Z Receiving objects:  75% (154/205)
2022-05-08T21:14:16.0402106Z Receiving objects:  76% (156/205)
2022-05-08T21:14:16.0402352Z Receiving objects:  77% (158/205)
2022-05-08T21:14:16.0402612Z Receiving objects:  78% (160/205)
2022-05-08T21:14:16.0402870Z Receiving objects:  79% (162/205)
2022-05-08T21:14:16.0403119Z Receiving objects:  80% (164/205)
2022-05-08T21:14:16.0403384Z Receiving objects:  81% (167/205)
2022-05-08T21:14:16.0403795Z Receiving objects:  82% (169/205)
2022-05-08T21:14:16.0404041Z Receiving objects:  83% (171/205)
2022-05-08T21:14:16.0404303Z Receiving objects:  84% (173/205)
2022-05-08T21:14:16.0404562Z Receiving objects:  85% (175/205)
2022-05-08T21:14:16.0404808Z Receiving objects:  86% (177/205)
2022-05-08T21:14:16.0500167Z Receiving objects:  87% (179/205)
2022-05-08T21:14:16.0501328Z remote: Total 205 (delta 13), reused 3 (delta 3), pack-reused 167        
2022-05-08T21:14:16.0509654Z Receiving objects:  88% (181/205)
2022-05-08T21:14:16.0510004Z Receiving objects:  89% (183/205)
2022-05-08T21:14:16.0510248Z Receiving objects:  90% (185/205)
2022-05-08T21:14:16.0510471Z Receiving objects:  91% (187/205)
2022-05-08T21:14:16.0510705Z Receiving objects:  92% (189/205)
2022-05-08T21:14:16.0510937Z Receiving objects:  93% (191/205)
2022-05-08T21:14:16.0511151Z Receiving objects:  94% (193/205)
2022-05-08T21:14:16.0511377Z Receiving objects:  95% (195/205)
2022-05-08T21:14:16.0511603Z Receiving objects:  96% (197/205)
2022-05-08T21:14:16.0511823Z Receiving objects:  97% (199/205)
2022-05-08T21:14:16.0512058Z Receiving objects:  98% (201/205)
2022-05-08T21:14:16.0512284Z Receiving objects:  99% (203/205)
2022-05-08T21:14:16.0512513Z Receiving objects: 100% (205/205)
2022-05-08T21:14:16.0512768Z Receiving objects: 100% (205/205), 39.49 KiB | 1.16 MiB/s, done.
2022-05-08T21:14:16.0513032Z Resolving deltas:   0% (0/56)
2022-05-08T21:14:16.0513258Z Resolving deltas:   1% (1/56)
2022-05-08T21:14:16.0513473Z Resolving deltas:   3% (2/56)
2022-05-08T21:14:16.0513702Z Resolving deltas:   5% (3/56)
2022-05-08T21:14:16.0513928Z Resolving deltas:   7% (4/56)
2022-05-08T21:14:16.0519337Z Resolving deltas:   8% (5/56)
2022-05-08T21:14:16.0519660Z Resolving deltas:  10% (6/56)
2022-05-08T21:14:16.0519891Z Resolving deltas:  12% (7/56)
2022-05-08T21:14:16.0520103Z Resolving deltas:  14% (8/56)
2022-05-08T21:14:16.0520333Z Resolving deltas:  16% (9/56)
2022-05-08T21:14:16.0520565Z Resolving deltas:  17% (10/56)
2022-05-08T21:14:16.0520793Z Resolving deltas:  19% (11/56)
2022-05-08T21:14:16.0521022Z Resolving deltas:  21% (12/56)
2022-05-08T21:14:16.0521252Z Resolving deltas:  23% (13/56)
2022-05-08T21:14:16.0521471Z Resolving deltas:  25% (14/56)
2022-05-08T21:14:16.0521701Z Resolving deltas:  26% (15/56)
2022-05-08T21:14:16.0521930Z Resolving deltas:  28% (16/56)
2022-05-08T21:14:16.0522156Z Resolving deltas:  30% (17/56)
2022-05-08T21:14:16.0522371Z Resolving deltas:  32% (18/56)
2022-05-08T21:14:16.0522596Z Resolving deltas:  33% (19/56)
2022-05-08T21:14:16.0522822Z Resolving deltas:  35% (20/56)
2022-05-08T21:14:16.0523033Z Resolving deltas:  37% (21/56)
2022-05-08T21:14:16.0523261Z Resolving deltas:  39% (22/56)
2022-05-08T21:14:16.0523506Z Resolving deltas:  41% (23/56)
2022-05-08T21:14:16.0523732Z Resolving deltas:  42% (24/56)
2022-05-08T21:14:16.0523961Z Resolving deltas:  44% (25/56)
2022-05-08T21:14:16.0524176Z Resolving deltas:  46% (26/56)
2022-05-08T21:14:16.0524400Z Resolving deltas:  48% (27/56)
2022-05-08T21:14:16.0524629Z Resolving deltas:  50% (28/56)
2022-05-08T21:14:16.0524841Z Resolving deltas:  51% (29/56)
2022-05-08T21:14:16.0525066Z Resolving deltas:  53% (30/56)
2022-05-08T21:14:16.0525291Z Resolving deltas:  55% (31/56)
2022-05-08T21:14:16.0525501Z Resolving deltas:  57% (32/56)
2022-05-08T21:14:16.0525727Z Resolving deltas:  58% (33/56)
2022-05-08T21:14:16.0525955Z Resolving deltas:  60% (34/56)
2022-05-08T21:14:16.0526168Z Resolving deltas:  62% (35/56)
2022-05-08T21:14:16.0526391Z Resolving deltas:  64% (36/56)
2022-05-08T21:14:16.0526618Z Resolving deltas:  66% (37/56)
2022-05-08T21:14:16.0526831Z Resolving deltas:  67% (38/56)
2022-05-08T21:14:16.0527057Z Resolving deltas:  69% (39/56)
2022-05-08T21:14:16.0527283Z Resolving deltas:  71% (40/56)
2022-05-08T21:14:16.0527495Z Resolving deltas:  73% (41/56)
2022-05-08T21:14:16.0527715Z Resolving deltas:  75% (42/56)
2022-05-08T21:14:16.0527941Z Resolving deltas:  76% (43/56)
2022-05-08T21:14:16.0528155Z Resolving deltas:  78% (44/56)
2022-05-08T21:14:16.0528491Z Resolving deltas:  80% (45/56)
2022-05-08T21:14:16.0528717Z Resolving deltas:  82% (46/56)
2022-05-08T21:14:16.0528930Z Resolving deltas:  83% (47/56)
2022-05-08T21:14:16.0529155Z Resolving deltas:  85% (48/56)
2022-05-08T21:14:16.0529381Z Resolving deltas:  87% (49/56)
2022-05-08T21:14:16.0529607Z Resolving deltas:  89% (50/56)
2022-05-08T21:14:16.0529819Z Resolving deltas:  91% (51/56)
2022-05-08T21:14:16.0530043Z Resolving deltas:  92% (52/56)
2022-05-08T21:14:16.0530269Z Resolving deltas:  94% (53/56)
2022-05-08T21:14:16.0530483Z Resolving deltas:  96% (54/56)
2022-05-08T21:14:16.0530711Z Resolving deltas:  98% (55/56)
2022-05-08T21:14:16.0530939Z Resolving deltas: 100% (56/56)
2022-05-08T21:14:16.0531161Z Resolving deltas: 100% (56/56), done.
2022-05-08T21:14:16.0573283Z From https://github.com/alexfiz/my_demo_git
2022-05-08T21:14:16.0574004Z  * [new branch]      main                                     -> origin/main
2022-05-08T21:14:16.0575456Z  * [new branch]      second                                   -> origin/second
2022-05-08T21:14:16.0576717Z  * [new ref]         89bcbdcc1d7c0baef73891299a3cd7356b2fbc4c -> pull/25/merge
2022-05-08T21:14:16.0601454Z ##[endgroup]

2022-05-08T21:14:16.0602399Z ##[group]Determining the checkout info
2022-05-08T21:14:16.0603048Z ##[endgroup]

2022-05-08T21:14:16.0603524Z ##[group]Checking out the ref
2022-05-08T21:14:16.0606709Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/25/merge
2022-05-08T21:14:16.0645208Z Note: switching to 'refs/remotes/pull/25/merge'.
2022-05-08T21:14:16.0645678Z 
2022-05-08T21:14:16.0646589Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-08T21:14:16.0647010Z changes and commit them, and you can discard any commits you make in this
2022-05-08T21:14:16.0647372Z state without impacting any branches by switching back to a branch.
2022-05-08T21:14:16.0647570Z 
2022-05-08T21:14:16.0647721Z If you want to create a new branch to retain commits you create, you may
2022-05-08T21:14:16.0648163Z do so (now or later) by using -c with the switch command. Example:
2022-05-08T21:14:16.0648356Z 
2022-05-08T21:14:16.0648527Z   git switch -c <new-branch-name>
2022-05-08T21:14:16.0648685Z 
2022-05-08T21:14:16.0648789Z Or undo this operation with:
2022-05-08T21:14:16.0648922Z 
2022-05-08T21:14:16.0649007Z   git switch -
2022-05-08T21:14:16.0649134Z 
2022-05-08T21:14:16.0649314Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-08T21:14:16.0649526Z 
2022-05-08T21:14:16.0649751Z HEAD is now at 89bcbdc Merge efb18ae4c42c428bed259a5997ddf84924631378 into 0490c6de23b61163ac24d4926a2796aad98ae967
2022-05-08T21:14:16.0655606Z ##[endgroup]

2022-05-08T21:14:16.0698960Z [command]/usr/bin/git log -1 --format='%H'
2022-05-08T21:14:16.0730635Z '89bcbdcc1d7c0baef73891299a3cd7356b2fbc4c'
2022-05-08T21:14:16.0999328Z ##[group]Run jitterbit/get-changed-files@v1
2022-05-08T21:14:16.0999588Z with:
2022-05-08T21:14:16.0999968Z   token: ***
2022-05-08T21:14:16.1000181Z   format: space-delimited
2022-05-08T21:14:16.1000402Z ##[endgroup]

2022-05-08T21:14:16.2838443Z Base commit: 0490c6de23b61163ac24d4926a2796aad98ae967
2022-05-08T21:14:16.2839273Z Head commit: efb18ae4c42c428bed259a5997ddf84924631378
2022-05-08T21:14:16.5698051Z All: .github/workflows/blank2.yml test_TAB.txt
2022-05-08T21:14:16.5698887Z Added: 
2022-05-08T21:14:16.5699166Z Modified: .github/workflows/blank2.yml test_TAB.txt
2022-05-08T21:14:16.5699416Z Removed: 
2022-05-08T21:14:16.5699605Z Renamed: 
2022-05-08T21:14:16.5701981Z Added or modified: .github/workflows/blank2.yml test_TAB.txt
2022-05-08T21:14:16.5880001Z ##[group]Run for changed_file in .github/workflows/blank2.yml test_TAB.txt; do
2022-05-08T21:14:16.5880456Z [36;1mfor changed_file in .github/workflows/blank2.yml test_TAB.txt; do[0m
2022-05-08T21:14:16.5880793Z [36;1mgrep -P '\t' ${changed_file} | sort -n > output.log[0m
2022-05-08T21:14:16.5881049Z [36;1mdone[0m
2022-05-08T21:14:16.5932057Z shell: /usr/bin/bash -e {0}
2022-05-08T21:14:16.5932317Z ##[endgroup]

2022-05-08T21:14:16.6159274Z ##[group]Run actions/upload-artifact@v2
2022-05-08T21:14:16.6159606Z with:
2022-05-08T21:14:16.6159827Z   path: output.log
2022-05-08T21:14:16.6160148Z   name: artifact
2022-05-08T21:14:16.6160451Z   if-no-files-found: warn
2022-05-08T21:14:16.6160693Z ##[endgroup]

2022-05-08T21:14:16.6729598Z With the provided path, there will be 1 file uploaded
2022-05-08T21:14:16.6732150Z Starting artifact upload
2022-05-08T21:14:16.6733279Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-08T21:14:16.6734279Z Artifact name is valid!
2022-05-08T21:14:16.7649701Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-08T21:14:16.8639819Z Total size of all the files uploaded is 31 bytes
2022-05-08T21:14:16.8640943Z File upload process has finished. Finalizing the artifact upload
2022-05-08T21:14:16.9137681Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-08T21:14:16.9138020Z 
2022-05-08T21:14:16.9138255Z The raw size of all the files that were specified for upload is 31 bytes
2022-05-08T21:14:16.9138852Z The size of all the files that were uploaded is 31 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-08T21:14:16.9139607Z 
2022-05-08T21:14:16.9140421Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-08T21:14:16.9140872Z 
2022-05-08T21:14:16.9141560Z Artifact artifact has been successfully uploaded!
2022-05-08T21:14:16.9279105Z Post job cleanup.
2022-05-08T21:14:17.0675974Z [command]/usr/bin/git version
2022-05-08T21:14:17.0676490Z git version 2.36.0
2022-05-08T21:14:17.0695819Z Temporarily overriding HOME='/home/runner/work/_temp/5d08bfef-d602-47de-b546-afb9130d82f9' before making global git config changes
2022-05-08T21:14:17.0696328Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T21:14:17.0696879Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:14:17.0697393Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T21:14:17.0718326Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T21:14:17.0945469Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T21:14:17.0971863Z http.https://github.com/.extraheader
2022-05-08T21:14:17.0982877Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-08T21:14:17.1017503Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T21:14:17.1446972Z Cleaning up orphan processes
```