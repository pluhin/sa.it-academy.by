# GIT Hosting
## Create remote empty repositories
### Links
#### Github
[https://github.com/Tony-BY/03-Git.git](https://github.com/Tony-BY/03-Git.git)
#### Gitlab
[https://gitlab.com/Tony-BY/03-git.git](https://gitlab.com/Tony-BY/03-git.git)
#### Bitbucket
[https://Tony-BY@bitbucket.org/tony-by/03-git.git](https://Tony-BY@bitbucket.org/tony-by/03-git.git)
## Add ssh key(s) to use ssh authentication
### Screenshots
#### Github
<dl>
<img src="https://dub01pap001files.storage.live.com/y4m94lX2CaAVncoQ86Sus-dBuF_QS8QTI0PCscIXrJOBMiUjK-C34ZEmxtDR6lJ9AAIBXnlB3vwHynM5u6BC2NlkjYkhInaY5vj6ofmUxcL88vbREdb_AYqkBgAjto4Owuj-xvgLBUBgYBguyEPy3tDiFaTIgYloD1tj77sbfROVoe22nG2-iQnr9GVRdKM_ZY_?width=1917&height=870&cropmode=none" width="auto" height="auto" />
</dl>

#### Gitlab
<dl> 
<img src="https://dub01pap001files.storage.live.com/y4mTJAQgqjoiJww7YrXu4AchNAlAJ6xfLn8vQu9J2apQALeTAuJMn9d3atBteo7h2MeZVAmrGJY4SF23kj96mWKZ-7LrhivYvBznI-T3DJAFszWR08LPGVgkko40cpHJ5FiAeM8TSsJdIgAALOiEEWFoz3VG9U5mrBDCA-z5AYJS8y3O0EGIjbHeUYVB9ZR66L_?width=2104&height=699&cropmode=none" width="auto" height="auto" />
</dl>

#### Bitbucket
<dl>
<img src="https://dub01pap001files.storage.live.com/y4mAkwBjjsWbHKa8LbYppfTKn5qLNayTglxbWCw_uGjkN7uQpyP-dAmT7Mde8-bOM0R-p4kMuTXME9fKyodlzc7hcfPdwa7SFG8PlHRUY5lEsnJMNkdebRQOB60ipGrjpwvIkd3VMlBjYfGJ9nRL96dVD-9ogNPmK5MntEQRHns3E6vrQ-QSvJ5uGntD_But2-q?width=1639&height=673&cropmode=none" width="auto" height="auto" />
</dl>

## Push local repository into remote repositories
### Console log
```bash
    1  cd d:Projects
    2  ls -ll
    3  cd 02.GIT.Local/
    4  git remote add origin git@github.com:Tony-BY/03-Git.git
    5  git remote
    6  git push origin --all
    7  git remote rename origin origin_github
    8  git remote add origin git@bitbucket.org:tony-by/03-git.git
    9  git push origin --all
   10  git push origin --all
   11  git remote rename origin origin_bitbucket
   12  git remote add origin git@gitlab.com:Tony-BY/03-git.git
   13  git push origin --all
   14  history
```
## Slack integration push/commit events
### Screenshot
<dl>
<img src="https://dub01pap001files.storage.live.com/y4mqYZQGuZ01AKJhky-J-UWB1FljWl9KlwnUfLhYr1LSVTDEW-A7Jf_0zOv8Ud-A9ZpCnd4IZ0x-lKYqQgLU36djiWr7OtYE-BG7XCudvbPoYOHgglEb818Cz6025sIMHe-Lm7ImA82-gelf5gtNbwYRMFIVoSuIn7T9uSrKOgoIgvThecj7eqccy9-EMNH2wzs?width=1605&height=1057&cropmode=none" width="auto" height="auto" />
</dl>

## Script for automate pushing to all remote repositories
### Script
```bash
#!/bin/bash
remotes=($(git remote)) #Put remote repo into array

for i in ${!remotes[@]}; do
       echo "Push to ${remotes[$i]}"
       git push ${remotes[$i]}
       echo "-------------------------------" #delimiter
done         
```
### Output
```bash
Anton@TONY-DESKTOP MINGW64 /d/Projects/02.GIT.Local (features/do_one)
$ ./git-push.sh
Push to origin
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 774 bytes | 387.00 KiB/s, done.
Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
remote: 
remote: To create a merge request for features/do_one, visit:
remote:   https://gitlab.com/Tony-BY/03-git/-/merge_requests/new?merge_request%5Bsource_branch%5D=features%2Fdo_one
remote:
To gitlab.com:Tony-BY/03-git.git
   4816dc9..4da07c4  features/do_one -> features/do_one
-------------------------------
Push to origin_bitbucket
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 774 bytes | 387.00 KiB/s, done.
Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
remote: 
remote: Create pull request for features/do_one:
remote:   https://bitbucket.org/tony-by/03-git/pull-requests/new?source=features/do_one&t=1
remote:
To bitbucket.org:tony-by/03-git.git
   4816dc9..4da07c4  features/do_one -> features/do_one
-------------------------------
Push to origin_github
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 774 bytes | 387.00 KiB/s, done.
Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:Tony-BY/03-Git.git
   4816dc9..4da07c4  features/do_one -> features/do_one
-------------------------------
```