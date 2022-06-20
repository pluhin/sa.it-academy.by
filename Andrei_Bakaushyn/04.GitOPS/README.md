# 04.GitOPS

## Location testing runner https://github.com/AndreiBakaushyn/Demo_repository/tree/main/.github/workflows )

## Pipeline logs
```bash
2022-06-20T09:27:57.8718342Z Requested labels: ubuntu-latest
2022-06-20T09:27:57.8718388Z Job defined at: AndreiBakaushyn/Demo_repository/.github/workflows/4_github_action.yaml@refs/heads/main
2022-06-20T09:27:57.8718409Z Waiting for a runner to pick up this job...
2022-06-20T09:27:59.0533013Z Job is waiting for a hosted runner to come online.
2022-06-20T09:28:02.5800132Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-06-20T09:28:05.8688847Z Current runner version: '2.293.0'
2022-06-20T09:28:05.8714453Z ##[group]Operating System
2022-06-20T09:28:05.8715078Z Ubuntu
2022-06-20T09:28:05.8715362Z 20.04.4
2022-06-20T09:28:05.8715588Z LTS
2022-06-20T09:28:05.8715894Z ##[endgroup]
2022-06-20T09:28:05.8716221Z ##[group]Virtual Environment
2022-06-20T09:28:05.8716575Z Environment: ubuntu-20.04
2022-06-20T09:28:05.8716904Z Version: 20220614.0
2022-06-20T09:28:05.8717442Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220614.0/images/linux/Ubuntu2004-Readme.md
2022-06-20T09:28:05.8718059Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220614.0
2022-06-20T09:28:05.8718508Z ##[endgroup]
2022-06-20T09:28:05.8718888Z ##[group]Virtual Environment Provisioner
2022-06-20T09:28:05.8719247Z 1.0.0.0-main-20220531-1
2022-06-20T09:28:05.8719525Z ##[endgroup]
2022-06-20T09:28:05.8720262Z ##[group]GITHUB_TOKEN Permissions
2022-06-20T09:28:05.8720726Z Contents: read
2022-06-20T09:28:05.8721120Z Metadata: read
2022-06-20T09:28:05.8721570Z ##[endgroup]
2022-06-20T09:28:05.8724695Z Secret source: Actions
2022-06-20T09:28:05.8725211Z Prepare workflow directory
2022-06-20T09:28:05.9556832Z Prepare all required actions
2022-06-20T09:28:05.9724954Z Getting action download info
2022-06-20T09:28:06.2491288Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-06-20T09:28:07.5078820Z Download action repository 'tj-actions/changed-files@v13.1' (SHA:2c85495a7bb72f2734cb5181e29b2ee5e08e61f7)
2022-06-20T09:28:08.3632568Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-06-20T09:28:09.5008829Z Getting action download info
2022-06-20T09:28:09.7258242Z Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
2022-06-20T09:28:10.8356149Z ##[group]Run actions/checkout@v2
2022-06-20T09:28:10.8356482Z with:
2022-06-20T09:28:10.8356733Z   fetch-depth: 0
2022-06-20T09:28:10.8357076Z   repository: AndreiBakaushyn/Demo_repository
2022-06-20T09:28:10.8357640Z   token: ***
2022-06-20T09:28:10.8357875Z   ssh-strict: true
2022-06-20T09:28:10.8358148Z   persist-credentials: true
2022-06-20T09:28:10.8358425Z   clean: true
2022-06-20T09:28:10.8358636Z   lfs: false
2022-06-20T09:28:10.8358881Z   submodules: false
2022-06-20T09:28:10.8359149Z   set-safe-directory: true
2022-06-20T09:28:10.8359403Z ##[endgroup]
2022-06-20T09:28:11.1697302Z Syncing repository: AndreiBakaushyn/Demo_repository
2022-06-20T09:28:11.1700601Z ##[group]Getting Git version info
2022-06-20T09:28:11.1702461Z Working directory is '/home/runner/work/Demo_repository/Demo_repository'
2022-06-20T09:28:11.1703160Z [command]/usr/bin/git version
2022-06-20T09:28:11.1838365Z git version 2.36.1
2022-06-20T09:28:11.1839727Z ##[endgroup]
2022-06-20T09:28:11.1858286Z Temporarily overriding HOME='/home/runner/work/_temp/a2baadd6-3a66-40cb-853b-9949374074f3' before making global git config changes
2022-06-20T09:28:11.1858749Z Adding repository directory to the temporary git global config as a safe directory
2022-06-20T09:28:11.1859307Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Demo_repository/Demo_repository
2022-06-20T09:28:11.1893470Z Deleting the contents of '/home/runner/work/Demo_repository/Demo_repository'
2022-06-20T09:28:11.1906951Z ##[group]Initializing the repository
2022-06-20T09:28:11.1907379Z [command]/usr/bin/git init /home/runner/work/Demo_repository/Demo_repository
2022-06-20T09:28:11.1995551Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-06-20T09:28:11.1996388Z hint: is subject to change. To configure the initial branch name to use in all
2022-06-20T09:28:11.1997597Z hint: of your new repositories, which will suppress this warning, call:
2022-06-20T09:28:11.1998324Z hint: 
2022-06-20T09:28:11.1998820Z hint: 	git config --global init.defaultBranch <name>
2022-06-20T09:28:11.1999558Z hint: 
2022-06-20T09:28:11.2000435Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-06-20T09:28:11.2001321Z hint: 'development'. The just-created branch can be renamed via this command:
2022-06-20T09:28:11.2001762Z hint: 
2022-06-20T09:28:11.2002562Z hint: 	git branch -m <name>
2022-06-20T09:28:11.2010886Z Initialized empty Git repository in /home/runner/work/Demo_repository/Demo_repository/.git/
2022-06-20T09:28:11.2020720Z [command]/usr/bin/git remote add origin https://github.com/AndreiBakaushyn/Demo_repository
2022-06-20T09:28:11.2120834Z ##[endgroup]
2022-06-20T09:28:11.2121726Z ##[group]Disabling automatic garbage collection
2022-06-20T09:28:11.2126337Z [command]/usr/bin/git config --local gc.auto 0
2022-06-20T09:28:11.2163257Z ##[endgroup]
2022-06-20T09:28:11.2164146Z ##[group]Setting up auth
2022-06-20T09:28:11.2173120Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-06-20T09:28:11.2223711Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-06-20T09:28:11.2689839Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-06-20T09:28:11.2720640Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-06-20T09:28:11.3004097Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-06-20T09:28:11.3026204Z ##[endgroup]
2022-06-20T09:28:11.3026947Z ##[group]Fetching the repository
2022-06-20T09:28:11.3039361Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-06-20T09:28:12.0910738Z remote: Enumerating objects: 123, done.        
2022-06-20T09:28:12.0911080Z remote: Counting objects:   0% (1/123)        
2022-06-20T09:28:12.0911378Z remote: Counting objects:   1% (2/123)        
2022-06-20T09:28:12.0911637Z remote: Counting objects:   2% (3/123)        
2022-06-20T09:28:12.0911877Z remote: Counting objects:   3% (4/123)        
2022-06-20T09:28:12.0912127Z remote: Counting objects:   4% (5/123)        
2022-06-20T09:28:12.0912378Z remote: Counting objects:   5% (7/123)        
2022-06-20T09:28:12.0912616Z remote: Counting objects:   6% (8/123)        
2022-06-20T09:28:12.0912864Z remote: Counting objects:   7% (9/123)        
2022-06-20T09:28:12.0913553Z remote: Counting objects:   8% (10/123)        
2022-06-20T09:28:12.0913945Z remote: Counting objects:   9% (12/123)        
2022-06-20T09:28:12.0914202Z remote: Counting objects:  10% (13/123)        
2022-06-20T09:28:12.0914455Z remote: Counting objects:  11% (14/123)        
2022-06-20T09:28:12.0914719Z remote: Counting objects:  12% (15/123)        
2022-06-20T09:28:12.0915092Z remote: Counting objects:  13% (16/123)        
2022-06-20T09:28:12.0915317Z remote: Counting objects:  14% (18/123)        
2022-06-20T09:28:12.0915832Z remote: Counting objects:  15% (19/123)        
2022-06-20T09:28:12.0916040Z remote: Counting objects:  16% (20/123)        
2022-06-20T09:28:12.0917163Z remote: Counting objects:  17% (21/123)        
2022-06-20T09:28:12.0956356Z remote: Counting objects:  18% (23/123)        
2022-06-20T09:28:12.0962627Z remote: Counting objects:  19% (24/123)        
2022-06-20T09:28:12.0963268Z remote: Counting objects:  20% (25/123)        
2022-06-20T09:28:12.0967336Z remote: Counting objects:  21% (26/123)        
2022-06-20T09:28:12.0969721Z remote: Counting objects:  22% (28/123)        
2022-06-20T09:28:12.0971362Z remote: Counting objects:  23% (29/123)        
2022-06-20T09:28:12.0974301Z remote: Counting objects:  24% (30/123)        
2022-06-20T09:28:12.0977674Z remote: Counting objects:  25% (31/123)        
2022-06-20T09:28:12.0978240Z remote: Counting objects:  26% (32/123)        
2022-06-20T09:28:12.0978777Z remote: Counting objects:  27% (34/123)        
2022-06-20T09:28:12.0979736Z remote: Counting objects:  28% (35/123)        
2022-06-20T09:28:12.0980263Z remote: Counting objects:  29% (36/123)        
2022-06-20T09:28:12.0980794Z remote: Counting objects:  30% (37/123)        
2022-06-20T09:28:12.0981261Z remote: Counting objects:  31% (39/123)        
2022-06-20T09:28:12.0981484Z remote: Counting objects:  32% (40/123)        
2022-06-20T09:28:12.0981700Z remote: Counting objects:  33% (41/123)        
2022-06-20T09:28:12.0981917Z remote: Counting objects:  34% (42/123)        
2022-06-20T09:28:12.0982121Z remote: Counting objects:  35% (44/123)        
2022-06-20T09:28:12.0983609Z remote: Counting objects:  36% (45/123)        
2022-06-20T09:28:12.0984202Z remote: Counting objects:  37% (46/123)        
2022-06-20T09:28:12.0984749Z remote: Counting objects:  38% (47/123)        
2022-06-20T09:28:12.0985283Z remote: Counting objects:  39% (48/123)        
2022-06-20T09:28:12.0985822Z remote: Counting objects:  40% (50/123)        
2022-06-20T09:28:12.0986345Z remote: Counting objects:  41% (51/123)        
2022-06-20T09:28:12.0986872Z remote: Counting objects:  42% (52/123)        
2022-06-20T09:28:12.0987398Z remote: Counting objects:  43% (53/123)        
2022-06-20T09:28:12.0987922Z remote: Counting objects:  44% (55/123)        
2022-06-20T09:28:12.0992769Z remote: Counting objects:  45% (56/123)        
2022-06-20T09:28:12.0999910Z remote: Counting objects:  46% (57/123)        
2022-06-20T09:28:12.1004020Z remote: Counting objects:  47% (58/123)        
2022-06-20T09:28:12.1008115Z remote: Counting objects:  48% (60/123)        
2022-06-20T09:28:12.1012913Z remote: Counting objects:  49% (61/123)        
2022-06-20T09:28:12.1013469Z remote: Counting objects:  50% (62/123)        
2022-06-20T09:28:12.1029285Z remote: Counting objects:  51% (63/123)        
2022-06-20T09:28:12.1030202Z remote: Counting objects:  52% (64/123)        
2022-06-20T09:28:12.1030761Z remote: Counting objects:  53% (66/123)        
2022-06-20T09:28:12.1031286Z remote: Counting objects:  54% (67/123)        
2022-06-20T09:28:12.1031823Z remote: Counting objects:  55% (68/123)        
2022-06-20T09:28:12.1032353Z remote: Counting objects:  56% (69/123)        
2022-06-20T09:28:12.1032865Z remote: Counting objects:  57% (71/123)        
2022-06-20T09:28:12.1033386Z remote: Counting objects:  58% (72/123)        
2022-06-20T09:28:12.1033914Z remote: Counting objects:  59% (73/123)        
2022-06-20T09:28:12.1036808Z remote: Counting objects:  60% (74/123)        
2022-06-20T09:28:12.1041897Z remote: Counting objects:  61% (76/123)        
2022-06-20T09:28:12.1042949Z remote: Counting objects:  62% (77/123)        
2022-06-20T09:28:12.1043483Z remote: Counting objects:  63% (78/123)        
2022-06-20T09:28:12.1044032Z remote: Counting objects:  64% (79/123)        
2022-06-20T09:28:12.1044554Z remote: Counting objects:  65% (80/123)        
2022-06-20T09:28:12.1045075Z remote: Counting objects:  66% (82/123)        
2022-06-20T09:28:12.1045604Z remote: Counting objects:  67% (83/123)        
2022-06-20T09:28:12.1046118Z remote: Counting objects:  68% (84/123)        
2022-06-20T09:28:12.1046633Z remote: Counting objects:  69% (85/123)        
2022-06-20T09:28:12.1047385Z remote: Counting objects:  70% (87/123)        
2022-06-20T09:28:12.1047893Z remote: Counting objects:  71% (88/123)        
2022-06-20T09:28:12.1048422Z remote: Counting objects:  72% (89/123)        
2022-06-20T09:28:12.1048939Z remote: Counting objects:  73% (90/123)        
2022-06-20T09:28:12.1049455Z remote: Counting objects:  74% (92/123)        
2022-06-20T09:28:12.1049956Z remote: Counting objects:  75% (93/123)        
2022-06-20T09:28:12.1050473Z remote: Counting objects:  76% (94/123)        
2022-06-20T09:28:12.1502729Z remote: Counting objects:  77% (95/123)        
2022-06-20T09:28:12.1503178Z remote: Counting objects:  78% (96/123)        
2022-06-20T09:28:12.1503464Z remote: Counting objects:  79% (98/123)        
2022-06-20T09:28:12.1503754Z remote: Counting objects:  80% (99/123)        
2022-06-20T09:28:12.1504284Z remote: Counting objects:  81% (100/123)        
2022-06-20T09:28:12.1504569Z remote: Counting objects:  82% (101/123)        
2022-06-20T09:28:12.1504858Z remote: Counting objects:  83% (103/123)        
2022-06-20T09:28:12.1505150Z remote: Counting objects:  84% (104/123)        
2022-06-20T09:28:12.1505445Z remote: Counting objects:  85% (105/123)        
2022-06-20T09:28:12.1505720Z remote: Counting objects:  86% (106/123)        
2022-06-20T09:28:12.1506000Z remote: Counting objects:  87% (108/123)        
2022-06-20T09:28:12.1506284Z remote: Counting objects:  88% (109/123)        
2022-06-20T09:28:12.1506561Z remote: Counting objects:  89% (110/123)        
2022-06-20T09:28:12.1506842Z remote: Counting objects:  90% (111/123)        
2022-06-20T09:28:12.1507132Z remote: Counting objects:  91% (112/123)        
2022-06-20T09:28:12.1507399Z remote: Counting objects:  92% (114/123)        
2022-06-20T09:28:12.1507676Z remote: Counting objects:  93% (115/123)        
2022-06-20T09:28:12.1507961Z remote: Counting objects:  94% (116/123)        
2022-06-20T09:28:12.1508227Z remote: Counting objects:  95% (117/123)        
2022-06-20T09:28:12.1508508Z remote: Counting objects:  96% (119/123)        
2022-06-20T09:28:12.1508788Z remote: Counting objects:  97% (120/123)        
2022-06-20T09:28:12.1509066Z remote: Counting objects:  98% (121/123)        
2022-06-20T09:28:12.1509333Z remote: Counting objects:  99% (122/123)        
2022-06-20T09:28:12.1509617Z remote: Counting objects: 100% (123/123)        
2022-06-20T09:28:12.1509911Z remote: Counting objects: 100% (123/123), done.        
2022-06-20T09:28:12.1510216Z remote: Compressing objects:   1% (1/87)        
2022-06-20T09:28:12.1510630Z remote: Compressing objects:   2% (2/87)        
2022-06-20T09:28:12.1510926Z remote: Compressing objects:   3% (3/87)        
2022-06-20T09:28:12.1511310Z remote: Compressing objects:   4% (4/87)        
2022-06-20T09:28:12.1511603Z remote: Compressing objects:   5% (5/87)        
2022-06-20T09:28:12.1511898Z remote: Compressing objects:   6% (6/87)        
2022-06-20T09:28:12.1512174Z remote: Compressing objects:   8% (7/87)        
2022-06-20T09:28:12.1512464Z remote: Compressing objects:   9% (8/87)        
2022-06-20T09:28:12.1512752Z remote: Compressing objects:  10% (9/87)        
2022-06-20T09:28:12.1513048Z remote: Compressing objects:  11% (10/87)        
2022-06-20T09:28:12.1513335Z remote: Compressing objects:  12% (11/87)        
2022-06-20T09:28:12.1513635Z remote: Compressing objects:  13% (12/87)        
2022-06-20T09:28:12.1513933Z remote: Compressing objects:  14% (13/87)        
2022-06-20T09:28:12.1514312Z remote: Compressing objects:  16% (14/87)        
2022-06-20T09:28:12.1514569Z remote: Compressing objects:  17% (15/87)        
2022-06-20T09:28:12.1514831Z remote: Compressing objects:  18% (16/87)        
2022-06-20T09:28:12.1515075Z remote: Compressing objects:  19% (17/87)        
2022-06-20T09:28:12.1515333Z remote: Compressing objects:  20% (18/87)        
2022-06-20T09:28:12.1515594Z remote: Compressing objects:  21% (19/87)        
2022-06-20T09:28:12.1515835Z remote: Compressing objects:  22% (20/87)        
2022-06-20T09:28:12.1516100Z remote: Compressing objects:  24% (21/87)        
2022-06-20T09:28:12.1516358Z remote: Compressing objects:  25% (22/87)        
2022-06-20T09:28:12.1516795Z remote: Compressing objects:  26% (23/87)        
2022-06-20T09:28:12.1517074Z remote: Compressing objects:  27% (24/87)        
2022-06-20T09:28:12.1517369Z remote: Compressing objects:  28% (25/87)        
2022-06-20T09:28:12.1517660Z remote: Compressing objects:  29% (26/87)        
2022-06-20T09:28:12.1519335Z remote: Compressing objects:  31% (27/87)        
2022-06-20T09:28:12.1519965Z remote: Compressing objects:  32% (28/87)        
2022-06-20T09:28:12.1520533Z remote: Compressing objects:  33% (29/87)        
2022-06-20T09:28:12.1521100Z remote: Compressing objects:  34% (30/87)        
2022-06-20T09:28:12.1521673Z remote: Compressing objects:  35% (31/87)        
2022-06-20T09:28:12.1522617Z remote: Compressing objects:  36% (32/87)        
2022-06-20T09:28:12.1523171Z remote: Compressing objects:  37% (33/87)        
2022-06-20T09:28:12.1523702Z remote: Compressing objects:  39% (34/87)        
2022-06-20T09:28:12.1524252Z remote: Compressing objects:  40% (35/87)        
2022-06-20T09:28:12.1524800Z remote: Compressing objects:  41% (36/87)        
2022-06-20T09:28:12.1525325Z remote: Compressing objects:  42% (37/87)        
2022-06-20T09:28:12.1525866Z remote: Compressing objects:  43% (38/87)        
2022-06-20T09:28:12.1526404Z remote: Compressing objects:  44% (39/87)        
2022-06-20T09:28:12.1527273Z remote: Compressing objects:  45% (40/87)        
2022-06-20T09:28:12.1527824Z remote: Compressing objects:  47% (41/87)        
2022-06-20T09:28:12.1528373Z remote: Compressing objects:  48% (42/87)        
2022-06-20T09:28:12.1528893Z remote: Compressing objects:  49% (43/87)        
2022-06-20T09:28:12.1529446Z remote: Compressing objects:  50% (44/87)        
2022-06-20T09:28:12.1529991Z remote: Compressing objects:  51% (45/87)        
2022-06-20T09:28:12.1530528Z remote: Compressing objects:  52% (46/87)        
2022-06-20T09:28:12.1531062Z remote: Compressing objects:  54% (47/87)        
2022-06-20T09:28:12.1531599Z remote: Compressing objects:  55% (48/87)        
2022-06-20T09:28:12.1532134Z remote: Compressing objects:  56% (49/87)        
2022-06-20T09:28:12.1532660Z remote: Compressing objects:  57% (50/87)        
2022-06-20T09:28:12.1533197Z remote: Compressing objects:  58% (51/87)        
2022-06-20T09:28:12.1533739Z remote: Compressing objects:  59% (52/87)        
2022-06-20T09:28:12.1535093Z remote: Compressing objects:  60% (53/87)        
2022-06-20T09:28:12.1535659Z remote: Compressing objects:  62% (54/87)        
2022-06-20T09:28:12.1536438Z remote: Compressing objects:  63% (55/87)        
2022-06-20T09:28:12.1536998Z remote: Compressing objects:  64% (56/87)        
2022-06-20T09:28:12.1537533Z remote: Compressing objects:  65% (57/87)        
2022-06-20T09:28:12.1538081Z remote: Compressing objects:  66% (58/87)        
2022-06-20T09:28:12.1538638Z remote: Compressing objects:  67% (59/87)        
2022-06-20T09:28:12.1539169Z remote: Compressing objects:  68% (60/87)        
2022-06-20T09:28:12.1539714Z remote: Compressing objects:  70% (61/87)        
2022-06-20T09:28:12.1540259Z remote: Compressing objects:  71% (62/87)        
2022-06-20T09:28:12.1540783Z remote: Compressing objects:  72% (63/87)        
2022-06-20T09:28:12.1541317Z remote: Compressing objects:  73% (64/87)        
2022-06-20T09:28:12.1541859Z remote: Compressing objects:  74% (65/87)        
2022-06-20T09:28:12.1542384Z remote: Compressing objects:  75% (66/87)        
2022-06-20T09:28:12.1542930Z remote: Compressing objects:  77% (67/87)        
2022-06-20T09:28:12.1543480Z remote: Compressing objects:  78% (68/87)        
2022-06-20T09:28:12.1544018Z remote: Compressing objects:  79% (69/87)        
2022-06-20T09:28:12.1544545Z remote: Compressing objects:  80% (70/87)        
2022-06-20T09:28:12.1545096Z remote: Compressing objects:  81% (71/87)        
2022-06-20T09:28:12.1545633Z remote: Compressing objects:  82% (72/87)        
2022-06-20T09:28:12.1546184Z remote: Compressing objects:  83% (73/87)        
2022-06-20T09:28:12.1546723Z remote: Compressing objects:  85% (74/87)        
2022-06-20T09:28:12.1547262Z remote: Compressing objects:  86% (75/87)        
2022-06-20T09:28:12.1547783Z remote: Compressing objects:  87% (76/87)        
2022-06-20T09:28:12.1548318Z remote: Compressing objects:  88% (77/87)        
2022-06-20T09:28:12.1548854Z remote: Compressing objects:  89% (78/87)        
2022-06-20T09:28:12.1549393Z remote: Compressing objects:  90% (79/87)        
2022-06-20T09:28:12.1549922Z remote: Compressing objects:  91% (80/87)        
2022-06-20T09:28:12.1550463Z remote: Compressing objects:  93% (81/87)        
2022-06-20T09:28:12.1551000Z remote: Compressing objects:  94% (82/87)        
2022-06-20T09:28:12.1551521Z remote: Compressing objects:  95% (83/87)        
2022-06-20T09:28:12.1552179Z remote: Compressing objects:  96% (84/87)        
2022-06-20T09:28:12.1552730Z remote: Compressing objects:  97% (85/87)        
2022-06-20T09:28:12.1553262Z remote: Compressing objects:  98% (86/87)        
2022-06-20T09:28:12.1553807Z remote: Compressing objects: 100% (87/87)        
2022-06-20T09:28:12.1554383Z remote: Compressing objects: 100% (87/87), done.        
2022-06-20T09:28:12.1657629Z remote: Total 123 (delta 38), reused 81 (delta 16), pack-reused 0        
2022-06-20T09:28:12.1700439Z Receiving objects:   0% (1/123)
2022-06-20T09:28:12.1700748Z Receiving objects:   1% (2/123)
2022-06-20T09:28:12.1701014Z Receiving objects:   2% (3/123)
2022-06-20T09:28:12.1701272Z Receiving objects:   3% (4/123)
2022-06-20T09:28:12.1701514Z Receiving objects:   4% (5/123)
2022-06-20T09:28:12.1701776Z Receiving objects:   5% (7/123)
2022-06-20T09:28:12.1702032Z Receiving objects:   6% (8/123)
2022-06-20T09:28:12.1702271Z Receiving objects:   7% (9/123)
2022-06-20T09:28:12.1702531Z Receiving objects:   8% (10/123)
2022-06-20T09:28:12.1702793Z Receiving objects:   9% (12/123)
2022-06-20T09:28:12.1703034Z Receiving objects:  10% (13/123)
2022-06-20T09:28:12.1703285Z Receiving objects:  11% (14/123)
2022-06-20T09:28:12.1703543Z Receiving objects:  12% (15/123)
2022-06-20T09:28:12.1703784Z Receiving objects:  13% (16/123)
2022-06-20T09:28:12.1704035Z Receiving objects:  14% (18/123)
2022-06-20T09:28:12.1705205Z Receiving objects:  15% (19/123)
2022-06-20T09:28:12.1705481Z Receiving objects:  16% (20/123)
2022-06-20T09:28:12.1705732Z Receiving objects:  17% (21/123)
2022-06-20T09:28:12.1705988Z Receiving objects:  18% (23/123)
2022-06-20T09:28:12.1706225Z Receiving objects:  19% (24/123)
2022-06-20T09:28:12.1706481Z Receiving objects:  20% (25/123)
2022-06-20T09:28:12.1706734Z Receiving objects:  21% (26/123)
2022-06-20T09:28:12.1708172Z Receiving objects:  22% (28/123)
2022-06-20T09:28:12.1708428Z Receiving objects:  23% (29/123)
2022-06-20T09:28:12.1708678Z Receiving objects:  24% (30/123)
2022-06-20T09:28:12.1708937Z Receiving objects:  25% (31/123)
2022-06-20T09:28:12.1709174Z Receiving objects:  26% (32/123)
2022-06-20T09:28:12.1709425Z Receiving objects:  27% (34/123)
2022-06-20T09:28:12.1709677Z Receiving objects:  28% (35/123)
2022-06-20T09:28:12.1709915Z Receiving objects:  29% (36/123)
2022-06-20T09:28:12.1710165Z Receiving objects:  30% (37/123)
2022-06-20T09:28:12.1710416Z Receiving objects:  31% (39/123)
2022-06-20T09:28:12.1710653Z Receiving objects:  32% (40/123)
2022-06-20T09:28:12.1710905Z Receiving objects:  33% (41/123)
2022-06-20T09:28:12.1711156Z Receiving objects:  34% (42/123)
2022-06-20T09:28:12.1711394Z Receiving objects:  35% (44/123)
2022-06-20T09:28:12.1711639Z Receiving objects:  36% (45/123)
2022-06-20T09:28:12.1711889Z Receiving objects:  37% (46/123)
2022-06-20T09:28:12.1712129Z Receiving objects:  38% (47/123)
2022-06-20T09:28:12.1712378Z Receiving objects:  39% (48/123)
2022-06-20T09:28:12.1712628Z Receiving objects:  40% (50/123)
2022-06-20T09:28:12.1712863Z Receiving objects:  41% (51/123)
2022-06-20T09:28:12.1713122Z Receiving objects:  42% (52/123)
2022-06-20T09:28:12.1713370Z Receiving objects:  43% (53/123)
2022-06-20T09:28:12.1713791Z Receiving objects:  44% (55/123)
2022-06-20T09:28:12.1714052Z Receiving objects:  45% (56/123)
2022-06-20T09:28:12.1714319Z Receiving objects:  46% (57/123)
2022-06-20T09:28:12.1714686Z Receiving objects:  47% (58/123)
2022-06-20T09:28:12.1714923Z Receiving objects:  48% (60/123)
2022-06-20T09:28:12.1715173Z Receiving objects:  49% (61/123)
2022-06-20T09:28:12.1715421Z Receiving objects:  50% (62/123)
2022-06-20T09:28:12.1715657Z Receiving objects:  51% (63/123)
2022-06-20T09:28:12.1715905Z Receiving objects:  52% (64/123)
2022-06-20T09:28:12.1716154Z Receiving objects:  53% (66/123)
2022-06-20T09:28:12.1716393Z Receiving objects:  54% (67/123)
2022-06-20T09:28:12.1716644Z Receiving objects:  55% (68/123)
2022-06-20T09:28:12.1716894Z Receiving objects:  56% (69/123)
2022-06-20T09:28:12.1717128Z Receiving objects:  57% (71/123)
2022-06-20T09:28:12.1737269Z Receiving objects:  58% (72/123)
2022-06-20T09:28:12.1737626Z Receiving objects:  59% (73/123)
2022-06-20T09:28:12.1737880Z Receiving objects:  60% (74/123)
2022-06-20T09:28:12.1738148Z Receiving objects:  61% (76/123)
2022-06-20T09:28:12.1738423Z Receiving objects:  62% (77/123)
2022-06-20T09:28:12.1738676Z Receiving objects:  63% (78/123)
2022-06-20T09:28:12.1738951Z Receiving objects:  64% (79/123)
2022-06-20T09:28:12.1739219Z Receiving objects:  65% (80/123)
2022-06-20T09:28:12.1739681Z Receiving objects:  66% (82/123)
2022-06-20T09:28:12.1740042Z Receiving objects:  67% (83/123)
2022-06-20T09:28:12.1740395Z Receiving objects:  68% (84/123)
2022-06-20T09:28:12.1740718Z Receiving objects:  69% (85/123)
2022-06-20T09:28:12.1741073Z Receiving objects:  70% (87/123)
2022-06-20T09:28:12.1741471Z Receiving objects:  71% (88/123)
2022-06-20T09:28:12.1741827Z Receiving objects:  72% (89/123)
2022-06-20T09:28:12.1742127Z Receiving objects:  73% (90/123)
2022-06-20T09:28:12.1742489Z Receiving objects:  74% (92/123)
2022-06-20T09:28:12.1742895Z Receiving objects:  75% (93/123)
2022-06-20T09:28:12.1743194Z Receiving objects:  76% (94/123)
2022-06-20T09:28:12.1743543Z Receiving objects:  77% (95/123)
2022-06-20T09:28:12.1743911Z Receiving objects:  78% (96/123)
2022-06-20T09:28:12.1744206Z Receiving objects:  79% (98/123)
2022-06-20T09:28:12.1744587Z Receiving objects:  80% (99/123)
2022-06-20T09:28:12.1744945Z Receiving objects:  81% (100/123)
2022-06-20T09:28:12.1745255Z Receiving objects:  82% (101/123)
2022-06-20T09:28:12.1745630Z Receiving objects:  83% (103/123)
2022-06-20T09:28:12.1745989Z Receiving objects:  84% (104/123)
2022-06-20T09:28:12.1746318Z Receiving objects:  85% (105/123)
2022-06-20T09:28:12.1746670Z Receiving objects:  86% (106/123)
2022-06-20T09:28:12.1747033Z Receiving objects:  87% (108/123)
2022-06-20T09:28:12.1747472Z Receiving objects:  88% (109/123)
2022-06-20T09:28:12.1747839Z Receiving objects:  89% (110/123)
2022-06-20T09:28:12.1748232Z Receiving objects:  90% (111/123)
2022-06-20T09:28:12.1748548Z Receiving objects:  91% (112/123)
2022-06-20T09:28:12.1748912Z Receiving objects:  92% (114/123)
2022-06-20T09:28:12.1749262Z Receiving objects:  93% (115/123)
2022-06-20T09:28:12.1749641Z Receiving objects:  94% (116/123)
2022-06-20T09:28:12.1750265Z Receiving objects:  95% (117/123)
2022-06-20T09:28:12.1750795Z Receiving objects:  96% (119/123)
2022-06-20T09:28:12.1751127Z Receiving objects:  97% (120/123)
2022-06-20T09:28:12.1751408Z Receiving objects:  98% (121/123)
2022-06-20T09:28:12.1751782Z Receiving objects:  99% (122/123)
2022-06-20T09:28:12.1752118Z Receiving objects: 100% (123/123)
2022-06-20T09:28:12.1752440Z Receiving objects: 100% (123/123), 16.89 KiB | 8.45 MiB/s, done.
2022-06-20T09:28:12.1752809Z Resolving deltas:   0% (0/38)
2022-06-20T09:28:12.1753143Z Resolving deltas:   2% (1/38)
2022-06-20T09:28:12.1753457Z Resolving deltas:   5% (2/38)
2022-06-20T09:28:12.1753798Z Resolving deltas:   7% (3/38)
2022-06-20T09:28:12.1754121Z Resolving deltas:  10% (4/38)
2022-06-20T09:28:12.1754395Z Resolving deltas:  13% (5/38)
2022-06-20T09:28:12.1754711Z Resolving deltas:  15% (6/38)
2022-06-20T09:28:12.1755484Z Resolving deltas:  18% (7/38)
2022-06-20T09:28:12.1756086Z Resolving deltas:  21% (8/38)
2022-06-20T09:28:12.1756413Z Resolving deltas:  23% (9/38)
2022-06-20T09:28:12.1756737Z Resolving deltas:  26% (10/38)
2022-06-20T09:28:12.1757132Z Resolving deltas:  28% (11/38)
2022-06-20T09:28:12.1757679Z Resolving deltas:  31% (12/38)
2022-06-20T09:28:12.1759066Z Resolving deltas:  34% (13/38)
2022-06-20T09:28:12.1759390Z Resolving deltas:  36% (14/38)
2022-06-20T09:28:12.1759663Z Resolving deltas:  39% (15/38)
2022-06-20T09:28:12.1760056Z Resolving deltas:  42% (16/38)
2022-06-20T09:28:12.1760387Z Resolving deltas:  44% (17/38)
2022-06-20T09:28:12.1760659Z Resolving deltas:  47% (18/38)
2022-06-20T09:28:12.1760986Z Resolving deltas:  50% (19/38)
2022-06-20T09:28:12.1761318Z Resolving deltas:  52% (20/38)
2022-06-20T09:28:12.1761615Z Resolving deltas:  55% (21/38)
2022-06-20T09:28:12.1762491Z Resolving deltas:  57% (22/38)
2022-06-20T09:28:12.1762824Z Resolving deltas:  60% (23/38)
2022-06-20T09:28:12.1763096Z Resolving deltas:  63% (24/38)
2022-06-20T09:28:12.1763435Z Resolving deltas:  65% (25/38)
2022-06-20T09:28:12.1763808Z Resolving deltas:  68% (26/38)
2022-06-20T09:28:12.1764075Z Resolving deltas:  71% (27/38)
2022-06-20T09:28:12.1764385Z Resolving deltas:  73% (28/38)
2022-06-20T09:28:12.1764822Z Resolving deltas:  76% (29/38)
2022-06-20T09:28:12.1765095Z Resolving deltas:  78% (30/38)
2022-06-20T09:28:12.1765469Z Resolving deltas:  81% (31/38)
2022-06-20T09:28:12.1765782Z Resolving deltas:  84% (32/38)
2022-06-20T09:28:12.1766107Z Resolving deltas:  86% (33/38)
2022-06-20T09:28:12.1766378Z Resolving deltas:  89% (34/38)
2022-06-20T09:28:12.1766722Z Resolving deltas:  92% (35/38)
2022-06-20T09:28:12.1767273Z Resolving deltas:  94% (36/38)
2022-06-20T09:28:12.1767541Z Resolving deltas:  97% (37/38)
2022-06-20T09:28:12.1767867Z Resolving deltas: 100% (38/38)
2022-06-20T09:28:12.1768198Z Resolving deltas: 100% (38/38), done.
2022-06-20T09:28:12.1834878Z From https://github.com/AndreiBakaushyn/Demo_repository
2022-06-20T09:28:12.1835845Z  * [new branch]      main       -> origin/main
2022-06-20T09:28:12.1879062Z [command]/usr/bin/git branch --list --remote origin/main
2022-06-20T09:28:12.1898245Z   origin/main
2022-06-20T09:28:12.1906881Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-06-20T09:28:12.1936182Z d31404031a8182a9a2003b2fec7171344d7dbf8a
2022-06-20T09:28:12.1941499Z ##[endgroup]
2022-06-20T09:28:12.1942503Z ##[group]Determining the checkout info
2022-06-20T09:28:12.1943487Z ##[endgroup]
2022-06-20T09:28:12.1944414Z ##[group]Checking out the ref
2022-06-20T09:28:12.1947749Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-06-20T09:28:12.1996873Z Switched to a new branch 'main'
2022-06-20T09:28:12.1998425Z branch 'main' set up to track 'origin/main'.
2022-06-20T09:28:12.2004343Z ##[endgroup]
2022-06-20T09:28:12.2047978Z [command]/usr/bin/git log -1 --format='%H'
2022-06-20T09:28:12.2078072Z 'd31404031a8182a9a2003b2fec7171344d7dbf8a'
2022-06-20T09:28:12.2416592Z ##[group]Run tj-actions/changed-files@v13.1
2022-06-20T09:28:12.2416986Z with:
2022-06-20T09:28:12.2417534Z   token: ***
2022-06-20T09:28:12.2417863Z   separator:  
2022-06-20T09:28:12.2418232Z   sha: d31404031a8182a9a2003b2fec7171344d7dbf8a
2022-06-20T09:28:12.2418609Z   since_last_remote_commit: false
2022-06-20T09:28:12.2418944Z ##[endgroup]
2022-06-20T09:28:12.2827067Z ##[group]Run # "Set base sha..."
2022-06-20T09:28:12.2827344Z [36;1m# "Set base sha..."[0m
2022-06-20T09:28:12.2827540Z [36;1mif [[ -n "" ]]; then[0m
2022-06-20T09:28:12.2827742Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-06-20T09:28:12.2827968Z [36;1melif [[ "false" == "true" ]]; then[0m
2022-06-20T09:28:12.2828235Z [36;1m  if [[ "f7cbeb4c6c0e4ae42f268e088b6eb2f089e1aa25" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-06-20T09:28:12.2828564Z [36;1m    echo "::set-output name=base_sha::f7cbeb4c6c0e4ae42f268e088b6eb2f089e1aa25"[0m
2022-06-20T09:28:12.2828844Z [36;1m  else[0m
2022-06-20T09:28:12.2829082Z [36;1m    echo "::set-output name=base_sha::d31404031a8182a9a2003b2fec7171344d7dbf8a"[0m
2022-06-20T09:28:12.2829301Z [36;1m  fi[0m
2022-06-20T09:28:12.2829461Z [36;1mfi[0m
2022-06-20T09:28:12.2894087Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-20T09:28:12.2894429Z ##[endgroup]
2022-06-20T09:28:12.3105662Z ##[group]Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
2022-06-20T09:28:12.3106168Z [36;1mbash $GITHUB_ACTION_PATH/sourcefiles.sh[0m
2022-06-20T09:28:12.3152125Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-20T09:28:12.3152361Z env:
2022-06-20T09:28:12.3152506Z   INPUT_FILES: 
2022-06-20T09:28:12.3152690Z   INPUT_FILES_FROM_SOURCE_FILE: 
2022-06-20T09:28:12.3152876Z ##[endgroup]
2022-06-20T09:28:12.3241348Z ##[group]changed-files-from-source-file
2022-06-20T09:28:12.3381286Z Input files: 
2022-06-20T09:28:12.3409394Z ##[endgroup]
2022-06-20T09:28:12.3445910Z ##[group]Run tj-actions/glob@v3.3
2022-06-20T09:28:12.3446119Z with:
2022-06-20T09:28:12.3446317Z   files-separator:  
2022-06-20T09:28:12.3446524Z   separator: |
2022-06-20T09:28:12.3446732Z   excluded-files-separator: 

2022-06-20T09:28:12.3448393Z   files-from-source-file-separator: 

2022-06-20T09:28:12.3448718Z   excluded-files-from-source-file-separator: 

2022-06-20T09:28:12.3449002Z   follow-symbolic-links: true
2022-06-20T09:28:12.3449244Z   strip-top-level-dir: true
2022-06-20T09:28:12.3449606Z   include-deleted-files: false
2022-06-20T09:28:12.3449812Z   sha: d31404031a8182a9a2003b2fec7171344d7dbf8a
2022-06-20T09:28:12.3450079Z   working-directory: /home/runner/work/Demo_repository/Demo_repository
2022-06-20T09:28:12.3450318Z ##[endgroup]
2022-06-20T09:28:12.4110718Z 
2022-06-20T09:28:12.4166557Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-06-20T09:28:12.4167296Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-06-20T09:28:12.4218669Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-06-20T09:28:12.4218896Z env:
2022-06-20T09:28:12.4219088Z   GITHUB_SERVER_URL: https://github.com
2022-06-20T09:28:12.4219341Z   GITHUB_REPOSITORY: AndreiBakaushyn/Demo_repository
2022-06-20T09:28:12.4219565Z   GITHUB_BASE_REF: 
2022-06-20T09:28:12.4219761Z   INPUT_SHA: d31404031a8182a9a2003b2fec7171344d7dbf8a
2022-06-20T09:28:12.4219964Z   INPUT_BASE_SHA: 
2022-06-20T09:28:12.4220379Z   INPUT_TOKEN: ***
2022-06-20T09:28:12.4220539Z   INPUT_FILES: 
2022-06-20T09:28:12.4220714Z   INPUT_SEPARATOR:  
2022-06-20T09:28:12.4220889Z   INPUT_PATH: 
2022-06-20T09:28:12.4221044Z ##[endgroup]
2022-06-20T09:28:12.4318575Z ##[group]changed-files
2022-06-20T09:28:12.4319954Z Resolving repository path...
2022-06-20T09:28:12.4348397Z Setting up 'temp_changed_files' remote...
2022-06-20T09:28:12.4386825Z No 'temp_changed_files' remote found
2022-06-20T09:28:12.4387378Z Creating 'temp_changed_files' remote...
2022-06-20T09:28:12.4422763Z Getting HEAD info...
2022-06-20T09:28:12.4497088Z Retrieving changes between f7cbeb4c6c0e4ae42f268e088b6eb2f089e1aa25 (main) → d31404031a8182a9a2003b2fec7171344d7dbf8a (main)
2022-06-20T09:28:12.4497664Z Getting diff...
2022-06-20T09:28:12.4919718Z Added files: 
2022-06-20T09:28:12.4920403Z Copied files: 
2022-06-20T09:28:12.4921149Z Deleted files: 
2022-06-20T09:28:12.4921631Z Modified files: testfile.txt
2022-06-20T09:28:12.4922371Z Renamed files: 
2022-06-20T09:28:12.4922785Z Type Changed files: 
2022-06-20T09:28:12.4923431Z Unmerged files: 
2022-06-20T09:28:12.4923843Z Unknown files: 
2022-06-20T09:28:12.4924606Z All changed and modified files: testfile.txt
2022-06-20T09:28:12.4925057Z All changed files: testfile.txt
2022-06-20T09:28:12.4925687Z All modified files: testfile.txt
2022-06-20T09:28:12.4941742Z ##[endgroup]
2022-06-20T09:28:12.5061318Z ##[group]Run for file in testfile.txt; do
2022-06-20T09:28:12.5061651Z [36;1mfor file in testfile.txt; do[0m
2022-06-20T09:28:12.5061956Z [36;1m  echo "$file was changed" >> files.log 2>&1[0m
2022-06-20T09:28:12.5062344Z [36;1m  echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1 [0m
2022-06-20T09:28:12.5062643Z [36;1mdone[0m
2022-06-20T09:28:12.5121771Z shell: /usr/bin/bash -e {0}
2022-06-20T09:28:12.5122052Z ##[endgroup]
2022-06-20T09:28:12.5271263Z ##[group]Run actions/upload-artifact@v2
2022-06-20T09:28:12.5271517Z with:
2022-06-20T09:28:12.5271726Z   path: files.log
2022-06-20T09:28:12.5271947Z   name: artifact
2022-06-20T09:28:12.5272171Z   if-no-files-found: warn
2022-06-20T09:28:12.5272408Z ##[endgroup]
2022-06-20T09:28:12.5892416Z With the provided path, there will be 1 file uploaded
2022-06-20T09:28:12.5895385Z Starting artifact upload
2022-06-20T09:28:12.5896666Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-06-20T09:28:12.5897996Z Artifact name is valid!
2022-06-20T09:28:12.8609377Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-06-20T09:28:13.0299774Z Total size of all the files uploaded is 47 bytes
2022-06-20T09:28:13.0300286Z File upload process has finished. Finalizing the artifact upload
2022-06-20T09:28:13.1220719Z Artifact has been finalized. All files have been successfully uploaded!
2022-06-20T09:28:13.1221270Z 
2022-06-20T09:28:13.1224538Z The raw size of all the files that were specified for upload is 47 bytes
2022-06-20T09:28:13.1225224Z The size of all the files that were uploaded is 47 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-06-20T09:28:13.1228365Z 
2022-06-20T09:28:13.1229314Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-06-20T09:28:13.1231397Z 
2022-06-20T09:28:13.1231705Z Artifact artifact has been successfully uploaded!
2022-06-20T09:28:13.1296509Z Post job cleanup.
2022-06-20T09:28:13.2519036Z [command]/usr/bin/git version
2022-06-20T09:28:13.2566779Z git version 2.36.1
2022-06-20T09:28:13.2614934Z Temporarily overriding HOME='/home/runner/work/_temp/bd2040dc-4826-4298-997f-6b04b819c42a' before making global git config changes
2022-06-20T09:28:13.2617325Z Adding repository directory to the temporary git global config as a safe directory
2022-06-20T09:28:13.2624133Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Demo_repository/Demo_repository
2022-06-20T09:28:13.2663817Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-06-20T09:28:13.2698772Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-06-20T09:28:13.2935622Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-06-20T09:28:13.2995064Z http.https://github.com/.extraheader
2022-06-20T09:28:13.3005278Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-06-20T09:28:13.3042238Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-06-20T09:28:13.3513764Z Cleaning up orphan processes


```
