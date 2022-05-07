## 04.GITOPS HOMEWORK
### My action file
```bash
https://github.com/hladki/my_repos/blob/main/.github/workflows/find_tab.yaml
```
### My test repository
```bash
https://github.com/hladki/my_repos
```
### My pipeline log

```bash
2022-05-07T20:41:37.6272156Z Requested labels: ubuntu-latest
2022-05-07T20:41:37.6272229Z Job defined at: hladki/my_repos/.github/workflows/find_tab.yaml@refs/pull/1/merge
2022-05-07T20:41:37.6272251Z Waiting for a runner to pick up this job...
2022-05-07T20:41:38.0666637Z Job is waiting for a hosted runner to come online.
2022-05-07T20:41:42.3335377Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-07T20:41:44.4822363Z Current runner version: '2.291.1'
2022-05-07T20:41:44.4857025Z ##[group]Operating System
2022-05-07T20:41:44.4857636Z Ubuntu
2022-05-07T20:41:44.4857910Z 20.04.4
2022-05-07T20:41:44.4858307Z LTS
2022-05-07T20:41:44.4858572Z ##[endgroup]
2022-05-07T20:41:44.4858919Z ##[group]Virtual Environment
2022-05-07T20:41:44.4859313Z Environment: ubuntu-20.04
2022-05-07T20:41:44.4859716Z Version: 20220503.1
2022-05-07T20:41:44.4860215Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-07T20:41:44.4860913Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-07T20:41:44.4861391Z ##[endgroup]
2022-05-07T20:41:44.4861730Z ##[group]Virtual Environment Provisioner
2022-05-07T20:41:44.4862184Z 1.0.0.0-main-20220421-1
2022-05-07T20:41:44.4862518Z ##[endgroup]
2022-05-07T20:41:44.4863463Z ##[group]GITHUB_TOKEN Permissions
2022-05-07T20:41:44.4864185Z Actions: write
2022-05-07T20:41:44.4864718Z Checks: write
2022-05-07T20:41:44.4865078Z Contents: write
2022-05-07T20:41:44.4865432Z Deployments: write
2022-05-07T20:41:44.4865757Z Discussions: write
2022-05-07T20:41:44.4866133Z Issues: write
2022-05-07T20:41:44.4866407Z Metadata: read
2022-05-07T20:41:44.4866733Z Packages: write
2022-05-07T20:41:44.4867076Z Pages: write
2022-05-07T20:41:44.4867362Z PullRequests: write
2022-05-07T20:41:44.4867768Z RepositoryProjects: write
2022-05-07T20:41:44.4868294Z SecurityEvents: write
2022-05-07T20:41:44.4868779Z Statuses: write
2022-05-07T20:41:44.4869116Z ##[endgroup]
2022-05-07T20:41:44.4876476Z Secret source: Actions
2022-05-07T20:41:44.4877213Z Prepare workflow directory
2022-05-07T20:41:44.5968377Z Prepare all required actions
2022-05-07T20:41:44.6202020Z Getting action download info
2022-05-07T20:41:44.8126596Z Download action repository 'actions/checkout@v3' (SHA:2541b1294d2704b0964813337f33b291d3f8596b)
2022-05-07T20:41:45.1826793Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-05-07T20:41:45.3126909Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-07T20:41:45.6629928Z Getting action download info
2022-05-07T20:41:45.7852187Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-05-07T20:41:46.1396232Z ##[group]Run actions/checkout@v3
2022-05-07T20:41:46.1396558Z with:
2022-05-07T20:41:46.1396744Z   fetch-depth: 0
2022-05-07T20:41:46.1396981Z   repository: hladki/my_repos
2022-05-07T20:41:46.1397379Z   token: ***
2022-05-07T20:41:46.1397571Z   ssh-strict: true
2022-05-07T20:41:46.1397797Z   persist-credentials: true
2022-05-07T20:41:46.1398028Z   clean: true
2022-05-07T20:41:46.1398202Z   lfs: false
2022-05-07T20:41:46.1398404Z   submodules: false
2022-05-07T20:41:46.1398802Z   set-safe-directory: true
2022-05-07T20:41:46.1399193Z ##[endgroup]
2022-05-07T20:41:46.5013756Z Syncing repository: hladki/my_repos
2022-05-07T20:41:46.5016130Z ##[group]Getting Git version info
2022-05-07T20:41:46.5017025Z Working directory is '/home/runner/work/my_repos/my_repos'
2022-05-07T20:41:46.5017578Z [command]/usr/bin/git version
2022-05-07T20:41:46.5178454Z git version 2.36.0
2022-05-07T20:41:46.5197508Z ##[endgroup]
2022-05-07T20:41:46.5222382Z Temporarily overriding HOME='/home/runner/work/_temp/14e2ed4a-2e7f-446a-ac11-7fe046e5babd' before making global git config changes
2022-05-07T20:41:46.5222860Z Adding repository directory to the temporary git global config as a safe directory
2022-05-07T20:41:46.5228491Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_repos/my_repos
2022-05-07T20:41:46.5279571Z Deleting the contents of '/home/runner/work/my_repos/my_repos'
2022-05-07T20:41:46.5283354Z ##[group]Initializing the repository
2022-05-07T20:41:46.5288942Z [command]/usr/bin/git init /home/runner/work/my_repos/my_repos
2022-05-07T20:41:46.5409801Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-07T20:41:46.5411754Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-07T20:41:46.5412542Z hint: of your new repositories, which will suppress this warning, call:
2022-05-07T20:41:46.5413377Z hint: 
2022-05-07T20:41:46.5413953Z hint: 	git config --global init.defaultBranch <name>
2022-05-07T20:41:46.5414468Z hint: 
2022-05-07T20:41:46.5415063Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-07T20:41:46.5415953Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-07T20:41:46.5416776Z hint: 
2022-05-07T20:41:46.5423014Z hint: 	git branch -m <name>
2022-05-07T20:41:46.5430145Z Initialized empty Git repository in /home/runner/work/my_repos/my_repos/.git/
2022-05-07T20:41:46.5438318Z [command]/usr/bin/git remote add origin https://github.com/hladki/my_repos
2022-05-07T20:41:46.5491084Z ##[endgroup]
2022-05-07T20:41:46.5492083Z ##[group]Disabling automatic garbage collection
2022-05-07T20:41:46.5500370Z [command]/usr/bin/git config --local gc.auto 0
2022-05-07T20:41:46.5548121Z ##[endgroup]
2022-05-07T20:41:46.5549236Z ##[group]Setting up auth
2022-05-07T20:41:46.5564454Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-07T20:41:46.5604391Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-07T20:41:46.6050051Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-07T20:41:46.6079770Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-07T20:41:46.6333237Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-07T20:41:46.6380483Z ##[endgroup]
2022-05-07T20:41:46.6383074Z ##[group]Fetching the repository
2022-05-07T20:41:46.6392883Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +94e8805567337b4309a5214ff5ae84f1f3bac063:refs/remotes/pull/1/merge
2022-05-07T20:41:46.8728763Z remote: Enumerating objects: 125, done.        
2022-05-07T20:41:46.8729846Z remote: Counting objects:   0% (1/125)        
2022-05-07T20:41:46.8731266Z remote: Counting objects:   1% (2/125)        
2022-05-07T20:41:46.8732094Z remote: Counting objects:   2% (3/125)        
2022-05-07T20:41:46.8733332Z remote: Counting objects:   3% (4/125)        
2022-05-07T20:41:46.8733765Z remote: Counting objects:   4% (5/125)        
2022-05-07T20:41:46.8734017Z remote: Counting objects:   5% (7/125)        
2022-05-07T20:41:46.8734268Z remote: Counting objects:   6% (8/125)        
2022-05-07T20:41:46.8734829Z remote: Counting objects:   7% (9/125)        
2022-05-07T20:41:46.8735078Z remote: Counting objects:   8% (10/125)        
2022-05-07T20:41:46.8735347Z remote: Counting objects:   9% (12/125)        
2022-05-07T20:41:46.8735580Z remote: Counting objects:  10% (13/125)        
2022-05-07T20:41:46.8735827Z remote: Counting objects:  11% (14/125)        
2022-05-07T20:41:46.8736079Z remote: Counting objects:  12% (15/125)        
2022-05-07T20:41:46.8738021Z remote: Counting objects:  13% (17/125)        
2022-05-07T20:41:46.8739099Z remote: Counting objects:  14% (18/125)        
2022-05-07T20:41:46.8740016Z remote: Counting objects:  15% (19/125)        
2022-05-07T20:41:46.8741020Z remote: Counting objects:  16% (20/125)        
2022-05-07T20:41:46.8743375Z remote: Counting objects:  17% (22/125)        
2022-05-07T20:41:46.8744731Z remote: Counting objects:  18% (23/125)        
2022-05-07T20:41:46.8745742Z remote: Counting objects:  19% (24/125)        
2022-05-07T20:41:46.8747489Z remote: Counting objects:  20% (25/125)        
2022-05-07T20:41:46.8749525Z remote: Counting objects:  21% (27/125)        
2022-05-07T20:41:46.8750628Z remote: Counting objects:  22% (28/125)        
2022-05-07T20:41:46.8751510Z remote: Counting objects:  23% (29/125)        
2022-05-07T20:41:46.8752780Z remote: Counting objects:  24% (30/125)        
2022-05-07T20:41:46.8753680Z remote: Counting objects:  25% (32/125)        
2022-05-07T20:41:46.8754711Z remote: Counting objects:  26% (33/125)        
2022-05-07T20:41:46.8755640Z remote: Counting objects:  27% (34/125)        
2022-05-07T20:41:46.8756749Z remote: Counting objects:  28% (35/125)        
2022-05-07T20:41:46.8757615Z remote: Counting objects:  29% (37/125)        
2022-05-07T20:41:46.8758567Z remote: Counting objects:  30% (38/125)        
2022-05-07T20:41:46.8759414Z remote: Counting objects:  31% (39/125)        
2022-05-07T20:41:46.8760291Z remote: Counting objects:  32% (40/125)        
2022-05-07T20:41:46.8760777Z remote: Counting objects:  33% (42/125)        
2022-05-07T20:41:46.8761609Z remote: Counting objects:  34% (43/125)        
2022-05-07T20:41:46.8762311Z remote: Counting objects:  35% (44/125)        
2022-05-07T20:41:46.8763089Z remote: Counting objects:  36% (45/125)        
2022-05-07T20:41:46.8763760Z remote: Counting objects:  37% (47/125)        
2022-05-07T20:41:46.8764705Z remote: Counting objects:  38% (48/125)        
2022-05-07T20:41:46.8765402Z remote: Counting objects:  39% (49/125)        
2022-05-07T20:41:46.8766132Z remote: Counting objects:  40% (50/125)        
2022-05-07T20:41:46.8767016Z remote: Counting objects:  41% (52/125)        
2022-05-07T20:41:46.8767748Z remote: Counting objects:  42% (53/125)        
2022-05-07T20:41:46.8768673Z remote: Counting objects:  43% (54/125)        
2022-05-07T20:41:46.8769377Z remote: Counting objects:  44% (55/125)        
2022-05-07T20:41:46.8770299Z remote: Counting objects:  45% (57/125)        
2022-05-07T20:41:46.8770988Z remote: Counting objects:  46% (58/125)        
2022-05-07T20:41:46.8772334Z remote: Counting objects:  47% (59/125)        
2022-05-07T20:41:46.8773075Z remote: Counting objects:  48% (60/125)        
2022-05-07T20:41:46.8819881Z remote: Counting objects:  49% (62/125)        
2022-05-07T20:41:46.8825155Z remote: Counting objects:  50% (63/125)        
2022-05-07T20:41:46.8825990Z remote: Counting objects:  51% (64/125)        
2022-05-07T20:41:46.8826419Z remote: Counting objects:  52% (65/125)        
2022-05-07T20:41:46.8826691Z remote: Counting objects:  53% (67/125)        
2022-05-07T20:41:46.8826934Z remote: Counting objects:  54% (68/125)        
2022-05-07T20:41:46.8827161Z remote: Counting objects:  55% (69/125)        
2022-05-07T20:41:46.8827571Z remote: Counting objects:  56% (70/125)        
2022-05-07T20:41:46.8827809Z remote: Counting objects:  57% (72/125)        
2022-05-07T20:41:46.8828043Z remote: Counting objects:  58% (73/125)        
2022-05-07T20:41:46.8828468Z remote: Counting objects:  59% (74/125)        
2022-05-07T20:41:46.8829212Z remote: Counting objects:  60% (75/125)        
2022-05-07T20:41:46.8829919Z remote: Counting objects:  61% (77/125)        
2022-05-07T20:41:46.8830473Z remote: Counting objects:  62% (78/125)        
2022-05-07T20:41:46.8831101Z remote: Counting objects:  63% (79/125)        
2022-05-07T20:41:46.8831808Z remote: Counting objects:  64% (80/125)        
2022-05-07T20:41:46.8834203Z remote: Counting objects:  65% (82/125)        
2022-05-07T20:41:46.8834490Z remote: Counting objects:  66% (83/125)        
2022-05-07T20:41:46.8834931Z remote: Counting objects:  67% (84/125)        
2022-05-07T20:41:46.8835436Z remote: Counting objects:  68% (85/125)        
2022-05-07T20:41:46.8835733Z remote: Counting objects:  69% (87/125)        
2022-05-07T20:41:46.8835993Z remote: Counting objects:  70% (88/125)        
2022-05-07T20:41:46.8836230Z remote: Counting objects:  71% (89/125)        
2022-05-07T20:41:46.8836482Z remote: Counting objects:  72% (90/125)        
2022-05-07T20:41:46.8836917Z remote: Counting objects:  73% (92/125)        
2022-05-07T20:41:46.8837177Z remote: Counting objects:  74% (93/125)        
2022-05-07T20:41:46.8837811Z remote: Counting objects:  75% (94/125)        
2022-05-07T20:41:46.8838267Z remote: Counting objects:  76% (95/125)        
2022-05-07T20:41:46.8838866Z remote: Counting objects:  77% (97/125)        
2022-05-07T20:41:46.8839099Z remote: Counting objects:  78% (98/125)        
2022-05-07T20:41:46.8839351Z remote: Counting objects:  79% (99/125)        
2022-05-07T20:41:46.8839604Z remote: Counting objects:  80% (100/125)        
2022-05-07T20:41:46.8839846Z remote: Counting objects:  81% (102/125)        
2022-05-07T20:41:46.8840097Z remote: Counting objects:  82% (103/125)        
2022-05-07T20:41:46.8840501Z remote: Counting objects:  83% (104/125)        
2022-05-07T20:41:46.8840731Z remote: Counting objects:  84% (105/125)        
2022-05-07T20:41:46.8840977Z remote: Counting objects:  85% (107/125)        
2022-05-07T20:41:46.8841218Z remote: Counting objects:  86% (108/125)        
2022-05-07T20:41:46.8841612Z remote: Counting objects:  87% (109/125)        
2022-05-07T20:41:46.8841840Z remote: Counting objects:  88% (110/125)        
2022-05-07T20:41:46.8842075Z remote: Counting objects:  89% (112/125)        
2022-05-07T20:41:46.8842309Z remote: Counting objects:  90% (113/125)        
2022-05-07T20:41:46.8842528Z remote: Counting objects:  91% (114/125)        
2022-05-07T20:41:46.8842768Z remote: Counting objects:  92% (115/125)        
2022-05-07T20:41:46.8843001Z remote: Counting objects:  93% (117/125)        
2022-05-07T20:41:46.8843220Z remote: Counting objects:  94% (118/125)        
2022-05-07T20:41:46.8843451Z remote: Counting objects:  95% (119/125)        
2022-05-07T20:41:46.8843690Z remote: Counting objects:  96% (120/125)        
2022-05-07T20:41:46.8843907Z remote: Counting objects:  97% (122/125)        
2022-05-07T20:41:46.8844144Z remote: Counting objects:  98% (123/125)        
2022-05-07T20:41:46.8844379Z remote: Counting objects:  99% (124/125)        
2022-05-07T20:41:46.8844787Z remote: Counting objects: 100% (125/125)        
2022-05-07T20:41:46.8845040Z remote: Counting objects: 100% (125/125), done.        
2022-05-07T20:41:46.8845515Z remote: Compressing objects:   1% (1/53)        
2022-05-07T20:41:46.8845775Z remote: Compressing objects:   3% (2/53)        
2022-05-07T20:41:46.8846020Z remote: Compressing objects:   5% (3/53)        
2022-05-07T20:41:46.8846361Z remote: Compressing objects:   7% (4/53)        
2022-05-07T20:41:46.8846639Z remote: Compressing objects:   9% (5/53)        
2022-05-07T20:41:46.8846884Z remote: Compressing objects:  11% (6/53)        
2022-05-07T20:41:46.8847139Z remote: Compressing objects:  13% (7/53)        
2022-05-07T20:41:46.8847401Z remote: Compressing objects:  15% (8/53)        
2022-05-07T20:41:46.8847643Z remote: Compressing objects:  16% (9/53)        
2022-05-07T20:41:46.8847905Z remote: Compressing objects:  18% (10/53)        
2022-05-07T20:41:46.8848330Z remote: Compressing objects:  20% (11/53)        
2022-05-07T20:41:46.8848587Z remote: Compressing objects:  22% (12/53)        
2022-05-07T20:41:46.8848987Z remote: Compressing objects:  24% (13/53)        
2022-05-07T20:41:46.8849232Z remote: Compressing objects:  26% (14/53)        
2022-05-07T20:41:46.8849476Z remote: Compressing objects:  28% (15/53)        
2022-05-07T20:41:46.8849702Z remote: Compressing objects:  30% (16/53)        
2022-05-07T20:41:46.8850123Z remote: Compressing objects:  32% (17/53)        
2022-05-07T20:41:46.8850545Z remote: Compressing objects:  33% (18/53)        
2022-05-07T20:41:46.8850974Z remote: Compressing objects:  35% (19/53)        
2022-05-07T20:41:46.8851245Z remote: Compressing objects:  37% (20/53)        
2022-05-07T20:41:46.8851978Z remote: Compressing objects:  39% (21/53)        
2022-05-07T20:41:46.8852444Z remote: Compressing objects:  41% (22/53)        
2022-05-07T20:41:46.8852713Z remote: Compressing objects:  43% (23/53)        
2022-05-07T20:41:46.8853105Z remote: Compressing objects:  45% (24/53)        
2022-05-07T20:41:46.8853386Z remote: Compressing objects:  47% (25/53)        
2022-05-07T20:41:46.8853794Z remote: Compressing objects:  49% (26/53)        
2022-05-07T20:41:46.8854234Z remote: Compressing objects:  50% (27/53)        
2022-05-07T20:41:46.8854837Z remote: Compressing objects:  52% (28/53)        
2022-05-07T20:41:46.8855089Z remote: Compressing objects:  54% (29/53)        
2022-05-07T20:41:46.8855363Z remote: Compressing objects:  56% (30/53)        
2022-05-07T20:41:46.8856040Z remote: Compressing objects:  58% (31/53)        
2022-05-07T20:41:46.8856635Z remote: Compressing objects:  60% (32/53)        
2022-05-07T20:41:46.8856918Z remote: Compressing objects:  62% (33/53)        
2022-05-07T20:41:46.8857176Z remote: Compressing objects:  64% (34/53)        
2022-05-07T20:41:46.8857432Z remote: Compressing objects:  66% (35/53)        
2022-05-07T20:41:46.8857673Z remote: Compressing objects:  67% (36/53)        
2022-05-07T20:41:46.8857928Z remote: Compressing objects:  69% (37/53)        
2022-05-07T20:41:46.8858183Z remote: Compressing objects:  71% (38/53)        
2022-05-07T20:41:46.8858582Z remote: Compressing objects:  73% (39/53)        
2022-05-07T20:41:46.8858831Z remote: Compressing objects:  75% (40/53)        
2022-05-07T20:41:46.8859078Z remote: Compressing objects:  77% (41/53)        
2022-05-07T20:41:46.8859309Z remote: Compressing objects:  79% (42/53)        
2022-05-07T20:41:46.8859561Z remote: Compressing objects:  81% (43/53)        
2022-05-07T20:41:46.8859811Z remote: Compressing objects:  83% (44/53)        
2022-05-07T20:41:46.8860209Z remote: Compressing objects:  84% (45/53)        
2022-05-07T20:41:46.8860439Z remote: Compressing objects:  86% (46/53)        
2022-05-07T20:41:46.8860681Z remote: Compressing objects:  88% (47/53)        
2022-05-07T20:41:46.8860922Z remote: Compressing objects:  90% (48/53)        
2022-05-07T20:41:46.8862908Z remote: Compressing objects:  92% (49/53)        
2022-05-07T20:41:46.8863232Z remote: Compressing objects:  94% (50/53)        
2022-05-07T20:41:46.8863480Z remote: Compressing objects:  96% (51/53)        
2022-05-07T20:41:46.8863720Z remote: Compressing objects:  98% (52/53)        
2022-05-07T20:41:46.8864456Z remote: Compressing objects: 100% (53/53)        
2022-05-07T20:41:46.8864931Z remote: Compressing objects: 100% (53/53), done.        
2022-05-07T20:41:46.8866492Z remote: Total 125 (delta 35), reused 99 (delta 19), pack-reused 0        
2022-05-07T20:41:46.8913101Z Receiving objects:   0% (1/125)
2022-05-07T20:41:46.8913750Z Receiving objects:   1% (2/125)
2022-05-07T20:41:46.8915063Z Receiving objects:   2% (3/125)
2022-05-07T20:41:46.8915884Z Receiving objects:   3% (4/125)
2022-05-07T20:41:46.8916637Z Receiving objects:   4% (5/125)
2022-05-07T20:41:46.8917395Z Receiving objects:   5% (7/125)
2022-05-07T20:41:46.8918262Z Receiving objects:   6% (8/125)
2022-05-07T20:41:46.8918463Z Receiving objects:   7% (9/125)
2022-05-07T20:41:46.8918679Z Receiving objects:   8% (10/125)
2022-05-07T20:41:46.8919037Z Receiving objects:   9% (12/125)
2022-05-07T20:41:46.8919814Z Receiving objects:  10% (13/125)
2022-05-07T20:41:46.8920197Z Receiving objects:  11% (14/125)
2022-05-07T20:41:46.8920948Z Receiving objects:  12% (15/125)
2022-05-07T20:41:46.8921934Z Receiving objects:  13% (17/125)
2022-05-07T20:41:46.8922491Z Receiving objects:  14% (18/125)
2022-05-07T20:41:46.8923255Z Receiving objects:  15% (19/125)
2022-05-07T20:41:46.8923496Z Receiving objects:  16% (20/125)
2022-05-07T20:41:46.8928214Z Receiving objects:  17% (22/125)
2022-05-07T20:41:46.8928632Z Receiving objects:  18% (23/125)
2022-05-07T20:41:46.8929325Z Receiving objects:  19% (24/125)
2022-05-07T20:41:46.8929868Z Receiving objects:  20% (25/125)
2022-05-07T20:41:46.8931017Z Receiving objects:  21% (27/125)
2022-05-07T20:41:46.8931392Z Receiving objects:  22% (28/125)
2022-05-07T20:41:46.8932205Z Receiving objects:  23% (29/125)
2022-05-07T20:41:46.8932581Z Receiving objects:  24% (30/125)
2022-05-07T20:41:46.8934704Z Receiving objects:  25% (32/125)
2022-05-07T20:41:46.8935078Z Receiving objects:  26% (33/125)
2022-05-07T20:41:46.8935893Z Receiving objects:  27% (34/125)
2022-05-07T20:41:46.8936947Z Receiving objects:  28% (35/125)
2022-05-07T20:41:46.8937181Z Receiving objects:  29% (37/125)
2022-05-07T20:41:46.8937400Z Receiving objects:  30% (38/125)
2022-05-07T20:41:46.8937761Z Receiving objects:  31% (39/125)
2022-05-07T20:41:46.8937977Z Receiving objects:  32% (40/125)
2022-05-07T20:41:46.8938190Z Receiving objects:  33% (42/125)
2022-05-07T20:41:46.8938403Z Receiving objects:  34% (43/125)
2022-05-07T20:41:46.8938633Z Receiving objects:  35% (44/125)
2022-05-07T20:41:46.8938828Z Receiving objects:  36% (45/125)
2022-05-07T20:41:46.8939038Z Receiving objects:  37% (47/125)
2022-05-07T20:41:46.8939251Z Receiving objects:  38% (48/125)
2022-05-07T20:41:46.8939449Z Receiving objects:  39% (49/125)
2022-05-07T20:41:46.8939657Z Receiving objects:  40% (50/125)
2022-05-07T20:41:46.8939867Z Receiving objects:  41% (52/125)
2022-05-07T20:41:46.8940235Z Receiving objects:  42% (53/125)
2022-05-07T20:41:46.8940793Z Receiving objects:  43% (54/125)
2022-05-07T20:41:46.8941206Z Receiving objects:  44% (55/125)
2022-05-07T20:41:46.8941425Z Receiving objects:  45% (57/125)
2022-05-07T20:41:46.8947529Z Receiving objects:  46% (58/125)
2022-05-07T20:41:46.8948236Z Receiving objects:  47% (59/125)
2022-05-07T20:41:46.8948456Z Receiving objects:  48% (60/125)
2022-05-07T20:41:46.8948666Z Receiving objects:  49% (62/125)
2022-05-07T20:41:46.8948879Z Receiving objects:  50% (63/125)
2022-05-07T20:41:46.8949096Z Receiving objects:  51% (64/125)
2022-05-07T20:41:46.8949297Z Receiving objects:  52% (65/125)
2022-05-07T20:41:46.8949511Z Receiving objects:  53% (67/125)
2022-05-07T20:41:46.8949893Z Receiving objects:  54% (68/125)
2022-05-07T20:41:46.8950616Z Receiving objects:  55% (69/125)
2022-05-07T20:41:46.8951144Z Receiving objects:  56% (70/125)
2022-05-07T20:41:46.8951981Z Receiving objects:  57% (72/125)
2022-05-07T20:41:46.8952593Z Receiving objects:  58% (73/125)
2022-05-07T20:41:46.8953179Z Receiving objects:  59% (74/125)
2022-05-07T20:41:46.8953928Z Receiving objects:  60% (75/125)
2022-05-07T20:41:46.8954304Z Receiving objects:  61% (77/125)
2022-05-07T20:41:46.8955225Z Receiving objects:  62% (78/125)
2022-05-07T20:41:46.8955774Z Receiving objects:  63% (79/125)
2022-05-07T20:41:46.8956595Z Receiving objects:  64% (80/125)
2022-05-07T20:41:46.8956959Z Receiving objects:  65% (82/125)
2022-05-07T20:41:46.8957934Z Receiving objects:  66% (83/125)
2022-05-07T20:41:46.8958449Z Receiving objects:  67% (84/125)
2022-05-07T20:41:46.8958667Z Receiving objects:  68% (85/125)
2022-05-07T20:41:46.8958882Z Receiving objects:  69% (87/125)
2022-05-07T20:41:46.8959077Z Receiving objects:  70% (88/125)
2022-05-07T20:41:46.8959286Z Receiving objects:  71% (89/125)
2022-05-07T20:41:46.8959498Z Receiving objects:  72% (90/125)
2022-05-07T20:41:46.8959690Z Receiving objects:  73% (92/125)
2022-05-07T20:41:46.8959900Z Receiving objects:  74% (93/125)
2022-05-07T20:41:46.8960110Z Receiving objects:  75% (94/125)
2022-05-07T20:41:46.8960305Z Receiving objects:  76% (95/125)
2022-05-07T20:41:46.8960878Z Receiving objects:  77% (97/125)
2022-05-07T20:41:46.8961095Z Receiving objects:  78% (98/125)
2022-05-07T20:41:46.8961361Z Receiving objects:  79% (99/125)
2022-05-07T20:41:46.8961562Z Receiving objects:  80% (100/125)
2022-05-07T20:41:46.8961780Z Receiving objects:  81% (102/125)
2022-05-07T20:41:46.8962000Z Receiving objects:  82% (103/125)
2022-05-07T20:41:46.8962201Z Receiving objects:  83% (104/125)
2022-05-07T20:41:46.8962410Z Receiving objects:  84% (105/125)
2022-05-07T20:41:46.8962622Z Receiving objects:  85% (107/125)
2022-05-07T20:41:46.8962820Z Receiving objects:  86% (108/125)
2022-05-07T20:41:46.8963030Z Receiving objects:  87% (109/125)
2022-05-07T20:41:46.8963239Z Receiving objects:  88% (110/125)
2022-05-07T20:41:46.8963433Z Receiving objects:  89% (112/125)
2022-05-07T20:41:46.8963647Z Receiving objects:  90% (113/125)
2022-05-07T20:41:46.8963856Z Receiving objects:  91% (114/125)
2022-05-07T20:41:46.8964238Z Receiving objects:  92% (115/125)
2022-05-07T20:41:46.8965572Z Receiving objects:  93% (117/125)
2022-05-07T20:41:46.8966850Z Receiving objects:  94% (118/125)
2022-05-07T20:41:46.8967280Z Receiving objects:  95% (119/125)
2022-05-07T20:41:46.8967497Z Receiving objects:  96% (120/125)
2022-05-07T20:41:46.8967865Z Receiving objects:  97% (122/125)
2022-05-07T20:41:46.8968701Z Receiving objects:  98% (123/125)
2022-05-07T20:41:46.8969306Z Receiving objects:  99% (124/125)
2022-05-07T20:41:46.8970350Z Receiving objects: 100% (125/125)
2022-05-07T20:41:46.8971006Z Receiving objects: 100% (125/125), 12.10 KiB | 2.42 MiB/s, done.
2022-05-07T20:41:46.8972050Z Resolving deltas:   0% (0/35)
2022-05-07T20:41:46.8979643Z Resolving deltas:   2% (1/35)
2022-05-07T20:41:46.8980051Z Resolving deltas:   5% (2/35)
2022-05-07T20:41:46.8981351Z Resolving deltas:   8% (3/35)
2022-05-07T20:41:46.8981861Z Resolving deltas:  11% (4/35)
2022-05-07T20:41:46.8982072Z Resolving deltas:  14% (5/35)
2022-05-07T20:41:46.8982293Z Resolving deltas:  17% (6/35)
2022-05-07T20:41:46.8982693Z Resolving deltas:  20% (7/35)
2022-05-07T20:41:46.8982916Z Resolving deltas:  22% (8/35)
2022-05-07T20:41:46.8983146Z Resolving deltas:  25% (9/35)
2022-05-07T20:41:46.8983560Z Resolving deltas:  28% (10/35)
2022-05-07T20:41:46.8984983Z Resolving deltas:  31% (11/35)
2022-05-07T20:41:46.8985295Z Resolving deltas:  34% (12/35)
2022-05-07T20:41:46.8985716Z Resolving deltas:  37% (13/35)
2022-05-07T20:41:46.8986145Z Resolving deltas:  40% (14/35)
2022-05-07T20:41:46.8986351Z Resolving deltas:  42% (15/35)
2022-05-07T20:41:46.8986571Z Resolving deltas:  45% (16/35)
2022-05-07T20:41:46.8986792Z Resolving deltas:  48% (17/35)
2022-05-07T20:41:46.8986998Z Resolving deltas:  51% (18/35)
2022-05-07T20:41:46.8987218Z Resolving deltas:  54% (19/35)
2022-05-07T20:41:46.8987752Z Resolving deltas:  57% (20/35)
2022-05-07T20:41:46.8988078Z Resolving deltas:  60% (21/35)
2022-05-07T20:41:46.8988334Z Resolving deltas:  62% (22/35)
2022-05-07T20:41:46.8988739Z Resolving deltas:  65% (23/35)
2022-05-07T20:41:46.8989278Z Resolving deltas:  68% (24/35)
2022-05-07T20:41:46.8990862Z Resolving deltas:  71% (25/35)
2022-05-07T20:41:46.8991145Z Resolving deltas:  74% (26/35)
2022-05-07T20:41:46.8991408Z Resolving deltas:  77% (27/35)
2022-05-07T20:41:46.8991657Z Resolving deltas:  80% (28/35)
2022-05-07T20:41:46.8991927Z Resolving deltas:  82% (29/35)
2022-05-07T20:41:46.8992396Z Resolving deltas:  85% (30/35)
2022-05-07T20:41:46.8992679Z Resolving deltas:  88% (31/35)
2022-05-07T20:41:46.8992938Z Resolving deltas:  91% (32/35)
2022-05-07T20:41:46.8993365Z Resolving deltas:  94% (33/35)
2022-05-07T20:41:46.8993908Z Resolving deltas:  97% (34/35)
2022-05-07T20:41:46.8994132Z Resolving deltas: 100% (35/35)
2022-05-07T20:41:46.8994552Z Resolving deltas: 100% (35/35), done.
2022-05-07T20:41:47.0146804Z From https://github.com/hladki/my_repos
2022-05-07T20:41:47.0157760Z  * [new branch]      main                                     -> origin/main
2022-05-07T20:41:47.0158857Z  * [new branch]      second                                   -> origin/second
2022-05-07T20:41:47.0159803Z  * [new ref]         94e8805567337b4309a5214ff5ae84f1f3bac063 -> pull/1/merge
2022-05-07T20:41:47.0182883Z ##[endgroup]
2022-05-07T20:41:47.0183749Z ##[group]Determining the checkout info
2022-05-07T20:41:47.0184823Z ##[endgroup]
2022-05-07T20:41:47.0185749Z ##[group]Checking out the ref
2022-05-07T20:41:47.0189835Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/1/merge
2022-05-07T20:41:47.0246764Z Note: switching to 'refs/remotes/pull/1/merge'.
2022-05-07T20:41:47.0247475Z 
2022-05-07T20:41:47.0250033Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-07T20:41:47.0251970Z changes and commit them, and you can discard any commits you make in this
2022-05-07T20:41:47.0252542Z state without impacting any branches by switching back to a branch.
2022-05-07T20:41:47.0253065Z 
2022-05-07T20:41:47.0253670Z If you want to create a new branch to retain commits you create, you may
2022-05-07T20:41:47.0254965Z do so (now or later) by using -c with the switch command. Example:
2022-05-07T20:41:47.0256255Z 
2022-05-07T20:41:47.0257125Z   git switch -c <new-branch-name>
2022-05-07T20:41:47.0258036Z 
2022-05-07T20:41:47.0258417Z Or undo this operation with:
2022-05-07T20:41:47.0259094Z 
2022-05-07T20:41:47.0259575Z   git switch -
2022-05-07T20:41:47.0260386Z 
2022-05-07T20:41:47.0260847Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-07T20:41:47.0261741Z 
2022-05-07T20:41:47.0262193Z HEAD is now at 94e8805 Merge f527648392b179bbb1b2c4884813b74b0367534d into c89188191874f6d9c68af4f9511301fd35927249
2022-05-07T20:41:47.0264024Z ##[endgroup]
2022-05-07T20:41:47.0317955Z [command]/usr/bin/git log -1 --format='%H'
2022-05-07T20:41:47.0351553Z '94e8805567337b4309a5214ff5ae84f1f3bac063'
2022-05-07T20:41:47.0775330Z ##[group]Run tj-actions/changed-files@v19
2022-05-07T20:41:47.0775651Z with:
2022-05-07T20:41:47.0776953Z   token: ***
2022-05-07T20:41:47.0777185Z   separator:  
2022-05-07T20:41:47.0779445Z   files_separator: 

2022-05-07T20:41:47.0779726Z   files_ignore_separator: 

2022-05-07T20:41:47.0779977Z   sha: 94e8805567337b4309a5214ff5ae84f1f3bac063
2022-05-07T20:41:47.0780241Z   since_last_remote_commit: false
2022-05-07T20:41:47.0780487Z   use_fork_point: false
2022-05-07T20:41:47.0780695Z   quotepath: true
2022-05-07T20:41:47.0780906Z ##[endgroup]
2022-05-07T20:41:47.1141281Z ##[group]Run # "Set base sha..."
2022-05-07T20:41:47.1141566Z [36;1m# "Set base sha..."[0m
2022-05-07T20:41:47.1141785Z [36;1mif [[ -n "" ]]; then[0m
2022-05-07T20:41:47.1142026Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-07T20:41:47.1142334Z [36;1melif [[ "false" == "true" && "6cac99577f0270d7d192b251dcd881dadc043b3d" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-07T20:41:47.1142739Z [36;1m    echo "::set-output name=base_sha::6cac99577f0270d7d192b251dcd881dadc043b3d"[0m
2022-05-07T20:41:47.1143008Z [36;1mfi[0m
2022-05-07T20:41:47.1198490Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-07T20:41:47.1198784Z ##[endgroup]
2022-05-07T20:41:47.1502738Z ##[group]Run # "Calculating the previous and current SHA..."
2022-05-07T20:41:47.1503088Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-05-07T20:41:47.1503355Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-05-07T20:41:47.1550802Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-07T20:41:47.1551057Z env:
2022-05-07T20:41:47.1551286Z   GITHUB_SERVER_URL: https://github.com
2022-05-07T20:41:47.1551535Z   GITHUB_REPOSITORY: hladki/my_repos
2022-05-07T20:41:47.1551740Z   GITHUB_BASE_REF: main
2022-05-07T20:41:47.1551943Z   GITHUB_HEAD_REF: second
2022-05-07T20:41:47.1552215Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-07T20:41:47.1552522Z   INPUT_SHA: 94e8805567337b4309a5214ff5ae84f1f3bac063
2022-05-07T20:41:47.1552729Z   INPUT_BASE_SHA: 
2022-05-07T20:41:47.1553138Z   INPUT_TOKEN: ***
2022-05-07T20:41:47.1553335Z   INPUT_PATH: 
2022-05-07T20:41:47.1553519Z   INPUT_USE_FORK_POINT: false
2022-05-07T20:41:47.1553723Z ##[endgroup]
2022-05-07T20:41:47.1646757Z ##[group]changed-files-diff-sha
2022-05-07T20:41:47.1647209Z Resolving repository path...
2022-05-07T20:41:47.1682725Z Setting up 'temp_changed_files' remote...
2022-05-07T20:41:47.1728878Z No 'temp_changed_files' remote found
2022-05-07T20:41:47.1729556Z Creating 'temp_changed_files' remote...
2022-05-07T20:41:47.1777167Z Getting HEAD SHA...
2022-05-07T20:41:47.4093203Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-07T20:41:47.4178954Z From https://github.com/hladki/my_repos
2022-05-07T20:41:47.4179945Z  * [new branch]      main       -> main
2022-05-07T20:41:47.4182695Z  * [new branch]      main       -> temp_changed_files/main
2022-05-07T20:41:47.4230177Z Verifying commit SHA...
2022-05-07T20:41:47.4305045Z ##[endgroup]
2022-05-07T20:41:47.4360318Z ##[group]Run tj-actions/glob@v7.16
2022-05-07T20:41:47.4360562Z with:
2022-05-07T20:41:47.4360769Z   files-separator: 

2022-05-07T20:41:47.4361162Z   escape-paths: true
2022-05-07T20:41:47.4361406Z   excluded-files-separator: 

2022-05-07T20:41:47.4361684Z   base-sha: c89188191874f6d9c68af4f9511301fd35927249
2022-05-07T20:41:47.4361958Z   sha: 94e8805567337b4309a5214ff5ae84f1f3bac063
2022-05-07T20:41:47.4362198Z   include-deleted-files: true
2022-05-07T20:41:47.4362427Z   separator: |
2022-05-07T20:41:47.4362676Z   files-from-source-file-separator: 

2022-05-07T20:41:47.4362992Z   excluded-files-from-source-file-separator: 

2022-05-07T20:41:47.4363299Z   follow-symbolic-links: true
2022-05-07T20:41:47.4363552Z   strip-top-level-dir: true
2022-05-07T20:41:47.4363765Z ##[endgroup]
2022-05-07T20:41:47.6535725Z [command]/usr/bin/git rev-parse --show-toplevel
2022-05-07T20:41:47.6580156Z /home/runner/work/my_repos/my_repos
2022-05-07T20:41:47.6619810Z [command]/usr/bin/git diff --diff-filter=D --name-only c89188191874f6d9c68af4f9511301fd35927249 94e8805567337b4309a5214ff5ae84f1f3bac063
2022-05-07T20:41:47.6668769Z 
2022-05-07T20:41:47.6784550Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-07T20:41:47.6785411Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-07T20:41:47.6843961Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-07T20:41:47.6844261Z env:
2022-05-07T20:41:47.6844557Z   GITHUB_ACTION_PATH: /home/runner/work/_actions/tj-actions/changed-files/v19
2022-05-07T20:41:47.6844903Z   INPUT_FILES_PATTERN_FILE: 
2022-05-07T20:41:47.6845162Z   INPUT_SEPARATOR:  
2022-05-07T20:41:47.6845383Z   INPUT_PATH: 
2022-05-07T20:41:47.6845856Z   INPUT_PREVIOUS_SHA: c89188191874f6d9c68af4f9511301fd35927249
2022-05-07T20:41:47.6846205Z   INPUT_CURRENT_SHA: 94e8805567337b4309a5214ff5ae84f1f3bac063
2022-05-07T20:41:47.6846490Z   INPUT_TARGET_BRANCH: main
2022-05-07T20:41:47.6846772Z   INPUT_CURRENT_BRANCH: second
2022-05-07T20:41:47.6847041Z   INPUT_QUOTEPATH: true
2022-05-07T20:41:47.6847270Z ##[endgroup]
2022-05-07T20:41:47.6985102Z ##[group]changed-files
2022-05-07T20:41:47.6985984Z Resolving repository path...
2022-05-07T20:41:47.6987520Z Retrieving changes between c89188191874f6d9c68af4f9511301fd35927249 (main) → 94e8805567337b4309a5214ff5ae84f1f3bac063 (second)
2022-05-07T20:41:47.6987940Z Getting diff...
2022-05-07T20:41:48.0686597Z Added files: sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt
2022-05-07T20:41:48.0687614Z Copied files: 
2022-05-07T20:41:48.0688145Z Deleted files: 
2022-05-07T20:41:48.0691541Z Modified files: 
2022-05-07T20:41:48.0708368Z Renamed files: 
2022-05-07T20:41:48.0708815Z Type Changed files: 
2022-05-07T20:41:48.0709550Z Unmerged files: 
2022-05-07T20:41:48.0710309Z Unknown files: 
2022-05-07T20:41:48.0710762Z All changed and modified files: sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt
2022-05-07T20:41:48.0711163Z All changed files: sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt
2022-05-07T20:41:48.0711531Z All modified files: sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt
2022-05-07T20:41:48.0715755Z ##[endgroup]
2022-05-07T20:41:48.0875028Z ##[group]Run for file in sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt; do
2022-05-07T20:41:48.0875499Z [36;1mfor file in sec_tab_file.txt sec_tab_file2.txt sec_tab_file3.txt; do[0m
2022-05-07T20:41:48.0875806Z [36;1m  echo "$file was changed"[0m
2022-05-07T20:41:48.0876083Z [36;1m  tab=`grep -P "\t" "$file" | wc -l`[0m
2022-05-07T20:41:48.0876404Z [36;1m  echo "In the modified file $file found number of tabs $tab" >> report.log 2>&1[0m
2022-05-07T20:41:48.0876693Z [36;1mdone[0m
2022-05-07T20:41:48.0937017Z shell: /usr/bin/bash -e {0}
2022-05-07T20:41:48.0937459Z ##[endgroup]
2022-05-07T20:41:48.1023779Z sec_tab_file.txt was changed
2022-05-07T20:41:48.1064423Z sec_tab_file2.txt was changed
2022-05-07T20:41:48.1087840Z sec_tab_file3.txt was changed
2022-05-07T20:41:48.1157181Z ##[group]Run actions/upload-artifact@v2
2022-05-07T20:41:48.1157518Z with:
2022-05-07T20:41:48.1157829Z   path: report.log
2022-05-07T20:41:48.1158130Z   name: artifact
2022-05-07T20:41:48.1158459Z   if-no-files-found: warn
2022-05-07T20:41:48.1158773Z ##[endgroup]
2022-05-07T20:41:48.2063467Z With the provided path, there will be 1 file uploaded
2022-05-07T20:41:48.2078789Z Starting artifact upload
2022-05-07T20:41:48.2082308Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-07T20:41:48.2083405Z Artifact name is valid!
2022-05-07T20:41:48.2721436Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-07T20:41:48.3437465Z Total size of all the files uploaded is 92 bytes
2022-05-07T20:41:48.3441553Z File upload process has finished. Finalizing the artifact upload
2022-05-07T20:41:48.3918037Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-07T20:41:48.3921102Z 
2022-05-07T20:41:48.3921662Z The raw size of all the files that were specified for upload is 185 bytes
2022-05-07T20:41:48.3922631Z The size of all the files that were uploaded is 92 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-07T20:41:48.3924466Z 
2022-05-07T20:41:48.3925730Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-07T20:41:48.3926518Z 
2022-05-07T20:41:48.3933789Z Artifact artifact has been successfully uploaded!
2022-05-07T20:41:48.4168963Z Post job cleanup.
2022-05-07T20:41:48.4349167Z Post job cleanup.
2022-05-07T20:41:48.5151572Z Post job cleanup.
2022-05-07T20:41:48.6939468Z [command]/usr/bin/git version
2022-05-07T20:41:48.7025748Z git version 2.36.0
2022-05-07T20:41:48.7082897Z Copying '/home/runner/.gitconfig' to '/home/runner/work/_temp/718d4a48-3e14-4e2f-a4b3-0332ba1b18bb/.gitconfig'
2022-05-07T20:41:48.7103399Z Temporarily overriding HOME='/home/runner/work/_temp/718d4a48-3e14-4e2f-a4b3-0332ba1b18bb' before making global git config changes
2022-05-07T20:41:48.7104270Z Adding repository directory to the temporary git global config as a safe directory
2022-05-07T20:41:48.7111422Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/my_repos/my_repos
2022-05-07T20:41:48.7176951Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-07T20:41:48.7220701Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-07T20:41:48.7549693Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-07T20:41:48.7581740Z http.https://github.com/.extraheader
2022-05-07T20:41:48.7597321Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-07T20:41:48.7647148Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-07T20:41:48.8267134Z Cleaning up orphan processes
```