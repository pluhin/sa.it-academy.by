
## Link to action files


## Testing repository
[https://github.com/kirilltd/04.GitOps](https://github.com/kirilltd/04.GitOps)

## Pipeline logs
```
Job get_updated_files

2022-05-02T15:31:03.0703885Z ##[group]Run actions/checkout@v3
2022-05-02T15:31:03.0704200Z with:
2022-05-02T15:31:03.0704407Z   fetch-depth: 0
2022-05-02T15:31:03.0704661Z   repository: kirilltd/04.GitOps
2022-05-02T15:31:03.0705108Z   token: ***
2022-05-02T15:31:03.0705315Z   ssh-strict: true
2022-05-02T15:31:03.0705573Z   persist-credentials: true
2022-05-02T15:31:03.0705819Z   clean: true
2022-05-02T15:31:03.0706015Z   lfs: false
2022-05-02T15:31:03.0706228Z   submodules: false
2022-05-02T15:31:03.0706477Z   set-safe-directory: true
2022-05-02T15:31:03.0706707Z ##[endgroup]
2022-05-02T15:31:03.3209702Z Syncing repository: kirilltd/04.GitOps
2022-05-02T15:31:03.3212027Z ##[group]Getting Git version info
2022-05-02T15:31:03.3212582Z Working directory is '/home/runner/work/04.GitOps/04.GitOps'
2022-05-02T15:31:03.3213113Z [command]/usr/bin/git version
2022-05-02T15:31:03.3298257Z git version 2.36.0
2022-05-02T15:31:03.3321539Z ##[endgroup]
2022-05-02T15:31:03.3339679Z Temporarily overriding HOME='/home/runner/work/_temp/93104706-7e04-4732-a5e3-39d365fefcb9' before making global git config changes
2022-05-02T15:31:03.3340330Z Adding repository directory to the temporary git global config as a safe directory
2022-05-02T15:31:03.3342309Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/04.GitOps/04.GitOps
2022-05-02T15:31:03.3425429Z Deleting the contents of '/home/runner/work/04.GitOps/04.GitOps'
2022-05-02T15:31:03.3426819Z ##[group]Initializing the repository
2022-05-02T15:31:03.3428035Z [command]/usr/bin/git init /home/runner/work/04.GitOps/04.GitOps
2022-05-02T15:31:03.3446413Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-02T15:31:03.3447296Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-02T15:31:03.3447784Z hint: of your new repositories, which will suppress this warning, call:
2022-05-02T15:31:03.3448128Z hint: 
2022-05-02T15:31:03.3448521Z hint: 	git config --global init.defaultBranch <name>
2022-05-02T15:31:03.3448831Z hint: 
2022-05-02T15:31:03.3449251Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-02T15:31:03.3449965Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-02T15:31:03.3450398Z hint: 
2022-05-02T15:31:03.3450987Z hint: 	git branch -m <name>
2022-05-02T15:31:03.3465420Z Initialized empty Git repository in /home/runner/work/04.GitOps/04.GitOps/.git/
2022-05-02T15:31:03.3474873Z [command]/usr/bin/git remote add origin https://github.com/kirilltd/04.GitOps
2022-05-02T15:31:03.3517727Z ##[endgroup]
2022-05-02T15:31:03.3533018Z ##[group]Disabling automatic garbage collection
2022-05-02T15:31:03.3533930Z [command]/usr/bin/git config --local gc.auto 0
2022-05-02T15:31:03.3558510Z ##[endgroup]
2022-05-02T15:31:03.3559325Z ##[group]Setting up auth
2022-05-02T15:31:03.3563300Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-02T15:31:03.3619522Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-02T15:31:03.3982665Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-02T15:31:03.3984030Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-02T15:31:03.4173457Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-02T15:31:03.4209137Z ##[endgroup]
2022-05-02T15:31:03.4209893Z ##[group]Fetching the repository
2022-05-02T15:31:03.4218605Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/* +f4a20676224e39c4c3946c7ced67ed1861936d52:refs/remotes/pull/2/merge
2022-05-02T15:31:03.7805186Z From https://github.com/kirilltd/04.GitOps
2022-05-02T15:31:03.7806169Z  * [new branch]      dev                                      -> origin/dev
2022-05-02T15:31:03.7807341Z  * [new branch]      main                                     -> origin/main
2022-05-02T15:31:03.7808317Z  * [new ref]         f4a20676224e39c4c3946c7ced67ed1861936d52 -> pull/2/merge
2022-05-02T15:31:03.7825610Z ##[endgroup]
2022-05-02T15:31:03.7826534Z ##[group]Determining the checkout info
2022-05-02T15:31:03.7827558Z ##[endgroup]
2022-05-02T15:31:03.7828285Z ##[group]Checking out the ref
2022-05-02T15:31:03.7830707Z [command]/usr/bin/git checkout --progress --force refs/remotes/pull/2/merge
2022-05-02T15:31:03.7868278Z Note: switching to 'refs/remotes/pull/2/merge'.
2022-05-02T15:31:03.7868872Z 
2022-05-02T15:31:03.7869976Z You are in 'detached HEAD' state. You can look around, make experimental
2022-05-02T15:31:03.7870554Z changes and commit them, and you can discard any commits you make in this
2022-05-02T15:31:03.7871081Z state without impacting any branches by switching back to a branch.
2022-05-02T15:31:03.7871411Z 
2022-05-02T15:31:03.7871704Z If you want to create a new branch to retain commits you create, you may
2022-05-02T15:31:03.7872197Z do so (now or later) by using -c with the switch command. Example:
2022-05-02T15:31:03.7872526Z 
2022-05-02T15:31:03.7872818Z   git switch -c <new-branch-name>
2022-05-02T15:31:03.7872999Z 
2022-05-02T15:31:03.7873224Z Or undo this operation with:
2022-05-02T15:31:03.7873662Z 
2022-05-02T15:31:03.7873855Z   git switch -
2022-05-02T15:31:03.7874012Z 
2022-05-02T15:31:03.7874232Z Turn off this advice by setting config variable advice.detachedHead to false
2022-05-02T15:31:03.7874583Z 
2022-05-02T15:31:03.7889413Z HEAD is now at f4a2067 Merge 42be6919650259f045c4e7be429ad883693967a1 into 5d91f2178321e4f54a180d3926c521b7fa665927
2022-05-02T15:31:03.7890540Z ##[endgroup]
2022-05-02T15:31:03.7918234Z [command]/usr/bin/git log -1 --format='%H'
2022-05-02T15:31:03.7947028Z 'f4a20676224e39c4c3946c7ced67ed1861936d52'

2022-05-02T15:31:03.8225926Z ##[group]Run json_file_list=$(git diff HEAD HEAD~1 --name-only --diff-filter=M | jq -R -s -c 'split("\n")[:-1]')
2022-05-02T15:31:03.8226627Z [36;1mjson_file_list=$(git diff HEAD HEAD~1 --name-only --diff-filter=M | jq -R -s -c 'split("\n")[:-1]')[0m
2022-05-02T15:31:03.8227052Z [36;1mecho $json_file_list[0m
2022-05-02T15:31:03.8227411Z [36;1mecho "::set-output name=files::$json_file_list"[0m
2022-05-02T15:31:03.8281329Z shell: /usr/bin/bash -e {0}
2022-05-02T15:31:03.8281695Z ##[endgroup]
2022-05-02T15:31:03.8736512Z [".github/workflows/blank.yml","file1.txt","file3.txt"]

Job check_files (.github/workflows/blank.yml)
2022-05-02T15:31:19.3858277Z ##[group]Run file=`echo .github/workflows/blank.yml`
2022-05-02T15:31:19.3858762Z [36;1mfile=`echo .github/workflows/blank.yml`[0m
2022-05-02T15:31:19.3859059Z [36;1mecho $file[0m
2022-05-02T15:31:19.3859316Z [36;1mif [ -z `grep -n $'\t' $file` ][0m
2022-05-02T15:31:19.3859572Z [36;1mthen[0m
2022-05-02T15:31:19.3859859Z [36;1m    echo "Tabs not found" >> "$file".log[0m
2022-05-02T15:31:19.3860113Z [36;1melse[0m
2022-05-02T15:31:19.3860361Z [36;1m    grep -n $'\t' "$file"[0m
2022-05-02T15:31:19.3860650Z [36;1m    grep -n $'\t' "$file" >> "$file".log[0m
2022-05-02T15:31:19.3860897Z [36;1mfi[0m
2022-05-02T15:31:19.3916278Z shell: /usr/bin/bash -e {0}
2022-05-02T15:31:19.3916744Z ##[endgroup]
2022-05-02T15:31:19.4090977Z .github/workflows/blank.yml

2022-05-02T15:31:19.4153077Z ##[group]Run actions/upload-artifact@v2
2022-05-02T15:31:19.4153412Z with:
2022-05-02T15:31:19.4153658Z   path: .github/workflows/blank.yml.log
2022-05-02T15:31:19.4153930Z   name: artifact
2022-05-02T15:31:19.4154181Z   if-no-files-found: warn
2022-05-02T15:31:19.4154416Z ##[endgroup]
2022-05-02T15:31:19.6041713Z With the provided path, there will be 1 file uploaded
2022-05-02T15:31:19.6042439Z Starting artifact upload
2022-05-02T15:31:19.6043452Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-02T15:31:19.6044082Z Artifact name is valid!
2022-05-02T15:31:19.6663911Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-02T15:31:19.7332266Z Total size of all the files uploaded is 15 bytes
2022-05-02T15:31:19.7334721Z File upload process has finished. Finalizing the artifact upload
2022-05-02T15:31:19.7660555Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-02T15:31:19.7660894Z 
2022-05-02T15:31:19.7661115Z The raw size of all the files that were specified for upload is 15 bytes
2022-05-02T15:31:19.7661706Z The size of all the files that were uploaded is 15 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-02T15:31:19.7662253Z 
2022-05-02T15:31:19.7662929Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-02T15:31:19.7663512Z 
2022-05-02T15:31:19.7665897Z Artifact artifact has been successfully uploaded!


Job check_files (file1.txt)

2022-05-02T15:31:19.1144035Z ##[group]Run file=`echo file1.txt`
2022-05-02T15:31:19.1144448Z [36;1mfile=`echo file1.txt`[0m
2022-05-02T15:31:19.1144723Z [36;1mecho $file[0m
2022-05-02T15:31:19.1144986Z [36;1mif [ -z `grep -n $'\t' $file` ][0m
2022-05-02T15:31:19.1145246Z [36;1mthen[0m
2022-05-02T15:31:19.1145515Z [36;1m    echo "Tabs not found" >> "$file".log[0m
2022-05-02T15:31:19.1145768Z [36;1melse[0m
2022-05-02T15:31:19.1146017Z [36;1m    grep -n $'\t' "$file"[0m
2022-05-02T15:31:19.1146310Z [36;1m    grep -n $'\t' "$file" >> "$file".log[0m
2022-05-02T15:31:19.1146561Z [36;1mfi[0m
2022-05-02T15:31:19.1199839Z shell: /usr/bin/bash -e {0}
2022-05-02T15:31:19.1200157Z ##[endgroup]
2022-05-02T15:31:19.1353971Z file1.txt
2022-05-02T15:31:19.1369189Z /home/runner/work/_temp/a26ad1a7-9c7d-4c98-a0f8-08a837f9eafd.sh: line 3: [: too many arguments
2022-05-02T15:31:19.1380787Z 1:Hello	world
2022-05-02T15:31:19.1381206Z 3:Hello 	world

2022-05-02T15:31:19.1435979Z ##[group]Run actions/upload-artifact@v2
2022-05-02T15:31:19.1436292Z with:
2022-05-02T15:31:19.1436516Z   path: file1.txt.log
2022-05-02T15:31:19.1436767Z   name: artifact
2022-05-02T15:31:19.1437030Z   if-no-files-found: warn
2022-05-02T15:31:19.1437280Z ##[endgroup]
2022-05-02T15:31:19.3008926Z With the provided path, there will be 1 file uploaded
2022-05-02T15:31:19.3012803Z Starting artifact upload
2022-05-02T15:31:19.3014117Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-02T15:31:19.3015065Z Artifact name is valid!
2022-05-02T15:31:19.4357412Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-02T15:31:19.5445987Z Total size of all the files uploaded is 29 bytes
2022-05-02T15:31:19.5447178Z File upload process has finished. Finalizing the artifact upload
2022-05-02T15:31:19.7422362Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-02T15:31:19.7438289Z 
2022-05-02T15:31:19.7455872Z The raw size of all the files that were specified for upload is 29 bytes
2022-05-02T15:31:19.7458397Z The size of all the files that were uploaded is 29 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-02T15:31:19.7458860Z 
2022-05-02T15:31:19.7461426Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-02T15:31:19.7461910Z 
2022-05-02T15:31:19.7463958Z Artifact artifact has been successfully uploaded!

Job check_files (file3.txt)

2022-05-02T15:31:17.0504062Z ##[group]Run file=`echo file3.txt`
2022-05-02T15:31:17.0504400Z [36;1mfile=`echo file3.txt`[0m
2022-05-02T15:31:17.0504633Z [36;1mecho $file[0m
2022-05-02T15:31:17.0504875Z [36;1mif [ -z `grep -n $'\t' $file` ][0m
2022-05-02T15:31:17.0505101Z [36;1mthen[0m
2022-05-02T15:31:17.0505318Z [36;1m    echo "Tabs not found" >> "$file".log[0m
2022-05-02T15:31:17.0505549Z [36;1melse[0m
2022-05-02T15:31:17.0505757Z [36;1m    grep -n $'\t' "$file"[0m
2022-05-02T15:31:17.0505994Z [36;1m    grep -n $'\t' "$file" >> "$file".log[0m
2022-05-02T15:31:17.0506217Z [36;1mfi[0m
2022-05-02T15:31:17.0558067Z shell: /usr/bin/bash -e {0}
2022-05-02T15:31:17.0558361Z ##[endgroup]
2022-05-02T15:31:17.0708151Z file3.txt

2022-05-02T15:31:17.0765382Z ##[group]Run actions/upload-artifact@v2
2022-05-02T15:31:17.0765680Z with:
2022-05-02T15:31:17.0765892Z   path: file3.txt.log
2022-05-02T15:31:17.0766127Z   name: artifact
2022-05-02T15:31:17.0766373Z   if-no-files-found: warn
2022-05-02T15:31:17.0766603Z ##[endgroup]
2022-05-02T15:31:17.2521640Z With the provided path, there will be 1 file uploaded
2022-05-02T15:31:17.2522469Z Starting artifact upload
2022-05-02T15:31:17.2523311Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-02T15:31:17.2523830Z Artifact name is valid!
2022-05-02T15:31:17.3060163Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-02T15:31:17.3858996Z Total size of all the files uploaded is 15 bytes
2022-05-02T15:31:17.3859515Z File upload process has finished. Finalizing the artifact upload
2022-05-02T15:31:17.4152711Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-02T15:31:17.4152980Z 
2022-05-02T15:31:17.4153132Z The raw size of all the files that were specified for upload is 15 bytes
2022-05-02T15:31:17.4153543Z The size of all the files that were uploaded is 15 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-02T15:31:17.4153796Z 
2022-05-02T15:31:17.4154428Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-02T15:31:17.4154746Z 
2022-05-02T15:31:17.4154871Z Artifact artifact has been successfully uploaded!


```

