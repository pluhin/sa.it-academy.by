#Branches after play the situations Release phase and Hotfix deploy
```bash

`master`
 kristoit@M-SA2-Ubuntu:~/project$ git checkout master
 Switched to branch 'master'
 kristoit@M-SA2-Ubuntu:~/project$ git branch -a
   dev
   features/do_one
   hotfix/we_gonna_die
 * master
 kristoit@M-SA2-Ubuntu:~/project$ git log --oneline
 e2bc01c 1 commit on hotfix/we_gonna_die
 3eff70d 1 commit on features/do_one
 92f73f7 2 commit on dev
 61089a6 1 commit on dev
 7a3e232 2 commit on master
 5e956b3 1 commit on master

`dev`

 kristoit@M-SA2-Ubuntu:~/project$ git checkout dev
 Switched to branch 'dev'
 kristoit@M-SA2-Ubuntu:~/project$ git branch -a
 * dev
   features/do_one
   hotfix/we_gonna_die
   master
 kristoit@M-SA2-Ubuntu:~/project$ git log --oneline
 a3e2153 1 commit on hotfix/we_gonna_die
 92f73f7 2 commit on dev
 61089a6 1 commit on dev
 7a3e232 2 commit on master
 5e956b3 1 commit on master

`features/do_one`

 kristoit@M-SA2-Ubuntu:~/project$ git checkout features/do_one
 witched to branch 'features/do_one'
 kristoit@M-SA2-Ubuntu:~/project$ git branch -a
   dev
 * features/do_one
   hotfix/we_gonna_die
   master
 kristoit@M-SA2-Ubuntu:~/project$ git log --oneline
 8fd38ad 1 commit on hotfix/we_gonna_die
 3eff70d 1 commit on features/do_one
 92f73f7 2 commit on dev
 61089a6 1 commit on dev
 7a3e232 2 commit on master
 5e956b3 1 commit on master

`hotfix/we_gonna_die`

 kristoit@M-SA2-Ubuntu:~/project$ git checkout hotfix/we_gonna_die
 Switched to branch 'hotfix/we_gonna_die'
 kristoit@M-SA2-Ubuntu:~/project$ git branch -a
   dev
   features/do_one
 * hotfix/we_gonna_die
   master
 kristoit@M-SA2-Ubuntu:~/project$ git log --oneline
 e6a513a 1 commit on hotfix/we_gonna_die
 7a3e232 2 commit on master
 5e956b3 1 commit on master
```
