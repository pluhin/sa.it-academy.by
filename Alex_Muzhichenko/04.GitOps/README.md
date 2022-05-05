##### Mnzhichenko_Alex_04.GitOps

---

### Repository link

[my_github_actions](https://github.com/amuzhichenko/test.git)

### Log of pipeline:

```bash

2022-05-05T09:08:54.0019871Z Requested labels: ubuntu-latest
2022-05-05T09:08:54.0019935Z Job defined at: amuzhichenko/test/.github/workflows/github_action.yaml@refs/heads/main
2022-05-05T09:08:54.0019954Z Waiting for a runner to pick up this job...
2022-05-05T09:08:54.5863781Z Job is waiting for a hosted runner to come online.
2022-05-05T09:08:59.8619823Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-05-05T09:09:02.9806306Z Current runner version: '2.291.1'
2022-05-05T09:09:02.9833653Z ##[group]Operating System
2022-05-05T09:09:02.9834299Z Ubuntu
2022-05-05T09:09:02.9834595Z 20.04.4
2022-05-05T09:09:02.9834830Z LTS
2022-05-05T09:09:02.9835147Z ##[endgroup]
2022-05-05T09:09:02.9835529Z ##[group]Virtual Environment
2022-05-05T09:09:02.9835867Z Environment: ubuntu-20.04
2022-05-05T09:09:02.9836205Z Version: 20220503.1
2022-05-05T09:09:02.9836733Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220503.1/images/linux/Ubuntu2004-Readme.md
2022-05-05T09:09:02.9837370Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220503.1
2022-05-05T09:09:02.9837875Z ##[endgroup]
2022-05-05T09:09:02.9838241Z ##[group]Virtual Environment Provisioner
2022-05-05T09:09:02.9838574Z 1.0.0.0-main-20220421-1
2022-05-05T09:09:02.9838892Z ##[endgroup]
2022-05-05T09:09:02.9839586Z ##[group]GITHUB_TOKEN Permissions
2022-05-05T09:09:02.9840097Z Contents: read
2022-05-05T09:09:02.9840543Z Metadata: read
2022-05-05T09:09:02.9840885Z ##[endgroup]
2022-05-05T09:09:02.9844470Z Secret source: Actions
2022-05-05T09:09:02.9845005Z Prepare workflow directory
2022-05-05T09:09:03.0677240Z Prepare all required actions
2022-05-05T09:09:03.0862805Z Getting action download info
2022-05-05T09:09:03.3057672Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-05-05T09:09:03.9739945Z Download action repository 'tj-actions/changed-files@v13.1' (SHA:2c85495a7bb72f2734cb5181e29b2ee5e08e61f7)
2022-05-05T09:09:04.4434409Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-05T09:09:05.0223228Z Getting action download info
2022-05-05T09:09:05.1962367Z Download action repository 'tj-actions/glob@v3.3' (SHA:5021d1972563d56de23480a8d5eb667d6d128c0a)
2022-05-05T09:09:05.7785434Z ##[group]Run actions/checkout@v2
2022-05-05T09:09:05.7785715Z with:
2022-05-05T09:09:05.7785921Z   fetch-depth: 0
2022-05-05T09:09:05.7786167Z   repository: amuzhichenko/test
2022-05-05T09:09:05.7786636Z   token: ***
2022-05-05T09:09:05.7786844Z   ssh-strict: true
2022-05-05T09:09:05.7787158Z   persist-credentials: true
2022-05-05T09:09:05.7787370Z   clean: true
2022-05-05T09:09:05.7787560Z   lfs: false
2022-05-05T09:09:05.7787757Z   submodules: false
2022-05-05T09:09:05.7787979Z   set-safe-directory: true
2022-05-05T09:09:05.7788210Z ##[endgroup]
2022-05-05T09:09:07.8375825Z Syncing repository: amuzhichenko/test
2022-05-05T09:09:07.8385295Z ##[group]Getting Git version info
2022-05-05T09:09:07.8385923Z Working directory is '/home/runner/work/test/test'
2022-05-05T09:09:07.8386436Z [command]/usr/bin/git version
2022-05-05T09:09:07.8500575Z git version 2.36.0
2022-05-05T09:09:07.8526940Z ##[endgroup]
2022-05-05T09:09:07.8561318Z Temporarily overriding HOME='/home/runner/work/_temp/b87e0f18-04df-4d15-8f66-5690cf296142' before making global git config changes
2022-05-05T09:09:07.8563838Z Adding repository directory to the temporary git global config as a safe directory
2022-05-05T09:09:07.8570462Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/test/test
2022-05-05T09:09:07.8618633Z Deleting the contents of '/home/runner/work/test/test'
2022-05-05T09:09:07.8623193Z ##[group]Initializing the repository
2022-05-05T09:09:07.8626752Z [command]/usr/bin/git init /home/runner/work/test/test
2022-05-05T09:09:07.8707726Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-05T09:09:07.8708455Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-05T09:09:07.8709581Z hint: of your new repositories, which will suppress this warning, call:
2022-05-05T09:09:07.8710095Z hint:
2022-05-05T09:09:07.8710879Z hint: 	git config --global init.defaultBranch <name>
2022-05-05T09:09:07.8711431Z hint:
2022-05-05T09:09:07.8712210Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-05T09:09:07.8712895Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-05T09:09:07.8713856Z hint:
2022-05-05T09:09:07.8714353Z hint: 	git branch -m <name>
2022-05-05T09:09:07.8800513Z Initialized empty Git repository in /home/runner/work/test/test/.git/
2022-05-05T09:09:07.8810560Z [command]/usr/bin/git remote add origin https://github.com/amuzhichenko/test
2022-05-05T09:09:07.8931939Z ##[endgroup]
2022-05-05T09:09:07.8932898Z ##[group]Disabling automatic garbage collection
2022-05-05T09:09:07.8934232Z [command]/usr/bin/git config --local gc.auto 0
2022-05-05T09:09:07.8957641Z ##[endgroup]
2022-05-05T09:09:07.8958282Z ##[group]Setting up auth
2022-05-05T09:09:07.8965562Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-05T09:09:07.9002597Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-05T09:09:07.9402484Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-05T09:09:07.9442893Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-05T09:09:07.9738250Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-05T09:09:07.9781395Z ##[endgroup]
2022-05-05T09:09:07.9827963Z ##[group]Fetching the repository
2022-05-05T09:09:07.9828878Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-05-05T09:09:08.4787442Z remote: Enumerating objects: 35, done.
2022-05-05T09:09:08.4791572Z remote: Counting objects:   2% (1/35)
2022-05-05T09:09:08.4792074Z remote: Counting objects:   5% (2/35)
2022-05-05T09:09:08.4792518Z remote: Counting objects:   8% (3/35)
2022-05-05T09:09:08.4792946Z remote: Counting objects:  11% (4/35)
2022-05-05T09:09:08.4793288Z remote: Counting objects:  14% (5/35)
2022-05-05T09:09:08.4794485Z remote: Counting objects:  17% (6/35)
2022-05-05T09:09:08.4794813Z remote: Counting objects:  20% (7/35)
2022-05-05T09:09:08.4795577Z remote: Counting objects:  22% (8/35)
2022-05-05T09:09:08.4795929Z remote: Counting objects:  25% (9/35)
2022-05-05T09:09:08.4796244Z remote: Counting objects:  28% (10/35)
2022-05-05T09:09:08.4796531Z remote: Counting objects:  31% (11/35)
2022-05-05T09:09:08.4796830Z remote: Counting objects:  34% (12/35)
2022-05-05T09:09:08.4797131Z remote: Counting objects:  37% (13/35)
2022-05-05T09:09:08.4797416Z remote: Counting objects:  40% (14/35)
2022-05-05T09:09:08.4797726Z remote: Counting objects:  42% (15/35)
2022-05-05T09:09:08.4798027Z remote: Counting objects:  45% (16/35)
2022-05-05T09:09:08.4798302Z remote: Counting objects:  48% (17/35)
2022-05-05T09:09:08.4798601Z remote: Counting objects:  51% (18/35)
2022-05-05T09:09:08.4798895Z remote: Counting objects:  54% (19/35)
2022-05-05T09:09:08.4799190Z remote: Counting objects:  57% (20/35)
2022-05-05T09:09:08.4799467Z remote: Counting objects:  60% (21/35)
2022-05-05T09:09:08.4799761Z remote: Counting objects:  62% (22/35)
2022-05-05T09:09:08.4800049Z remote: Counting objects:  65% (23/35)
2022-05-05T09:09:08.4800328Z remote: Counting objects:  68% (24/35)
2022-05-05T09:09:08.4800618Z remote: Counting objects:  71% (25/35)
2022-05-05T09:09:08.4801137Z remote: Counting objects:  74% (26/35)
2022-05-05T09:09:08.4801420Z remote: Counting objects:  77% (27/35)
2022-05-05T09:09:08.4801715Z remote: Counting objects:  80% (28/35)
2022-05-05T09:09:08.4802330Z remote: Counting objects:  82% (29/35)
2022-05-05T09:09:08.4802618Z remote: Counting objects:  85% (30/35)
2022-05-05T09:09:08.4803260Z remote: Counting objects:  88% (31/35)
2022-05-05T09:09:08.4803559Z remote: Counting objects:  91% (32/35)
2022-05-05T09:09:08.4803850Z remote: Counting objects:  94% (33/35)
2022-05-05T09:09:08.4804129Z remote: Counting objects:  97% (34/35)
2022-05-05T09:09:08.4804418Z remote: Counting objects: 100% (35/35)
2022-05-05T09:09:08.4804727Z remote: Counting objects: 100% (35/35), done.
2022-05-05T09:09:08.4805050Z remote: Compressing objects:   5% (1/17)
2022-05-05T09:09:08.4805375Z remote: Compressing objects:  11% (2/17)
2022-05-05T09:09:08.4805690Z remote: Compressing objects:  17% (3/17)
2022-05-05T09:09:08.4806018Z remote: Compressing objects:  23% (4/17)
2022-05-05T09:09:08.4806330Z remote: Compressing objects:  29% (5/17)
2022-05-05T09:09:08.4806641Z remote: Compressing objects:  35% (6/17)
2022-05-05T09:09:08.4806952Z remote: Compressing objects:  41% (7/17)
2022-05-05T09:09:08.4807253Z remote: Compressing objects:  47% (8/17)
2022-05-05T09:09:08.4807560Z remote: Compressing objects:  52% (9/17)
2022-05-05T09:09:08.4807880Z remote: Compressing objects:  58% (10/17)
2022-05-05T09:09:08.4808186Z remote: Compressing objects:  64% (11/17)
2022-05-05T09:09:08.4808506Z remote: Compressing objects:  70% (12/17)
2022-05-05T09:09:08.4808818Z remote: Compressing objects:  76% (13/17)
2022-05-05T09:09:08.4809113Z remote: Compressing objects:  82% (14/17)
2022-05-05T09:09:08.4809420Z remote: Compressing objects:  88% (15/17)
2022-05-05T09:09:08.4809727Z remote: Compressing objects:  94% (16/17)
2022-05-05T09:09:08.4810019Z remote: Compressing objects: 100% (17/17)
2022-05-05T09:09:08.4810350Z remote: Compressing objects: 100% (17/17), done.
2022-05-05T09:09:08.4817193Z remote: Total 35 (delta 6), reused 28 (delta 5), pack-reused 0
2022-05-05T09:09:08.5172712Z From https://github.com/amuzhichenko/test
2022-05-05T09:09:08.5173641Z  * [new branch]      main       -> origin/main
2022-05-05T09:09:08.5271685Z [command]/usr/bin/git branch --list --remote origin/main
2022-05-05T09:09:08.5309213Z   origin/main
2022-05-05T09:09:08.5318841Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-05-05T09:09:08.5350040Z 524592f06e89cfc980029611ccd7749705fa2209
2022-05-05T09:09:08.5355145Z ##[endgroup]
2022-05-05T09:09:08.5355763Z ##[group]Determining the checkout info
2022-05-05T09:09:08.5357065Z ##[endgroup]
2022-05-05T09:09:08.5357571Z ##[group]Checking out the ref
2022-05-05T09:09:08.5361534Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-05-05T09:09:08.5414202Z Switched to a new branch 'main'
2022-05-05T09:09:08.5417261Z branch 'main' set up to track 'origin/main'.
2022-05-05T09:09:08.5422339Z ##[endgroup]
2022-05-05T09:09:08.5469037Z [command]/usr/bin/git log -1 --format='%H'
2022-05-05T09:09:08.5500754Z '524592f06e89cfc980029611ccd7749705fa2209'
2022-05-05T09:09:08.5828729Z ##[group]Run tj-actions/changed-files@v13.1
2022-05-05T09:09:08.5828974Z with:
2022-05-05T09:09:08.5829351Z   token: ***
2022-05-05T09:09:08.5829552Z   separator:
2022-05-05T09:09:08.5829775Z   sha: 524592f06e89cfc980029611ccd7749705fa2209
2022-05-05T09:09:08.5830033Z   since_last_remote_commit: false
2022-05-05T09:09:08.5830252Z ##[endgroup]
2022-05-05T09:09:08.6133094Z ##[group]Run # "Set base sha..."
2022-05-05T09:09:08.6133440Z [36;1m# "Set base sha..."[0m
2022-05-05T09:09:08.6133993Z [36;1mif [[ -n "" ]]; then[0m
2022-05-05T09:09:08.6134254Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-05T09:09:08.6134698Z [36;1melif [[ "false" == "true" ]]; then[0m
2022-05-05T09:09:08.6135010Z [36;1m  if [[ "254f827559ad20fd17bbbb20492f20110e9610fe" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-05T09:09:08.6135373Z [36;1m    echo "::set-output name=base_sha::254f827559ad20fd17bbbb20492f20110e9610fe"[0m
2022-05-05T09:09:08.6135902Z [36;1m  else[0m
2022-05-05T09:09:08.6136529Z [36;1m    echo "::set-output name=base_sha::524592f06e89cfc980029611ccd7749705fa2209"[0m
2022-05-05T09:09:08.6136827Z [36;1m  fi[0m
2022-05-05T09:09:08.6137087Z [36;1mfi[0m
2022-05-05T09:09:08.6191091Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-05T09:09:08.6191420Z ##[endgroup]
2022-05-05T09:09:08.6406550Z ##[group]Run bash $GITHUB_ACTION_PATH/sourcefiles.sh
2022-05-05T09:09:08.6406988Z [36;1mbash $GITHUB_ACTION_PATH/sourcefiles.sh[0m
2022-05-05T09:09:08.6455036Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-05T09:09:08.6455414Z env:
2022-05-05T09:09:08.6455635Z   INPUT_FILES:
2022-05-05T09:09:08.6455931Z   INPUT_FILES_FROM_SOURCE_FILE:
2022-05-05T09:09:08.6456318Z ##[endgroup]
2022-05-05T09:09:08.6548289Z ##[group]changed-files-from-source-file
2022-05-05T09:09:08.6735156Z Input files:
2022-05-05T09:09:08.6767478Z ##[endgroup]
2022-05-05T09:09:08.6812806Z ##[group]Run tj-actions/glob@v3.3
2022-05-05T09:09:08.6813100Z with:
2022-05-05T09:09:08.6813344Z   files-separator:
2022-05-05T09:09:08.6815340Z   separator: |
2022-05-05T09:09:08.6815659Z   excluded-files-separator:

2022-05-05T09:09:08.6815964Z   files-from-source-file-separator:

2022-05-05T09:09:08.6816364Z   excluded-files-from-source-file-separator:

2022-05-05T09:09:08.6816747Z   follow-symbolic-links: true
2022-05-05T09:09:08.6817101Z   strip-top-level-dir: true
2022-05-05T09:09:08.6817380Z   include-deleted-files: false
2022-05-05T09:09:08.6817707Z   sha: 524592f06e89cfc980029611ccd7749705fa2209
2022-05-05T09:09:08.6818095Z   working-directory: /home/runner/work/test/test
2022-05-05T09:09:08.6818369Z ##[endgroup]
2022-05-05T09:09:08.7427886Z
2022-05-05T09:09:08.7496330Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-05T09:09:08.7496733Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-05T09:09:08.7544370Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-05T09:09:08.7544659Z env:
2022-05-05T09:09:08.7544987Z   GITHUB_SERVER_URL: https://github.com
2022-05-05T09:09:08.7545350Z   GITHUB_REPOSITORY: amuzhichenko/test
2022-05-05T09:09:08.7545672Z   GITHUB_BASE_REF:
2022-05-05T09:09:08.7545970Z   INPUT_SHA: 524592f06e89cfc980029611ccd7749705fa2209
2022-05-05T09:09:08.7546285Z   INPUT_BASE_SHA:
2022-05-05T09:09:08.7546906Z   INPUT_TOKEN: ***
2022-05-05T09:09:08.7547166Z   INPUT_FILES:
2022-05-05T09:09:08.7547461Z   INPUT_SEPARATOR:
2022-05-05T09:09:08.7547767Z   INPUT_PATH:
2022-05-05T09:09:08.7547981Z ##[endgroup]
2022-05-05T09:09:08.7769562Z ##[group]changed-files
2022-05-05T09:09:08.7770210Z Resolving repository path...
2022-05-05T09:09:08.7781962Z Setting up 'temp_changed_files' remote...
2022-05-05T09:09:08.7820824Z No 'temp_changed_files' remote found
2022-05-05T09:09:08.7821394Z Creating 'temp_changed_files' remote...
2022-05-05T09:09:08.7854713Z Getting HEAD info...
2022-05-05T09:09:08.7941638Z Retrieving changes between 254f827559ad20fd17bbbb20492f20110e9610fe (main) → 524592f06e89cfc980029611ccd7749705fa2209 (main)
2022-05-05T09:09:08.7942566Z Getting diff...
2022-05-05T09:09:08.8411907Z Added files: 123_.txt
2022-05-05T09:09:08.8412312Z Copied files:
2022-05-05T09:09:08.8412584Z Deleted files:
2022-05-05T09:09:08.8412867Z Modified files:
2022-05-05T09:09:08.8413141Z Renamed files:
2022-05-05T09:09:08.8413363Z Type Changed files:
2022-05-05T09:09:08.8413631Z Unmerged files:
2022-05-05T09:09:08.8414496Z Unknown files:
2022-05-05T09:09:08.8414763Z All changed and modified files: 123_.txt
2022-05-05T09:09:08.8414998Z All changed files: 123_.txt
2022-05-05T09:09:08.8415228Z All modified files: 123_.txt
2022-05-05T09:09:08.8471111Z ##[endgroup]
2022-05-05T09:09:08.8590145Z ##[group]Run for file in 123_.txt; do
2022-05-05T09:09:08.8590416Z [36;1mfor file in 123_.txt; do[0m
2022-05-05T09:09:08.8590679Z [36;1m  echo "$file was changed" >> files.log 2>&1[0m
2022-05-05T09:09:08.8591020Z [36;1m  echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1 [0m
2022-05-05T09:09:08.8591282Z [36;1mdone[0m
2022-05-05T09:09:08.8639933Z shell: /usr/bin/bash -e {0}
2022-05-05T09:09:08.8640167Z ##[endgroup]
2022-05-05T09:09:08.8780733Z ##[group]Run actions/upload-artifact@v2
2022-05-05T09:09:08.8780967Z with:
2022-05-05T09:09:08.8781159Z   path: files.log
2022-05-05T09:09:08.8781361Z   name: artifact
2022-05-05T09:09:08.8781563Z   if-no-files-found: warn
2022-05-05T09:09:08.8781780Z ##[endgroup]
2022-05-05T09:09:08.9407568Z With the provided path, there will be 1 file uploaded
2022-05-05T09:09:08.9411198Z Starting artifact upload
2022-05-05T09:09:08.9412271Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-05T09:09:08.9413244Z Artifact name is valid!
2022-05-05T09:09:09.0272926Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-05T09:09:09.1375835Z Total size of all the files uploaded is 43 bytes
2022-05-05T09:09:09.1380028Z File upload process has finished. Finalizing the artifact upload
2022-05-05T09:09:09.1925718Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-05T09:09:09.1926480Z
2022-05-05T09:09:09.1926853Z The raw size of all the files that were specified for upload is 43 bytes
2022-05-05T09:09:09.1927765Z The size of all the files that were uploaded is 43 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-05T09:09:09.1928257Z
2022-05-05T09:09:09.1929442Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads
2022-05-05T09:09:09.1931500Z
2022-05-05T09:09:09.1932108Z Artifact artifact has been successfully uploaded!
2022-05-05T09:09:09.1996202Z Post job cleanup.
2022-05-05T09:09:09.3239503Z [command]/usr/bin/git version
2022-05-05T09:09:09.3284287Z git version 2.36.0
2022-05-05T09:09:09.3323293Z Temporarily overriding HOME='/home/runner/work/_temp/83936b0e-10c4-48e2-bd79-741c7f0db8d2' before making global git config changes
2022-05-05T09:09:09.3324000Z Adding repository directory to the temporary git global config as a safe directory
2022-05-05T09:09:09.3327790Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/test/test
2022-05-05T09:09:09.3368809Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-05T09:09:09.3403681Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-05T09:09:09.3643641Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-05T09:09:09.3710087Z http.https://github.com/.extraheader
2022-05-05T09:09:09.3718918Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-05T09:09:09.3755496Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-05T09:09:09.4225600Z Cleaning up orphan processes
```

