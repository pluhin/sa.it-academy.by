### Push
```
152  cd git-local/
153  git remote list
154  git remote show
155  clear
156  git remote add origin-github git@github.com:mhryhoryeu/git-hosting.git
157  git remote show
158  git remote add origin-gitlab git@gitlab.com:mhryhoryeu/git-hosting.git
159  git remote show
160  git push origin-github --all
161  git push origin-gitlab --all
```

### Link to GitHub and GitLab
* [GitHub](https://github.com/mhryhoryeu/git-hosting)
* [GitLab](https://gitlab.com/mhryhoryeu/git-hosting)


### Script
```bash
#!/bin/bash

remote_output=`git remote show`
for remote_element in $remote_output
do
git push -u $remote_element --all
done
```

### Result
```
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 395 bytes | 395.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:mhryhoryeu/git-hosting.git
   6e161ef..4630d3c  hotfix/we_gonna_die -> hotfix/we_gonna_die
Branch 'dev' set up to track remote branch 'dev' from 'origin-github'.
Branch 'features/do_one' set up to track remote branch 'features/do_one' from 'origin-github'.
Branch 'hotfix/we_gonna_die' set up to track remote branch 'hotfix/we_gonna_die' from 'origin-github'.
Branch 'master' set up to track remote branch 'master' from 'origin-github'.
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 395 bytes | 395.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
remote:
remote: To create a merge request for hotfix/we_gonna_die, visit:
remote:   https://gitlab.com/mhryhoryeu/git-hosting/-/merge_requests/new?merge_request%5Bsource_branch%5D=hotfix%2Fwe_gonna_die
remote:
To gitlab.com:mhryhoryeu/git-hosting.git
   6e161ef..4630d3c  hotfix/we_gonna_die -> hotfix/we_gonna_die
Branch 'dev' set up to track remote branch 'dev' from 'origin-gitlab'.
Branch 'features/do_one' set up to track remote branch 'features/do_one' from 'origin-gitlab'.
Branch 'hotfix/we_gonna_die' set up to track remote branch 'hotfix/we_gonna_die' from 'origin-gitlab'.
Branch 'master' set up to track remote branch 'master' from 'origin-gitlab'.
```
