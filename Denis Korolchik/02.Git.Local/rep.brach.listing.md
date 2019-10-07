```
root@den-UB18:/home/den/rp1# git branch -a
  dev
  features/do_one
  hotfix/we_gonna_die
* master
root@den-UB18:/home/den/rp1# git log --oneline
815dd75 (HEAD -> master) fix 1st commit zero file
9b5a6f9 fut 1st commit zero file
8c9b578 dev 2nd commit zero file
0ad405b dev 1st commit zero file
57774a2 master 2nd commit zero file
37db862 master 1st commit zero file


root@den-UB18:/home/den/rp1# git checkout dev
Switched to branch 'dev'
root@den-UB18:/home/den/rp1# git branch -a
* dev
  features/do_one
  hotfix/we_gonna_die
  master
root@den-UB18:/home/den/rp1# git log --oneline
2f24663 (HEAD -> dev) fix 1st commit zero file
8c9b578 dev 2nd commit zero file
0ad405b dev 1st commit zero file
57774a2 master 2nd commit zero file
37db862 master 1st commit zero file


root@den-UB18:/home/den/rp1# git checkout features/do_one
Switched to branch 'features/do_one'
root@den-UB18:/home/den/rp1# git branch -a
  dev
* features/do_one
  hotfix/we_gonna_die
  master
root@den-UB18:/home/den/rp1# git log --oneline
fe78a19 (HEAD -> features/do_one) fix 1st commit zero file
9b5a6f9 fut 1st commit zero file
8c9b578 dev 2nd commit zero file
0ad405b dev 1st commit zero file
57774a2 master 2nd commit zero file
37db862 master 1st commit zero file


root@den-UB18:/home/den/rp1# git checkout hotfix/we_gonna_die
Switched to branch 'hotfix/we_gonna_die'
root@den-UB18:/home/den/rp1# git branch -a
  dev
  features/do_one
* hotfix/we_gonna_die
  master
root@den-UB18:/home/den/rp1# git log --oneline
3030dc4 (HEAD -> hotfix/we_gonna_die) fix 1st commit zero file
57774a2 master 2nd commit zero file
37db862 master 1st commit zero file

```