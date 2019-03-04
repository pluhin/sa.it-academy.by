# Lesson 3: Git. Hosting (part 1)
### Repositories:
[GitHubRepo](https://github.com/hutemai)

[GitLabRepo](https://gitlab.com/hutemai?nav_source=navbar)

[BitBucketRepo](https://bitbucket.org/hutemai/)
### Git push via ssh-key:
```bash
pelsh@HP-ENVY-m6:~/git/local_sa$ git push --all hub
Counting objects: 32, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (24/24), done.
Writing objects: 100% (32/32), 4.41 KiB | 0 bytes/s, done.
Total 32 (delta 9), reused 0 (delta 0)
remote: Resolving deltas: 100% (9/9), done.
To git@github.com:hutemai/local.git
 * [new branch]      dev -> dev
 * [new branch]      features/do_one -> features/do_one
 * [new branch]      hotfix/we_gonna_die -> hotfix/we_gonna_die
 * [new branch]      master -> master

pelsh@HP-ENVY-m6:~/git/local_sa$ git push --all origin 
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (9/9), 2.43 KiB | 0 bytes/s, done.
Total 9 (delta 2), reused 0 (delta 0)
To git@gitlab.com:hutemai/local.git
   1184990..0102023  master -> master

pelsh@HP-ENVY-m6:~/git/local_sa$ git push --all bitb 
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 292 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To git@bitbucket.org:hutemai/local.git
   0102023..afb7401  master -> master
```
### Slack integration:
#### GitLab
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_03/integration_lab.png?raw=true)
#### BitBucket
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_03/integration_bitb.png?raw=true)
#### GitHub
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_03/integration_hub.png?raw=true)

