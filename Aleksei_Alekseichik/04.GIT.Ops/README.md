## 04.GIT.OPS
---
[GitHub](https://github.com/alexfiz/my_demo_git)
---
## Log
```bash
2022-05-08T21:57:07.3998364Z Requested labels: ubuntu-latest
2022-05-08T21:57:07.3998443Z Job defined at: alexfiz/my_demo_git/.github/workflows/blank2.yml@refs/pull/44/merge
2022-05-08T21:57:07.3998477Z Waiting for a runner to pick up this job...
2022-05-08T21:57:07.8984322Z Job is waiting for a hosted runner to come online.
2022-05-08T21:57:11.1031544Z Job is about to start running on the hosted runner: GitHub Actions 2 (hosted)
2022-05-08T21:57:13.2892010Z Current runner version: '2.291.1'
2022-05-08T21:57:13.2920921Z ##[group]Operating System
2022-05-08T21:57:13.2921927Z Ubuntu
2022-05-08T21:57:13.2922234Z 20.04.4
2022-05-08T21:57:13.2922458Z LTS
2022-05-08T21:57:13.2922765Z ##[endgroup]
2022-05-08T21:57:13.2923140Z ##[group]Virtual Environment
2022-05-08T21:57:13.2923463Z Environment: ubuntu-20.04
2022-05-08T21:57:13.2923977Z Version: 20220503.1
2022-05-08T21:57:13.2924690Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-08T21:57:13.2925321Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-08T21:57:13.2925836Z ##[endgroup]
2022-05-08T21:57:13.2926208Z ##[group]Virtual Environment Provisioner
2022-05-08T21:57:13.2926788Z 1.0.0.0-main-20220421-1
2022-05-08T21:57:13.2927141Z ##[endgroup]
2022-05-08T21:57:13.2927864Z ##[group]GITHUB_TOKEN Permissions
2022-05-08T21:57:13.2928630Z Contents: read
2022-05-08T21:57:13.2929131Z Metadata: read
2022-05-08T21:57:13.2929658Z ##[endgroup]
2022-05-08T21:57:13.2934987Z Secret source: Actions
2022-05-08T21:57:13.2935851Z Prepare workflow directory
2022-05-08T21:57:13.3999683Z Prepare all required actions
2022-05-08T21:57:13.4233369Z Getting action download info
2022-05-08T21:57:13.6704546Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-08T21:57:14.3405406Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2022-05-08T21:57:14.8307039Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-08T21:57:15.5638229Z ##[group]Run actions/checkout@v3
2022-05-08T21:57:15.5638656Z with:
2022-05-08T21:57:15.5638964Z   fetch-depth: 0
2022-05-08T21:57:15.5639331Z   repository: alexfiz/my_demo_git
2022-05-08T21:57:15.5639885Z   token: ***
2022-05-08T21:57:15.5640182Z   ssh-strict: true
2022-05-08T21:57:15.5640616Z   persist-credentials: true
2022-05-08T21:57:15.5640998Z   clean: true
2022-05-08T21:57:15.5641531Z   lfs: false
2022-05-08T21:57:15.5641765Z   submodules: false
2022-05-08T21:57:15.5642070Z   set-safe-directory: true
2022-05-08T21:57:15.5642400Z ##[endgroup]
2022-05-08T21:57:15.9124437Z Syncing repository: alexfiz/my_demo_git
2022-05-08T21:57:15.9126443Z ##[group]Getting Git version info
2022-05-08T21:57:15.9127317Z Working directory is '/home/runner/work/my_demo_git/my_demo_git'
2022-05-08T21:57:15.9127974Z [command]/usr/bin/git version
2022-05-08T21:57:15.9284614Z git version 2.36.0
2022-05-08T21:57:15.9313463Z ##[endgroup]
2022-05-08T21:57:15.9340989Z Temporarily overriding HOME='/home/runner/work/_temp/5bfe2f24-05e0-42f7-b75d-d601d37a0e64' before making global git config changes
2022-05-08T21:57:15.9341570Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T21:57:15.9592911Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:57:15.9595119Z Deleting the contents of '/home/runner/work/my_demo_git/my_demo_git'
2022-05-08T21:57:15.9596093Z ##[group]Initializing the repository
2022-05-08T21:57:15.9596473Z [command]/usr/bin/git init /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:57:15.9597011Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-08T21:57:15.9597510Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-08T21:57:15.9597946Z hint: of your new repositories, which will suppress this warning, call:
2022-05-08T21:57:15.9599448Z hint: 
2022-05-08T21:57:15.9599995Z hint: 	git config --global init.defaultBranch <name>
2022-05-08T21:57:15.9600313Z hint: 
2022-05-08T21:57:15.9600805Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-08T21:57:15.9601542Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-08T21:57:15.9602507Z hint: 
2022-05-08T21:57:15.9604440Z hint: 	git branch -m <name>
2022-05-08T21:57:15.9605178Z Initialized empty Git repository in /home/runner/work/my_demo_git/my_demo_git/.git/
2022-05-08T21:57:15.9605646Z [command]/usr/bin/git remote add origin https://github.com/alexfiz/my_demo_git
2022-05-08T21:57:15.9674498Z ##[endgroup]
2022-05-08T21:57:15.9675047Z ##[group]Disabling automatic garbage collection
2022-05-08T21:57:15.9675595Z [command]/usr/bin/git config --local gc.auto 0
2022-05-08T21:57:15.9726046Z ##[endgroup]
2022-05-08T21:57:15.9726564Z ##[group]Setting up auth
2022-05-08T21:57:15.9727183Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T21:57:15.9759229Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T21:57:16.0213017Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T21:57:16.0246777Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T21:57:16.0525209Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-08T21:57:16.0576199Z ##[endgroup]
2022-05-08T21:57:16.0577249Z ##[group]Fetching the repository
2022-05-08T21:57:16.0588850Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +f70ae18ec213788f8e1b803c5cdbf521362b426c:refs/remotes/pull/44/merge
2022-05-08T21:57:16.5769704Z remote: Enumerating objects: 289, done.        
2022-05-08T21:57:16.5770249Z remote: Counting objects:   0% (1/122)        
2022-05-08T21:57:16.5770581Z remote: Counting objects:   1% (2/122)        
2022-05-08T21:57:16.5770889Z remote: Counting objects:   2% (3/122)        
2022-05-08T21:57:16.5771180Z remote: Counting objects:   3% (4/122)        
2022-05-08T21:57:16.5771500Z remote: Counting objects:   4% (5/122)        
2022-05-08T21:57:16.5771805Z remote: Counting objects:   5% (7/122)        
2022-05-08T21:57:16.5772090Z remote: Counting objects:   6% (8/122)        
2022-05-08T21:57:16.5772394Z remote: Counting objects:   7% (9/122)        
2022-05-08T21:57:16.5772698Z remote: Counting objects:   8% (10/122)        
2022-05-08T21:57:16.5773007Z remote: Counting objects:   9% (11/122)        
2022-05-08T21:57:16.5773299Z remote: Counting objects:  10% (13/122)        
2022-05-08T21:57:16.5773639Z remote: Counting objects:  11% (14/122)        
2022-05-08T21:57:16.5773951Z remote: Counting objects:  12% (15/122)        
2022-05-08T21:57:16.5774242Z remote: Counting objects:  13% (16/122)        
2022-05-08T21:57:16.5774539Z remote: Counting objects:  14% (18/122)        
2022-05-08T21:57:16.5774840Z remote: Counting objects:  15% (19/122)        
2022-05-08T21:57:16.5775119Z remote: Counting objects:  16% (20/122)        
2022-05-08T21:57:16.5775421Z remote: Counting objects:  17% (21/122)        
2022-05-08T21:57:16.5775724Z remote: Counting objects:  18% (22/122)        
2022-05-08T21:57:16.5776005Z remote: Counting objects:  19% (24/122)        
2022-05-08T21:57:16.5776308Z remote: Counting objects:  20% (25/122)        
2022-05-08T21:57:16.5776605Z remote: Counting objects:  21% (26/122)        
2022-05-08T21:57:16.5776902Z remote: Counting objects:  22% (27/122)        
2022-05-08T21:57:16.5777187Z remote: Counting objects:  23% (29/122)        
2022-05-08T21:57:16.5777640Z remote: Counting objects:  24% (30/122)        
2022-05-08T21:57:16.5777932Z remote: Counting objects:  25% (31/122)        
2022-05-08T21:57:16.5778208Z remote: Counting objects:  26% (32/122)        
2022-05-08T21:57:16.5778494Z remote: Counting objects:  27% (33/122)        
2022-05-08T21:57:16.5778797Z remote: Counting objects:  28% (35/122)        
2022-05-08T21:57:16.5779069Z remote: Counting objects:  29% (36/122)        
2022-05-08T21:57:16.5779545Z remote: Counting objects:  30% (37/122)        
2022-05-08T21:57:16.5779835Z remote: Counting objects:  31% (38/122)        
2022-05-08T21:57:16.5780126Z remote: Counting objects:  32% (40/122)        
2022-05-08T21:57:16.5780401Z remote: Counting objects:  33% (41/122)        
2022-05-08T21:57:16.5780691Z remote: Counting objects:  34% (42/122)        
2022-05-08T21:57:16.5780979Z remote: Counting objects:  35% (43/122)        
2022-05-08T21:57:16.5781251Z remote: Counting objects:  36% (44/122)        
2022-05-08T21:57:16.5789787Z remote: Counting objects:  37% (46/122)        
2022-05-08T21:57:16.5790386Z remote: Counting objects:  38% (47/122)        
2022-05-08T21:57:16.5790700Z remote: Counting objects:  39% (48/122)        
2022-05-08T21:57:16.5791008Z remote: Counting objects:  40% (49/122)        
2022-05-08T21:57:16.5791295Z remote: Counting objects:  41% (51/122)        
2022-05-08T21:57:16.5791596Z remote: Counting objects:  42% (52/122)        
2022-05-08T21:57:16.5791900Z remote: Counting objects:  43% (53/122)        
2022-05-08T21:57:16.5792186Z remote: Counting objects:  44% (54/122)        
2022-05-08T21:57:16.5792483Z remote: Counting objects:  45% (55/122)        
2022-05-08T21:57:16.5792784Z remote: Counting objects:  46% (57/122)        
2022-05-08T21:57:16.5793229Z remote: Counting objects:  47% (58/122)        
2022-05-08T21:57:16.5793686Z remote: Counting objects:  48% (59/122)        
2022-05-08T21:57:16.5793965Z remote: Counting objects:  49% (60/122)        
2022-05-08T21:57:16.5794241Z remote: Counting objects:  50% (61/122)        
2022-05-08T21:57:16.5794505Z remote: Counting objects:  51% (63/122)        
2022-05-08T21:57:16.5794957Z remote: Counting objects:  52% (64/122)        
2022-05-08T21:57:16.5795264Z remote: Counting objects:  53% (65/122)        
2022-05-08T21:57:16.5795529Z remote: Counting objects:  54% (66/122)        
2022-05-08T21:57:16.5795807Z remote: Counting objects:  55% (68/122)        
2022-05-08T21:57:16.5796085Z remote: Counting objects:  56% (69/122)        
2022-05-08T21:57:16.5796352Z remote: Counting objects:  57% (70/122)        
2022-05-08T21:57:16.5796626Z remote: Counting objects:  58% (71/122)        
2022-05-08T21:57:16.5796906Z remote: Counting objects:  59% (72/122)        
2022-05-08T21:57:16.5797168Z remote: Counting objects:  60% (74/122)        
2022-05-08T21:57:16.5797448Z remote: Counting objects:  61% (75/122)        
2022-05-08T21:57:16.5797727Z remote: Counting objects:  62% (76/122)        
2022-05-08T21:57:16.5798003Z remote: Counting objects:  63% (77/122)        
2022-05-08T21:57:16.5798454Z remote: Counting objects:  64% (79/122)        
2022-05-08T21:57:16.5798726Z remote: Counting objects:  65% (80/122)        
2022-05-08T21:57:16.5799481Z remote: Counting objects:  66% (81/122)        
2022-05-08T21:57:16.5880818Z remote: Counting objects:  67% (82/122)        
2022-05-08T21:57:16.5882419Z remote: Counting objects:  68% (83/122)        
2022-05-08T21:57:16.5882723Z remote: Counting objects:  69% (85/122)        
2022-05-08T21:57:16.5884467Z remote: Counting objects:  70% (86/122)        
2022-05-08T21:57:16.5885552Z remote: Counting objects:  71% (87/122)        
2022-05-08T21:57:16.5886670Z remote: Counting objects:  72% (88/122)        
2022-05-08T21:57:16.5887675Z remote: Counting objects:  73% (90/122)        
2022-05-08T21:57:16.5889139Z remote: Counting objects:  74% (91/122)        
2022-05-08T21:57:16.5890151Z remote: Counting objects:  75% (92/122)        
2022-05-08T21:57:16.5891493Z remote: Counting objects:  76% (93/122)        
2022-05-08T21:57:16.5892502Z remote: Counting objects:  77% (94/122)        
2022-05-08T21:57:16.5894047Z remote: Counting objects:  78% (96/122)        
2022-05-08T21:57:16.5895417Z remote: Counting objects:  79% (97/122)        
2022-05-08T21:57:16.5896739Z remote: Counting objects:  80% (98/122)        
2022-05-08T21:57:16.5897816Z remote: Counting objects:  81% (99/122)        
2022-05-08T21:57:16.5899102Z remote: Counting objects:  82% (101/122)        
2022-05-08T21:57:16.5900083Z remote: Counting objects:  83% (102/122)        
2022-05-08T21:57:16.5901688Z remote: Counting objects:  84% (103/122)        
2022-05-08T21:57:16.5901990Z remote: Counting objects:  85% (104/122)        
2022-05-08T21:57:16.5903479Z remote: Counting objects:  86% (105/122)        
2022-05-08T21:57:16.5904586Z remote: Counting objects:  87% (107/122)        
2022-05-08T21:57:16.5905779Z remote: Counting objects:  88% (108/122)        
2022-05-08T21:57:16.5907135Z remote: Counting objects:  89% (109/122)        
2022-05-08T21:57:16.5908405Z remote: Counting objects:  90% (110/122)        
2022-05-08T21:57:16.5909607Z remote: Counting objects:  91% (112/122)        
2022-05-08T21:57:16.5914317Z remote: Counting objects:  92% (113/122)        
2022-05-08T21:57:16.5916060Z remote: Counting objects:  93% (114/122)        
2022-05-08T21:57:16.5916362Z remote: Counting objects:  94% (115/122)        
2022-05-08T21:57:16.5921425Z remote: Counting objects:  95% (116/122)        
2022-05-08T21:57:16.5921789Z remote: Counting objects:  96% (118/122)        
2022-05-08T21:57:16.5922109Z remote: Counting objects:  97% (119/122)        
2022-05-08T21:57:16.5922392Z remote: Counting objects:  98% (120/122)        
2022-05-08T21:57:16.5922691Z remote: Counting objects:  99% (121/122)        
2022-05-08T21:57:16.5922989Z remote: Counting objects: 100% (122/122)        
2022-05-08T21:57:16.5923285Z remote: Counting objects: 100% (122/122), done.        
2022-05-08T21:57:16.5923766Z remote: Compressing objects:   0% (1/104)        
2022-05-08T21:57:16.5924073Z remote: Compressing objects:   1% (2/104)        
2022-05-08T21:57:16.5924355Z remote: Compressing objects:   2% (3/104)        
2022-05-08T21:57:16.5924984Z remote: Compressing objects:   3% (4/104)        
2022-05-08T21:57:16.5925304Z remote: Compressing objects:   4% (5/104)        
2022-05-08T21:57:16.5925574Z remote: Compressing objects:   5% (6/104)        
2022-05-08T21:57:16.5926053Z remote: Compressing objects:   6% (7/104)        
2022-05-08T21:57:16.5926350Z remote: Compressing objects:   7% (8/104)        
2022-05-08T21:57:16.5926645Z remote: Compressing objects:   8% (9/104)        
2022-05-08T21:57:16.5926929Z remote: Compressing objects:   9% (10/104)        
2022-05-08T21:57:16.5927233Z remote: Compressing objects:  10% (11/104)        
2022-05-08T21:57:16.5927535Z remote: Compressing objects:  11% (12/104)        
2022-05-08T21:57:16.5927819Z remote: Compressing objects:  12% (13/104)        
2022-05-08T21:57:16.5928136Z remote: Compressing objects:  13% (14/104)        
2022-05-08T21:57:16.5928437Z remote: Compressing objects:  14% (15/104)        
2022-05-08T21:57:16.5928721Z remote: Compressing objects:  15% (16/104)        
2022-05-08T21:57:16.5929025Z remote: Compressing objects:  16% (17/104)        
2022-05-08T21:57:16.5929474Z remote: Compressing objects:  17% (18/104)        
2022-05-08T21:57:16.5929765Z remote: Compressing objects:  18% (19/104)        
2022-05-08T21:57:16.5930035Z remote: Compressing objects:  19% (20/104)        
2022-05-08T21:57:16.5930328Z remote: Compressing objects:  20% (21/104)        
2022-05-08T21:57:16.5930614Z remote: Compressing objects:  21% (22/104)        
2022-05-08T21:57:16.5930881Z remote: Compressing objects:  22% (23/104)        
2022-05-08T21:57:16.5931169Z remote: Compressing objects:  23% (24/104)        
2022-05-08T21:57:16.5931455Z remote: Compressing objects:  24% (25/104)        
2022-05-08T21:57:16.5931725Z remote: Compressing objects:  25% (26/104)        
2022-05-08T21:57:16.5932014Z remote: Compressing objects:  26% (28/104)        
2022-05-08T21:57:16.5932299Z remote: Compressing objects:  27% (29/104)        
2022-05-08T21:57:16.5933111Z remote: Compressing objects:  28% (30/104)        
2022-05-08T21:57:16.5933682Z remote: Compressing objects:  29% (31/104)        
2022-05-08T21:57:16.5933985Z remote: Compressing objects:  30% (32/104)        
2022-05-08T21:57:16.5934281Z remote: Compressing objects:  31% (33/104)        
2022-05-08T21:57:16.5934732Z remote: Compressing objects:  32% (34/104)        
2022-05-08T21:57:16.5935318Z remote: Compressing objects:  33% (35/104)        
2022-05-08T21:57:16.5935994Z remote: Compressing objects:  34% (36/104)        
2022-05-08T21:57:16.5936816Z remote: Compressing objects:  35% (37/104)        
2022-05-08T21:57:16.5937420Z remote: Compressing objects:  36% (38/104)        
2022-05-08T21:57:16.5938121Z remote: Compressing objects:  37% (39/104)        
2022-05-08T21:57:16.5938845Z remote: Compressing objects:  38% (40/104)        
2022-05-08T21:57:16.5939501Z remote: Compressing objects:  39% (41/104)        
2022-05-08T21:57:16.5940055Z remote: Compressing objects:  40% (42/104)        
2022-05-08T21:57:16.5940773Z remote: Compressing objects:  41% (43/104)        
2022-05-08T21:57:16.5941417Z remote: Compressing objects:  42% (44/104)        
2022-05-08T21:57:16.5941893Z remote: Compressing objects:  43% (45/104)        
2022-05-08T21:57:16.5943090Z remote: Compressing objects:  44% (46/104)        
2022-05-08T21:57:16.5943618Z remote: Compressing objects:  45% (47/104)        
2022-05-08T21:57:16.5944078Z remote: Compressing objects:  46% (48/104)        
2022-05-08T21:57:16.5945224Z remote: Compressing objects:  47% (49/104)        
2022-05-08T21:57:16.5945671Z remote: Compressing objects:  48% (50/104)        
2022-05-08T21:57:16.5949934Z remote: Compressing objects:  49% (51/104)        
2022-05-08T21:57:16.5950445Z remote: Compressing objects:  50% (52/104)        
2022-05-08T21:57:16.5950915Z remote: Compressing objects:  51% (54/104)        
2022-05-08T21:57:16.5951362Z remote: Compressing objects:  52% (55/104)        
2022-05-08T21:57:16.5951660Z remote: Compressing objects:  53% (56/104)        
2022-05-08T21:57:16.5952230Z remote: Compressing objects:  54% (57/104)        
2022-05-08T21:57:16.5952539Z remote: Compressing objects:  55% (58/104)        
2022-05-08T21:57:16.5953015Z remote: Compressing objects:  56% (59/104)        
2022-05-08T21:57:16.5953321Z remote: Compressing objects:  57% (60/104)        
2022-05-08T21:57:16.5953604Z remote: Compressing objects:  58% (61/104)        
2022-05-08T21:57:16.5953916Z remote: Compressing objects:  59% (62/104)        
2022-05-08T21:57:16.5954218Z remote: Compressing objects:  60% (63/104)        
2022-05-08T21:57:16.5954519Z remote: Compressing objects:  61% (64/104)        
2022-05-08T21:57:16.5954798Z remote: Compressing objects:  62% (65/104)        
2022-05-08T21:57:16.5955094Z remote: Compressing objects:  63% (66/104)        
2022-05-08T21:57:16.5955400Z remote: Compressing objects:  64% (67/104)        
2022-05-08T21:57:16.5955678Z remote: Compressing objects:  65% (68/104)        
2022-05-08T21:57:16.5956152Z remote: Compressing objects:  66% (69/104)        
2022-05-08T21:57:16.5956648Z remote: Compressing objects:  67% (70/104)        
2022-05-08T21:57:16.5956949Z remote: Compressing objects:  68% (71/104)        
2022-05-08T21:57:16.5957382Z remote: Compressing objects:  69% (72/104)        
2022-05-08T21:57:16.5957710Z remote: Compressing objects:  70% (73/104)        
2022-05-08T21:57:16.5958028Z remote: Compressing objects:  71% (74/104)        
2022-05-08T21:57:16.5958335Z remote: Compressing objects:  72% (75/104)        
2022-05-08T21:57:16.5958659Z remote: Compressing objects:  73% (76/104)        
2022-05-08T21:57:16.5958980Z remote: Compressing objects:  74% (77/104)        
2022-05-08T21:57:16.5959284Z remote: Compressing objects:  75% (78/104)        
2022-05-08T21:57:16.5959607Z remote: Compressing objects:  76% (80/104)        
2022-05-08T21:57:16.5959924Z remote: Compressing objects:  77% (81/104)        
2022-05-08T21:57:16.5960222Z remote: Compressing objects:  78% (82/104)        
2022-05-08T21:57:16.5960541Z remote: Compressing objects:  79% (83/104)        
2022-05-08T21:57:16.5963167Z remote: Compressing objects:  80% (84/104)        
2022-05-08T21:57:16.5963468Z remote: Compressing objects:  81% (85/104)        
2022-05-08T21:57:16.5963774Z remote: Compressing objects:  82% (86/104)        
2022-05-08T21:57:16.5964078Z remote: Compressing objects:  83% (87/104)        
2022-05-08T21:57:16.5964599Z remote: Compressing objects:  84% (88/104)        
2022-05-08T21:57:16.5964885Z remote: Compressing objects:  85% (89/104)        
2022-05-08T21:57:16.5965195Z remote: Compressing objects:  86% (90/104)        
2022-05-08T21:57:16.5966271Z remote: Compressing objects:  87% (91/104)        
2022-05-08T21:57:16.5966623Z remote: Compressing objects:  88% (92/104)        
2022-05-08T21:57:16.5966948Z remote: Compressing objects:  89% (93/104)        
2022-05-08T21:57:16.5967269Z remote: Compressing objects:  90% (94/104)        
2022-05-08T21:57:16.5967571Z remote: Compressing objects:  91% (95/104)        
2022-05-08T21:57:16.5967902Z remote: Compressing objects:  92% (96/104)        
2022-05-08T21:57:16.5968219Z remote: Compressing objects:  93% (97/104)        
2022-05-08T21:57:16.5968563Z remote: Compressing objects:  94% (98/104)        
2022-05-08T21:57:16.5968881Z remote: Compressing objects:  95% (99/104)        
2022-05-08T21:57:16.5969354Z remote: Compressing objects:  96% (100/104)        
2022-05-08T21:57:16.5969988Z remote: Compressing objects:  97% (101/104)        
2022-05-08T21:57:16.5970281Z remote: Compressing objects:  98% (102/104)        
2022-05-08T21:57:16.5970730Z remote: Compressing objects:  99% (103/104)        
2022-05-08T21:57:16.5970995Z remote: Compressing objects: 100% (104/104)        
2022-05-08T21:57:16.5971292Z remote: Compressing objects: 100% (104/104), done.        
2022-05-08T21:57:16.6009349Z Receiving objects:   0% (1/289)
2022-05-08T21:57:16.6010250Z Receiving objects:   1% (3/289)
2022-05-08T21:57:16.6010716Z Receiving objects:   2% (6/289)
2022-05-08T21:57:16.6011652Z Receiving objects:   3% (9/289)
2022-05-08T21:57:16.6012298Z Receiving objects:   4% (12/289)
2022-05-08T21:57:16.6012729Z Receiving objects:   5% (15/289)
2022-05-08T21:57:16.6013386Z Receiving objects:   6% (18/289)
2022-05-08T21:57:16.6014081Z Receiving objects:   7% (21/289)
2022-05-08T21:57:16.6014896Z Receiving objects:   8% (24/289)
2022-05-08T21:57:16.6015452Z Receiving objects:   9% (27/289)
2022-05-08T21:57:16.6016215Z Receiving objects:  10% (29/289)
2022-05-08T21:57:16.6016886Z Receiving objects:  11% (32/289)
2022-05-08T21:57:16.6017674Z Receiving objects:  12% (35/289)
2022-05-08T21:57:16.6018450Z Receiving objects:  13% (38/289)
2022-05-08T21:57:16.6019099Z Receiving objects:  14% (41/289)
2022-05-08T21:57:16.6019475Z Receiving objects:  15% (44/289)
2022-05-08T21:57:16.6020377Z Receiving objects:  16% (47/289)
2022-05-08T21:57:16.6021763Z Receiving objects:  17% (50/289)
2022-05-08T21:57:16.6022576Z Receiving objects:  18% (53/289)
2022-05-08T21:57:16.6024305Z Receiving objects:  19% (55/289)
2022-05-08T21:57:16.6025137Z Receiving objects:  20% (58/289)
2022-05-08T21:57:16.6026054Z Receiving objects:  21% (61/289)
2022-05-08T21:57:16.6027303Z Receiving objects:  22% (64/289)
2022-05-08T21:57:16.6028415Z Receiving objects:  23% (67/289)
2022-05-08T21:57:16.6030072Z Receiving objects:  24% (70/289)
2022-05-08T21:57:16.6030506Z Receiving objects:  25% (73/289)
2022-05-08T21:57:16.6031291Z Receiving objects:  26% (76/289)
2022-05-08T21:57:16.6032022Z Receiving objects:  27% (79/289)
2022-05-08T21:57:16.6033240Z Receiving objects:  28% (81/289)
2022-05-08T21:57:16.6033831Z Receiving objects:  29% (84/289)
2022-05-08T21:57:16.6034956Z Receiving objects:  30% (87/289)
2022-05-08T21:57:16.6035514Z Receiving objects:  31% (90/289)
2022-05-08T21:57:16.6036336Z Receiving objects:  32% (93/289)
2022-05-08T21:57:16.6036857Z Receiving objects:  33% (96/289)
2022-05-08T21:57:16.6072243Z Receiving objects:  34% (99/289)
2022-05-08T21:57:16.6072637Z Receiving objects:  35% (102/289)
2022-05-08T21:57:16.6072920Z Receiving objects:  36% (105/289)
2022-05-08T21:57:16.6073192Z Receiving objects:  37% (107/289)
2022-05-08T21:57:16.6073473Z Receiving objects:  38% (110/289)
2022-05-08T21:57:16.6073750Z Receiving objects:  39% (113/289)
2022-05-08T21:57:16.6074005Z Receiving objects:  40% (116/289)
2022-05-08T21:57:16.6074790Z Receiving objects:  41% (119/289)
2022-05-08T21:57:16.6075080Z Receiving objects:  42% (122/289)
2022-05-08T21:57:16.6077847Z Receiving objects:  43% (125/289)
2022-05-08T21:57:16.6162302Z Receiving objects:  44% (128/289)
2022-05-08T21:57:16.6162970Z Receiving objects:  45% (131/289)
2022-05-08T21:57:16.6163361Z Receiving objects:  46% (133/289)
2022-05-08T21:57:16.6171568Z Receiving objects:  47% (136/289)
2022-05-08T21:57:16.6172343Z Receiving objects:  48% (139/289)
2022-05-08T21:57:16.6173825Z Receiving objects:  49% (142/289)
2022-05-08T21:57:16.6174539Z Receiving objects:  50% (145/289)
2022-05-08T21:57:16.6180367Z Receiving objects:  51% (148/289)
2022-05-08T21:57:16.6180989Z Receiving objects:  52% (151/289)
2022-05-08T21:57:16.6181423Z Receiving objects:  53% (154/289)
2022-05-08T21:57:16.6183029Z Receiving objects:  54% (157/289)
2022-05-08T21:57:16.6184427Z Receiving objects:  55% (159/289)
2022-05-08T21:57:16.6184938Z Receiving objects:  56% (162/289)
2022-05-08T21:57:16.6186160Z Receiving objects:  57% (165/289)
2022-05-08T21:57:16.6186459Z Receiving objects:  58% (168/289)
2022-05-08T21:57:16.6197131Z Receiving objects:  59% (171/289)
2022-05-08T21:57:16.6197902Z Receiving objects:  60% (174/289)
2022-05-08T21:57:16.6198660Z Receiving objects:  61% (177/289)
2022-05-08T21:57:16.6199404Z Receiving objects:  62% (180/289)
2022-05-08T21:57:16.6200382Z Receiving objects:  63% (183/289)
2022-05-08T21:57:16.6200848Z Receiving objects:  64% (185/289)
2022-05-08T21:57:16.6202086Z Receiving objects:  65% (188/289)
2022-05-08T21:57:16.6202773Z Receiving objects:  66% (191/289)
2022-05-08T21:57:16.6203542Z Receiving objects:  67% (194/289)
2022-05-08T21:57:16.6204313Z Receiving objects:  68% (197/289)
2022-05-08T21:57:16.6229094Z Receiving objects:  69% (200/289)
2022-05-08T21:57:16.6229943Z Receiving objects:  70% (203/289)
2022-05-08T21:57:16.6230486Z Receiving objects:  71% (206/289)
2022-05-08T21:57:16.6231353Z remote: Total 289 (delta 44), reused 3 (delta 3), pack-reused 167        
2022-05-08T21:57:16.6231661Z Receiving objects:  72% (209/289)
2022-05-08T21:57:16.6232803Z Receiving objects:  73% (211/289)
2022-05-08T21:57:16.6233293Z Receiving objects:  74% (214/289)
2022-05-08T21:57:16.6234480Z Receiving objects:  75% (217/289)
2022-05-08T21:57:16.6238659Z Receiving objects:  76% (220/289)
2022-05-08T21:57:16.6239119Z Receiving objects:  77% (223/289)
2022-05-08T21:57:16.6239389Z Receiving objects:  78% (226/289)
2022-05-08T21:57:16.6239630Z Receiving objects:  79% (229/289)
2022-05-08T21:57:16.6239962Z Receiving objects:  80% (232/289)
2022-05-08T21:57:16.6240727Z Receiving objects:  81% (235/289)
2022-05-08T21:57:16.6245526Z Receiving objects:  82% (237/289)
2022-05-08T21:57:16.6246310Z Receiving objects:  83% (240/289)
2022-05-08T21:57:16.6246819Z Receiving objects:  84% (243/289)
2022-05-08T21:57:16.6247383Z Receiving objects:  85% (246/289)
2022-05-08T21:57:16.6247915Z Receiving objects:  86% (249/289)
2022-05-08T21:57:16.6248461Z Receiving objects:  87% (252/289)
2022-05-08T21:57:16.6248843Z Receiving objects:  88% (255/289)
2022-05-08T21:57:16.6249210Z Receiving objects:  89% (258/289)
2022-05-08T21:57:16.6249763Z Receiving objects:  90% (261/289)
2022-05-08T21:57:16.6250700Z Receiving objects:  91% (263/289)
2022-05-08T21:57:16.6251256Z Receiving objects:  92% (266/289)
2022-05-08T21:57:16.6251601Z Receiving objects:  93% (269/289)
2022-05-08T21:57:16.6251952Z Receiving objects:  94% (272/289)
2022-05-08T21:57:16.6252308Z Receiving objects:  95% (275/289)
2022-05-08T21:57:16.6252645Z Receiving objects:  96% (278/289)
2022-05-08T21:57:16.6253006Z Receiving objects:  97% (281/289)
2022-05-08T21:57:16.6253358Z Receiving objects:  98% (284/289)
2022-05-08T21:57:16.6253710Z Receiving objects:  99% (287/289)
2022-05-08T21:57:16.6254059Z Receiving objects: 100% (289/289)
2022-05-08T21:57:16.6254464Z Receiving objects: 100% (289/289), 63.83 KiB | 3.75 MiB/s, done.
2022-05-08T21:57:16.6254854Z Resolving deltas:   0% (0/87)
2022-05-08T21:57:16.6255213Z Resolving deltas:   1% (1/87)
2022-05-08T21:57:16.6255549Z Resolving deltas:   2% (2/87)
2022-05-08T21:57:16.6255901Z Resolving deltas:   3% (3/87)
2022-05-08T21:57:16.6260581Z Resolving deltas:   4% (4/87)
2022-05-08T21:57:16.6261385Z Resolving deltas:   5% (5/87)
2022-05-08T21:57:16.6261636Z Resolving deltas:   6% (6/87)
2022-05-08T21:57:16.6261907Z Resolving deltas:   8% (7/87)
2022-05-08T21:57:16.6262236Z Resolving deltas:   9% (8/87)
2022-05-08T21:57:16.6262517Z Resolving deltas:  10% (9/87)
2022-05-08T21:57:16.6262964Z Resolving deltas:  11% (10/87)
2022-05-08T21:57:16.6263241Z Resolving deltas:  12% (11/87)
2022-05-08T21:57:16.6263496Z Resolving deltas:  13% (12/87)
2022-05-08T21:57:16.6270868Z Resolving deltas:  14% (13/87)
2022-05-08T21:57:16.6271591Z Resolving deltas:  16% (14/87)
2022-05-08T21:57:16.6272429Z Resolving deltas:  17% (15/87)
2022-05-08T21:57:16.6272725Z Resolving deltas:  18% (16/87)
2022-05-08T21:57:16.6273552Z Resolving deltas:  19% (17/87)
2022-05-08T21:57:16.6273822Z Resolving deltas:  20% (18/87)
2022-05-08T21:57:16.6274098Z Resolving deltas:  21% (19/87)
2022-05-08T21:57:16.6274366Z Resolving deltas:  22% (20/87)
2022-05-08T21:57:16.6274644Z Resolving deltas:  24% (21/87)
2022-05-08T21:57:16.6274895Z Resolving deltas:  25% (22/87)
2022-05-08T21:57:16.6275555Z Resolving deltas:  26% (23/87)
2022-05-08T21:57:16.6275858Z Resolving deltas:  27% (24/87)
2022-05-08T21:57:16.6276110Z Resolving deltas:  28% (25/87)
2022-05-08T21:57:16.6276382Z Resolving deltas:  29% (26/87)
2022-05-08T21:57:16.6276653Z Resolving deltas:  31% (27/87)
2022-05-08T21:57:16.6277415Z Resolving deltas:  32% (28/87)
2022-05-08T21:57:16.6278606Z Resolving deltas:  33% (29/87)
2022-05-08T21:57:16.6279802Z Resolving deltas:  34% (30/87)
2022-05-08T21:57:16.6280068Z Resolving deltas:  35% (31/87)
2022-05-08T21:57:16.6281975Z Resolving deltas:  36% (32/87)
2022-05-08T21:57:16.6283088Z Resolving deltas:  37% (33/87)
2022-05-08T21:57:16.6285579Z Resolving deltas:  39% (34/87)
2022-05-08T21:57:16.6285929Z Resolving deltas:  40% (35/87)
2022-05-08T21:57:16.6286196Z Resolving deltas:  41% (36/87)
2022-05-08T21:57:16.6287491Z Resolving deltas:  42% (37/87)
2022-05-08T21:57:16.6288301Z Resolving deltas:  43% (38/87)
2022-05-08T21:57:16.6288592Z Resolving deltas:  44% (39/87)
2022-05-08T21:57:16.6289047Z Resolving deltas:  45% (40/87)
2022-05-08T21:57:16.6289307Z Resolving deltas:  47% (41/87)
2022-05-08T21:57:16.6289562Z Resolving deltas:  48% (42/87)
2022-05-08T21:57:16.6289820Z Resolving deltas:  49% (43/87)
2022-05-08T21:57:16.6290235Z Resolving deltas:  50% (44/87)
2022-05-08T21:57:16.6290501Z Resolving deltas:  51% (45/87)
2022-05-08T21:57:16.6290768Z Resolving deltas:  52% (46/87)
2022-05-08T21:57:16.6291014Z Resolving deltas:  54% (47/87)
2022-05-08T21:57:16.6291275Z Resolving deltas:  55% (48/87)
2022-05-08T21:57:16.6291547Z Resolving deltas:  56% (49/87)
2022-05-08T21:57:16.6291798Z Resolving deltas:  57% (50/87)
2022-05-08T21:57:16.6292060Z Resolving deltas:  58% (51/87)
2022-05-08T21:57:16.6292325Z Resolving deltas:  59% (52/87)
2022-05-08T21:57:16.6292572Z Resolving deltas:  60% (53/87)
2022-05-08T21:57:16.6292837Z Resolving deltas:  62% (54/87)
2022-05-08T21:57:16.6293108Z Resolving deltas:  63% (55/87)
2022-05-08T21:57:16.6293355Z Resolving deltas:  64% (56/87)
2022-05-08T21:57:16.6293615Z Resolving deltas:  65% (57/87)
2022-05-08T21:57:16.6293879Z Resolving deltas:  66% (58/87)
2022-05-08T21:57:16.6294287Z Resolving deltas:  67% (59/87)
2022-05-08T21:57:16.6294706Z Resolving deltas:  68% (60/87)
2022-05-08T21:57:16.6294953Z Resolving deltas:  70% (61/87)
2022-05-08T21:57:16.6295183Z Resolving deltas:  71% (62/87)
2022-05-08T21:57:16.6295429Z Resolving deltas:  72% (63/87)
2022-05-08T21:57:16.6295676Z Resolving deltas:  73% (64/87)
2022-05-08T21:57:16.6295923Z Resolving deltas:  74% (65/87)
2022-05-08T21:57:16.6296159Z Resolving deltas:  75% (66/87)
2022-05-08T21:57:16.6296406Z Resolving deltas:  77% (67/87)
2022-05-08T21:57:16.6296654Z Resolving deltas:  78% (68/87)
2022-05-08T21:57:16.6297067Z Resolving deltas:  79% (69/87)
2022-05-08T21:57:16.6297323Z Resolving deltas:  80% (70/87)
2022-05-08T21:57:16.6297577Z Resolving deltas:  81% (71/87)
2022-05-08T21:57:16.6297819Z Resolving deltas:  82% (72/87)
2022-05-08T21:57:16.6298283Z Resolving deltas:  83% (73/87)
2022-05-08T21:57:16.6298724Z Resolving deltas:  85% (74/87)
2022-05-08T21:57:16.6298979Z Resolving deltas:  86% (75/87)
2022-05-08T21:57:16.6299246Z Resolving deltas:  87% (76/87)
2022-05-08T21:57:16.6299515Z Resolving deltas:  88% (77/87)
2022-05-08T21:57:16.6299764Z Resolving deltas:  89% (78/87)
2022-05-08T21:57:16.6300031Z Resolving deltas:  90% (79/87)
2022-05-08T21:57:16.6300295Z Resolving deltas:  91% (80/87)
2022-05-08T21:57:16.6300540Z Resolving deltas:  93% (81/87)
2022-05-08T21:57:16.6300802Z Resolving deltas:  94% (82/87)
2022-05-08T21:57:16.6301070Z Resolving deltas:  95% (83/87)
2022-05-08T21:57:16.6301320Z Resolving deltas:  96% (84/87)
2022-05-08T21:57:16.6301584Z Resolving deltas:  97% (85/87)
2022-05-08T21:57:16.6301847Z Resolving deltas:  98% (86/87)
2022-05-08T21:57:16.6302108Z Resolving deltas: 100% (87/87)
2022-05-08T21:57:16.6302367Z Resolving deltas: 100% (87/87), done.
2022-05-08T21:57:16.6386302Z From https://github.com/alexfiz/my_demo_git
2022-05-08T21:57:16.6387457Z  * [new branch]      main                                     -> origin/main
2022-05-08T21:57:16.6388746Z  * [new branch]      second                                   -> origin/second
2022-05-08T21:57:16.6389533Z  * [new ref]         f70ae18ec213788f8e1b803c5cdbf521362b426c -> pull/44/merge
2022-05-08T21:57:16.6441423Z ##[endgroup]
2022-05-08T21:57:16.6442317Z ##[group]Determining the checkout info
2022-05-08T21:57:16.6443906Z ##[endgroup]
2022-05-08T21:57:16.6444815Z ##[group]Checking out the ref
2022-05-08T21:57:16.6446287Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/44/merge
2022-05-08T21:57:16.6491016Z Note: switching to 'refs/remotes/pull/44/merge'.
2022-05-08T21:57:16.6491359Z 
2022-05-08T21:57:16.6491844Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-08T21:57:16.6492383Z changes and commit them, and you can discard any commits you make in this
2022-05-08T21:57:16.6493399Z state without impacting any branches by switching back to a branch.
2022-05-08T21:57:16.6493879Z 
2022-05-08T21:57:16.6494322Z If you want to create a new branch to retain commits you create, you may
2022-05-08T21:57:16.6495119Z do so (now or later) by using -c with the switch command. Example:
2022-05-08T21:57:16.6495452Z 
2022-05-08T21:57:16.6495755Z   git switch -c <new-branch-name>
2022-05-08T21:57:16.6496025Z 
2022-05-08T21:57:16.6496244Z Or undo this operation with:
2022-05-08T21:57:16.6496511Z 
2022-05-08T21:57:16.6496701Z   git switch -
2022-05-08T21:57:16.6496943Z 
2022-05-08T21:57:16.6497252Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-08T21:57:16.6497599Z 
2022-05-08T21:57:16.6497937Z HEAD is now at f70ae18 Merge d208a0c540045af7415f20c5e465eaebf909ed88 into e865021480cc01c1a2b623d35704fd91af5fa939
2022-05-08T21:57:16.6498800Z ##[endgroup]
2022-05-08T21:57:16.6568210Z [command]/usr/bin/git log -1 --format='%H'
2022-05-08T21:57:16.6600058Z 'f70ae18ec213788f8e1b803c5cdbf521362b426c'
2022-05-08T21:57:16.6967570Z ##[group]Run jitterbit/get-changed-files@v1
2022-05-08T21:57:16.6967906Z with:
2022-05-08T21:57:16.6968310Z   token: ***
2022-05-08T21:57:16.6968563Z   format: space-delimited
2022-05-08T21:57:16.6969125Z ##[endgroup]
2022-05-08T21:57:16.9634919Z Base commit: e865021480cc01c1a2b623d35704fd91af5fa939
2022-05-08T21:57:16.9635949Z Head commit: d208a0c540045af7415f20c5e465eaebf909ed88
2022-05-08T21:57:17.2640371Z All: test2_TAB.txt test_TAB.txt
2022-05-08T21:57:17.2652180Z Added: 
2022-05-08T21:57:17.2655812Z Modified: test2_TAB.txt test_TAB.txt
2022-05-08T21:57:17.2656695Z Removed: 
2022-05-08T21:57:17.2657154Z Renamed: 
2022-05-08T21:57:17.2657899Z Added or modified: test2_TAB.txt test_TAB.txt
2022-05-08T21:57:17.2878245Z ##[group]Run for changed_file in test2_TAB.txt test_TAB.txt; do
2022-05-08T21:57:17.2878742Z [36;1mfor changed_file in test2_TAB.txt test_TAB.txt; do[0m
2022-05-08T21:57:17.2879099Z [36;1mecho "File ${changed_file} checked, tab found" >> TAB.log[0m
2022-05-08T21:57:17.2879656Z [36;1mgrep -P '\t' ${changed_file} | sort -n >> TAB.log[0m
2022-05-08T21:57:17.2879919Z [36;1mdone[0m
2022-05-08T21:57:17.2946769Z shell: /usr/bin/bash -e {0}
2022-05-08T21:57:17.2947436Z ##[endgroup]
2022-05-08T21:57:17.3240681Z ##[group]Run actions/upload-artifact@v2
2022-05-08T21:57:17.3240999Z with:
2022-05-08T21:57:17.3241645Z   path: TAB.log
2022-05-08T21:57:17.3241875Z   name: artifact
2022-05-08T21:57:17.3242107Z   if-no-files-found: warn
2022-05-08T21:57:17.3242355Z ##[endgroup]
2022-05-08T21:57:17.3974086Z With the provided path, there will be 1 file uploaded
2022-05-08T21:57:17.3979132Z Starting artifact upload
2022-05-08T21:57:17.3980468Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-08T21:57:17.3981705Z Artifact name is valid!
2022-05-08T21:57:17.5208595Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-08T21:57:17.6666574Z Total size of all the files uploaded is 86 bytes
2022-05-08T21:57:17.6667439Z File upload process has finished. Finalizing the artifact upload
2022-05-08T21:57:17.7619382Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-08T21:57:17.7619667Z 
2022-05-08T21:57:17.7619850Z The raw size of all the files that were specified for upload is 119 bytes
2022-05-08T21:57:17.7620348Z The size of all the files that were uploaded is 86 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-08T21:57:17.7620657Z 
2022-05-08T21:57:17.7621453Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-08T21:57:17.7621835Z 
2022-05-08T21:57:17.7621988Z Artifact artifact has been successfully uploaded!
2022-05-08T21:57:17.7740092Z Post job cleanup.
2022-05-08T21:57:17.9302710Z [command]/usr/bin/git version
2022-05-08T21:57:17.9410250Z git version 2.36.0
2022-05-08T21:57:17.9493908Z Temporarily overriding HOME='/home/runner/work/_temp/74440f20-41fb-4170-b808-9b7230721cee' before making global git config changes
2022-05-08T21:57:17.9497650Z Adding repository directory to the temporary git global config as a safe directory
2022-05-08T21:57:17.9506692Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
2022-05-08T21:57:17.9572619Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-08T21:57:17.9658496Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-08T21:57:17.9981774Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-08T21:57:18.0045751Z http.https://github.com/.extraheader
2022-05-08T21:57:18.0065066Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-08T21:57:18.0128179Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-08T21:57:18.0748117Z Cleaning up orphan processes
```