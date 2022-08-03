## Links

[Testing Repository](https://github.com/EvgeniErmakov/yes-i-still-love-you)

[Action file](tabs-finder.yml)

## Log of the pipeline

```bash
2022-08-03T17:56:04.6584948Z Requested labels: ubuntu-latest
2022-08-03T17:56:04.6585004Z Job defined at: EvgeniErmakov/yes-i-still-love-you/.github/workflows/tabs-finder.yml@refs/pull/23/merge
2022-08-03T17:56:04.6585029Z Waiting for a runner to pick up this job...
2022-08-03T17:56:04.9563470Z Job is waiting for a hosted runner to come online.
2022-08-03T17:56:08.8059818Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-08-03T17:56:12.0029229Z Current runner version: '2.294.0'
2022-08-03T17:56:12.0053949Z ##[group]Operating System
2022-08-03T17:56:12.0054411Z Ubuntu
2022-08-03T17:56:12.0054679Z 20.04.4
2022-08-03T17:56:12.0055019Z LTS
2022-08-03T17:56:12.0055268Z ##[endgroup]
2022-08-03T17:56:12.0055581Z ##[group]Virtual Environment
2022-08-03T17:56:12.0055945Z Environment: ubuntu-20.04
2022-08-03T17:56:12.0056219Z Version: 20220729.1
2022-08-03T17:56:12.0056759Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
2022-08-03T17:56:12.0057398Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
2022-08-03T17:56:12.0057787Z ##[endgroup]
2022-08-03T17:56:12.0058126Z ##[group]Virtual Environment Provisioner
2022-08-03T17:56:12.0058495Z 1.0.0.0-main-20220725-1
2022-08-03T17:56:12.0058791Z ##[endgroup]
2022-08-03T17:56:12.0059684Z ##[group]GITHUB_TOKEN Permissions
2022-08-03T17:56:12.0060251Z Actions: write
2022-08-03T17:56:12.0060725Z Checks: write
2022-08-03T17:56:12.0061030Z Contents: write
2022-08-03T17:56:12.0061329Z Deployments: write
2022-08-03T17:56:12.0061639Z Discussions: write
2022-08-03T17:56:12.0061903Z Issues: write
2022-08-03T17:56:12.0062213Z Metadata: read
2022-08-03T17:56:12.0062505Z Packages: write
2022-08-03T17:56:12.0062752Z Pages: write
2022-08-03T17:56:12.0063062Z PullRequests: write
2022-08-03T17:56:12.0063424Z RepositoryProjects: write
2022-08-03T17:56:12.0063714Z SecurityEvents: write
2022-08-03T17:56:12.0064024Z Statuses: write
2022-08-03T17:56:12.0064317Z ##[endgroup]
2022-08-03T17:56:12.0067791Z Secret source: Actions
2022-08-03T17:56:12.0068377Z Prepare workflow directory
2022-08-03T17:56:12.0926078Z Prepare all required actions
2022-08-03T17:56:12.1110851Z Getting action download info
2022-08-03T17:56:12.3037003Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-08-03T17:56:12.6169402Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2022-08-03T17:56:12.7995304Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-08-03T17:56:13.2343169Z ##[group]Run actions/checkout@v3
2022-08-03T17:56:13.2343450Z with:
2022-08-03T17:56:13.2343643Z   fetch-depth: 0
2022-08-03T17:56:13.2343893Z   repository: EvgeniErmakov/yes-i-still-love-you
2022-08-03T17:56:13.2344371Z   token: ***
2022-08-03T17:56:13.2344566Z   ssh-strict: true
2022-08-03T17:56:13.2344788Z   persist-credentials: true
2022-08-03T17:56:13.2344994Z   clean: true
2022-08-03T17:56:13.2345186Z   lfs: false
2022-08-03T17:56:13.2345377Z   submodules: false
2022-08-03T17:56:13.2345576Z   set-safe-directory: true
2022-08-03T17:56:13.2345787Z ##[endgroup]
2022-08-03T17:56:13.4692481Z Syncing repository: EvgeniErmakov/yes-i-still-love-you
2022-08-03T17:56:13.4694617Z ##[group]Getting Git version info
2022-08-03T17:56:13.4695371Z Working directory is '/home/runner/work/yes-i-still-love-you/yes-i-still-love-you'
2022-08-03T17:56:13.4696645Z [command]/usr/bin/git version
2022-08-03T17:56:13.4772913Z git version 2.37.1
2022-08-03T17:56:13.4798109Z ##[endgroup]
2022-08-03T17:56:13.4816113Z Temporarily overriding HOME='/home/runner/work/_temp/00d00a83-b651-4ed8-a98b-53e9d2509401' before making global git config changes
2022-08-03T17:56:13.4816599Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T17:56:13.4820643Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/yes-i-still-love-you/yes-i-still-love-you
2022-08-03T17:56:13.4863100Z Deleting the contents of '/home/runner/work/yes-i-still-love-you/yes-i-still-love-you'
2022-08-03T17:56:13.4867101Z ##[group]Initializing the repository
2022-08-03T17:56:13.4870615Z [command]/usr/bin/git init /home/runner/work/yes-i-still-love-you/yes-i-still-love-you
2022-08-03T17:56:13.4925371Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-08-03T17:56:13.4926074Z hint: is subject to change. To configure the initial branch name to use in all
2022-08-03T17:56:13.4927121Z hint: of your new repositories, which will suppress this warning, call:
2022-08-03T17:56:13.4927422Z hint: 
2022-08-03T17:56:13.4927832Z hint: 	git config --global init.defaultBranch <name>
2022-08-03T17:56:13.4928209Z hint: 
2022-08-03T17:56:13.4928588Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-08-03T17:56:13.4929027Z hint: 'development'. The just-created branch can be renamed via this command:
2022-08-03T17:56:13.4929388Z hint: 
2022-08-03T17:56:13.4929655Z hint: 	git branch -m <name>
2022-08-03T17:56:13.4937885Z Initialized empty Git repository in /home/runner/work/yes-i-still-love-you/yes-i-still-love-you/.git/
2022-08-03T17:56:13.4948399Z [command]/usr/bin/git remote add origin https://github.com/EvgeniErmakov/yes-i-still-love-you
2022-08-03T17:56:13.4988278Z ##[endgroup]
2022-08-03T17:56:13.4988835Z ##[group]Disabling automatic garbage collection
2022-08-03T17:56:13.4994486Z [command]/usr/bin/git config --local gc.auto 0
2022-08-03T17:56:13.5025394Z ##[endgroup]
2022-08-03T17:56:13.5025926Z ##[group]Setting up auth
2022-08-03T17:56:13.5035437Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T17:56:13.5069142Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T17:56:13.5387240Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T17:56:13.5405847Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T17:56:13.5644263Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-08-03T17:56:13.5686203Z ##[endgroup]
2022-08-03T17:56:13.5686774Z ##[group]Fetching the repository
2022-08-03T17:56:13.5698857Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +42e90733e468247d5a3ce4da9574ee89b1f45546:refs/remotes/pull/23/merge
2022-08-03T17:56:13.8356013Z remote: Enumerating objects: 143, done.        
2022-08-03T17:56:13.8356832Z remote: Counting objects:   2% (1/50)        
2022-08-03T17:56:13.8357667Z remote: Counting objects:   4% (2/50)        
2022-08-03T17:56:13.8358115Z remote: Counting objects:   6% (3/50)        
2022-08-03T17:56:13.8358732Z remote: Counting objects:   8% (4/50)        
2022-08-03T17:56:13.8359133Z remote: Counting objects:  10% (5/50)        
2022-08-03T17:56:13.8359759Z remote: Counting objects:  12% (6/50)        
2022-08-03T17:56:13.8360166Z remote: Counting objects:  14% (7/50)        
2022-08-03T17:56:13.8360762Z remote: Counting objects:  16% (8/50)        
2022-08-03T17:56:13.8361172Z remote: Counting objects:  18% (9/50)        
2022-08-03T17:56:13.8362214Z remote: Counting objects:  20% (10/50)        
2022-08-03T17:56:13.8362636Z remote: Counting objects:  22% (11/50)        
2022-08-03T17:56:13.8363187Z remote: Counting objects:  24% (12/50)        
2022-08-03T17:56:13.8364504Z remote: Counting objects:  26% (13/50)        
2022-08-03T17:56:13.8364932Z remote: Counting objects:  28% (14/50)        
2022-08-03T17:56:13.8365532Z remote: Counting objects:  30% (15/50)        
2022-08-03T17:56:13.8366267Z remote: Counting objects:  32% (16/50)        
2022-08-03T17:56:13.8366948Z remote: Counting objects:  34% (17/50)        
2022-08-03T17:56:13.8367538Z remote: Counting objects:  36% (18/50)        
2022-08-03T17:56:13.8368174Z remote: Counting objects:  38% (19/50)        
2022-08-03T17:56:13.8369511Z remote: Counting objects:  40% (20/50)        
2022-08-03T17:56:13.8371791Z remote: Counting objects:  42% (21/50)        
2022-08-03T17:56:13.8372501Z remote: Counting objects:  44% (22/50)        
2022-08-03T17:56:13.8373159Z remote: Counting objects:  46% (23/50)        
2022-08-03T17:56:13.8373821Z remote: Counting objects:  48% (24/50)        
2022-08-03T17:56:13.8374246Z remote: Counting objects:  50% (25/50)        
2022-08-03T17:56:13.8375125Z remote: Counting objects:  52% (26/50)        
2022-08-03T17:56:13.8375539Z remote: Counting objects:  54% (27/50)        
2022-08-03T17:56:13.8376146Z remote: Counting objects:  56% (28/50)        
2022-08-03T17:56:13.8376645Z remote: Counting objects:  58% (29/50)        
2022-08-03T17:56:13.8377260Z remote: Counting objects:  60% (30/50)        
2022-08-03T17:56:13.8377673Z remote: Counting objects:  62% (31/50)        
2022-08-03T17:56:13.8378300Z remote: Counting objects:  64% (32/50)        
2022-08-03T17:56:13.8378710Z remote: Counting objects:  66% (33/50)        
2022-08-03T17:56:13.8379312Z remote: Counting objects:  68% (34/50)        
2022-08-03T17:56:13.8379730Z remote: Counting objects:  70% (35/50)        
2022-08-03T17:56:13.8380333Z remote: Counting objects:  72% (36/50)        
2022-08-03T17:56:13.8380751Z remote: Counting objects:  74% (37/50)        
2022-08-03T17:56:13.8381360Z remote: Counting objects:  76% (38/50)        
2022-08-03T17:56:13.8381763Z remote: Counting objects:  78% (39/50)        
2022-08-03T17:56:13.8382373Z remote: Counting objects:  80% (40/50)        
2022-08-03T17:56:13.8382781Z remote: Counting objects:  82% (41/50)        
2022-08-03T17:56:13.8383384Z remote: Counting objects:  84% (42/50)        
2022-08-03T17:56:13.8383789Z remote: Counting objects:  86% (43/50)        
2022-08-03T17:56:13.8384395Z remote: Counting objects:  88% (44/50)        
2022-08-03T17:56:13.8384816Z remote: Counting objects:  90% (45/50)        
2022-08-03T17:56:13.8385704Z remote: Counting objects:  92% (46/50)        
2022-08-03T17:56:13.8386692Z remote: Counting objects:  94% (47/50)        
2022-08-03T17:56:13.8387097Z remote: Counting objects:  96% (48/50)        
2022-08-03T17:56:13.8387632Z remote: Counting objects:  98% (49/50)        
2022-08-03T17:56:13.8388285Z remote: Counting objects: 100% (50/50)        
2022-08-03T17:56:13.8388922Z remote: Counting objects: 100% (50/50), done.        
2022-08-03T17:56:13.8389523Z remote: Compressing objects:   5% (1/19)        
2022-08-03T17:56:13.8390184Z remote: Compressing objects:  10% (2/19)        
2022-08-03T17:56:13.8390632Z remote: Compressing objects:  15% (3/19)        
2022-08-03T17:56:13.8391437Z remote: Compressing objects:  21% (4/19)        
2022-08-03T17:56:13.8391850Z remote: Compressing objects:  26% (5/19)        
2022-08-03T17:56:13.8392600Z remote: Compressing objects:  31% (6/19)        
2022-08-03T17:56:13.8393015Z remote: Compressing objects:  36% (7/19)        
2022-08-03T17:56:13.8393805Z remote: Compressing objects:  42% (8/19)        
2022-08-03T17:56:13.8394664Z remote: Compressing objects:  47% (9/19)        
2022-08-03T17:56:13.8395214Z remote: Compressing objects:  52% (10/19)        
2022-08-03T17:56:13.8395682Z remote: Compressing objects:  57% (11/19)        
2022-08-03T17:56:13.8396476Z remote: Compressing objects:  63% (12/19)        
2022-08-03T17:56:13.8396851Z remote: Compressing objects:  68% (13/19)        
2022-08-03T17:56:13.8397501Z remote: Compressing objects:  73% (14/19)        
2022-08-03T17:56:13.8398061Z remote: Compressing objects:  78% (15/19)        
2022-08-03T17:56:13.8398618Z remote: Compressing objects:  84% (16/19)        
2022-08-03T17:56:13.8399172Z remote: Compressing objects:  89% (17/19)        
2022-08-03T17:56:13.8399729Z remote: Compressing objects:  94% (18/19)        
2022-08-03T17:56:13.8400982Z remote: Compressing objects: 100% (19/19)        
2022-08-03T17:56:13.8401573Z remote: Compressing objects: 100% (19/19), done.        
2022-08-03T17:56:13.8431919Z Receiving objects:   0% (1/143)
2022-08-03T17:56:13.8432468Z Receiving objects:   1% (2/143)
2022-08-03T17:56:13.8433127Z Receiving objects:   2% (3/143)
2022-08-03T17:56:13.8433523Z Receiving objects:   3% (5/143)
2022-08-03T17:56:13.8434104Z Receiving objects:   4% (6/143)
2022-08-03T17:56:13.8434632Z Receiving objects:   5% (8/143)
2022-08-03T17:56:13.8435232Z Receiving objects:   6% (9/143)
2022-08-03T17:56:13.8435637Z Receiving objects:   7% (11/143)
2022-08-03T17:56:13.8436238Z Receiving objects:   8% (12/143)
2022-08-03T17:56:13.8436633Z Receiving objects:   9% (13/143)
2022-08-03T17:56:13.8437225Z Receiving objects:  10% (15/143)
2022-08-03T17:56:13.8437603Z Receiving objects:  11% (16/143)
2022-08-03T17:56:13.8438197Z Receiving objects:  12% (18/143)
2022-08-03T17:56:13.8438648Z Receiving objects:  13% (19/143)
2022-08-03T17:56:13.8439243Z Receiving objects:  14% (21/143)
2022-08-03T17:56:13.8439612Z Receiving objects:  15% (22/143)
2022-08-03T17:56:13.8440190Z Receiving objects:  16% (23/143)
2022-08-03T17:56:13.8440570Z Receiving objects:  17% (25/143)
2022-08-03T17:56:13.8441146Z Receiving objects:  18% (26/143)
2022-08-03T17:56:13.8441517Z Receiving objects:  19% (28/143)
2022-08-03T17:56:13.8442096Z Receiving objects:  20% (29/143)
2022-08-03T17:56:13.8442471Z Receiving objects:  21% (31/143)
2022-08-03T17:56:13.8443050Z Receiving objects:  22% (32/143)
2022-08-03T17:56:13.8443432Z Receiving objects:  23% (33/143)
2022-08-03T17:56:13.8444166Z Receiving objects:  24% (35/143)
2022-08-03T17:56:13.8490867Z Receiving objects:  25% (36/143)
2022-08-03T17:56:13.8491093Z Receiving objects:  26% (38/143)
2022-08-03T17:56:13.8491469Z Receiving objects:  27% (39/143)
2022-08-03T17:56:13.8491682Z Receiving objects:  28% (41/143)
2022-08-03T17:56:13.8491884Z Receiving objects:  29% (42/143)
2022-08-03T17:56:13.8492093Z Receiving objects:  30% (43/143)
2022-08-03T17:56:13.8492307Z Receiving objects:  31% (45/143)
2022-08-03T17:56:13.8492508Z Receiving objects:  32% (46/143)
2022-08-03T17:56:13.8492715Z Receiving objects:  33% (48/143)
2022-08-03T17:56:13.8525119Z Receiving objects:  34% (49/143)
2022-08-03T17:56:13.8525917Z Receiving objects:  35% (51/143)
2022-08-03T17:56:13.8527232Z Receiving objects:  36% (52/143)
2022-08-03T17:56:13.8528146Z Receiving objects:  37% (53/143)
2022-08-03T17:56:13.8529169Z Receiving objects:  38% (55/143)
2022-08-03T17:56:13.8530001Z Receiving objects:  39% (56/143)
2022-08-03T17:56:13.8530942Z Receiving objects:  40% (58/143)
2022-08-03T17:56:13.8531638Z Receiving objects:  41% (59/143)
2022-08-03T17:56:13.8532466Z Receiving objects:  42% (61/143)
2022-08-03T17:56:13.8536308Z Receiving objects:  43% (62/143)
2022-08-03T17:56:13.8543636Z Receiving objects:  44% (63/143)
2022-08-03T17:56:13.8543883Z Receiving objects:  45% (65/143)
2022-08-03T17:56:13.8544108Z Receiving objects:  46% (66/143)
2022-08-03T17:56:13.8544314Z Receiving objects:  47% (68/143)
2022-08-03T17:56:13.8544533Z Receiving objects:  48% (69/143)
2022-08-03T17:56:13.8544905Z Receiving objects:  49% (71/143)
2022-08-03T17:56:13.8545107Z Receiving objects:  50% (72/143)
2022-08-03T17:56:13.8545314Z Receiving objects:  51% (73/143)
2022-08-03T17:56:13.8546004Z remote: Total 143 (delta 32), reused 31 (delta 26), pack-reused 93        
2022-08-03T17:56:13.8546363Z Receiving objects:  52% (75/143)
2022-08-03T17:56:13.8546591Z Receiving objects:  53% (76/143)
2022-08-03T17:56:13.8546803Z Receiving objects:  54% (78/143)
2022-08-03T17:56:13.8547015Z Receiving objects:  55% (79/143)
2022-08-03T17:56:13.8547226Z Receiving objects:  56% (81/143)
2022-08-03T17:56:13.8547439Z Receiving objects:  57% (82/143)
2022-08-03T17:56:13.8547641Z Receiving objects:  58% (83/143)
2022-08-03T17:56:13.8547843Z Receiving objects:  59% (85/143)
2022-08-03T17:56:13.8548050Z Receiving objects:  60% (86/143)
2022-08-03T17:56:13.8548247Z Receiving objects:  61% (88/143)
2022-08-03T17:56:13.8548464Z Receiving objects:  62% (89/143)
2022-08-03T17:56:13.8548673Z Receiving objects:  63% (91/143)
2022-08-03T17:56:13.8548937Z Receiving objects:  64% (92/143)
2022-08-03T17:56:13.8549153Z Receiving objects:  65% (93/143)
2022-08-03T17:56:13.8549356Z Receiving objects:  66% (95/143)
2022-08-03T17:56:13.8549567Z Receiving objects:  67% (96/143)
2022-08-03T17:56:13.8549766Z Receiving objects:  68% (98/143)
2022-08-03T17:56:13.8549966Z Receiving objects:  69% (99/143)
2022-08-03T17:56:13.8550309Z Receiving objects:  70% (101/143)
2022-08-03T17:56:13.8550526Z Receiving objects:  71% (102/143)
2022-08-03T17:56:13.8550750Z Receiving objects:  72% (103/143)
2022-08-03T17:56:13.8550968Z Receiving objects:  73% (105/143)
2022-08-03T17:56:13.8551170Z Receiving objects:  74% (106/143)
2022-08-03T17:56:13.8551382Z Receiving objects:  75% (108/143)
2022-08-03T17:56:13.8551600Z Receiving objects:  76% (109/143)
2022-08-03T17:56:13.8551800Z Receiving objects:  77% (111/143)
2022-08-03T17:56:13.8552019Z Receiving objects:  78% (112/143)
2022-08-03T17:56:13.8552226Z Receiving objects:  79% (113/143)
2022-08-03T17:56:13.8552426Z Receiving objects:  80% (115/143)
2022-08-03T17:56:13.8552648Z Receiving objects:  81% (116/143)
2022-08-03T17:56:13.8552863Z Receiving objects:  82% (118/143)
2022-08-03T17:56:13.8558154Z Receiving objects:  83% (119/143)
2022-08-03T17:56:13.8558382Z Receiving objects:  84% (121/143)
2022-08-03T17:56:13.8558592Z Receiving objects:  85% (122/143)
2022-08-03T17:56:13.8558805Z Receiving objects:  86% (123/143)
2022-08-03T17:56:13.8559006Z Receiving objects:  87% (125/143)
2022-08-03T17:56:13.8559226Z Receiving objects:  88% (126/143)
2022-08-03T17:56:13.8559908Z Receiving objects:  89% (128/143)
2022-08-03T17:56:13.8560112Z Receiving objects:  90% (129/143)
2022-08-03T17:56:13.8560324Z Receiving objects:  91% (131/143)
2022-08-03T17:56:13.8560542Z Receiving objects:  92% (132/143)
2022-08-03T17:56:13.8560746Z Receiving objects:  93% (133/143)
2022-08-03T17:56:13.8560963Z Receiving objects:  94% (135/143)
2022-08-03T17:56:13.8561177Z Receiving objects:  95% (136/143)
2022-08-03T17:56:13.8561376Z Receiving objects:  96% (138/143)
2022-08-03T17:56:13.8561582Z Receiving objects:  97% (139/143)
2022-08-03T17:56:13.8561851Z Receiving objects:  98% (141/143)
2022-08-03T17:56:13.8562048Z Receiving objects:  99% (142/143)
2022-08-03T17:56:13.8562259Z Receiving objects: 100% (143/143)
2022-08-03T17:56:13.8562590Z Receiving objects: 100% (143/143), 28.39 KiB | 4.06 MiB/s, done.
2022-08-03T17:56:13.8562852Z Resolving deltas:   0% (0/44)
2022-08-03T17:56:13.8563066Z Resolving deltas:   2% (1/44)
2022-08-03T17:56:13.8563372Z Resolving deltas:   4% (2/44)
2022-08-03T17:56:13.8563588Z Resolving deltas:   6% (3/44)
2022-08-03T17:56:13.8563785Z Resolving deltas:   9% (4/44)
2022-08-03T17:56:13.8564181Z Resolving deltas:  11% (5/44)
2022-08-03T17:56:13.8564396Z Resolving deltas:  13% (6/44)
2022-08-03T17:56:13.8564597Z Resolving deltas:  15% (7/44)
2022-08-03T17:56:13.8564807Z Resolving deltas:  18% (8/44)
2022-08-03T17:56:13.8565016Z Resolving deltas:  20% (9/44)
2022-08-03T17:56:13.8565216Z Resolving deltas:  22% (10/44)
2022-08-03T17:56:13.8565438Z Resolving deltas:  25% (11/44)
2022-08-03T17:56:13.8565659Z Resolving deltas:  27% (12/44)
2022-08-03T17:56:13.8565866Z Resolving deltas:  29% (13/44)
2022-08-03T17:56:13.8566102Z Resolving deltas:  31% (14/44)
2022-08-03T17:56:13.8566310Z Resolving deltas:  34% (15/44)
2022-08-03T17:56:13.8566522Z Resolving deltas:  36% (16/44)
2022-08-03T17:56:13.8566740Z Resolving deltas:  38% (17/44)
2022-08-03T17:56:13.8566939Z Resolving deltas:  40% (18/44)
2022-08-03T17:56:13.8567147Z Resolving deltas:  43% (19/44)
2022-08-03T17:56:13.8567359Z Resolving deltas:  45% (20/44)
2022-08-03T17:56:13.8567554Z Resolving deltas:  47% (21/44)
2022-08-03T17:56:13.8567758Z Resolving deltas:  50% (22/44)
2022-08-03T17:56:13.8567963Z Resolving deltas:  52% (23/44)
2022-08-03T17:56:13.8568157Z Resolving deltas:  54% (24/44)
2022-08-03T17:56:13.8568361Z Resolving deltas:  56% (25/44)
2022-08-03T17:56:13.8568569Z Resolving deltas:  59% (26/44)
2022-08-03T17:56:13.8568763Z Resolving deltas:  61% (27/44)
2022-08-03T17:56:13.8568966Z Resolving deltas:  63% (28/44)
2022-08-03T17:56:13.8569173Z Resolving deltas:  65% (29/44)
2022-08-03T17:56:13.8569377Z Resolving deltas:  68% (30/44)
2022-08-03T17:56:13.8569573Z Resolving deltas:  70% (31/44)
2022-08-03T17:56:13.8569774Z Resolving deltas:  72% (32/44)
2022-08-03T17:56:13.8569979Z Resolving deltas:  75% (33/44)
2022-08-03T17:56:13.8570266Z Resolving deltas:  77% (34/44)
2022-08-03T17:56:13.8570465Z Resolving deltas:  79% (35/44)
2022-08-03T17:56:13.8570670Z Resolving deltas:  81% (36/44)
2022-08-03T17:56:13.8570866Z Resolving deltas:  84% (37/44)
2022-08-03T17:56:13.8571067Z Resolving deltas:  86% (38/44)
2022-08-03T17:56:13.8571270Z Resolving deltas:  88% (39/44)
2022-08-03T17:56:13.8571465Z Resolving deltas:  90% (40/44)
2022-08-03T17:56:13.8571667Z Resolving deltas:  93% (41/44)
2022-08-03T17:56:13.8623174Z Resolving deltas:  95% (42/44)
2022-08-03T17:56:13.8623424Z Resolving deltas:  97% (43/44)
2022-08-03T17:56:13.8623646Z Resolving deltas: 100% (44/44)
2022-08-03T17:56:13.8623881Z Resolving deltas: 100% (44/44), done.
2022-08-03T17:56:13.8624426Z From https://github.com/EvgeniErmakov/yes-i-still-love-you
2022-08-03T17:56:13.8624918Z  * [new branch]      EvgeniErmakov-patch-1                    -> origin/EvgeniErmakov-patch-1
2022-08-03T17:56:13.8625427Z  * [new branch]      EvgeniErmakov-patch-10                   -> origin/EvgeniErmakov-patch-10
2022-08-03T17:56:13.8625923Z  * [new branch]      EvgeniErmakov-patch-11                   -> origin/EvgeniErmakov-patch-11
2022-08-03T17:56:13.8626388Z  * [new branch]      EvgeniErmakov-patch-12                   -> origin/EvgeniErmakov-patch-12
2022-08-03T17:56:13.8626846Z  * [new branch]      EvgeniErmakov-patch-13                   -> origin/EvgeniErmakov-patch-13
2022-08-03T17:56:13.8627320Z  * [new branch]      EvgeniErmakov-patch-2                    -> origin/EvgeniErmakov-patch-2
2022-08-03T17:56:13.8627801Z  * [new branch]      EvgeniErmakov-patch-3                    -> origin/EvgeniErmakov-patch-3
2022-08-03T17:56:13.8628256Z  * [new branch]      EvgeniErmakov-patch-4                    -> origin/EvgeniErmakov-patch-4
2022-08-03T17:56:13.8628718Z  * [new branch]      EvgeniErmakov-patch-5                    -> origin/EvgeniErmakov-patch-5
2022-08-03T17:56:13.8629179Z  * [new branch]      EvgeniErmakov-patch-6                    -> origin/EvgeniErmakov-patch-6
2022-08-03T17:56:13.8629634Z  * [new branch]      EvgeniErmakov-patch-7                    -> origin/EvgeniErmakov-patch-7
2022-08-03T17:56:13.8630190Z  * [new branch]      EvgeniErmakov-patch-8                    -> origin/EvgeniErmakov-patch-8
2022-08-03T17:56:13.8630650Z  * [new branch]      EvgeniErmakov-patch-9                    -> origin/EvgeniErmakov-patch-9
2022-08-03T17:56:13.8631142Z  * [new branch]      EvgeniErmakov-tabs-finder                -> origin/EvgeniErmakov-tabs-finder
2022-08-03T17:56:13.8631568Z  * [new branch]      dev                                      -> origin/dev
2022-08-03T17:56:13.8631971Z  * [new branch]      features/do_one                          -> origin/features/do_one
2022-08-03T17:56:13.8632397Z  * [new branch]      hotfix/we_gonna_die                      -> origin/hotfix/we_gonna_die
2022-08-03T17:56:13.8632787Z  * [new branch]      main                                     -> origin/main
2022-08-03T17:56:13.8633158Z  * [new branch]      master                                   -> origin/master
2022-08-03T17:56:13.8633567Z  * [new branch]      run_github_action                        -> origin/run_github_action
2022-08-03T17:56:13.8633990Z  * [new branch]      run_github_action2                       -> origin/run_github_action2
2022-08-03T17:56:13.8634368Z  * [new branch]      test                                     -> origin/test
2022-08-03T17:56:13.8634766Z  * [new ref]         42e90733e468247d5a3ce4da9574ee89b1f45546 -> pull/23/merge
2022-08-03T17:56:13.8650129Z ##[endgroup]
2022-08-03T17:56:13.8650576Z ##[group]Determining the checkout info
2022-08-03T17:56:13.8650955Z ##[endgroup]
2022-08-03T17:56:13.8651298Z ##[group]Checking out the ref
2022-08-03T17:56:13.8653202Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/23/merge
2022-08-03T17:56:13.8690368Z Note: switching to 'refs/remotes/pull/23/merge'.
2022-08-03T17:56:13.8690835Z 
2022-08-03T17:56:13.8691699Z You are in 'detached HEAD' state. You can look around, make experimental
2022-08-03T17:56:13.8692298Z changes and commit them, and you can discard any commits you make in this
2022-08-03T17:56:13.8692663Z state without impacting any branches by switching back to a branch.
2022-08-03T17:56:13.8692862Z 
2022-08-03T17:56:13.8693024Z If you want to create a new branch to retain commits you create, you may
2022-08-03T17:56:13.8693479Z do so (now or later) by using -c with the switch command. Example:
2022-08-03T17:56:13.8693668Z 
2022-08-03T17:56:13.8693829Z   git switch -c <new-branch-name>
2022-08-03T17:56:13.8693981Z 
2022-08-03T17:56:13.8694081Z Or undo this operation with:
2022-08-03T17:56:13.8694225Z 
2022-08-03T17:56:13.8694304Z   git switch -
2022-08-03T17:56:13.8694424Z 
2022-08-03T17:56:13.8694595Z Turn off this advice by setting config variable advice.detachedHead to false
2022-08-03T17:56:13.8694806Z 
2022-08-03T17:56:13.8695019Z HEAD is now at 42e9073 Merge 12e187bd5933ad4bd18eb79b41a316551a3aabc7 into cc219c1524739a093d66990213aaf6a55fff43b8
2022-08-03T17:56:13.8700864Z ##[endgroup]
2022-08-03T17:56:13.8746719Z [command]/usr/bin/git log -1 --format='%H'
2022-08-03T17:56:13.8778994Z '42e90733e468247d5a3ce4da9574ee89b1f45546'
2022-08-03T17:56:13.9069498Z ##[group]Run jitterbit/get-changed-files@v1
2022-08-03T17:56:13.9069745Z with:
2022-08-03T17:56:13.9070088Z   token: ***
2022-08-03T17:56:13.9070298Z   format: space-delimited
2022-08-03T17:56:13.9070507Z ##[endgroup]
2022-08-03T17:56:14.0765663Z Base commit: cc219c1524739a093d66990213aaf6a55fff43b8
2022-08-03T17:56:14.0766033Z Head commit: 12e187bd5933ad4bd18eb79b41a316551a3aabc7
2022-08-03T17:56:14.3062848Z All: tabs
2022-08-03T17:56:14.3066153Z Added: 
2022-08-03T17:56:14.3069316Z Modified: tabs
2022-08-03T17:56:14.3069535Z Removed: 
2022-08-03T17:56:14.3069717Z Renamed: 
2022-08-03T17:56:14.3071804Z Added or modified: tabs
2022-08-03T17:56:14.3234382Z ##[group]Run for changed_file in tabs; do
2022-08-03T17:56:14.3234739Z [36;1mfor changed_file in tabs; do[0m
2022-08-03T17:56:14.3235055Z [36;1mecho "File ${changed_file} has been checked and count of tabs : " >> tabs.log[0m
2022-08-03T17:56:14.3235394Z [36;1mgrep -P '\t' ${changed_file} | wc -l >> tabs.log[0m
2022-08-03T17:56:14.3235631Z [36;1mdone[0m
2022-08-03T17:56:14.3293990Z shell: /usr/bin/bash -e {0}
2022-08-03T17:56:14.3294228Z ##[endgroup]
2022-08-03T17:56:14.3514713Z ##[group]Run actions/upload-artifact@v2
2022-08-03T17:56:14.3514944Z with:
2022-08-03T17:56:14.3515121Z   path: tabs.log
2022-08-03T17:56:14.3515309Z   name: artifact
2022-08-03T17:56:14.3515503Z   if-no-files-found: warn
2022-08-03T17:56:14.3515703Z ##[endgroup]
2022-08-03T17:56:14.4095134Z With the provided path, there will be 1 file uploaded
2022-08-03T17:56:14.4098919Z Starting artifact upload
2022-08-03T17:56:14.4099864Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-08-03T17:56:14.4100718Z Artifact name is valid!
2022-08-03T17:56:14.4769664Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-08-03T17:56:14.5525460Z Total size of all the files uploaded is 50 bytes
2022-08-03T17:56:14.5525795Z File upload process has finished. Finalizing the artifact upload
2022-08-03T17:56:14.5848575Z Artifact has been finalized. All files have been successfully uploaded!
2022-08-03T17:56:14.5848812Z 
2022-08-03T17:56:14.5848967Z The raw size of all the files that were specified for upload is 50 bytes
2022-08-03T17:56:14.5849408Z The size of all the files that were uploaded is 50 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-08-03T17:56:14.5849681Z 
2022-08-03T17:56:14.5850303Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-08-03T17:56:14.5850635Z 
2022-08-03T17:56:14.5850765Z Artifact artifact has been successfully uploaded!
2022-08-03T17:56:14.5954660Z Post job cleanup.
2022-08-03T17:56:14.7227142Z [command]/usr/bin/git version
2022-08-03T17:56:14.7287174Z git version 2.37.1
2022-08-03T17:56:14.7342400Z Temporarily overriding HOME='/home/runner/work/_temp/9b6b0081-a491-449f-9b50-05ce928ec89b' before making global git config changes
2022-08-03T17:56:14.7346252Z Adding repository directory to the temporary git global config as a safe directory
2022-08-03T17:56:14.7353147Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/yes-i-still-love-you/yes-i-still-love-you
2022-08-03T17:56:14.7408475Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-03T17:56:14.7458124Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-03T17:56:14.7712181Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-03T17:56:14.7740463Z http.https://github.com/.extraheader
2022-08-03T17:56:14.7760078Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-08-03T17:56:14.7803660Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-03T17:56:14.8285726Z Cleaning up orphan processes
```
