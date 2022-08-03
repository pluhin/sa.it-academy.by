# 04.GitOps

## Repository
* [github](https://github.com/agbusko/it-academy)

## Action
* [link to action](https://github.com/agbusko/it-academy/blob/dev/.github/workflows/pipeline.yml)

## Log
```
2022-08-03T22:07:36.1564223Z Requested labels: ubuntu-latest
2022-08-03T22:07:36.1564270Z Job defined at: agbusko/it-academy/.github/workflows/pipeline.yml@refs/pull/1/merge
2022-08-03T22:07:36.1564291Z Waiting for a runner to pick up this job...
2022-08-03T22:07:36.8594635Z Job is waiting for a hosted runner to come online.
2022-08-03T22:07:40.5662253Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-08-03T22:07:43.1981328Z Current runner version: '2.294.0'
2022-08-03T22:07:43.2017418Z ##[group]Operating System
2022-08-03T22:07:43.2018081Z Ubuntu
2022-08-03T22:07:43.2018324Z 20.04.4
2022-08-03T22:07:43.2018735Z LTS
2022-08-03T22:07:43.2019055Z ##[endgroup]
2022-08-03T22:07:43.2019353Z ##[group]Virtual Environment
2022-08-03T22:07:43.2019739Z Environment: ubuntu-20.04
2022-08-03T22:07:43.2020128Z Version: 20220729.1
2022-08-03T22:07:43.2020634Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
2022-08-03T22:07:43.2021351Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
2022-08-03T22:07:43.2021841Z ##[endgroup]
2022-08-03T22:07:43.2022189Z ##[group]Virtual Environment Provisioner
2022-08-03T22:07:43.2022621Z 1.0.0.0-main-20220725-1
2022-08-03T22:07:43.2022971Z ##[endgroup]
2022-08-03T22:07:43.2023967Z ##[group]GITHUB_TOKEN Permissions
2022-08-03T22:07:43.2024698Z Actions: write
2022-08-03T22:07:43.2025276Z Checks: write
2022-08-03T22:07:43.2025618Z Contents: write
2022-08-03T22:07:43.2025957Z Deployments: write
2022-08-03T22:07:43.2026277Z Discussions: write
2022-08-03T22:07:43.2026653Z Issues: write
2022-08-03T22:07:43.2026921Z Metadata: read
2022-08-03T22:07:43.2027249Z Packages: write
2022-08-03T22:07:43.2027571Z Pages: write
2022-08-03T22:07:43.2027856Z PullRequests: write
2022-08-03T22:07:43.2028265Z RepositoryProjects: write
2022-08-03T22:07:43.2028636Z SecurityEvents: write
2022-08-03T22:07:43.2028926Z Statuses: write
2022-08-03T22:07:43.2029273Z ##[endgroup]
2022-08-03T22:07:43.2033650Z Secret source: Actions
2022-08-03T22:07:43.2034160Z Prepare workflow directory
2022-08-03T22:07:43.2912650Z Prepare all required actions
2022-08-03T22:07:43.3104349Z Getting action download info
2022-08-03T22:07:43.5446046Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-08-03T22:07:44.2098634Z Download action repository 'tj-actions/changed-files@v24' (SHA:6c44eb8294bb9c93d6118427f4ff8404b695e1d7)
2022-08-03T22:07:44.5984782Z Download action repository 'actions/upload-artifact@v3' (SHA:3cea5372237819ed00197afe530f5a7ea3e805c8)
2022-08-03T22:07:45.1591075Z Getting action download info
2022-08-03T22:07:45.3289148Z Download action repository 'tj-actions/glob@v9.2' (SHA:8852971095f57bebf1912233304340b43a79d3e3)
2022-08-03T22:07:45.9846346Z ##[group]Run actions/checkout@v3
2022-08-03T22:07:45.9846681Z with:
2022-08-03T22:07:45.9846893Z   fetch-depth: 0
2022-08-03T22:07:45.9847125Z   repository: agbusko/it-academy
2022-08-03T22:07:45.9847576Z   token: ***
2022-08-03T22:07:45.9847783Z   ssh-strict: true
2022-08-03T22:07:45.9848002Z   persist-credentials: true
2022-08-03T22:07:45.9848227Z   clean: true
2022-08-03T22:07:45.9848420Z   lfs: false
2022-08-03T22:07:45.9848607Z   submodules: false
2022-08-03T22:07:45.9848831Z   set-safe-directory: true
2022-08-03T22:07:45.9849057Z ##[endgroup]
2022-08-03T22:07:46.2982357Z Syncing repository: agbusko/it-academy
2022-08-03T22:07:46.2984415Z ##[group]Getting Git version info
2022-08-03T22:07:46.2985056Z Working directory is '/home/runner/work/it-academy/it-academy'
2022-08-03T22:07:46.2985564Z [command]/usr/bin/git version
2022-08-03T22:07:46.3119258Z git version 2.37.1
2022-08-03T22:07:46.3134873Z ##[endgroup]
2022-08-03T22:07:46.3156032Z Temporarily overriding HOME='/home/runner/work/_temp/fd1db94b-77c6-49c6-b26e-20cd668ff6f7' before making global git config changes
2022-08-03T22:07:46.3157109Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T22:07:46.3161756Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/it-academy/it-academy
2022-08-03T22:07:46.3272261Z Deleting the contents of '/home/runner/work/it-academy/it-academy'
2022-08-03T22:07:46.3273769Z ##[group]Initializing the repository
2022-08-03T22:07:46.3274402Z [command]/usr/bin/git init /home/runner/work/it-academy/it-academy
2022-08-03T22:07:46.3298761Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-08-03T22:07:46.3299619Z hint: is subject to change. To configure the initial branch name to use in all
2022-08-03T22:07:46.3300110Z hint: of your new repositories, which will suppress this warning, call:
2022-08-03T22:07:46.3300488Z hint: 
2022-08-03T22:07:46.3306064Z hint: 	git config --global init.defaultBranch <name>
2022-08-03T22:07:46.3327304Z hint: 
2022-08-03T22:07:46.3327864Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-08-03T22:07:46.3328348Z hint: 'development'. The just-created branch can be renamed via this command:
2022-08-03T22:07:46.3328627Z hint: 
2022-08-03T22:07:46.3328877Z hint: 	git branch -m <name>
2022-08-03T22:07:46.3329297Z Initialized empty Git repository in /home/runner/work/it-academy/it-academy/.git/
2022-08-03T22:07:46.3329810Z [command]/usr/bin/git remote add origin https://github.com/agbusko/it-academy
2022-08-03T22:07:46.3367391Z ##[endgroup]
2022-08-03T22:07:46.3367869Z ##[group]Disabling automatic garbage collection
2022-08-03T22:07:46.3372431Z [command]/usr/bin/git config --local gc.auto 0
2022-08-03T22:07:46.3410330Z ##[endgroup]
2022-08-03T22:07:46.3411093Z ##[group]Setting up auth
2022-08-03T22:07:46.3419034Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T22:07:46.3460654Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T22:07:46.3839890Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T22:07:46.3860019Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T22:07:46.4119182Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-08-03T22:07:46.4164032Z ##[endgroup]
2022-08-03T22:07:46.4164975Z ##[group]Fetching the repository
2022-08-03T22:07:46.4173966Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +5b37b23b3f8d10afb9c23a9b797e252472ee190b:refs/remotes/pull/1/merge
2022-08-03T22:07:46.7662846Z remote: Enumerating objects: 101, done.        
2022-08-03T22:07:46.7666882Z remote: Counting objects:   0% (1/101)        
2022-08-03T22:07:46.7667703Z remote: Counting objects:   1% (2/101)        
2022-08-03T22:07:46.7668160Z remote: Counting objects:   2% (3/101)        
2022-08-03T22:07:46.7668812Z remote: Counting objects:   3% (4/101)        
2022-08-03T22:07:46.7669240Z remote: Counting objects:   4% (5/101)        
2022-08-03T22:07:46.7669874Z remote: Counting objects:   5% (6/101)        
2022-08-03T22:07:46.7670308Z remote: Counting objects:   6% (7/101)        
2022-08-03T22:07:46.7670938Z remote: Counting objects:   7% (8/101)        
2022-08-03T22:07:46.7671371Z remote: Counting objects:   8% (9/101)        
2022-08-03T22:07:46.7672006Z remote: Counting objects:   9% (10/101)        
2022-08-03T22:07:46.7672480Z remote: Counting objects:  10% (11/101)        
2022-08-03T22:07:46.7673125Z remote: Counting objects:  11% (12/101)        
2022-08-03T22:07:46.7673559Z remote: Counting objects:  12% (13/101)        
2022-08-03T22:07:46.7674235Z remote: Counting objects:  13% (14/101)        
2022-08-03T22:07:46.7674673Z remote: Counting objects:  14% (15/101)        
2022-08-03T22:07:46.7675313Z remote: Counting objects:  15% (16/101)        
2022-08-03T22:07:46.7675750Z remote: Counting objects:  16% (17/101)        
2022-08-03T22:07:46.7676974Z remote: Counting objects:  17% (18/101)        
2022-08-03T22:07:46.7677456Z remote: Counting objects:  18% (19/101)        
2022-08-03T22:07:46.7678368Z remote: Counting objects:  19% (20/101)        
2022-08-03T22:07:46.7679582Z remote: Counting objects:  20% (21/101)        
2022-08-03T22:07:46.7700122Z remote: Counting objects:  21% (22/101)        
2022-08-03T22:07:46.7706964Z remote: Counting objects:  22% (23/101)        
2022-08-03T22:07:46.7707464Z remote: Counting objects:  23% (24/101)        
2022-08-03T22:07:46.7708149Z remote: Counting objects:  24% (25/101)        
2022-08-03T22:07:46.7708608Z remote: Counting objects:  25% (26/101)        
2022-08-03T22:07:46.7709247Z remote: Counting objects:  26% (27/101)        
2022-08-03T22:07:46.7709670Z remote: Counting objects:  27% (28/101)        
2022-08-03T22:07:46.7710396Z remote: Counting objects:  28% (29/101)        
2022-08-03T22:07:46.7710833Z remote: Counting objects:  29% (30/101)        
2022-08-03T22:07:46.7711457Z remote: Counting objects:  30% (31/101)        
2022-08-03T22:07:46.7711895Z remote: Counting objects:  31% (32/101)        
2022-08-03T22:07:46.7712524Z remote: Counting objects:  32% (33/101)        
2022-08-03T22:07:46.7712984Z remote: Counting objects:  33% (34/101)        
2022-08-03T22:07:46.7713606Z remote: Counting objects:  34% (35/101)        
2022-08-03T22:07:46.7714048Z remote: Counting objects:  35% (36/101)        
2022-08-03T22:07:46.7714684Z remote: Counting objects:  36% (37/101)        
2022-08-03T22:07:46.7715114Z remote: Counting objects:  37% (38/101)        
2022-08-03T22:07:46.7715729Z remote: Counting objects:  38% (39/101)        
2022-08-03T22:07:46.7716165Z remote: Counting objects:  39% (40/101)        
2022-08-03T22:07:46.7717102Z remote: Counting objects:  40% (41/101)        
2022-08-03T22:07:46.7717527Z remote: Counting objects:  41% (42/101)        
2022-08-03T22:07:46.7718160Z remote: Counting objects:  42% (43/101)        
2022-08-03T22:07:46.7718612Z remote: Counting objects:  43% (44/101)        
2022-08-03T22:07:46.7719247Z remote: Counting objects:  44% (45/101)        
2022-08-03T22:07:46.7719661Z remote: Counting objects:  45% (46/101)        
2022-08-03T22:07:46.7720292Z remote: Counting objects:  46% (47/101)        
2022-08-03T22:07:46.7720721Z remote: Counting objects:  47% (48/101)        
2022-08-03T22:07:46.7721351Z remote: Counting objects:  48% (49/101)        
2022-08-03T22:07:46.7721772Z remote: Counting objects:  49% (50/101)        
2022-08-03T22:07:46.7722394Z remote: Counting objects:  50% (51/101)        
2022-08-03T22:07:46.7722826Z remote: Counting objects:  51% (52/101)        
2022-08-03T22:07:46.7723715Z remote: Counting objects:  52% (53/101)        
2022-08-03T22:07:46.7724154Z remote: Counting objects:  53% (54/101)        
2022-08-03T22:07:46.7724808Z remote: Counting objects:  54% (55/101)        
2022-08-03T22:07:46.7725253Z remote: Counting objects:  55% (56/101)        
2022-08-03T22:07:46.7725867Z remote: Counting objects:  56% (57/101)        
2022-08-03T22:07:46.7726303Z remote: Counting objects:  57% (58/101)        
2022-08-03T22:07:46.7726927Z remote: Counting objects:  58% (59/101)        
2022-08-03T22:07:46.7727352Z remote: Counting objects:  59% (60/101)        
2022-08-03T22:07:46.7727987Z remote: Counting objects:  60% (61/101)        
2022-08-03T22:07:46.7728429Z remote: Counting objects:  61% (62/101)        
2022-08-03T22:07:46.7729060Z remote: Counting objects:  62% (63/101)        
2022-08-03T22:07:46.7729487Z remote: Counting objects:  63% (64/101)        
2022-08-03T22:07:46.7730097Z remote: Counting objects:  64% (65/101)        
2022-08-03T22:07:46.7730867Z remote: Counting objects:  65% (66/101)        
2022-08-03T22:07:46.7731510Z remote: Counting objects:  66% (67/101)        
2022-08-03T22:07:46.7731938Z remote: Counting objects:  67% (68/101)        
2022-08-03T22:07:46.7732558Z remote: Counting objects:  68% (69/101)        
2022-08-03T22:07:46.7732989Z remote: Counting objects:  69% (70/101)        
2022-08-03T22:07:46.7733615Z remote: Counting objects:  70% (71/101)        
2022-08-03T22:07:46.7734052Z remote: Counting objects:  71% (72/101)        
2022-08-03T22:07:46.7734664Z remote: Counting objects:  72% (73/101)        
2022-08-03T22:07:46.7735097Z remote: Counting objects:  73% (74/101)        
2022-08-03T22:07:46.7735745Z remote: Counting objects:  74% (75/101)        
2022-08-03T22:07:46.7736340Z remote: Counting objects:  75% (76/101)        
2022-08-03T22:07:46.7736961Z remote: Counting objects:  76% (77/101)        
2022-08-03T22:07:46.7737392Z remote: Counting objects:  77% (78/101)        
2022-08-03T22:07:46.7738024Z remote: Counting objects:  78% (79/101)        
2022-08-03T22:07:46.7738459Z remote: Counting objects:  79% (80/101)        
2022-08-03T22:07:46.7739077Z remote: Counting objects:  80% (81/101)        
2022-08-03T22:07:46.7739509Z remote: Counting objects:  81% (82/101)        
2022-08-03T22:07:46.7740136Z remote: Counting objects:  82% (83/101)        
2022-08-03T22:07:46.7740555Z remote: Counting objects:  83% (84/101)        
2022-08-03T22:07:46.7741183Z remote: Counting objects:  84% (85/101)        
2022-08-03T22:07:46.7741730Z remote: Counting objects:  85% (86/101)        
2022-08-03T22:07:46.7742671Z remote: Counting objects:  86% (87/101)        
2022-08-03T22:07:46.7743209Z remote: Counting objects:  87% (88/101)        
2022-08-03T22:07:46.7743942Z remote: Counting objects:  88% (89/101)        
2022-08-03T22:07:46.7744404Z remote: Counting objects:  89% (90/101)        
2022-08-03T22:07:46.7745120Z remote: Counting objects:  90% (91/101)        
2022-08-03T22:07:46.7745701Z remote: Counting objects:  91% (92/101)        
2022-08-03T22:07:46.7746384Z remote: Counting objects:  92% (93/101)        
2022-08-03T22:07:46.7746919Z remote: Counting objects:  93% (94/101)        
2022-08-03T22:07:46.7747668Z remote: Counting objects:  94% (95/101)        
2022-08-03T22:07:46.7748223Z remote: Counting objects:  95% (96/101)        
2022-08-03T22:07:46.7748893Z remote: Counting objects:  96% (97/101)        
2022-08-03T22:07:46.7749410Z remote: Counting objects:  97% (98/101)        
2022-08-03T22:07:46.7750875Z remote: Counting objects:  98% (99/101)        
2022-08-03T22:07:46.7751270Z remote: Counting objects:  99% (100/101)        
2022-08-03T22:07:46.7751563Z remote: Counting objects: 100% (101/101)        
2022-08-03T22:07:46.7751917Z remote: Counting objects: 100% (101/101), done.        
2022-08-03T22:07:46.7752297Z remote: Compressing objects:   1% (1/54)        
2022-08-03T22:07:46.7752593Z remote: Compressing objects:   3% (2/54)        
2022-08-03T22:07:46.7752981Z remote: Compressing objects:   5% (3/54)        
2022-08-03T22:07:46.7753471Z remote: Compressing objects:   7% (4/54)        
2022-08-03T22:07:46.7753845Z remote: Compressing objects:   9% (5/54)        
2022-08-03T22:07:46.7754147Z remote: Compressing objects:  11% (6/54)        
2022-08-03T22:07:46.7754523Z remote: Compressing objects:  12% (7/54)        
2022-08-03T22:07:46.7754873Z remote: Compressing objects:  14% (8/54)        
2022-08-03T22:07:46.7755183Z remote: Compressing objects:  16% (9/54)        
2022-08-03T22:07:46.7755542Z remote: Compressing objects:  18% (10/54)        
2022-08-03T22:07:46.7755901Z remote: Compressing objects:  20% (11/54)        
2022-08-03T22:07:46.7756231Z remote: Compressing objects:  22% (12/54)        
2022-08-03T22:07:46.7756797Z remote: Compressing objects:  24% (13/54)        
2022-08-03T22:07:46.7757157Z remote: Compressing objects:  25% (14/54)        
2022-08-03T22:07:46.7757456Z remote: Compressing objects:  27% (15/54)        
2022-08-03T22:07:46.7757805Z remote: Compressing objects:  29% (16/54)        
2022-08-03T22:07:46.7758190Z remote: Compressing objects:  31% (17/54)        
2022-08-03T22:07:46.7758542Z remote: Compressing objects:  33% (18/54)        
2022-08-03T22:07:46.7758835Z remote: Compressing objects:  35% (19/54)        
2022-08-03T22:07:46.7759175Z remote: Compressing objects:  37% (20/54)        
2022-08-03T22:07:46.7759545Z remote: Compressing objects:  38% (21/54)        
2022-08-03T22:07:46.7759837Z remote: Compressing objects:  40% (22/54)        
2022-08-03T22:07:46.7760187Z remote: Compressing objects:  42% (23/54)        
2022-08-03T22:07:46.7760523Z remote: Compressing objects:  44% (24/54)        
2022-08-03T22:07:46.7760812Z remote: Compressing objects:  46% (25/54)        
2022-08-03T22:07:46.7761293Z remote: Compressing objects:  48% (26/54)        
2022-08-03T22:07:46.7761665Z remote: Compressing objects:  50% (27/54)        
2022-08-03T22:07:46.7762004Z remote: Compressing objects:  51% (28/54)        
2022-08-03T22:07:46.7762347Z remote: Compressing objects:  53% (29/54)        
2022-08-03T22:07:46.7762700Z remote: Compressing objects:  55% (30/54)        
2022-08-03T22:07:46.7763088Z remote: Compressing objects:  57% (31/54)        
2022-08-03T22:07:46.7763387Z remote: Compressing objects:  59% (32/54)        
2022-08-03T22:07:46.7763730Z remote: Compressing objects:  61% (33/54)        
2022-08-03T22:07:46.7764071Z remote: Compressing objects:  62% (34/54)        
2022-08-03T22:07:46.7764369Z remote: Compressing objects:  64% (35/54)        
2022-08-03T22:07:46.7764755Z remote: Compressing objects:  66% (36/54)        
2022-08-03T22:07:46.7765098Z remote: Compressing objects:  68% (37/54)        
2022-08-03T22:07:46.7765390Z remote: Compressing objects:  70% (38/54)        
2022-08-03T22:07:46.7765736Z remote: Compressing objects:  72% (39/54)        
2022-08-03T22:07:46.7766122Z remote: Compressing objects:  74% (40/54)        
2022-08-03T22:07:46.7766465Z remote: Compressing objects:  75% (41/54)        
2022-08-03T22:07:46.7766758Z remote: Compressing objects:  77% (42/54)        
2022-08-03T22:07:46.7767100Z remote: Compressing objects:  79% (43/54)        
2022-08-03T22:07:46.7767453Z remote: Compressing objects:  81% (44/54)        
2022-08-03T22:07:46.7767776Z remote: Compressing objects:  83% (45/54)        
2022-08-03T22:07:46.7768135Z remote: Compressing objects:  85% (46/54)        
2022-08-03T22:07:46.7768474Z remote: Compressing objects:  87% (47/54)        
2022-08-03T22:07:46.7768766Z remote: Compressing objects:  88% (48/54)        
2022-08-03T22:07:46.7769119Z remote: Compressing objects:  90% (49/54)        
2022-08-03T22:07:46.7769491Z remote: Compressing objects:  92% (50/54)        
2022-08-03T22:07:46.7769832Z remote: Compressing objects:  94% (51/54)        
2022-08-03T22:07:46.7770129Z remote: Compressing objects:  96% (52/54)        
2022-08-03T22:07:46.7770484Z remote: Compressing objects:  98% (53/54)        
2022-08-03T22:07:46.7770851Z remote: Compressing objects: 100% (54/54)        
2022-08-03T22:07:46.7771165Z remote: Compressing objects: 100% (54/54), done.        
2022-08-03T22:07:46.7934345Z remote: Total 101 (delta 19), reused 93 (delta 17), pack-reused 0        
2022-08-03T22:07:46.7963872Z Receiving objects:   0% (1/101)
2022-08-03T22:07:46.7970853Z Receiving objects:   1% (2/101)
2022-08-03T22:07:46.7972112Z Receiving objects:   2% (3/101)
2022-08-03T22:07:46.7972435Z Receiving objects:   3% (4/101)
2022-08-03T22:07:46.7974471Z Receiving objects:   4% (5/101)
2022-08-03T22:07:46.7979721Z Receiving objects:   5% (6/101)
2022-08-03T22:07:46.7980091Z Receiving objects:   6% (7/101)
2022-08-03T22:07:46.7985390Z Receiving objects:   7% (8/101)
2022-08-03T22:07:46.7986419Z Receiving objects:   8% (9/101)
2022-08-03T22:07:46.7986742Z Receiving objects:   9% (10/101)
2022-08-03T22:07:46.7987080Z Receiving objects:  10% (11/101)
2022-08-03T22:07:46.7987569Z Receiving objects:  11% (12/101)
2022-08-03T22:07:46.7988234Z Receiving objects:  12% (13/101)
2022-08-03T22:07:46.7988551Z Receiving objects:  13% (14/101)
2022-08-03T22:07:46.7988860Z Receiving objects:  14% (15/101)
2022-08-03T22:07:46.7989124Z Receiving objects:  15% (16/101)
2022-08-03T22:07:46.7989551Z Receiving objects:  16% (17/101)
2022-08-03T22:07:46.7989956Z Receiving objects:  17% (18/101)
2022-08-03T22:07:46.7990216Z Receiving objects:  18% (19/101)
2022-08-03T22:07:46.7990519Z Receiving objects:  19% (20/101)
2022-08-03T22:07:46.7990941Z Receiving objects:  20% (21/101)
2022-08-03T22:07:46.7991747Z Receiving objects:  21% (22/101)
2022-08-03T22:07:46.7992004Z Receiving objects:  22% (23/101)
2022-08-03T22:07:46.7992324Z Receiving objects:  23% (24/101)
2022-08-03T22:07:46.7992718Z Receiving objects:  24% (25/101)
2022-08-03T22:07:46.7993459Z Receiving objects:  25% (26/101)
2022-08-03T22:07:46.7993915Z Receiving objects:  26% (27/101)
2022-08-03T22:07:46.7994221Z Receiving objects:  27% (28/101)
2022-08-03T22:07:46.7996030Z Receiving objects:  28% (29/101)
2022-08-03T22:07:46.7997907Z Receiving objects:  29% (30/101)
2022-08-03T22:07:46.8002002Z Receiving objects:  30% (31/101)
2022-08-03T22:07:46.8004887Z Receiving objects:  31% (32/101)
2022-08-03T22:07:46.8006823Z Receiving objects:  32% (33/101)
2022-08-03T22:07:46.8010368Z Receiving objects:  33% (34/101)
2022-08-03T22:07:46.8024359Z Receiving objects:  34% (35/101)
2022-08-03T22:07:46.8025350Z Receiving objects:  35% (36/101)
2022-08-03T22:07:46.8025666Z Receiving objects:  36% (37/101)
2022-08-03T22:07:46.8026052Z Receiving objects:  37% (38/101)
2022-08-03T22:07:46.8026769Z Receiving objects:  38% (39/101)
2022-08-03T22:07:46.8027836Z Receiving objects:  39% (40/101)
2022-08-03T22:07:46.8028305Z Receiving objects:  40% (41/101)
2022-08-03T22:07:46.8030280Z Receiving objects:  41% (42/101)
2022-08-03T22:07:46.8030897Z Receiving objects:  42% (43/101)
2022-08-03T22:07:46.8031459Z Receiving objects:  43% (44/101)
2022-08-03T22:07:46.8033091Z Receiving objects:  44% (45/101)
2022-08-03T22:07:46.8033644Z Receiving objects:  45% (46/101)
2022-08-03T22:07:46.8034051Z Receiving objects:  46% (47/101)
2022-08-03T22:07:46.8035792Z Receiving objects:  47% (48/101)
2022-08-03T22:07:46.8037692Z Receiving objects:  48% (49/101)
2022-08-03T22:07:46.8038305Z Receiving objects:  49% (50/101)
2022-08-03T22:07:46.8041968Z Receiving objects:  50% (51/101)
2022-08-03T22:07:46.8043887Z Receiving objects:  51% (52/101)
2022-08-03T22:07:46.8047476Z Receiving objects:  52% (53/101)
2022-08-03T22:07:46.8049356Z Receiving objects:  53% (54/101)
2022-08-03T22:07:46.8049939Z Receiving objects:  54% (55/101)
2022-08-03T22:07:46.8058889Z Receiving objects:  55% (56/101)
2022-08-03T22:07:46.8061267Z Receiving objects:  56% (57/101)
2022-08-03T22:07:46.8062964Z Receiving objects:  57% (58/101)
2022-08-03T22:07:46.8063292Z Receiving objects:  58% (59/101)
2022-08-03T22:07:46.8064786Z Receiving objects:  59% (60/101)
2022-08-03T22:07:46.8065134Z Receiving objects:  60% (61/101)
2022-08-03T22:07:46.8066647Z Receiving objects:  61% (62/101)
2022-08-03T22:07:46.8066978Z Receiving objects:  62% (63/101)
2022-08-03T22:07:46.8067288Z Receiving objects:  63% (64/101)
2022-08-03T22:07:46.8068796Z Receiving objects:  64% (65/101)
2022-08-03T22:07:46.8069293Z Receiving objects:  65% (66/101)
2022-08-03T22:07:46.8070978Z Receiving objects:  66% (67/101)
2022-08-03T22:07:46.8071299Z Receiving objects:  67% (68/101)
2022-08-03T22:07:46.8071626Z Receiving objects:  68% (69/101)
2022-08-03T22:07:46.8073063Z Receiving objects:  69% (70/101)
2022-08-03T22:07:46.8073380Z Receiving objects:  70% (71/101)
2022-08-03T22:07:46.8074956Z Receiving objects:  71% (72/101)
2022-08-03T22:07:46.8075226Z Receiving objects:  72% (73/101)
2022-08-03T22:07:46.8075544Z Receiving objects:  73% (74/101)
2022-08-03T22:07:46.8077256Z Receiving objects:  74% (75/101)
2022-08-03T22:07:46.8077536Z Receiving objects:  75% (76/101)
2022-08-03T22:07:46.8079075Z Receiving objects:  76% (77/101)
2022-08-03T22:07:46.8079490Z Receiving objects:  77% (78/101)
2022-08-03T22:07:46.8079749Z Receiving objects:  78% (79/101)
2022-08-03T22:07:46.8081179Z Receiving objects:  79% (80/101)
2022-08-03T22:07:46.8081606Z Receiving objects:  80% (81/101)
2022-08-03T22:07:46.8082995Z Receiving objects:  81% (82/101)
2022-08-03T22:07:46.8083401Z Receiving objects:  82% (83/101)
2022-08-03T22:07:46.8083715Z Receiving objects:  83% (84/101)
2022-08-03T22:07:46.8085156Z Receiving objects:  84% (85/101)
2022-08-03T22:07:46.8085546Z Receiving objects:  85% (86/101)
2022-08-03T22:07:46.8089349Z Receiving objects:  86% (87/101)
2022-08-03T22:07:46.8090862Z Receiving objects:  87% (88/101)
2022-08-03T22:07:46.8091156Z Receiving objects:  88% (89/101)
2022-08-03T22:07:46.8091544Z Receiving objects:  89% (90/101)
2022-08-03T22:07:46.8093095Z Receiving objects:  90% (91/101)
2022-08-03T22:07:46.8093365Z Receiving objects:  91% (92/101)
2022-08-03T22:07:46.8095125Z Receiving objects:  92% (93/101)
2022-08-03T22:07:46.8095444Z Receiving objects:  93% (94/101)
2022-08-03T22:07:46.8096989Z Receiving objects:  94% (95/101)
2022-08-03T22:07:46.8097316Z Receiving objects:  95% (96/101)
2022-08-03T22:07:46.8098681Z Receiving objects:  96% (97/101)
2022-08-03T22:07:46.8098998Z Receiving objects:  97% (98/101)
2022-08-03T22:07:46.8099332Z Receiving objects:  98% (99/101)
2022-08-03T22:07:46.8100848Z Receiving objects:  99% (100/101)
2022-08-03T22:07:46.8101176Z Receiving objects: 100% (101/101)
2022-08-03T22:07:46.8102657Z Receiving objects: 100% (101/101), 15.84 KiB | 3.17 MiB/s, done.
2022-08-03T22:07:46.8103009Z Resolving deltas:   0% (0/19)
2022-08-03T22:07:46.8106300Z Resolving deltas:   5% (1/19)
2022-08-03T22:07:46.8106578Z Resolving deltas:  10% (2/19)
2022-08-03T22:07:46.8108024Z Resolving deltas:  15% (3/19)
2022-08-03T22:07:46.8108399Z Resolving deltas:  21% (4/19)
2022-08-03T22:07:46.8108670Z Resolving deltas:  26% (5/19)
2022-08-03T22:07:46.8110168Z Resolving deltas:  31% (6/19)
2022-08-03T22:07:46.8111564Z Resolving deltas:  36% (7/19)
2022-08-03T22:07:46.8111881Z Resolving deltas:  42% (8/19)
2022-08-03T22:07:46.8112182Z Resolving deltas:  47% (9/19)
2022-08-03T22:07:46.8113633Z Resolving deltas:  52% (10/19)
2022-08-03T22:07:46.8113980Z Resolving deltas:  57% (11/19)
2022-08-03T22:07:46.8115457Z Resolving deltas:  63% (12/19)
2022-08-03T22:07:46.8115777Z Resolving deltas:  68% (13/19)
2022-08-03T22:07:46.8116049Z Resolving deltas:  73% (14/19)
2022-08-03T22:07:46.8118235Z Resolving deltas:  78% (15/19)
2022-08-03T22:07:46.8118726Z Resolving deltas:  84% (16/19)
2022-08-03T22:07:46.8118983Z Resolving deltas:  89% (17/19)
2022-08-03T22:07:46.8119296Z Resolving deltas:  94% (18/19)
2022-08-03T22:07:46.8119615Z Resolving deltas: 100% (19/19)
2022-08-03T22:07:46.8119965Z Resolving deltas: 100% (19/19), done.
2022-08-03T22:07:46.8121484Z From https://github.com/agbusko/it-academy
2022-08-03T22:07:46.8121964Z  * [new branch]      dev                                      -> origin/dev
2022-08-03T22:07:46.8122516Z  * [new branch]      features/do_one                          -> origin/features/do_one
2022-08-03T22:07:46.8122982Z  * [new branch]      hotfix/pr                                -> origin/hotfix/pr
2022-08-03T22:07:46.8123720Z  * [new branch]      hotfix/we_gonna_die                      -> origin/hotfix/we_gonna_die
2022-08-03T22:07:46.8124242Z  * [new branch]      master                                   -> origin/master
2022-08-03T22:07:46.8126128Z  * [new ref]         5b37b23b3f8d10afb9c23a9b797e252472ee190b -> pull/1/merge
2022-08-03T22:07:46.8161656Z ##[endgroup]
2022-08-03T22:07:46.8169642Z ##[group]Determining the checkout info
2022-08-03T22:07:46.8171411Z ##[endgroup]
2022-08-03T22:07:46.8173003Z ##[group]Checking out the ref
2022-08-03T22:07:46.8174915Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/1/merge
2022-08-03T22:07:46.8225790Z Note: switching to 'refs/remotes/pull/1/merge'.
2022-08-03T22:07:46.8226234Z 
2022-08-03T22:07:46.8227776Z You are in 'detached HEAD' state. You can look around, make experimental
2022-08-03T22:07:46.8228321Z changes and commit them, and you can discard any commits you make in this
2022-08-03T22:07:46.8231574Z state without impacting any branches by switching back to a branch.
2022-08-03T22:07:46.8232069Z 
2022-08-03T22:07:46.8232299Z If you want to create a new branch to retain commits you create, you may
2022-08-03T22:07:46.8234140Z do so (now or later) by using -c with the switch command. Example:
2022-08-03T22:07:46.8235562Z 
2022-08-03T22:07:46.8235844Z   git switch -c <new-branch-name>
2022-08-03T22:07:46.8236052Z 
2022-08-03T22:07:46.8236148Z Or undo this operation with:
2022-08-03T22:07:46.8237872Z 
2022-08-03T22:07:46.8238141Z   git switch -
2022-08-03T22:07:46.8238337Z 
2022-08-03T22:07:46.8239752Z Turn off this advice by setting config variable advice.detachedHead to false
2022-08-03T22:07:46.8240063Z 
2022-08-03T22:07:46.8241421Z HEAD is now at 5b37b23 Merge b484beca33e4a0080f56deac24542b5d6f32d798 into 6dfebc1f8a46ff4f6730f9749262c19351695238
2022-08-03T22:07:46.8245850Z ##[endgroup]
2022-08-03T22:07:46.8337423Z [command]/usr/bin/git log -1 --format='%H'
2022-08-03T22:07:46.8391361Z '5b37b23b3f8d10afb9c23a9b797e252472ee190b'
2022-08-03T22:07:46.8919101Z ##[group]Run tj-actions/changed-files@v24
2022-08-03T22:07:46.8919364Z with:
2022-08-03T22:07:46.8919699Z   token: ***
2022-08-03T22:07:46.8919897Z   separator:  
2022-08-03T22:07:46.8920131Z   include_all_old_new_renamed_files: false
2022-08-03T22:07:46.8920360Z   old_new_separator: ,
2022-08-03T22:07:46.8920584Z   old_new_files_separator:  
2022-08-03T22:07:46.8920810Z   files_separator: 

2022-08-03T22:07:46.8921019Z   files_ignore_separator: 

2022-08-03T22:07:46.8921278Z   sha: 5b37b23b3f8d10afb9c23a9b797e252472ee190b
2022-08-03T22:07:46.8921540Z   since_last_remote_commit: false
2022-08-03T22:07:46.8921743Z   path: .
2022-08-03T22:07:46.8921942Z   use_fork_point: false
2022-08-03T22:07:46.8922151Z   quotepath: true
2022-08-03T22:07:46.8922341Z   dir_names: false
2022-08-03T22:07:46.8922553Z ##[endgroup]
2022-08-03T22:07:46.9230658Z ##[group]Run # "Set base sha..."
2022-08-03T22:07:46.9231049Z [36;1m# "Set base sha..."[0m
2022-08-03T22:07:46.9231353Z [36;1mif [[ -n "" ]]; then[0m
2022-08-03T22:07:46.9231595Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-08-03T22:07:46.9231898Z [36;1melif [[ "false" == "true" && "" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-08-03T22:07:46.9232194Z [36;1m    echo "::set-output name=base_sha::"[0m
2022-08-03T22:07:46.9232413Z [36;1mfi[0m
2022-08-03T22:07:46.9291962Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-03T22:07:46.9292283Z ##[endgroup]
2022-08-03T22:07:46.9516260Z ##[group]Run # "Calculating the previous and current SHA..."
2022-08-03T22:07:46.9516978Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-08-03T22:07:46.9517270Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-08-03T22:07:46.9570055Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-03T22:07:46.9570354Z env:
2022-08-03T22:07:46.9570616Z   GITHUB_SERVER_URL: https://github.com
2022-08-03T22:07:46.9570895Z   GITHUB_REPOSITORY: agbusko/it-academy
2022-08-03T22:07:46.9571133Z   GITHUB_BASE_REF: dev
2022-08-03T22:07:46.9571362Z   GITHUB_HEAD_REF: hotfix/pr
2022-08-03T22:07:46.9571671Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
2022-08-03T22:07:46.9572025Z   GITHUB_WORKSPACE: /home/runner/work/it-academy/it-academy
2022-08-03T22:07:46.9572320Z   INPUT_SHA: 5b37b23b3f8d10afb9c23a9b797e252472ee190b
2022-08-03T22:07:46.9572574Z   INPUT_BASE_SHA: 
2022-08-03T22:07:46.9572952Z   INPUT_TOKEN: ***
2022-08-03T22:07:46.9573150Z   INPUT_PATH: .
2022-08-03T22:07:46.9573372Z   INPUT_USE_FORK_POINT: false
2022-08-03T22:07:46.9573598Z ##[endgroup]
2022-08-03T22:07:46.9670532Z ##[group]changed-files-diff-sha
2022-08-03T22:07:47.3305975Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-08-03T22:07:47.3356772Z From https://github.com/agbusko/it-academy
2022-08-03T22:07:47.3357432Z  * [new branch]      dev        -> dev
2022-08-03T22:07:47.3460143Z ##[endgroup]
2022-08-03T22:07:47.3504118Z ##[group]Run tj-actions/glob@v9.2
2022-08-03T22:07:47.3504362Z with:
2022-08-03T22:07:47.3504565Z   files-separator: 

2022-08-03T22:07:47.3504775Z   escape-paths: true
2022-08-03T22:07:47.3505020Z   excluded-files-separator: 

2022-08-03T22:07:47.3505264Z   working-directory: .
2022-08-03T22:07:47.3505527Z   base-sha: 6dfebc1f8a46ff4f6730f9749262c19351695238
2022-08-03T22:07:47.3505809Z   sha: 5b37b23b3f8d10afb9c23a9b797e252472ee190b
2022-08-03T22:07:47.3506078Z   include-deleted-files: true
2022-08-03T22:07:47.3506300Z   separator: |
2022-08-03T22:07:47.3506538Z   files-from-source-file-separator: 

2022-08-03T22:07:47.3506871Z   excluded-files-from-source-file-separator: 

2022-08-03T22:07:47.3507173Z   follow-symbolic-links: true
2022-08-03T22:07:47.3507409Z   strip-top-level-dir: true
2022-08-03T22:07:47.3507637Z ##[endgroup]
2022-08-03T22:07:47.5393379Z [command]/usr/bin/git rev-parse --show-toplevel
2022-08-03T22:07:47.5438171Z /home/runner/work/it-academy/it-academy
2022-08-03T22:07:47.5475949Z [command]/usr/bin/git diff --diff-filter=D --name-only 6dfebc1f8a46ff4f6730f9749262c19351695238 5b37b23b3f8d10afb9c23a9b797e252472ee190b
2022-08-03T22:07:47.5512970Z 
2022-08-03T22:07:47.5577216Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-08-03T22:07:47.5577548Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-08-03T22:07:47.5631836Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-08-03T22:07:47.5632117Z env:
2022-08-03T22:07:47.5632391Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v24
2022-08-03T22:07:47.5632750Z   GITHUB_WORKSPACE: /home/runner/work/it-academy/it-academy
2022-08-03T22:07:47.5633029Z   INPUT_FILES_PATTERN_FILE: 
2022-08-03T22:07:47.5633246Z   INPUT_SEPARATOR:  
2022-08-03T22:07:47.5633454Z   INPUT_PATH: .
2022-08-03T22:07:47.5633722Z   INPUT_PREVIOUS_SHA: 6dfebc1f8a46ff4f6730f9749262c19351695238
2022-08-03T22:07:47.5634051Z   INPUT_CURRENT_SHA: 5b37b23b3f8d10afb9c23a9b797e252472ee190b
2022-08-03T22:07:47.5634316Z   INPUT_TARGET_BRANCH: dev
2022-08-03T22:07:47.5634563Z   INPUT_CURRENT_BRANCH: hotfix/pr
2022-08-03T22:07:47.5634783Z   INPUT_QUOTEPATH: true
2022-08-03T22:07:47.5635040Z   INPUT_INCLUDE_ALL_OLD_NEW_RENAMED_FILES: false
2022-08-03T22:07:47.5635298Z   INPUT_OLD_NEW_SEPARATOR: ,
2022-08-03T22:07:47.5635541Z   INPUT_OLD_NEW_FILES_SEPARATOR:  
2022-08-03T22:07:47.5635758Z   INPUT_DIFF_RELATIVE: 
2022-08-03T22:07:47.5635977Z   INPUT_DIR_NAMES: false
2022-08-03T22:07:47.5636187Z ##[endgroup]
2022-08-03T22:07:47.5767075Z ##[group]changed-files
2022-08-03T22:07:47.8673182Z ##[endgroup]
2022-08-03T22:07:47.8794830Z ##[group]Run for file in commit.txt; do
2022-08-03T22:07:47.8795128Z [36;1mfor file in commit.txt; do[0m
2022-08-03T22:07:47.8795377Z [36;1m  echo "$file was changed"[0m
2022-08-03T22:07:47.8795686Z [36;1m  echo "Tabs in file $file: $(grep -P -o '\t' $file | wc -l)" >> count_tabs.txt 2>&1[0m
2022-08-03T22:07:47.8795981Z [36;1mdone[0m
2022-08-03T22:07:47.8851470Z shell: /usr/bin/bash -e {0}
2022-08-03T22:07:47.8851721Z ##[endgroup]
2022-08-03T22:07:47.8933161Z commit.txt was changed
2022-08-03T22:07:47.9000127Z ##[group]Run actions/upload-artifact@v3
2022-08-03T22:07:47.9000389Z with:
2022-08-03T22:07:47.9000578Z   name: artifact
2022-08-03T22:07:47.9000776Z   path: count_tabs.txt
2022-08-03T22:07:47.9001006Z   if-no-files-found: warn
2022-08-03T22:07:47.9001230Z ##[endgroup]
2022-08-03T22:07:47.9677737Z With the provided path, there will be 1 file uploaded
2022-08-03T22:07:47.9678935Z Starting artifact upload
2022-08-03T22:07:47.9680211Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-08-03T22:07:47.9680994Z Artifact name is valid!
2022-08-03T22:07:48.2032976Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-08-03T22:07:48.3100581Z Total size of all the files uploaded is 27 bytes
2022-08-03T22:07:48.3101497Z File upload process has finished. Finalizing the artifact upload
2022-08-03T22:07:48.3583196Z Artifact has been finalized. All files have been successfully uploaded!
2022-08-03T22:07:48.3583962Z 
2022-08-03T22:07:48.3584340Z The raw size of all the files that were specified for upload is 27 bytes
2022-08-03T22:07:48.3585269Z The size of all the files that were uploaded is 27 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-08-03T22:07:48.3585771Z 
2022-08-03T22:07:48.3586999Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-08-03T22:07:48.3587608Z 
2022-08-03T22:07:48.3588266Z Artifact artifact has been successfully uploaded!
2022-08-03T22:07:48.3794585Z Post job cleanup.
2022-08-03T22:07:48.3830716Z Post job cleanup.
2022-08-03T22:07:48.4398842Z Post job cleanup.
2022-08-03T22:07:48.5655632Z [command]/usr/bin/git version
2022-08-03T22:07:48.5738894Z git version 2.37.1
2022-08-03T22:07:48.5790963Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/bc21642f-c8f4-46e0-94e0-4095e224ad23/.gitconfig'
2022-08-03T22:07:48.5807142Z Temporarily overriding HOME='/home/runner/work/_temp/bc21642f-c8f4-46e0-94e0-4095e224ad23' before making global git config changes
2022-08-03T22:07:48.5810632Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T22:07:48.5818152Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/it-academy/it-academy
2022-08-03T22:07:48.5867929Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T22:07:48.5911029Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T22:07:48.6180412Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T22:07:48.6207453Z http.https://github.com/.extraheader
2022-08-03T22:07:48.6218498Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-08-03T22:07:48.6260414Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T22:07:48.6742902Z Cleaning up orphan processes
```