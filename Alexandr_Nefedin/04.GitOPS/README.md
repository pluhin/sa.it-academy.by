# 04.GitOPS

## Location testing runner [GitOPS](https://github.com/Demo2886/GitOPS)

## Pipeline logs
```bash
2022-05-02T10:14:19.8913682Z Requested labels: self-hosted
2022-05-02T10:14:19.8913775Z Job defined at: Demo2886/GitOPS/.github/workflows/Git_action.yml@refs/heads/master
2022-05-02T10:14:19.8913803Z Waiting for a runner to pick up this job...
2022-05-02T10:14:20.0647620Z Job is about to start running on the runner: my_test_runner (repository)
2022-05-02T10:14:25.0321997Z Current runner version: '2.290.1'
2022-05-02T10:14:25.0328014Z Runner name: 'my_test_runner'
2022-05-02T10:14:25.0328504Z Runner group name: 'Default'
2022-05-02T10:14:25.0329107Z Machine name: 'ubuntu-focal'
2022-05-02T10:14:25.0330566Z ##[group]GITHUB_TOKEN Permissions
2022-05-02T10:14:25.0331007Z Contents: read
2022-05-02T10:14:25.0331731Z Metadata: read
2022-05-02T10:14:25.0332063Z ##[endgroup]
2022-05-02T10:14:25.0335445Z Secret source: Actions
2022-05-02T10:14:25.0335920Z Prepare workflow directory
2022-05-02T10:14:25.1204277Z Prepare all required actions
2022-05-02T10:14:25.1391664Z Getting action download info
2022-05-02T10:14:25.4538090Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-05-02T10:14:26.4113174Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-05-02T10:14:27.1288854Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-02T10:14:28.0573579Z Getting action download info
2022-05-02T10:14:28.2756962Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-05-02T10:14:29.2516621Z ##[group]Run actions/checkout@v2
2022-05-02T10:14:29.2517028Z with:
2022-05-02T10:14:29.2517491Z   fetch-depth: 0
2022-05-02T10:14:29.2517815Z   repository: Demo2886/GitOPS
2022-05-02T10:14:29.2518531Z   token: ***
2022-05-02T10:14:29.2518828Z   ssh-strict: true
2022-05-02T10:14:29.2519140Z   persist-credentials: true
2022-05-02T10:14:29.2519442Z   clean: true
2022-05-02T10:14:29.2519744Z   lfs: false
2022-05-02T10:14:29.2520049Z   submodules: false
2022-05-02T10:14:29.2520350Z   set-safe-directory: true
2022-05-02T10:14:29.2520667Z ##[endgroup]
2022-05-02T10:14:29.3937685Z Syncing repository: Demo2886/GitOPS
2022-05-02T10:14:29.3940556Z ##[group]Getting Git version info
2022-05-02T10:14:29.3948594Z Working directory is '/home/vagrant/exit/GitOPS/GitOPS'
2022-05-02T10:14:29.3949471Z [command]/usr/bin/git version
2022-05-02T10:14:29.3949808Z git version 2.25.1
2022-05-02T10:14:29.3961345Z ##[endgroup]
2022-05-02T10:14:29.3988768Z Copying '/home/vagrant/.gitconfig' to '/home/vagrant/exit/_temp/1410ebd5-f614-4875-a8f0-ff9d34bfb120/.gitconfig'
2022-05-02T10:14:29.3989689Z Temporarily overriding HOME='/home/vagrant/exit/_temp/1410ebd5-f614-4875-a8f0-ff9d34bfb120' before making global git config changes
2022-05-02T10:14:29.3990297Z Adding repository directory to the temporary git global config as a safe directory
2022-05-02T10:14:29.3991267Z [command]/usr/bin/git config --global --add safe.directory /home/vagrant/exit/GitOPS/GitOPS
2022-05-02T10:14:29.4028568Z [command]/usr/bin/git config --local --get remote.origin.url
2022-05-02T10:14:29.4048602Z https://github.com/Demo2886/GitOPS
2022-05-02T10:14:29.4069508Z ##[group]Removing previously created refs, to avoid conflicts
2022-05-02T10:14:29.4071898Z [command]/usr/bin/git rev-parse --symbolic-full-name --verify --quiet HEAD
2022-05-02T10:14:29.4092979Z refs/heads/master
2022-05-02T10:14:29.4100477Z [command]/usr/bin/git checkout --detach
2022-05-02T10:14:29.4132927Z HEAD is now at 75f53b1 up_my_runner4
2022-05-02T10:14:29.4140661Z [command]/usr/bin/git rev-parse --symbolic-full-name --branches
2022-05-02T10:14:29.4163678Z refs/heads/master
2022-05-02T10:14:29.4172020Z [command]/usr/bin/git branch --delete --force master
2022-05-02T10:14:29.4232619Z Deleted branch master (was 75f53b1).
2022-05-02T10:14:29.4237608Z [command]/usr/bin/git rev-parse --symbolic-full-name --remotes=origin
2022-05-02T10:14:29.4260420Z refs/remotes/origin/master
2022-05-02T10:14:29.4264883Z ##[endgroup]
2022-05-02T10:14:29.4265873Z ##[group]Cleaning the repository
2022-05-02T10:14:29.4269348Z [command]/usr/bin/git clean -ffdx
2022-05-02T10:14:29.4292879Z Removing files.log
2022-05-02T10:14:29.4302517Z [command]/usr/bin/git reset --hard HEAD
2022-05-02T10:14:29.4330761Z HEAD is now at 75f53b1 up_my_runner4
2022-05-02T10:14:29.4333852Z ##[endgroup]
2022-05-02T10:14:29.4339883Z ##[group]Disabling automatic garbage collection
2022-05-02T10:14:29.4345259Z [command]/usr/bin/git config --local gc.auto 0
2022-05-02T10:14:29.4372748Z ##[endgroup]
2022-05-02T10:14:29.4373957Z ##[group]Setting up auth
2022-05-02T10:14:29.4379854Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-02T10:14:29.4409072Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-02T10:14:29.4577521Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-02T10:14:29.4602954Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-02T10:14:29.4772983Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-02T10:14:29.4814310Z ##[endgroup]
2022-05-02T10:14:29.4815857Z ##[group]Fetching the repository
2022-05-02T10:14:29.4822830Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules --unshallow origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-05-02T10:14:30.1882949Z remote: Enumerating objects: 51, done.        
2022-05-02T10:14:30.1960614Z remote: Counting objects:   1% (1/51)        
2022-05-02T10:14:30.1961189Z remote: Counting objects:   3% (2/51)        
2022-05-02T10:14:30.1961661Z remote: Counting objects:   5% (3/51)        
2022-05-02T10:14:30.1962726Z remote: Counting objects:   7% (4/51)        
2022-05-02T10:14:30.1963297Z remote: Counting objects:   9% (5/51)        
2022-05-02T10:14:30.1963877Z remote: Counting objects:  11% (6/51)        
2022-05-02T10:14:30.1965121Z remote: Counting objects:  13% (7/51)        
2022-05-02T10:14:30.1967873Z remote: Counting objects:  15% (8/51)        
2022-05-02T10:14:30.1968615Z remote: Counting objects:  17% (9/51)        
2022-05-02T10:14:30.1969048Z remote: Counting objects:  19% (10/51)        
2022-05-02T10:14:30.1969443Z remote: Counting objects:  21% (11/51)        
2022-05-02T10:14:30.1969857Z remote: Counting objects:  23% (12/51)        
2022-05-02T10:14:30.1970208Z remote: Counting objects:  25% (13/51)        
2022-05-02T10:14:30.1970639Z remote: Counting objects:  27% (14/51)        
2022-05-02T10:14:30.1971009Z remote: Counting objects:  29% (15/51)        
2022-05-02T10:14:30.1971389Z remote: Counting objects:  31% (16/51)        
2022-05-02T10:14:30.1971738Z remote: Counting objects:  33% (17/51)        
2022-05-02T10:14:30.1972127Z remote: Counting objects:  35% (18/51)        
2022-05-02T10:14:30.1972498Z remote: Counting objects:  37% (19/51)        
2022-05-02T10:14:30.1972847Z remote: Counting objects:  39% (20/51)        
2022-05-02T10:14:30.1973226Z remote: Counting objects:  41% (21/51)        
2022-05-02T10:14:30.1973597Z remote: Counting objects:  43% (22/51)        
2022-05-02T10:14:30.1973963Z remote: Counting objects:  45% (23/51)        
2022-05-02T10:14:30.1974332Z remote: Counting objects:  47% (24/51)        
2022-05-02T10:14:30.1974712Z remote: Counting objects:  49% (25/51)        
2022-05-02T10:14:30.1975212Z remote: Counting objects:  50% (26/51)        
2022-05-02T10:14:30.1975909Z remote: Counting objects:  52% (27/51)        
2022-05-02T10:14:30.1976321Z remote: Counting objects:  54% (28/51)        
2022-05-02T10:14:30.1976910Z remote: Counting objects:  56% (29/51)        
2022-05-02T10:14:30.1978042Z remote: Counting objects:  58% (30/51)        
2022-05-02T10:14:30.1978612Z remote: Counting objects:  60% (31/51)        
2022-05-02T10:14:30.1979125Z remote: Counting objects:  62% (32/51)        
2022-05-02T10:14:30.1980253Z remote: Counting objects:  64% (33/51)        
2022-05-02T10:14:30.1980733Z remote: Counting objects:  66% (34/51)        
2022-05-02T10:14:30.1981185Z remote: Counting objects:  68% (35/51)        
2022-05-02T10:14:30.1982025Z remote: Counting objects:  70% (36/51)        
2022-05-02T10:14:30.2040557Z remote: Counting objects:  72% (37/51)        
2022-05-02T10:14:30.2042679Z remote: Counting objects:  74% (38/51)        
2022-05-02T10:14:30.2043082Z remote: Counting objects:  76% (39/51)        
2022-05-02T10:14:30.2043425Z remote: Counting objects:  78% (40/51)        
2022-05-02T10:14:30.2043882Z remote: Counting objects:  80% (41/51)        
2022-05-02T10:14:30.2044234Z remote: Counting objects:  82% (42/51)        
2022-05-02T10:14:30.2044572Z remote: Counting objects:  84% (43/51)        
2022-05-02T10:14:30.2044917Z remote: Counting objects:  86% (44/51)        
2022-05-02T10:14:30.2045266Z remote: Counting objects:  88% (45/51)        
2022-05-02T10:14:30.2045602Z remote: Counting objects:  90% (46/51)        
2022-05-02T10:14:30.2045949Z remote: Counting objects:  92% (47/51)        
2022-05-02T10:14:30.2046291Z remote: Counting objects:  94% (48/51)        
2022-05-02T10:14:30.2046630Z remote: Counting objects:  96% (49/51)        
2022-05-02T10:14:30.2046972Z remote: Counting objects:  98% (50/51)        
2022-05-02T10:14:30.2047312Z remote: Counting objects: 100% (51/51)        
2022-05-02T10:14:30.2048106Z remote: Counting objects: 100% (51/51), done.        
2022-05-02T10:14:30.2048486Z remote: Compressing objects:   3% (1/26)        
2022-05-02T10:14:30.2048856Z remote: Compressing objects:   7% (2/26)        
2022-05-02T10:14:30.2049221Z remote: Compressing objects:  11% (3/26)        
2022-05-02T10:14:30.2049571Z remote: Compressing objects:  15% (4/26)        
2022-05-02T10:14:30.2049928Z remote: Compressing objects:  19% (5/26)        
2022-05-02T10:14:30.2050289Z remote: Compressing objects:  23% (6/26)        
2022-05-02T10:14:30.2050641Z remote: Compressing objects:  26% (7/26)        
2022-05-02T10:14:30.2050997Z remote: Compressing objects:  30% (8/26)        
2022-05-02T10:14:30.2051356Z remote: Compressing objects:  34% (9/26)        
2022-05-02T10:14:30.2051724Z remote: Compressing objects:  38% (10/26)        
2022-05-02T10:14:30.2052082Z remote: Compressing objects:  42% (11/26)        
2022-05-02T10:14:30.2052445Z remote: Compressing objects:  46% (12/26)        
2022-05-02T10:14:30.2052814Z remote: Compressing objects:  50% (13/26)        
2022-05-02T10:14:30.2053205Z remote: Compressing objects:  53% (14/26)        
2022-05-02T10:14:30.2053958Z remote: Compressing objects:  57% (15/26)        
2022-05-02T10:14:30.2054746Z remote: Compressing objects:  61% (16/26)        
2022-05-02T10:14:30.2055535Z remote: Compressing objects:  65% (17/26)        
2022-05-02T10:14:30.2055897Z remote: Compressing objects:  69% (18/26)        
2022-05-02T10:14:30.2056240Z remote: Compressing objects:  73% (19/26)        
2022-05-02T10:14:30.2056597Z remote: Compressing objects:  76% (20/26)        
2022-05-02T10:14:30.2056953Z remote: Compressing objects:  80% (21/26)        
2022-05-02T10:14:30.2057419Z remote: Compressing objects:  84% (22/26)        
2022-05-02T10:14:30.2058239Z remote: Compressing objects:  88% (23/26)        
2022-05-02T10:14:30.2059036Z remote: Compressing objects:  92% (24/26)        
2022-05-02T10:14:30.2059832Z remote: Compressing objects:  96% (25/26)        
2022-05-02T10:14:30.2060600Z remote: Compressing objects: 100% (26/26)        
2022-05-02T10:14:30.2061396Z remote: Compressing objects: 100% (26/26), done.        
2022-05-02T10:14:30.2062808Z remote: Total 43 (delta 5), reused 26 (delta 2), pack-reused 0        
2022-05-02T10:14:30.2378845Z From https://github.com/Demo2886/GitOPS
2022-05-02T10:14:30.2379890Z    75f53b1..b152010  master     -> origin/master
2022-05-02T10:14:30.2391721Z [command]/usr/bin/git branch --list --remote origin/master
2022-05-02T10:14:30.2411799Z   origin/master
2022-05-02T10:14:30.2418813Z [command]/usr/bin/git rev-parse refs/remotes/origin/master
2022-05-02T10:14:30.2485201Z b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:30.2487012Z ##[endgroup]
2022-05-02T10:14:30.2488431Z ##[group]Determining the checkout info
2022-05-02T10:14:30.2489112Z ##[endgroup]
2022-05-02T10:14:30.2490154Z ##[group]Checking out the ref
2022-05-02T10:14:30.2493185Z [command]/usr/bin/git checkout --progress --force -B master refs/remotes/origin/master
2022-05-02T10:14:30.2524914Z Previous HEAD position was 75f53b1 up_my_runner4
2022-05-02T10:14:30.2536926Z Switched to a new branch 'master'
2022-05-02T10:14:30.2539006Z Branch 'master' set up to track remote branch 'master' from 'origin'.
2022-05-02T10:14:30.2567503Z ##[endgroup]
2022-05-02T10:14:30.2585501Z [command]/usr/bin/git log -1 --format='%H'
2022-05-02T10:14:30.2603571Z 'b15201068af0a2c55786179af3e918b2039b96d1'
2022-05-02T10:14:30.3100637Z ##[group]Run tj-actions/changed-files@v19
2022-05-02T10:14:30.3100981Z with:
2022-05-02T10:14:30.3101393Z   token: ***
2022-05-02T10:14:30.3101668Z   separator:  
2022-05-02T10:14:30.3101954Z   files_separator: 

2022-05-02T10:14:30.3102266Z   files_ignore_separator: 

2022-05-02T10:14:30.3102600Z   sha: b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:30.3102928Z   since_last_remote_commit: false
2022-05-02T10:14:30.3103267Z   use_fork_point: false
2022-05-02T10:14:30.3103567Z   quotepath: true
2022-05-02T10:14:30.3103850Z ##[endgroup]
2022-05-02T10:14:30.3405906Z ##[group]Run # "Set base sha..."
2022-05-02T10:14:30.3406331Z [36;1m# "Set base sha..."[0m
2022-05-02T10:14:30.3406636Z [36;1mif [[ -n "" ]]; then[0m
2022-05-02T10:14:30.3406968Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-02T10:14:30.3407375Z [36;1melif [[ "false" == "true" && "75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-02T10:14:30.3407911Z [36;1m    echo "::set-output name=base_sha::75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a"[0m
2022-05-02T10:14:30.3408278Z [36;1mfi[0m
2022-05-02T10:14:30.3425268Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-02T10:14:30.3425650Z ##[endgroup]
2022-05-02T10:14:30.3583631Z ##[group]Run # "Calculating the previous and current SHA..."
2022-05-02T10:14:30.3584086Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-05-02T10:14:30.3584471Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-05-02T10:14:30.3593885Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-02T10:14:30.3594265Z env:
2022-05-02T10:14:30.3594728Z   GITHUB_SERVER_URL: https://github.com
2022-05-02T10:14:30.3595112Z   GITHUB_REPOSITORY: Demo2886/GitOPS
2022-05-02T10:14:30.3595429Z   GITHUB_BASE_REF: 
2022-05-02T10:14:30.3595708Z   GITHUB_HEAD_REF: 
2022-05-02T10:14:30.3596097Z   GITHUB_ACTION_PATH: /home/vagrant/exit/_actions/tj-actions/changed-files/v19
2022-05-02T10:14:30.3596520Z   INPUT_SHA: b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:30.3596841Z   INPUT_BASE_SHA: 
2022-05-02T10:14:30.3597281Z   INPUT_TOKEN: ***
2022-05-02T10:14:30.3597568Z   INPUT_PATH: 
2022-05-02T10:14:30.3597869Z   INPUT_USE_FORK_POINT: false
2022-05-02T10:14:30.3598161Z ##[endgroup]
2022-05-02T10:14:30.3640846Z ##[group]changed-files-diff-sha
2022-05-02T10:14:30.3641554Z Resolving repository path...
2022-05-02T10:14:30.3659350Z Setting up 'temp_changed_files' remote...
2022-05-02T10:14:30.3684913Z No 'temp_changed_files' remote found
2022-05-02T10:14:30.3685654Z Creating 'temp_changed_files' remote...
2022-05-02T10:14:30.3710702Z Getting HEAD SHA...
2022-05-02T10:14:31.0886960Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-02T10:14:31.0935413Z From https://github.com/Demo2886/GitOPS
2022-05-02T10:14:31.0936433Z  * [new branch]      master     -> temp_changed_files/master
2022-05-02T10:14:31.1052321Z ##[endgroup]
2022-05-02T10:14:31.1117107Z ##[group]Run tj-actions/glob@v7.16
2022-05-02T10:14:31.1117423Z with:
2022-05-02T10:14:31.1117706Z   files-separator: 

2022-05-02T10:14:31.1118013Z   escape-paths: true
2022-05-02T10:14:31.1118332Z   excluded-files-separator: 

2022-05-02T10:14:31.1118699Z   base-sha: 75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a
2022-05-02T10:14:31.1119063Z   sha: b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:31.1119391Z   include-deleted-files: true
2022-05-02T10:14:31.1119829Z   separator: |
2022-05-02T10:14:31.1120175Z   files-from-source-file-separator: 

2022-05-02T10:14:31.1120579Z   excluded-files-from-source-file-separator: 

2022-05-02T10:14:31.1120969Z   follow-symbolic-links: true
2022-05-02T10:14:31.1121309Z   strip-top-level-dir: true
2022-05-02T10:14:31.1121607Z ##[endgroup]
2022-05-02T10:14:31.1779988Z [command]/usr/bin/git rev-parse --show-toplevel
2022-05-02T10:14:31.1821263Z /home/vagrant/exit/GitOPS/GitOPS
2022-05-02T10:14:31.1852095Z [command]/usr/bin/git diff --diff-filter=D --name-only 75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:31.1872967Z .github/workflows/github-actions-demo.yml
2022-05-02T10:14:31.1882126Z 
2022-05-02T10:14:31.1948273Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-02T10:14:31.1948707Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-02T10:14:31.1958598Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-02T10:14:31.1958960Z env:
2022-05-02T10:14:31.1959351Z   GITHUB_ACTION_PATH: /home/vagrant/exit/_actions/tj-actions/changed-files/v19
2022-05-02T10:14:31.1959739Z   INPUT_FILES_PATTERN_FILE: 
2022-05-02T10:14:31.1960059Z   INPUT_SEPARATOR:  
2022-05-02T10:14:31.1960357Z   INPUT_PATH: 
2022-05-02T10:14:31.1960700Z   INPUT_PREVIOUS_SHA: 75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a
2022-05-02T10:14:31.1961109Z   INPUT_CURRENT_SHA: b15201068af0a2c55786179af3e918b2039b96d1
2022-05-02T10:14:31.1961471Z   INPUT_TARGET_BRANCH: master
2022-05-02T10:14:31.1961810Z   INPUT_CURRENT_BRANCH: master
2022-05-02T10:14:31.1962144Z   INPUT_QUOTEPATH: true
2022-05-02T10:14:31.1962449Z ##[endgroup]
2022-05-02T10:14:31.2017715Z ##[group]changed-files
2022-05-02T10:14:31.2018083Z Resolving repository path...
2022-05-02T10:14:31.2019524Z Retrieving changes between 75f53b131cff3d2e2a56e82d82eadd9f4e7cfe4a (master) → b15201068af0a2c55786179af3e918b2039b96d1 (master)
2022-05-02T10:14:31.2020017Z Getting diff...
2022-05-02T10:14:31.4358855Z Added files: file2.txt file3.txt
2022-05-02T10:14:31.4359512Z Copied files: 
2022-05-02T10:14:31.4362344Z Deleted files: .github/workflows/github-actions-demo.yml
2022-05-02T10:14:31.4362738Z Modified files: 
2022-05-02T10:14:31.4363029Z Renamed files: 
2022-05-02T10:14:31.4363314Z Type Changed files: 
2022-05-02T10:14:31.4363608Z Unmerged files: 
2022-05-02T10:14:31.4363890Z Unknown files: 
2022-05-02T10:14:31.4364418Z All changed and modified files: .github/workflows/github-actions-demo.yml file2.txt file3.txt
2022-05-02T10:14:31.4364858Z All changed files: file2.txt file3.txt
2022-05-02T10:14:31.4365395Z All modified files: .github/workflows/github-actions-demo.yml file2.txt file3.txt
2022-05-02T10:14:31.4369977Z ##[endgroup]
2022-05-02T10:14:31.4494949Z ##[group]Run for file in file2.txt file3.txt; do
2022-05-02T10:14:31.4495361Z [36;1mfor file in file2.txt file3.txt; do[0m
2022-05-02T10:14:31.4495718Z [36;1m  echo "$files was changed" >> files.log 2>&1[0m
2022-05-02T10:14:31.4496141Z [36;1m  echo "Count Tab in files: `grep -P '\t' $file | wc -l`" >> files.log 2>&1 [0m
2022-05-02T10:14:31.4496512Z [36;1mdone[0m
2022-05-02T10:14:31.4506374Z shell: /usr/bin/bash -e {0}
2022-05-02T10:14:31.4506687Z ##[endgroup]
2022-05-02T10:14:31.4593952Z ##[group]Run actions/upload-artifact@v2
2022-05-02T10:14:31.4594282Z with:
2022-05-02T10:14:31.4594559Z   path: files.log
2022-05-02T10:14:31.4594846Z   name: artifact
2022-05-02T10:14:31.4595137Z   if-no-files-found: warn
2022-05-02T10:14:31.4595441Z ##[endgroup]
2022-05-02T10:14:31.5118978Z With the provided path, there will be 1 file uploaded
2022-05-02T10:14:31.5120604Z Starting artifact upload
2022-05-02T10:14:31.5121989Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-02T10:14:31.5123942Z Artifact name is valid!
2022-05-02T10:14:32.0249380Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-02T10:14:32.2438158Z Total size of all the files uploaded is 60 bytes
2022-05-02T10:14:32.2439551Z File upload process has finished. Finalizing the artifact upload
2022-05-02T10:14:32.4387186Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-02T10:14:32.4387470Z 
2022-05-02T10:14:32.4387681Z The raw size of all the files that were specified for upload is 70 bytes
2022-05-02T10:14:32.4388235Z The size of all the files that were uploaded is 60 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-02T10:14:32.4388590Z 
2022-05-02T10:14:32.4389403Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-02T10:14:32.4389825Z 
2022-05-02T10:14:32.4390008Z Artifact artifact has been successfully uploaded!
2022-05-02T10:14:32.4631319Z Post job cleanup.
2022-05-02T10:14:32.4672490Z Post job cleanup.
2022-05-02T10:14:32.5131033Z Post job cleanup.
2022-05-02T10:14:32.6398513Z [command]/usr/bin/git version
2022-05-02T10:14:32.6434171Z git version 2.25.1
2022-05-02T10:14:32.6471789Z Copying '/home/vagrant/.gitconfig' to '/home/vagrant/exit/_temp/b480584d-dc20-4a04-88ed-1cd5b513d173/.gitconfig'
2022-05-02T10:14:32.6488796Z Temporarily overriding HOME='/home/vagrant/exit/_temp/b480584d-dc20-4a04-88ed-1cd5b513d173' before making global git config changes
2022-05-02T10:14:32.6489741Z Adding repository directory to the temporary git global config as a safe directory
2022-05-02T10:14:32.6493688Z [command]/usr/bin/git config --global --add safe.directory /home/vagrant/exit/GitOPS/GitOPS
2022-05-02T10:14:32.6528886Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-02T10:14:32.6556553Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-02T10:14:32.6773413Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-02T10:14:32.6793765Z http.https://github.com/.extraheader
2022-05-02T10:14:32.6803192Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-02T10:14:32.6868452Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-02T10:14:32.7439208Z Cleaning up orphan processes

```
