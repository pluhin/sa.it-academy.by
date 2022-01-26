# 04.GitOps

## Repository [link](https://github.com/DmitryTryput/git_ops)

## Pipeline logs
```bash
2022-01-26T21:26:05.6885082Z Found online and idle hosted runner in the current repository's organization account that matches the required labels: 'ubuntu-latest'
2022-01-26T21:26:05.7444540Z Waiting for a Hosted runner in the 'organization' to pick this job...
2022-01-26T21:26:05.9224342Z Job is waiting for a hosted runner to come online.
2022-01-26T21:26:09.8100579Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-01-26T21:26:13.2208210Z Current runner version: '2.286.1'
2022-01-26T21:26:13.2234718Z ##[group]Operating System
2022-01-26T21:26:13.2235233Z Ubuntu
2022-01-26T21:26:13.2235478Z 20.04.3
2022-01-26T21:26:13.2235782Z LTS
2022-01-26T21:26:13.2236184Z ##[endgroup]
2022-01-26T21:26:13.2236467Z ##[group]Virtual Environment
2022-01-26T21:26:13.2236836Z Environment: ubuntu-20.04
2022-01-26T21:26:13.2237123Z Version: 20220119.1
2022-01-26T21:26:13.2237640Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220119.1/images/linux/Ubuntu2004-Readme.md
2022-01-26T21:26:13.2238347Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220119.1
2022-01-26T21:26:13.2238759Z ##[endgroup]
2022-01-26T21:26:13.2239117Z ##[group]Virtual Environment Provisioner
2022-01-26T21:26:13.2239438Z 1.0.0.0-main-20211214-1
2022-01-26T21:26:13.2239766Z ##[endgroup]
2022-01-26T21:26:13.2240734Z ##[group]GITHUB_TOKEN Permissions
2022-01-26T21:26:13.2241312Z Actions: write
2022-01-26T21:26:13.2241803Z Checks: write
2022-01-26T21:26:13.2242181Z Contents: write
2022-01-26T21:26:13.2242505Z Deployments: write
2022-01-26T21:26:13.2242788Z Discussions: write
2022-01-26T21:26:13.2243104Z Issues: write
2022-01-26T21:26:13.2243360Z Metadata: read
2022-01-26T21:26:13.2243708Z Packages: write
2022-01-26T21:26:13.2244019Z Pages: write
2022-01-26T21:26:13.2244287Z PullRequests: write
2022-01-26T21:26:13.2244639Z RepositoryProjects: write
2022-01-26T21:26:13.2244945Z SecurityEvents: write
2022-01-26T21:26:13.2245306Z Statuses: write
2022-01-26T21:26:13.2245571Z ##[endgroup]
2022-01-26T21:26:13.2249350Z Secret source: Actions
2022-01-26T21:26:13.2249843Z Prepare workflow directory
2022-01-26T21:26:13.3095005Z Prepare all required actions
2022-01-26T21:26:13.3282876Z Getting action download info
2022-01-26T21:26:13.5679853Z Download action repository 'jitterbit/get-changed-files@v1' (SHA:b17fbb00bdc0c0f63fcf166580804b4d2cdc2a42)
2022-01-26T21:26:14.7145120Z ##[group]Run jitterbit/get-changed-files@v1
2022-01-26T21:26:14.7145579Z with:
2022-01-26T21:26:14.7145830Z   format: json
2022-01-26T21:26:14.7146402Z   token: ***
2022-01-26T21:26:14.7146674Z ##[endgroup]
2022-01-26T21:26:14.9486641Z Base commit: 4f730b7354e5e49de05fc052c08a3ebc2ccf6f4c
2022-01-26T21:26:14.9487038Z Head commit: 41f13dfd73a8b6465da609e2657d7236b564d315
2022-01-26T21:26:15.2772342Z All: ["file4.txt","file5.txt"]
2022-01-26T21:26:15.2813613Z Added: []
2022-01-26T21:26:15.2824290Z Modified: ["file4.txt","file5.txt"]
2022-01-26T21:26:15.2825035Z Removed: []
2022-01-26T21:26:15.2825741Z Renamed: []
2022-01-26T21:26:15.2826183Z Added or modified: ["file4.txt","file5.txt"]
2022-01-26T21:26:15.3023030Z Evaluate and set job outputs
2022-01-26T21:26:15.3038310Z Set output 'files'
2022-01-26T21:26:15.3039454Z Cleaning up orphan processes

2022-01-26T21:26:19.1305105Z Found online and idle hosted runner in the current repository's organization account that matches the required labels: 'ubuntu-latest'
2022-01-26T21:26:19.1826299Z Waiting for a Hosted runner in the 'organization' to pick this job...
2022-01-26T21:26:19.7928685Z Job is waiting for a hosted runner to come online.
2022-01-26T21:26:23.9915834Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2022-01-26T21:26:26.3517502Z Current runner version: '2.286.1'
2022-01-26T21:26:26.3554685Z ##[group]Operating System
2022-01-26T21:26:26.3555630Z Ubuntu
2022-01-26T21:26:26.3556087Z 20.04.3
2022-01-26T21:26:26.3556419Z LTS
2022-01-26T21:26:26.3556831Z ##[endgroup]
2022-01-26T21:26:26.3557240Z ##[group]Virtual Environment
2022-01-26T21:26:26.3557661Z Environment: ubuntu-20.04
2022-01-26T21:26:26.3558075Z Version: 20220119.1
2022-01-26T21:26:26.3558867Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220119.1/images/linux/Ubuntu2004-Readme.md
2022-01-26T21:26:26.3560306Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220119.1
2022-01-26T21:26:26.3560807Z ##[endgroup]
2022-01-26T21:26:26.3561125Z ##[group]Virtual Environment Provisioner
2022-01-26T21:26:26.3561511Z 1.0.0.0-main-20211214-1
2022-01-26T21:26:26.3561811Z ##[endgroup]
2022-01-26T21:26:26.3562874Z ##[group]GITHUB_TOKEN Permissions
2022-01-26T21:26:26.3563616Z Actions: write
2022-01-26T21:26:26.3564069Z Checks: write
2022-01-26T21:26:26.3564543Z Contents: write
2022-01-26T21:26:26.3564867Z Deployments: write
2022-01-26T21:26:26.3565206Z Discussions: write
2022-01-26T21:26:26.3565525Z Issues: write
2022-01-26T21:26:26.3565789Z Metadata: read
2022-01-26T21:26:26.3566150Z Packages: write
2022-01-26T21:26:26.3566434Z Pages: write
2022-01-26T21:26:26.3566765Z PullRequests: write
2022-01-26T21:26:26.3567080Z RepositoryProjects: write
2022-01-26T21:26:26.3567628Z SecurityEvents: write
2022-01-26T21:26:26.3568020Z Statuses: write
2022-01-26T21:26:26.3568310Z ##[endgroup]
2022-01-26T21:26:26.3572228Z Secret source: Actions
2022-01-26T21:26:26.3572719Z Prepare workflow directory
2022-01-26T21:26:26.4543229Z Prepare all required actions
2022-01-26T21:26:26.4764424Z Getting action download info
2022-01-26T21:26:26.6728228Z Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
2022-01-26T21:26:27.4081595Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-01-26T21:26:28.1072816Z ##[group]Run actions/checkout@v2
2022-01-26T21:26:28.1073296Z with:
2022-01-26T21:26:28.1073542Z   repository: DmitryTryput/git_ops
2022-01-26T21:26:28.1074383Z   token: ***
2022-01-26T21:26:28.1074621Z   ssh-strict: true
2022-01-26T21:26:28.1074891Z   persist-credentials: true
2022-01-26T21:26:28.1075214Z   clean: true
2022-01-26T21:26:28.1075415Z   fetch-depth: 1
2022-01-26T21:26:28.1075668Z   lfs: false
2022-01-26T21:26:28.1076088Z   submodules: false
2022-01-26T21:26:28.1076531Z ##[endgroup]
2022-01-26T21:26:28.4257211Z Syncing repository: DmitryTryput/git_ops
2022-01-26T21:26:28.4259522Z ##[group]Getting Git version info
2022-01-26T21:26:28.4260113Z Working directory is '/home/runner/work/git_ops/git_ops'
2022-01-26T21:26:28.4261380Z [command]/usr/bin/git version
2022-01-26T21:26:28.4395129Z git version 2.34.1
2022-01-26T21:26:28.4505901Z ##[endgroup]
2022-01-26T21:26:28.4507269Z Deleting the contents of '/home/runner/work/git_ops/git_ops'
2022-01-26T21:26:28.4510693Z ##[group]Initializing the repository
2022-01-26T21:26:28.4511785Z [command]/usr/bin/git init /home/runner/work/git_ops/git_ops
2022-01-26T21:26:28.4546374Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-01-26T21:26:28.4547605Z hint: is subject to change. To configure the initial branch name to use in all
2022-01-26T21:26:28.4548981Z hint: of your new repositories, which will suppress this warning, call:
2022-01-26T21:26:28.4549720Z hint: 
2022-01-26T21:26:28.4551171Z hint: 	git config --global init.defaultBranch <name>
2022-01-26T21:26:28.4552226Z hint: 
2022-01-26T21:26:28.4553724Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-01-26T21:26:28.4554746Z hint: 'development'. The just-created branch can be renamed via this command:
2022-01-26T21:26:28.4555262Z hint: 
2022-01-26T21:26:28.4558103Z hint: 	git branch -m <name>
2022-01-26T21:26:28.4602232Z Initialized empty Git repository in /home/runner/work/git_ops/git_ops/.git/
2022-01-26T21:26:28.4635932Z [command]/usr/bin/git remote add origin https://github.com/DmitryTryput/git_ops
2022-01-26T21:26:28.4698073Z ##[endgroup]
2022-01-26T21:26:28.4698711Z ##[group]Disabling automatic garbage collection
2022-01-26T21:26:28.4699332Z [command]/usr/bin/git config --local gc.auto 0
2022-01-26T21:26:28.4732317Z ##[endgroup]
2022-01-26T21:26:28.4754521Z ##[group]Setting up auth
2022-01-26T21:26:28.4755982Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-26T21:26:28.4789384Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-26T21:26:28.5286075Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-26T21:26:28.5287360Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-26T21:26:28.5540879Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-01-26T21:26:28.5630218Z ##[endgroup]
2022-01-26T21:26:28.5631396Z ##[group]Fetching the repository
2022-01-26T21:26:28.5639177Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +801b0400b65ab247453a89637c35564648ebb160:refs/remotes/pull/26/merge
2022-01-26T21:26:28.9041569Z remote: Enumerating objects: 18, done.        
2022-01-26T21:26:28.9049862Z remote: Counting objects:   5% (1/18)        
2022-01-26T21:26:28.9095455Z remote: Counting objects:  11% (2/18)        
2022-01-26T21:26:28.9095780Z remote: Counting objects:  16% (3/18)        
2022-01-26T21:26:28.9096070Z remote: Counting objects:  22% (4/18)        
2022-01-26T21:26:28.9096328Z remote: Counting objects:  27% (5/18)        
2022-01-26T21:26:28.9096673Z remote: Counting objects:  33% (6/18)        
2022-01-26T21:26:28.9097135Z remote: Counting objects:  38% (7/18)        
2022-01-26T21:26:28.9097652Z remote: Counting objects:  44% (8/18)        
2022-01-26T21:26:28.9097972Z remote: Counting objects:  50% (9/18)        
2022-01-26T21:26:28.9098226Z remote: Counting objects:  55% (10/18)        
2022-01-26T21:26:28.9098590Z remote: Counting objects:  61% (11/18)        
2022-01-26T21:26:28.9098847Z remote: Counting objects:  66% (12/18)        
2022-01-26T21:26:28.9099142Z remote: Counting objects:  72% (13/18)        
2022-01-26T21:26:28.9099397Z remote: Counting objects:  77% (14/18)        
2022-01-26T21:26:28.9099717Z remote: Counting objects:  83% (15/18)        
2022-01-26T21:26:28.9100119Z remote: Counting objects:  88% (16/18)        
2022-01-26T21:26:28.9100373Z remote: Counting objects:  94% (17/18)        
2022-01-26T21:26:28.9100825Z remote: Counting objects: 100% (18/18)        
2022-01-26T21:26:28.9101095Z remote: Counting objects: 100% (18/18), done.        
2022-01-26T21:26:28.9101424Z remote: Compressing objects:  12% (1/8)        
2022-01-26T21:26:28.9101780Z remote: Compressing objects:  25% (2/8)        
2022-01-26T21:26:28.9102042Z remote: Compressing objects:  37% (3/8)        
2022-01-26T21:26:28.9102344Z remote: Compressing objects:  50% (4/8)        
2022-01-26T21:26:28.9102615Z remote: Compressing objects:  62% (5/8)        
2022-01-26T21:26:28.9367408Z remote: Compressing objects:  75% (6/8)        
2022-01-26T21:26:28.9367711Z remote: Compressing objects:  87% (7/8)        
2022-01-26T21:26:28.9367972Z remote: Compressing objects: 100% (8/8)        
2022-01-26T21:26:28.9368236Z remote: Compressing objects: 100% (8/8), done.        
2022-01-26T21:26:28.9369099Z remote: Total 18 (delta 0), reused 15 (delta 0), pack-reused 0        
2022-01-26T21:26:28.9369644Z From https://github.com/DmitryTryput/git_ops
2022-01-26T21:26:28.9374965Z  * [new ref]         801b0400b65ab247453a89637c35564648ebb160 -> pull/26/merge
2022-01-26T21:26:28.9375673Z ##[endgroup]
2022-01-26T21:26:28.9376544Z ##[group]Determining the checkout info
2022-01-26T21:26:28.9376958Z ##[endgroup]
2022-01-26T21:26:28.9377476Z ##[group]Checking out the ref
2022-01-26T21:26:28.9378064Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/26/merge
2022-01-26T21:26:28.9378457Z Note: switching to 'refs/remotes/pull/26/merge'.
2022-01-26T21:26:28.9378619Z 
2022-01-26T21:26:28.9378937Z You are in 'detached HEAD' state. You can look around, make experimental
2022-01-26T21:26:28.9379273Z changes and commit them, and you can discard any commits you make in this
2022-01-26T21:26:28.9379604Z state without impacting any branches by switching back to a branch.
2022-01-26T21:26:28.9379771Z 
2022-01-26T21:26:28.9380015Z If you want to create a new branch to retain commits you create, you may
2022-01-26T21:26:28.9380415Z do so (now or later) by using -c with the switch command. Example:
2022-01-26T21:26:28.9380576Z 
2022-01-26T21:26:28.9380832Z   git switch -c <new-branch-name>
2022-01-26T21:26:28.9380984Z 
2022-01-26T21:26:28.9381163Z Or undo this operation with:
2022-01-26T21:26:28.9381383Z 
2022-01-26T21:26:28.9381553Z   git switch -
2022-01-26T21:26:28.9381673Z 
2022-01-26T21:26:28.9381914Z Turn off this advice by setting config variable advice.detachedHead to false
2022-01-26T21:26:28.9382110Z 
2022-01-26T21:26:28.9382394Z HEAD is now at 801b040 Merge 41f13dfd73a8b6465da609e2657d7236b564d315 into 4f730b7354e5e49de05fc052c08a3ebc2ccf6f4c
2022-01-26T21:26:28.9383015Z ##[endgroup]
2022-01-26T21:26:28.9383310Z [command]/usr/bin/git log -1 --format='%H'
2022-01-26T21:26:28.9415100Z '801b0400b65ab247453a89637c35564648ebb160'
2022-01-26T21:26:28.9737620Z ##[group]Run echo "file5.txt was changed" >> file5.txt.log 2>&1
2022-01-26T21:26:28.9738050Z [36;1mecho "file5.txt was changed" >> file5.txt.log 2>&1[0m
2022-01-26T21:26:28.9738340Z [36;1mecho "Tabs count:" >> file5.txt.log 2>&1[0m
2022-01-26T21:26:28.9738656Z [36;1mawk '{ print gsub (/\t/,"")}' file5.txt | awk '{ i+=$1 } END { print i }'>> file5.txt.log 2>&1[0m
2022-01-26T21:26:28.9794292Z shell: /usr/bin/bash -e {0}
2022-01-26T21:26:28.9794536Z ##[endgroup]
2022-01-26T21:26:29.0025300Z ##[group]Run actions/upload-artifact@v2
2022-01-26T21:26:29.0025536Z with:
2022-01-26T21:26:29.0025981Z   path: file5.txt.log
2022-01-26T21:26:29.0026178Z   name: artifact
2022-01-26T21:26:29.0026361Z   if-no-files-found: warn
2022-01-26T21:26:29.0026560Z ##[endgroup]
2022-01-26T21:26:29.0696672Z With the provided path, there will be 1 file uploaded
2022-01-26T21:26:29.0701048Z Starting artifact upload
2022-01-26T21:26:29.0702586Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-01-26T21:26:29.0703690Z Artifact name is valid!
2022-01-26T21:26:29.1487672Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-01-26T21:26:29.3623406Z Total size of all the files uploaded is 36 bytes
2022-01-26T21:26:29.3626501Z File upload process has finished. Finalizing the artifact upload
2022-01-26T21:26:29.4107665Z Artifact has been finalized. All files have been successfully uploaded!
2022-01-26T21:26:29.4108060Z 
2022-01-26T21:26:29.4108409Z The raw size of all the files that were specified for upload is 36 bytes
2022-01-26T21:26:29.4108879Z The size of all the files that were uploaded is 36 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-01-26T21:26:29.4109253Z 
2022-01-26T21:26:29.4110042Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-01-26T21:26:29.4110434Z 
2022-01-26T21:26:29.4110817Z Artifact artifact has been successfully uploaded!
2022-01-26T21:26:29.4203876Z Post job cleanup.
2022-01-26T21:26:29.5677022Z [command]/usr/bin/git version
2022-01-26T21:26:29.5776543Z git version 2.34.1
2022-01-26T21:26:29.5822782Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-26T21:26:29.5911122Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-26T21:26:29.6188459Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-26T21:26:29.6218079Z http.https://github.com/.extraheader
2022-01-26T21:26:29.6227913Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-01-26T21:26:29.6271850Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-26T21:26:29.6732935Z Cleaning up orphan processes

2022-01-26T21:26:19.1250333Z Found online and idle hosted runner in the current repository's organization account that matches the required labels: 'ubuntu-latest'
2022-01-26T21:26:19.2183106Z Waiting for a Hosted runner in the 'organization' to pick this job...
2022-01-26T21:26:19.7924351Z Job is waiting for a hosted runner to come online.
2022-01-26T21:26:22.1305156Z Job is about to start running on the hosted runner: GitHub Actions 2 (hosted)
2022-01-26T21:26:24.9078900Z Current runner version: '2.286.1'
2022-01-26T21:26:24.9120724Z ##[group]Operating System
2022-01-26T21:26:24.9121406Z Ubuntu
2022-01-26T21:26:24.9121811Z 20.04.3
2022-01-26T21:26:24.9122136Z LTS
2022-01-26T21:26:24.9122615Z ##[endgroup]
2022-01-26T21:26:24.9123061Z ##[group]Virtual Environment
2022-01-26T21:26:24.9123471Z Environment: ubuntu-20.04
2022-01-26T21:26:24.9123929Z Version: 20220119.1
2022-01-26T21:26:24.9124522Z Included Software: https://github.com/actions/virtual-environments/blob/ubuntu20/20220119.1/images/linux/Ubuntu2004-Readme.md
2022-01-26T21:26:24.9125369Z Image Release: https://github.com/actions/virtual-environments/releases/tag/ubuntu20%2F20220119.1
2022-01-26T21:26:24.9125939Z ##[endgroup]
2022-01-26T21:26:24.9126301Z ##[group]Virtual Environment Provisioner
2022-01-26T21:26:24.9126864Z 1.0.0.0-main-20211214-1
2022-01-26T21:26:24.9127199Z ##[endgroup]
2022-01-26T21:26:24.9128476Z ##[group]GITHUB_TOKEN Permissions
2022-01-26T21:26:24.9129296Z Actions: write
2022-01-26T21:26:24.9129872Z Checks: write
2022-01-26T21:26:24.9130398Z Contents: write
2022-01-26T21:26:24.9130724Z Deployments: write
2022-01-26T21:26:24.9131101Z Discussions: write
2022-01-26T21:26:24.9131412Z Issues: write
2022-01-26T21:26:24.9131761Z Metadata: read
2022-01-26T21:26:24.9132273Z Packages: write
2022-01-26T21:26:24.9132583Z Pages: write
2022-01-26T21:26:24.9132954Z PullRequests: write
2022-01-26T21:26:24.9133305Z RepositoryProjects: write
2022-01-26T21:26:24.9133717Z SecurityEvents: write
2022-01-26T21:26:24.9134111Z Statuses: write
2022-01-26T21:26:24.9134478Z ##[endgroup]
2022-01-26T21:26:24.9148469Z Secret source: Actions
2022-01-26T21:26:24.9149184Z Prepare workflow directory
2022-01-26T21:26:25.0238619Z Prepare all required actions
2022-01-26T21:26:25.0482363Z Getting action download info
2022-01-26T21:26:25.2856449Z Download action repository 'actions/checkout@v2' (SHA:ec3a7ce113134d7a93b817d10a8272cb61118579)
2022-01-26T21:26:26.0095386Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-01-26T21:26:26.7976348Z ##[group]Run actions/checkout@v2
2022-01-26T21:26:26.7976870Z with:
2022-01-26T21:26:26.7977237Z   repository: DmitryTryput/git_ops
2022-01-26T21:26:26.7977964Z   token: ***
2022-01-26T21:26:26.7978386Z   ssh-strict: true
2022-01-26T21:26:26.7978775Z   persist-credentials: true
2022-01-26T21:26:26.7979099Z   clean: true
2022-01-26T21:26:26.7979467Z   fetch-depth: 1
2022-01-26T21:26:26.7979812Z   lfs: false
2022-01-26T21:26:26.7980164Z   submodules: false
2022-01-26T21:26:26.7980597Z ##[endgroup]
2022-01-26T21:26:27.1502202Z Syncing repository: DmitryTryput/git_ops
2022-01-26T21:26:27.1504685Z ##[group]Getting Git version info
2022-01-26T21:26:27.1505463Z Working directory is '/home/runner/work/git_ops/git_ops'
2022-01-26T21:26:27.1510720Z [command]/usr/bin/git version
2022-01-26T21:26:27.1799161Z git version 2.34.1
2022-01-26T21:26:27.1800731Z ##[endgroup]
2022-01-26T21:26:27.1801314Z Deleting the contents of '/home/runner/work/git_ops/git_ops'
2022-01-26T21:26:27.1802950Z ##[group]Initializing the repository
2022-01-26T21:26:27.1803401Z [command]/usr/bin/git init /home/runner/work/git_ops/git_ops
2022-01-26T21:26:27.1911678Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-01-26T21:26:27.1912414Z hint: is subject to change. To configure the initial branch name to use in all
2022-01-26T21:26:27.1913189Z hint: of your new repositories, which will suppress this warning, call:
2022-01-26T21:26:27.1913578Z hint: 
2022-01-26T21:26:27.1914146Z hint: 	git config --global init.defaultBranch <name>
2022-01-26T21:26:27.1914524Z hint: 
2022-01-26T21:26:27.1915076Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-01-26T21:26:27.1915892Z hint: 'development'. The just-created branch can be renamed via this command:
2022-01-26T21:26:27.1916339Z hint: 
2022-01-26T21:26:27.1916766Z hint: 	git branch -m <name>
2022-01-26T21:26:27.1917206Z Initialized empty Git repository in /home/runner/work/git_ops/git_ops/.git/
2022-01-26T21:26:27.1922139Z [command]/usr/bin/git remote add origin https://github.com/DmitryTryput/git_ops
2022-01-26T21:26:27.1985903Z ##[endgroup]
2022-01-26T21:26:27.1987385Z ##[group]Disabling automatic garbage collection
2022-01-26T21:26:27.1991150Z [command]/usr/bin/git config --local gc.auto 0
2022-01-26T21:26:27.2035703Z ##[endgroup]
2022-01-26T21:26:27.2060337Z ##[group]Setting up auth
2022-01-26T21:26:27.2061461Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-26T21:26:27.2093039Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-26T21:26:27.2585292Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-26T21:26:27.2684583Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-26T21:26:27.2964079Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-01-26T21:26:27.3017759Z ##[endgroup]
2022-01-26T21:26:27.3019358Z ##[group]Fetching the repository
2022-01-26T21:26:27.3033544Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +801b0400b65ab247453a89637c35564648ebb160:refs/remotes/pull/26/merge
2022-01-26T21:26:27.6377745Z remote: Enumerating objects: 18, done.        
2022-01-26T21:26:27.6380542Z remote: Counting objects:   5% (1/18)        
2022-01-26T21:26:27.6382021Z remote: Counting objects:  11% (2/18)        
2022-01-26T21:26:27.6382882Z remote: Counting objects:  16% (3/18)        
2022-01-26T21:26:27.6383612Z remote: Counting objects:  22% (4/18)        
2022-01-26T21:26:27.6384295Z remote: Counting objects:  27% (5/18)        
2022-01-26T21:26:27.6384783Z remote: Counting objects:  33% (6/18)        
2022-01-26T21:26:27.6385892Z remote: Counting objects:  38% (7/18)        
2022-01-26T21:26:27.6386537Z remote: Counting objects:  44% (8/18)        
2022-01-26T21:26:27.6387089Z remote: Counting objects:  50% (9/18)        
2022-01-26T21:26:27.6387780Z remote: Counting objects:  55% (10/18)        
2022-01-26T21:26:27.6388354Z remote: Counting objects:  61% (11/18)        
2022-01-26T21:26:27.6388997Z remote: Counting objects:  66% (12/18)        
2022-01-26T21:26:27.6389533Z remote: Counting objects:  72% (13/18)        
2022-01-26T21:26:27.6390009Z remote: Counting objects:  77% (14/18)        
2022-01-26T21:26:27.6390578Z remote: Counting objects:  83% (15/18)        
2022-01-26T21:26:27.6391163Z remote: Counting objects:  88% (16/18)        
2022-01-26T21:26:27.6391659Z remote: Counting objects:  94% (17/18)        
2022-01-26T21:26:27.6392130Z remote: Counting objects: 100% (18/18)        
2022-01-26T21:26:27.6392714Z remote: Counting objects: 100% (18/18), done.        
2022-01-26T21:26:27.6393327Z remote: Compressing objects:  12% (1/8)        
2022-01-26T21:26:27.6393940Z remote: Compressing objects:  25% (2/8)        
2022-01-26T21:26:27.6394461Z remote: Compressing objects:  37% (3/8)        
2022-01-26T21:26:27.6394947Z remote: Compressing objects:  50% (4/8)        
2022-01-26T21:26:27.6395515Z remote: Compressing objects:  62% (5/8)        
2022-01-26T21:26:27.6646604Z remote: Compressing objects:  75% (6/8)        
2022-01-26T21:26:27.6695337Z remote: Compressing objects:  87% (7/8)        
2022-01-26T21:26:27.6696238Z remote: Compressing objects: 100% (8/8)        
2022-01-26T21:26:27.6697008Z remote: Compressing objects: 100% (8/8), done.        
2022-01-26T21:26:27.6704813Z remote: Total 18 (delta 0), reused 15 (delta 0), pack-reused 0        
2022-01-26T21:26:27.6706005Z From https://github.com/DmitryTryput/git_ops
2022-01-26T21:26:27.6706877Z  * [new ref]         801b0400b65ab247453a89637c35564648ebb160 -> pull/26/merge
2022-01-26T21:26:27.6708048Z ##[endgroup]
2022-01-26T21:26:27.6709162Z ##[group]Determining the checkout info
2022-01-26T21:26:27.6709939Z ##[endgroup]
2022-01-26T21:26:27.6710585Z ##[group]Checking out the ref
2022-01-26T21:26:27.6711307Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/26/merge
2022-01-26T21:26:27.6711958Z Note: switching to 'refs/remotes/pull/26/merge'.
2022-01-26T21:26:27.6712315Z 
2022-01-26T21:26:27.6712872Z You are in 'detached HEAD' state. You can look around, make experimental
2022-01-26T21:26:27.6713469Z changes and commit them, and you can discard any commits you make in this
2022-01-26T21:26:27.6714044Z state without impacting any branches by switching back to a branch.
2022-01-26T21:26:27.6714405Z 
2022-01-26T21:26:27.6714845Z If you want to create a new branch to retain commits you create, you may
2022-01-26T21:26:27.6715500Z do so (now or later) by using -c with the switch command. Example:
2022-01-26T21:26:27.6715840Z 
2022-01-26T21:26:27.6716306Z   git switch -c <new-branch-name>
2022-01-26T21:26:27.6716631Z 
2022-01-26T21:26:27.6717004Z Or undo this operation with:
2022-01-26T21:26:27.6717291Z 
2022-01-26T21:26:27.6717604Z   git switch -
2022-01-26T21:26:27.6717883Z 
2022-01-26T21:26:27.6718335Z Turn off this advice by setting config variable advice.detachedHead to false
2022-01-26T21:26:27.6718700Z 
2022-01-26T21:26:27.6719206Z HEAD is now at 801b040 Merge 41f13dfd73a8b6465da609e2657d7236b564d315 into 4f730b7354e5e49de05fc052c08a3ebc2ccf6f4c
2022-01-26T21:26:27.6719972Z ##[endgroup]
2022-01-26T21:26:27.6720494Z [command]/usr/bin/git log -1 --format='%H'
2022-01-26T21:26:27.6739652Z '801b0400b65ab247453a89637c35564648ebb160'
2022-01-26T21:26:27.7125460Z ##[group]Run echo "file4.txt was changed" >> file4.txt.log 2>&1
2022-01-26T21:26:27.7126010Z [36;1mecho "file4.txt was changed" >> file4.txt.log 2>&1[0m
2022-01-26T21:26:27.7126374Z [36;1mecho "Tabs count:" >> file4.txt.log 2>&1[0m
2022-01-26T21:26:27.7126814Z [36;1mawk '{ print gsub (/\t/,"")}' file4.txt | awk '{ i+=$1 } END { print i }'>> file4.txt.log 2>&1[0m
2022-01-26T21:26:27.7190633Z shell: /usr/bin/bash -e {0}
2022-01-26T21:26:27.7190964Z ##[endgroup]
2022-01-26T21:26:27.7475012Z ##[group]Run actions/upload-artifact@v2
2022-01-26T21:26:27.7475498Z with:
2022-01-26T21:26:27.7475733Z   path: file4.txt.log
2022-01-26T21:26:27.7475997Z   name: artifact
2022-01-26T21:26:27.7476257Z   if-no-files-found: warn
2022-01-26T21:26:27.7476533Z ##[endgroup]
2022-01-26T21:26:27.8213875Z With the provided path, there will be 1 file uploaded
2022-01-26T21:26:27.8217994Z Starting artifact upload
2022-01-26T21:26:27.8219252Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-01-26T21:26:27.8220188Z Artifact name is valid!
2022-01-26T21:26:27.9249993Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-01-26T21:26:28.0295862Z Total size of all the files uploaded is 36 bytes
2022-01-26T21:26:28.0299008Z File upload process has finished. Finalizing the artifact upload
2022-01-26T21:26:28.0880017Z Artifact has been finalized. All files have been successfully uploaded!
2022-01-26T21:26:28.0887721Z 
2022-01-26T21:26:28.0888102Z The raw size of all the files that were specified for upload is 36 bytes
2022-01-26T21:26:28.0888711Z The size of all the files that were uploaded is 36 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-01-26T21:26:28.0889029Z 
2022-01-26T21:26:28.0890121Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-01-26T21:26:28.0890522Z 
2022-01-26T21:26:28.0890793Z Artifact artifact has been successfully uploaded!
2022-01-26T21:26:28.1035605Z Post job cleanup.
2022-01-26T21:26:28.2529449Z [command]/usr/bin/git version
2022-01-26T21:26:28.2584765Z git version 2.34.1
2022-01-26T21:26:28.2632138Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-01-26T21:26:28.2679728Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-01-26T21:26:28.2971971Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-01-26T21:26:28.3003790Z http.https://github.com/.extraheader
2022-01-26T21:26:28.3017341Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-01-26T21:26:28.3078926Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-01-26T21:26:28.3633450Z Cleaning up orphan processes
```
 
