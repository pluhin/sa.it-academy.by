## git config

```bash
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:morozandralek/ci_cd-home_task.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = bitbucket
	merge = refs/heads/master
[user]
	name = Andrey Moroz
	email = morozandralek@gmail.com
[remote "bitbucket"]
	url = git@bitbucket.org:morozandralek/ci_cd-home_task.git
	fetch = +refs/heads/*:refs/remotes/bitbucket/*
[branch "dev"]
	remote = bitbucket
	merge = refs/heads/dev
[branch "features/do_one"]
	remote = bitbucket
	merge = refs/heads/features/do_one
[branch "hotfix/we_gonna_die"]
	remote = bitbucket
	merge = refs/heads/hotfix/we_gonna_die
[remote "gitlab"]
	url = git@gitlab.com:morozandralek/ci_cd-home_task.git
	fetch = +refs/heads/*:refs/remotes/gitlab/*
```
