# 04.GitOps

## Repository [link](https://github.com/devel0ne/04.GitOps)



## [Pipeline logs]
```bash
2022-01-23T20:09:24.2589423Z Waiting for a runner to pick up this job...
2022-01-23T20:09:24.8941920Z Job is about to start running on the runner: ubuntu_runner (repository)
2022-01-23T20:09:27.6191005Z Current runner version: '2.286.1'
2022-01-23T20:09:27.6199768Z Runner name: 'ubuntu_runner'
2022-01-23T20:09:27.6200270Z Runner group name: 'Default'
2022-01-23T20:09:27.6201253Z Machine name: 'ubuntu-focal'
2022-01-23T20:09:27.6204391Z ##[group]GITHUB_TOKEN Permissions
2022-01-23T20:09:27.6204987Z Actions: write
2022-01-23T20:09:27.6205290Z Checks: write
2022-01-23T20:09:27.6205611Z Contents: write
2022-01-23T20:09:27.6205958Z Deployments: write
2022-01-23T20:09:27.6206278Z Discussions: write
2022-01-23T20:09:27.6206617Z Issues: write
2022-01-23T20:09:27.6206906Z Metadata: read
2022-01-23T20:09:27.6207235Z Packages: write
2022-01-23T20:09:27.6207539Z Pages: write
2022-01-23T20:09:27.6207870Z PullRequests: write
2022-01-23T20:09:27.6208347Z RepositoryProjects: write
2022-01-23T20:09:27.6208737Z SecurityEvents: write
2022-01-23T20:09:27.6209076Z Statuses: write
2022-01-23T20:09:27.6209380Z ##[endgroup]
2022-01-23T20:09:27.6213715Z Secret source: Actions
2022-01-23T20:09:27.6214319Z Prepare workflow directory
2022-01-23T20:09:27.7754540Z Prepare all required actions
2022-01-23T20:09:27.8081609Z Getting action download info
2022-01-23T20:09:28.3556112Z Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
2022-01-23T20:09:29.2786557Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-01-23T20:09:30.3559266Z ##[group]Run echo "The devel0ne/04.GitOps repository will be cloned to the runner."
2022-01-23T20:09:30.3559944Z [36;1mecho "The devel0ne/04.GitOps repository will be cloned to the runner."[0m
2022-01-23T20:09:30.3617057Z shell: /usr/bin/bash -e {0}
2022-01-23T20:09:30.3617550Z ##[endgroup]
2022-01-23T20:09:30.4087212Z The devel0ne/04.GitOps repository will be cloned to the runner.
2022-01-23T20:09:30.4451068Z ##[group]Run actions/checkout@v2
2022-01-23T20:09:30.4452142Z with:
2022-01-23T20:09:30.4454250Z   fetch-depth: 0
2022-01-23T20:09:30.4455908Z   repository: devel0ne/04.GitOps
2022-01-23T20:09:30.4457158Z   token: ***
2022-01-23T20:09:30.4458829Z   ssh-strict: true
2022-01-23T20:09:30.4459823Z   persist-credentials: true
2022-01-23T20:09:30.4461816Z   clean: true
2022-01-23T20:09:30.4463429Z   lfs: false
2022-01-23T20:09:30.4464397Z   submodules: false
2022-01-23T20:09:30.4466014Z ##[endgroup]
2022-01-23T20:09:30.9783074Z Syncing repository: devel0ne/04.GitOps
2022-01-23T20:09:30.9789814Z ##[group]Getting Git version info
2022-01-23T20:09:30.9792227Z Working directory is '/home/vagrant/exit/04.GitOps/04.GitOps'
2022-01-23T20:09:30.9796084Z [command]/usr/bin/git version
2022-01-23T20:09:30.9960592Z git version 2.25.1
2022-01-23T20:09:31.0056620Z ##[endgroup]
2022-01-23T20:09:31.0086290Z [command]/usr/bin/git config --local --get remote.origin.url
2022-01-23T20:09:31.0454847Z https://github.com/devel0ne/04.GitOps
2022-01-23T20:09:31.0548473Z ##[group]Removing previously created refs, to avoid conflicts
2022-01-23T20:09:31.0549471Z [command]/usr/bin/git rev-parse --symbolic-full-name --verify --quiet HEAD
2022-01-23T20:09:31.0873957Z HEAD
2022-01-23T20:09:31.0920688Z [command]/usr/bin/git rev-parse --symbolic-full-name --branches
2022-01-23T20:09:31.1265177Z ##[endgroup]
2022-01-23T20:09:31.1265886Z ##[group]Cleaning the repository
2022-01-23T20:09:31.1266795Z [command]/usr/bin/git clean -ffdx
2022-01-23T20:09:31.1503006Z Removing Artifacts/
2022-01-23T20:09:31.1574265Z [command]/usr/bin/git reset --hard HEAD
2022-01-23T20:09:31.1870816Z HEAD is now at 4e7b010 Merge 3ff281de67353f222c588b93bca28ab489017784 into f43b071cd9fa4af56abd69c31e1cf052603ff4d5
2022-01-23T20:09:31.1905402Z ##[endgroup]
2022-01-23T20:09:31.1921697Z ##[group]Disabling automatic garbage collection
2022-01-23T20:09:31.1935850Z [command]/usr/bin/git config --local gc.auto 0
2022-01-23T20:09:31.2184743Z ##[endgroup]
2022-01-23T20:09:31.2297756Z ##[group]Setting up auth
2022-01-23T20:09:31.2298746Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-23T20:09:31.2567406Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-23T20:09:31.5130377Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-23T20:09:31.5398629Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-23T20:09:31.8827255Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-01-23T20:09:31.9184046Z ##[endgroup]
2022-01-23T20:09:31.9192668Z ##[group]Fetching the repository
2022-01-23T20:09:31.9245756Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +c8468181e04775d0342ff32b464181f2c3625ec1:refs/remotes/pull/1/merge
2022-01-23T20:09:32.6623685Z remote: Enumerating objects: 8, done.        
2022-01-23T20:09:32.6628993Z remote: Counting objects:  12% (1/8)        
2022-01-23T20:09:32.6629446Z remote: Counting objects:  25% (2/8)        
2022-01-23T20:09:32.6634782Z remote: Counting objects:  37% (3/8)        
2022-01-23T20:09:32.6635215Z remote: Counting objects:  50% (4/8)        
2022-01-23T20:09:32.6638739Z remote: Counting objects:  62% (5/8)        
2022-01-23T20:09:32.6639141Z remote: Counting objects:  75% (6/8)        
2022-01-23T20:09:32.6644018Z remote: Counting objects:  87% (7/8)        
2022-01-23T20:09:32.6655526Z remote: Counting objects: 100% (8/8)        
2022-01-23T20:09:32.6656596Z remote: Counting objects: 100% (8/8), done.        
2022-01-23T20:09:32.6660131Z remote: Compressing objects:  33% (1/3)        
2022-01-23T20:09:32.6660609Z remote: Compressing objects:  66% (2/3)        
2022-01-23T20:09:32.6661045Z remote: Compressing objects: 100% (3/3)        
2022-01-23T20:09:32.6661435Z remote: Compressing objects: 100% (3/3), done.        
2022-01-23T20:09:32.6663100Z remote: Total 5 (delta 3), reused 3 (delta 2), pack-reused 0        
2022-01-23T20:09:32.7134266Z From https://github.com/devel0ne/04.GitOps
2022-01-23T20:09:32.7137808Z    3ff281d..fe95f2d  test_pr                                  -> origin/test_pr
2022-01-23T20:09:32.7148093Z  + 4e7b010...c846818 c8468181e04775d0342ff32b464181f2c3625ec1 -> pull/1/merge  (forced update)
2022-01-23T20:09:32.7415591Z ##[endgroup]
2022-01-23T20:09:32.7418000Z ##[group]Determining the checkout info
2022-01-23T20:09:32.7424163Z ##[endgroup]
2022-01-23T20:09:32.7428326Z ##[group]Checking out the ref
2022-01-23T20:09:32.7450004Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/1/merge
2022-01-23T20:09:32.7788207Z Warning: you are leaving 1 commit behind, not connected to
2022-01-23T20:09:32.7793023Z any of your branches:
2022-01-23T20:09:32.7793460Z 
2022-01-23T20:09:32.7798674Z   4e7b010 Merge 3ff281de67353f222c588b93bca28ab489017784 into f43b071cd9fa4af56abd69c31e1cf052603ff4d5
2022-01-23T20:09:32.7799079Z 
2022-01-23T20:09:32.7802672Z If you want to keep it by creating a new branch, this may be a good time
2022-01-23T20:09:32.7803270Z to do so with:
2022-01-23T20:09:32.7808042Z 
2022-01-23T20:09:32.7809157Z  git branch <new-branch-name> 4e7b010
2022-01-23T20:09:32.7811548Z 
2022-01-23T20:09:32.7828612Z HEAD is now at c846818 Merge fe95f2dc9b28327ee0cd96eb06712cc556a2dd48 into a706ff4bce940da5f0155530006888172a504840
2022-01-23T20:09:32.7851294Z ##[endgroup]
2022-01-23T20:09:32.8152365Z [command]/usr/bin/git log -1 --format='%H'
2022-01-23T20:09:32.8402807Z 'c8468181e04775d0342ff32b464181f2c3625ec1'
2022-01-23T20:09:32.8871117Z ##[group]Run mkdir Artifacts
2022-01-23T20:09:32.8871696Z [36;1mmkdir Artifacts[0m
2022-01-23T20:09:32.8872081Z [36;1mfor file in $(git diff --name-only origin/main); do[0m
2022-01-23T20:09:32.8872471Z [36;1m([0m
2022-01-23T20:09:32.8872854Z [36;1m  a=$(awk '{print gsub(/\t/,"")}' $file | awk '{s+=$1} END { print s }')  [0m
2022-01-23T20:09:32.8873717Z [36;1m  if ((a>0)); then[0m
2022-01-23T20:09:32.8874142Z [36;1m    echo "Found '$file' with tabs"[0m
2022-01-23T20:09:32.8874545Z [36;1m    echo "Checking file $file" > Artifacts/${file}_artifacts[0m
2022-01-23T20:09:32.8875024Z [36;1m    echo "Count $a" >> Artifacts/${file}_artifacts  [0m
2022-01-23T20:09:32.8875385Z [36;1m  fi[0m
2022-01-23T20:09:32.8875652Z [36;1m) & [0m
2022-01-23T20:09:32.8876024Z [36;1mdone[0m
2022-01-23T20:09:32.8935873Z shell: /usr/bin/bash -e {0}
2022-01-23T20:09:32.8936166Z ##[endgroup]
2022-01-23T20:09:33.1411246Z Found 'test01.txt' with tabs
2022-01-23T20:09:33.1573832Z Found 'test02.txt' with tabs
2022-01-23T20:09:33.1745464Z Found 'test03.txt' with tabs
2022-01-23T20:09:33.1845352Z ##[group]Run actions/upload-artifact@v2
2022-01-23T20:09:33.1845760Z with:
2022-01-23T20:09:33.1846019Z   name: Artifacts
2022-01-23T20:09:33.1846435Z   path: ./Artifacts/
2022-01-23T20:09:33.1846791Z   if-no-files-found: warn
2022-01-23T20:09:33.1847106Z ##[endgroup]
2022-01-23T20:09:33.4069406Z With the provided path, there will be 3 files uploaded
2022-01-23T20:09:33.4083523Z Starting artifact upload
2022-01-23T20:09:33.4085662Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-01-23T20:09:33.4094583Z Artifact name is valid!
2022-01-23T20:09:34.2407200Z Container for artifact "Artifacts" successfully created. Starting upload of file(s)
2022-01-23T20:09:35.6295802Z Total size of all the files uploaded is 101 bytes
2022-01-23T20:09:35.6296440Z File upload process has finished. Finalizing the artifact upload
2022-01-23T20:09:36.3432249Z Artifact has been finalized. All files have been successfully uploaded!
2022-01-23T20:09:36.3432593Z 
2022-01-23T20:09:36.3432944Z The raw size of all the files that were specified for upload is 101 bytes
2022-01-23T20:09:36.3433571Z The size of all the files that were uploaded is 101 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-01-23T20:09:36.3435142Z 
2022-01-23T20:09:36.3436208Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-01-23T20:09:36.3436703Z 
2022-01-23T20:09:36.3437145Z Artifact Artifacts has been successfully uploaded!
2022-01-23T20:09:36.3753157Z Post job cleanup.
2022-01-23T20:09:36.8359683Z [command]/usr/bin/git version
2022-01-23T20:09:36.8680367Z git version 2.25.1
2022-01-23T20:09:36.8822126Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-23T20:09:36.9104201Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-23T20:09:37.1469011Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-23T20:09:37.1761914Z http.https://github.com/.extraheader
2022-01-23T20:09:37.1797161Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-01-23T20:09:37.2070269Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-23T20:09:37.5060485Z Cleaning up orphan processes
```
 
