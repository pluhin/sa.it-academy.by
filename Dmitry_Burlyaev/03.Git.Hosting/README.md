## 03.Git.Hosting 
Homework Assignment 1: Initializing a Remote Repository


1.Create remote empty repositories (GitHub and GitLab)
```bush
	https://github.com/Dmitry-Kitsune/md-sa2-29-24
	https://gitlab.com/D_Burlyaev/md-sa2-29-24
```bush

2.Add ssh key(s) to use ssh authentication
```bush
ssh-keygen
Generating public/private ed25519 key pair.
Enter file in which to save the key (/c/Users/XXXXX/.ssh/id_ed25519):
Enter passphrase for "/c/Users/XXXXXX/.ssh/id_ed25519" (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/XXXXXX/.ssh/id_ed25519
Your public key has been saved in /c/Users/XXXXXX/.ssh/id_ed25519.pub
## Added public key to profile in both hostings.
```

3.Push your local repository into remote repositories each all, one by one
```bush
## Adds path to remote repositories
git remote add GHub git@github.com:Dmitry-Kitsune/md-sa2-29-24.git
git remote add GLab git@gitlab.com:D_Burlyaev/md-sa2-29-24.git

git remote
GHub
GLab
origin


git branch -m md-sa2-29-24

```bush
$ git push GHub md-sa2-29-24
Enter passphrase for key '/c/Users/Fuzzy/.ssh/id_ed_md-sa2-29-24':
Enumerating objects: 182, done.
Counting objects: 100% (182/182), done.
Delta compression using up to 16 threads
Compressing objects: 100% (116/116), done.
Writing objects: 100% (182/182), 1.35 MiB | 2.17 MiB/s, done.
Total 182 (delta 38), reused 161 (delta 30), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (38/38), done.
remote:
remote: Create a pull request for 'md-sa2-29-24' on GitHub by visiting:
remote:      https://github.com/Dmitry-Kitsune/md-sa2-29-24/pull/new/md-sa2-29-24
remote:
To github.com:Dmitry-Kitsune/md-sa2-29-24.git
 * [new branch]      md-sa2-29-24 -> md-sa2-29-24

$ git push GLab md-sa2-29-24

Enter passphrase for key '/c/Users/Fuzzy/.ssh/id_ed25519':
Enumerating objects: 182, done.
Counting objects: 100% (182/182), done.
Delta compression using up to 16 threads
Compressing objects: 100% (116/116), done.
Writing objects: 100% (182/182), 1.35 MiB | 24.32 MiB/s, done.
Total 182 (delta 38), reused 161 (delta 30), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (38/38), done.
remote:
remote: To create a merge request for md-sa2-29-24, visit:
remote:   https://gitlab.com/D_Burlyaev/md-sa2-29-24/-/merge_requests/new?merge_request%5Bsource_branch%5D=md-sa2-29-24
remote:
To gitlab.com:D_Burlyaev/md-sa2-29-24.git
 * [new branch]      md-sa2-29-24 -> md-sa2-29-24


```



```
4.Create email integration push/commit events
```
## Added email notifications
```

5.Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
create alias for script in your shell
6.list of upstream repositories should be extracted automatically for loop


Create folder 03.GIT.Hosting, put all your repositories's urls to the file 03.GIT.Hosting/README.md + script and prepare PR (Pull Request)