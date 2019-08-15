Print all branches

```

pi@u18sdevops1:~/it-study/02.Git.Local$ git checkout master
Переключено на ветку «master»

pi@u18sdevops1:~/it-study/02.Git.Local$ git log --oneline
dfc6d82 (HEAD -> master) Readme hotfix/we_gonna_die
2fd47a6 Readme features/do_one
0f79bbb Readme dev commit
56a4a38 first dev commit
785a4b7 Readme commit
e2bcfd1 Init master

pi@u18sdevops1:~/it-study/02.Git.Local$ git checkout dev
Переключено на ветку «dev»

pi@u18sdevops1:~/it-study/02.Git.Local$ git log --oneline
0dc68f4 (HEAD -> dev) Readme hotfix/we_gonna_die
0f79bbb Readme dev commit
56a4a38 first dev commit
785a4b7 Readme commit
e2bcfd1 Init master

pi@u18sdevops1:~/it-study/02.Git.Local$ git checkout features/do_one
Переключено на ветку «features/do_one»

pi@u18sdevops1:~/it-study/02.Git.Local$ git log --oneline
0bdb4e3 (HEAD -> features/do_one) Readme hotfix/we_gonna_die
2fd47a6 Readme features/do_one
0f79bbb Readme dev commit
56a4a38 first dev commit
785a4b7 Readme commit
e2bcfd1 Init master

pi@u18sdevops1:~/it-study/02.Git.Local$

```