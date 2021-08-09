# Bash history

```bash
  190  echo $PATH
  191  cd ~
  192  ls -la
  193  cd bin
  194  cd /usr/bin
  195  vim push_to_all.sh
  198  cd ~/test
  199  /usr/bin/push_to_all.sh
  217  history
```


# .git/config

```ini
[core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
[remote "origin_github"]
        url = git@github.com:DenisDoubinin/03.Git.Hosting.git
        fetch = +refs/heads/*:refs/remotes/origin_github/*
[remote "origin_bitbucket"]
        url = git@bitbucket.org:DenisDoubinin/03.git.hosting.git
        fetch = +refs/heads/*:refs/remotes/origin_bitbucket/*
[remote "origin_gitlab"]
        url = git@gitlab.com:d.doubinin/03.git.hosting.git
        fetch = +refs/heads/*:refs/remotes/origin_gitlab/*
[branch "main"]
        remote = origin_gitlab
        merge = refs/heads/main
```
# Bash script

```bash
!/bin/bash
echo "Push has started"
for a in $(git remote show)
do
        for b in $(git branch)
        do
                git checkout $b
        if [ $a = update ]
        then
                echo "You don't have permissions to push your files in that repositiry"
        else
                echo "Push has started in the $a. Branch $b"
                git push $a $b
                if [ $? -eq 0 ]
                then
                        echo "Push to $a branch $b completed successfully"
                else
                        echo "Push to $a branch $b faild. Error: $?"
                fi
        fi
        done
done
```


# Push results:

```bash
Push has started
Switched to branch 'dev'
Push has started in the origin_bitbucket. Branch dev
Everything up-to-date
Push to origin_bitbucket branch dev completed successfully
Push has started in the origin_github. Branch dev
Everything up-to-date
Push to origin_github branch dev completed successfully
Push has started in the origin_gitlab. Branch dev
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0
Everything up-to-date
Push to origin_gitlab branch dev completed successfully
Switched to branch 'features/do_one'
Push has started in the origin_bitbucket. Branch features/do_one
Everything up-to-date
Push to origin_bitbucket branch features/do_one completed successfully
Push has started in the origin_github. Branch features/do_one
Everything up-to-date
Push to origin_github branch features/do_one completed successfully
Push has started in the origin_gitlab. Branch features/do_one
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0
Everything up-to-date
Push to origin_gitlab branch features/do_one completed successfully
Switched to branch 'hotfix/we_gonna_die'
Push has started in the origin_bitbucket. Branch hotfix/we_gonna_die
Everything up-to-date
Push to origin_bitbucket branch hotfix/we_gonna_die completed successfully
Push has started in the origin_github. Branch hotfix/we_gonna_die
Everything up-to-date
Push to origin_github branch hotfix/we_gonna_die completed successfully
Push has started in the origin_gitlab. Branch hotfix/we_gonna_die
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0
Everything up-to-date
Push to origin_gitlab branch hotfix/we_gonna_die completed successfully
Switched to branch 'main'
Your branch is up to date with 'origin_gitlab/main'.
Push has started in the origin_bitbucket. Branch main
Everything up-to-date
Push to origin_bitbucket branch main completed successfully
Push has started in the origin_github. Branch main
Everything up-to-date
Push to origin_github branch main completed successfully
Push has started in the origin_gitlab. Branch main
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0
Everything up-to-date
Push to origin_gitlab branch main completed successfully
Updated 0 paths from the index

Beginin error

Push has started in the origin_bitbucket. Branch dev1.txt
error: src refspec dev1.txt does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch dev1.txt faild. Error: 1
Push has started in the origin_github. Branch dev1.txt
error: src refspec dev1.txt does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch dev1.txt faild. Error: 1
Push has started in the origin_gitlab. Branch dev1.txt
error: src refspec dev1.txt does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'
Push to origin_gitlab branch dev1.txt faild. Error: 1
Updated 0 paths from the index
Push has started in the origin_bitbucket. Branch dev2.txt
error: src refspec dev2.txt does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch dev2.txt faild. Error: 1
Push has started in the origin_github. Branch dev2.txt
error: src refspec dev2.txt does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch dev2.txt faild. Error: 1
Push has started in the origin_gitlab. Branch dev2.txt
error: src refspec dev2.txt does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'
Push to origin_gitlab branch dev2.txt faild. Error: 1
Updated 0 paths from the index
Push has started in the origin_bitbucket. Branch do_one.txt
error: src refspec do_one.txt does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch do_one.txt faild. Error: 1
Push has started in the origin_github. Branch do_one.txt
error: src refspec do_one.txt does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch do_one.txt faild. Error: 1
Push has started in the origin_gitlab. Branch do_one.txt
error: src refspec do_one.txt does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'
Push to origin_gitlab branch do_one.txt faild. Error: 1
Updated 0 paths from the index
Push has started in the origin_bitbucket. Branch hotfix.txt
error: src refspec hotfix.txt does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch hotfix.txt faild. Error: 1
Push has started in the origin_github. Branch hotfix.txt
error: src refspec hotfix.txt does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch hotfix.txt faild. Error: 1
Push has started in the origin_gitlab. Branch hotfix.txt
error: src refspec hotfix.txt does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'
Push to origin_gitlab branch hotfix.txt faild. Error: 1
Updated 0 paths from the index
Push has started in the origin_bitbucket. Branch test1
error: src refspec test1 does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch test1 faild. Error: 1
Push has started in the origin_github. Branch test1
error: src refspec test1 does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch test1 faild. Error: 1
Push has started in the origin_gitlab. Branch test1
error: src refspec test1 does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'
Push to origin_gitlab branch test1 faild. Error: 1
Updated 0 paths from the index
Push has started in the origin_bitbucket. Branch test2
error: src refspec test2 does not match any
error: failed to push some refs to 'bitbucket.org:DenisDoubinin/03.git.hosting.git'
Push to origin_bitbucket branch test2 faild. Error: 1
Push has started in the origin_github. Branch test2
error: src refspec test2 does not match any
error: failed to push some refs to 'github.com:DenisDoubinin/03.Git.Hosting.git'
Push to origin_github branch test2 faild. Error: 1
Push has started in the origin_gitlab. Branch test2
error: src refspec test2 does not match any
error: failed to push some refs to 'gitlab.com:d.doubinin/03.git.hosting.git'

End bug

Push to origin_gitlab branch test2 faild. Error: 1
Switched to branch 'show'
Push has started in the origin_bitbucket. Branch show
Everything up-to-date
Push to origin_bitbucket branch show completed successfully
Push has started in the origin_github. Branch show
Everything up-to-date
Push to origin_github branch show completed successfully
Push has started in the origin_gitlab. Branch show
client_global_hostkeys_private_confirm: server gave bad signature for RSA key 0
Everything up-to-date
Push to origin_gitlab branch show completed successfully
```


# Questions

I can't understand, why my script try to take all my files like brunches, it mast takes branches from 'git branch' (for b in $(git branch)), but it takes not only branches. Why? 
