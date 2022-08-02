## Repository
[github-test](https://github.com/alexv8888/03git)

## Action file

[04gitops.yml](04gitops.yml)

## Log of the pipeline

```bash

2022-08-02T14:18:38.8646910Z Requested labels: ubuntu-latest
2022-08-02T14:18:38.8646951Z Job defined at: alexv8888/03git/.github/workflows/04gitops.yml@refs/pull/10/merge
2022-08-02T14:18:38.8646971Z Waiting for a runner to pick up this job...
2022-08-02T14:18:39.1869197Z Job is waiting for a hosted runner to come online.
2022-08-02T14:18:42.2202877Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-08-02T14:18:44.1844308Z Current runner version: '2.294.0'
2022-08-02T14:18:44.1871775Z ##[group]Operating System
2022-08-02T14:18:44.1872325Z Ubuntu
2022-08-02T14:18:44.1872555Z 20.04.4
2022-08-02T14:18:44.1872890Z LTS
2022-08-02T14:18:44.1873168Z ##[endgroup]
2022-08-02T14:18:44.1873453Z ##[group]Virtual Environment
2022-08-02T14:18:44.1873832Z Environment: ubuntu-20.04
2022-08-02T14:18:44.1874180Z Version: 20220729.1
2022-08-02T14:18:44.1874639Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220729.1/images/linux/Ubuntu2004-Readme.md
2022-08-02T14:18:44.1875281Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220729.1
2022-08-02T14:18:44.1875721Z ##[endgroup]
2022-08-02T14:18:44.1876018Z ##[group]Virtual Environment Provisioner
2022-08-02T14:18:44.1876402Z 1.0.0.0-main-20220725-1
2022-08-02T14:18:44.1876699Z ##[endgroup]
2022-08-02T14:18:44.1877566Z ##[group]GITHUB_TOKEN Permissions
2022-08-02T14:18:44.1878177Z Actions: write
2022-08-02T14:18:44.1878644Z Checks: write
2022-08-02T14:18:44.1878964Z Contents: write
2022-08-02T14:18:44.1879269Z Deployments: write
2022-08-02T14:18:44.1879561Z Discussions: write
2022-08-02T14:18:44.1879882Z Issues: write
2022-08-02T14:18:44.1880137Z Metadata: read
2022-08-02T14:18:44.1880444Z Packages: write
2022-08-02T14:18:44.1880755Z Pages: write
2022-08-02T14:18:44.1881009Z PullRequests: write
2022-08-02T14:18:44.1881380Z RepositoryProjects: write
2022-08-02T14:18:44.1881721Z SecurityEvents: write
2022-08-02T14:18:44.1881987Z Statuses: write
2022-08-02T14:18:44.1882285Z ##[endgroup]
2022-08-02T14:18:44.1886115Z Secret source: Actions
2022-08-02T14:18:44.1886557Z Prepare workflow directory
2022-08-02T14:18:44.2752760Z Prepare all required actions
2022-08-02T14:18:44.2943850Z Getting action download info
2022-08-02T14:18:44.4961457Z Download action repository 'actions/checkout@v2.4.2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-08-02T14:18:44.8163331Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2022-08-02T14:18:44.9878187Z Download action repository 'actions/upload-artifact@v3' (SHA:3cea5372237819ed00197afe530f5a7ea3e805c8)
2022-08-02T14:18:45.4293697Z ##[group]Run actions/checkout@v2.4.2
2022-08-02T14:18:45.4294073Z with:
2022-08-02T14:18:45.4294296Z   repository: alexv8888/03git
2022-08-02T14:18:45.4294846Z   token: ***
2022-08-02T14:18:45.4295074Z   ssh-strict: true
2022-08-02T14:18:45.4295318Z   persist-credentials: true
2022-08-02T14:18:45.4295565Z   clean: true
2022-08-02T14:18:45.4295781Z   fetch-depth: 1
2022-08-02T14:18:45.4296002Z   lfs: false
2022-08-02T14:18:45.4296218Z   submodules: false
2022-08-02T14:18:45.4296461Z   set-safe-directory: true
2022-08-02T14:18:45.4296890Z ##[endgroup]
2022-08-02T14:18:45.6996090Z Syncing repository: alexv8888/03git
2022-08-02T14:18:45.6998029Z ##[group]Getting Git version info
2022-08-02T14:18:45.6998636Z Working directory is '/home/runner/work/03git/03git'
2022-08-02T14:18:45.6999176Z [command]/usr/bin/git version
2022-08-02T14:18:45.7091855Z git version 2.37.1
2022-08-02T14:18:45.7115671Z ##[endgroup]
2022-08-02T14:18:45.7139452Z Temporarily overriding HOME='/home/runner/work/_temp/155e0fac-bc84-4f82-a45a-5b0a5f04afb2' before making global git config changes
2022-08-02T14:18:45.7140027Z Adding repository directory to the temporary git global config as a safe directory
2022-08-02T14:18:45.7140581Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03git/03git
2022-08-02T14:18:45.7185068Z Deleting the contents of '/home/runner/work/03git/03git'
2022-08-02T14:18:45.7189127Z ##[group]Initializing the repository
2022-08-02T14:18:45.7227820Z [command]/usr/bin/git init /home/runner/work/03git/03git
2022-08-02T14:18:45.7290136Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-08-02T14:18:45.7290590Z hint: is subject to change. To configure the initial branch name to use in all
2022-08-02T14:18:45.7291190Z hint: of your new repositories, which will suppress this warning, call:
2022-08-02T14:18:45.7291865Z hint: 
2022-08-02T14:18:45.7292308Z hint: 	git config --global init.defaultBranch <name>
2022-08-02T14:18:45.7292628Z hint: 
2022-08-02T14:18:45.7293006Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-08-02T14:18:45.7293612Z hint: 'development'. The just-created branch can be renamed via this command:
2022-08-02T14:18:45.7293982Z hint: 
2022-08-02T14:18:45.7294271Z hint: 	git branch -m <name>
2022-08-02T14:18:45.7313724Z Initialized empty Git repository in /home/runner/work/03git/03git/.git/
2022-08-02T14:18:45.7323073Z [command]/usr/bin/git remote add origin https://github.com/alexv8888/03git
2022-08-02T14:18:45.7368659Z ##[endgroup]
2022-08-02T14:18:45.7369544Z ##[group]Disabling automatic garbage collection
2022-08-02T14:18:45.7373212Z [command]/usr/bin/git config --local gc.auto 0
2022-08-02T14:18:45.7404378Z ##[endgroup]
2022-08-02T14:18:45.7405166Z ##[group]Setting up auth
2022-08-02T14:18:45.7412335Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-02T14:18:45.7445348Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-02T14:18:45.7774654Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-02T14:18:45.7808673Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-02T14:18:45.8045406Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-08-02T14:18:45.8077305Z ##[endgroup]
2022-08-02T14:18:45.8077826Z ##[group]Fetching the repository
2022-08-02T14:18:45.8089089Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +fec5a6d6a87203e266f4a3775a6050648744f042:refs/remotes/pull/10/merge
2022-08-02T14:18:46.0177943Z remote: Enumerating objects: 16, done.        
2022-08-02T14:18:46.0179040Z remote: Counting objects:   6% (1/16)        
2022-08-02T14:18:46.0179543Z remote: Counting objects:  12% (2/16)        
2022-08-02T14:18:46.0179797Z remote: Counting objects:  18% (3/16)        
2022-08-02T14:18:46.0180048Z remote: Counting objects:  25% (4/16)        
2022-08-02T14:18:46.0180292Z remote: Counting objects:  31% (5/16)        
2022-08-02T14:18:46.0180519Z remote: Counting objects:  37% (6/16)        
2022-08-02T14:18:46.0180760Z remote: Counting objects:  43% (7/16)        
2022-08-02T14:18:46.0181000Z remote: Counting objects:  50% (8/16)        
2022-08-02T14:18:46.0181471Z remote: Counting objects:  56% (9/16)        
2022-08-02T14:18:46.0181705Z remote: Counting objects:  62% (10/16)        
2022-08-02T14:18:46.0181966Z remote: Counting objects:  68% (11/16)        
2022-08-02T14:18:46.0182212Z remote: Counting objects:  75% (12/16)        
2022-08-02T14:18:46.0182460Z remote: Counting objects:  81% (13/16)        
2022-08-02T14:18:46.0182695Z remote: Counting objects:  87% (14/16)        
2022-08-02T14:18:46.0182937Z remote: Counting objects:  93% (15/16)        
2022-08-02T14:18:46.0184868Z remote: Counting objects: 100% (16/16)        
2022-08-02T14:18:46.0185144Z remote: Counting objects: 100% (16/16), done.        
2022-08-02T14:18:46.0185439Z remote: Compressing objects:  11% (1/9)        
2022-08-02T14:18:46.0185700Z remote: Compressing objects:  22% (2/9)        
2022-08-02T14:18:46.0185948Z remote: Compressing objects:  33% (3/9)        
2022-08-02T14:18:46.0186196Z remote: Compressing objects:  44% (4/9)        
2022-08-02T14:18:46.0186449Z remote: Compressing objects:  55% (5/9)        
2022-08-02T14:18:46.0186695Z remote: Compressing objects:  66% (6/9)        
2022-08-02T14:18:46.0186936Z remote: Compressing objects:  77% (7/9)        
2022-08-02T14:18:46.0187179Z remote: Compressing objects:  88% (8/9)        
2022-08-02T14:18:46.0187628Z remote: Compressing objects: 100% (9/9)        
2022-08-02T14:18:46.0187896Z remote: Compressing objects: 100% (9/9), done.        
2022-08-02T14:18:46.0189611Z remote: Total 16 (delta 0), reused 14 (delta 0), pack-reused 0        
2022-08-02T14:18:46.0292303Z From https://github.com/alexv8888/03git
2022-08-02T14:18:46.0292966Z  * [new ref]         fec5a6d6a87203e266f4a3775a6050648744f042 -> pull/10/merge
2022-08-02T14:18:46.0319728Z ##[endgroup]
2022-08-02T14:18:46.0320483Z ##[group]Determining the checkout info
2022-08-02T14:18:46.0321806Z ##[endgroup]
2022-08-02T14:18:46.0322335Z ##[group]Checking out the ref
2022-08-02T14:18:46.0334187Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/10/merge
2022-08-02T14:18:46.0367543Z Note: switching to 'refs/remotes/pull/10/merge'.
2022-08-02T14:18:46.0368008Z 
2022-08-02T14:18:46.0370482Z You are in 'detached HEAD' state. You can look around, make experimental
2022-08-02T14:18:46.0371034Z changes and commit them, and you can discard any commits you make in this
2022-08-02T14:18:46.0371786Z state without impacting any branches by switching back to a branch.
2022-08-02T14:18:46.0372030Z 
2022-08-02T14:18:46.0372201Z If you want to create a new branch to retain commits you create, you may
2022-08-02T14:18:46.0372726Z do so (now or later) by using -c with the switch command. Example:
2022-08-02T14:18:46.0372911Z 
2022-08-02T14:18:46.0373084Z   git switch -c <new-branch-name>
2022-08-02T14:18:46.0373241Z 
2022-08-02T14:18:46.0373340Z Or undo this operation with:
2022-08-02T14:18:46.0373471Z 
2022-08-02T14:18:46.0373552Z   git switch -
2022-08-02T14:18:46.0373671Z 
2022-08-02T14:18:46.0373847Z Turn off this advice by setting config variable advice.detachedHead to false
2022-08-02T14:18:46.0374055Z 
2022-08-02T14:18:46.0375376Z HEAD is now at fec5a6d Merge e73858692b9cb7ccc26264dd12e3468e003e5085 into ab00d6eace3181ae211cd3ef605eec60e6eb6bf3
2022-08-02T14:18:46.0378863Z ##[endgroup]
2022-08-02T14:18:46.0423316Z [command]/usr/bin/git log -1 --format='%H'
2022-08-02T14:18:46.0449997Z 'fec5a6d6a87203e266f4a3775a6050648744f042'
2022-08-02T14:18:46.0751535Z ##[group]Run jitterbit/get-changed-files@v1
2022-08-02T14:18:46.0751796Z with:
2022-08-02T14:18:46.0751967Z   format: csv
2022-08-02T14:18:46.0752339Z   token: ***
2022-08-02T14:18:46.0752527Z ##[endgroup]
2022-08-02T14:18:46.1697394Z Base commit: ab00d6eace3181ae211cd3ef605eec60e6eb6bf3
2022-08-02T14:18:46.1697745Z Head commit: e73858692b9cb7ccc26264dd12e3468e003e5085
2022-08-02T14:18:46.4346272Z All: tabfile
2022-08-02T14:18:46.4346525Z Added: 
2022-08-02T14:18:46.4346817Z Modified: tabfile
2022-08-02T14:18:46.4347003Z Removed: 
2022-08-02T14:18:46.4347184Z Renamed: 
2022-08-02T14:18:46.4347390Z Added or modified: tabfile
2022-08-02T14:18:46.4495683Z ##[group]Run mapfile -d ',' -t added_modified_files < <(printf '%s,' 'tabfile')
2022-08-02T14:18:46.4496137Z [36;1mmapfile -d ',' -t added_modified_files < <(printf '%s,' 'tabfile')[0m
2022-08-02T14:18:46.4496478Z [36;1mfor added_modified_file in "${added_modified_files[@]}"; do[0m
2022-08-02T14:18:46.4497212Z [36;1mecho "${added_modified_file} was changed" and has $(grep -o $'\t' ${added_modified_file} | wc -l) tabs | tee log.txt 2>&1 [0m
2022-08-02T14:18:46.4497544Z [36;1mdone[0m
2022-08-02T14:18:46.4555653Z shell: /usr/bin/bash -e {0}
2022-08-02T14:18:46.4555907Z ##[endgroup]
2022-08-02T14:18:46.4752009Z tabfile was changed and has 1 tabs
2022-08-02T14:18:46.4790527Z ##[group]Run actions/upload-artifact@v3
2022-08-02T14:18:46.4790774Z with:
2022-08-02T14:18:46.4790957Z   name: tabcountlog
2022-08-02T14:18:46.4791138Z   path: ./log.txt
2022-08-02T14:18:46.4791342Z   if-no-files-found: warn
2022-08-02T14:18:46.4791545Z ##[endgroup]
2022-08-02T14:18:46.6397605Z With the provided path, there will be 1 file uploaded
2022-08-02T14:18:46.6401588Z Starting artifact upload
2022-08-02T14:18:46.6402522Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-08-02T14:18:46.6403859Z Artifact name is valid!
2022-08-02T14:18:46.6985775Z Container for artifact "tabcountlog" successfully created. Starting upload of file(s)
2022-08-02T14:18:46.7694663Z Total size of all the files uploaded is 35 bytes
2022-08-02T14:18:46.7695049Z File upload process has finished. Finalizing the artifact upload
2022-08-02T14:18:46.8032808Z Artifact has been finalized. All files have been successfully uploaded!
2022-08-02T14:18:46.8034117Z 
2022-08-02T14:18:46.8034624Z The raw size of all the files that were specified for upload is 35 bytes
2022-08-02T14:18:46.8035283Z The size of all the files that were uploaded is 35 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-08-02T14:18:46.8035720Z 
2022-08-02T14:18:46.8036549Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-08-02T14:18:46.8037044Z 
2022-08-02T14:18:46.8037322Z Artifact tabcountlog has been successfully uploaded!
2022-08-02T14:18:46.8121497Z Post job cleanup.
2022-08-02T14:18:46.9310586Z [command]/usr/bin/git version
2022-08-02T14:18:46.9353533Z git version 2.37.1
2022-08-02T14:18:46.9393012Z Temporarily overriding HOME='/home/runner/work/_temp/3bef1283-b59d-4f84-a3b3-96f47f31ff4f' before making global git config changes
2022-08-02T14:18:46.9393726Z Adding repository directory to the temporary git global config as a safe directory
2022-08-02T14:18:46.9397919Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/03git/03git
2022-08-02T14:18:46.9443609Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-08-02T14:18:46.9482224Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-08-02T14:18:46.9773530Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-08-02T14:18:46.9800026Z http.https://github.com/.extraheader
2022-08-02T14:18:46.9807938Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-08-02T14:18:46.9841980Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-08-02T14:18:47.0279686Z Cleaning up orphan processes

```