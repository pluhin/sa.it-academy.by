## Create remote empty repositories (GitHub and GitLab)

- GitLab - https://gitlab.com/devopscourse4845405/git_hosting#
- GitHub - https://github.com/enFaust/GIT.-Hosting

## Add ssh key(s) to use ssh authentication

```bash
ssh-keygen -t ed25519 -C "fedorov.alexandr25@gmail.com"
```

## Push your local repository into remote repositories each all, one by one

```bash
git remote add origin git@github.com:enFaust/GIT.-Hosting.git
git remote set-url --add --push origin git@github.com:enFaust/GIT.-Hosting.git
git remote set-url --add --push origin git@gitlab.com:devopscourse4845405/git_hosting.git
git config --global push.autoSetupRemote true
git remote -v
```

Output:
```commandline
origin	git@github.com:enFaust/GIT.-Hosting.git (fetch)
origin	git@github.com:enFaust/GIT.-Hosting.git (push)
origin	git@gitlab.com:devopscourse4845405/git_hosting.git
```

## Create email integration push/commit events
<img width="786" height="137" alt="image" src="https://github.com/user-attachments/assets/0756f9e1-6517-42cf-9dea-4a29e6bd2e8f" />
<img width="1013" height="459" alt="image" src="https://github.com/user-attachments/assets/6685835c-a339-4b11-90e0-b24fadb376da" />

## Automate pushing your changes to all remote repositories (bash/python/go.. scripts) create alias for script in your shell list of upstream repositories should be extracted automatically for loop
Path to script: [git_push_all.py](git_push_all.py)

Alias
```bash
alias gpa='python3 ~/path/to/git_push_all.py'
chmod +x ~/path/to/git_push_all.py
echo "New data"  >> README.md
git add .
git commit -m "Add new data"
gpa
```

Output:
```commandline
Pushing to origin...
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 287 bytes | 287.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:enFaust/GIT.-Hosting.git
   4bbaeb3..d9c0ef6  feature-branch2 -> feature-branch2
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 287 bytes | 287.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: 
remote: To create a merge request for feature-branch2, visit:
remote:   https://gitlab.com/devopscourse4845405/git-hosting/-/merge_requests/new?merge_request%5Bsource_branch%5D=feature-branch2
remote: 
To gitlab.com:devopscourse4845405/git-hosting.git
   4bbaeb3..d9c0ef6  feature-branch2 -> feature-branch2
fiodarau@EPBYMINW5591 sa.it-academy.by % git push git@gitlab.com:devopscourse4845405/git_hosting.git feature-branch2 
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 12 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 516 bytes | 516.00 KiB/s, done.
Total 6 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: 
remote: To create a merge request for feature-branch2, visit:
remote:   https://gitlab.com/devopscourse4845405/git_hosting/-/merge_requests/new?merge_request%5Bsource_branch%5D=feature-branch2
remote: 
To gitlab.com:devopscourse4845405/git_hosting.git
   811bbe3..d9c0ef6  feature-branch2 -> feature-branch2
```

## Create folder 03.GIT.Hosting, put all your repositories's urls to the file 03.GIT.Hosting/README.md + script and prepare PR (Pull Request)
- GitLab - https://gitlab.com/devopscourse4845405/git_hosting#
- GitHub - https://github.com/enFaust/GIT.-Hosting