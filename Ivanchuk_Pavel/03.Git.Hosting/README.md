# 03.Git.Hosting 

## 1. Links to repositories:

**[GitHub](https://github.com/IPaul32/sa2-25-23-Ivanchuk "GitHub")**

**[GitLab](https://gitlab.com/IPaul32/sa-25-23-ivanchuk "GitLab")**

## Authorized SSH keys in Gitlab and Github

![sshkey_github](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/88dc7628-38d8-4ade-81a6-b6b3230a9bd8)

---

![sshkey_gitlab](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/67ff0099-bf61-4fbf-b579-d31e3bf1ca6b)

## Pushed  local repository into remote repositories each all

```bash 
  8  cd 02.GIT
  9  ls -la
  10  cd repo-PA
  11  git log --oneline
  12  git remote add origin git@github.com:IPaul32/sa2-25-23-Ivanchuk.git
  13  cat .git/config
  14  git push -u origin --all
  15  git remote add origin https://gitlab.com/ipaul321/md-sa2-25-23-Ivanchuk.git
  16  git remote rename origin github-origin
  17  git remote add origin https://gitlab.com/ipaul321/md-sa2-25-23-Ivanchuk.git
  18  git remote rename origin gitlab-origin
  19  cat .git/conf
  20  cat .git/config
  21  git branch -M main
  22  git push -u gitlab-origin --all
  23  nano .git/config
  24  git remote add origin git@gitlab.com:IPaul32/sa-25-23-ivanchuk.git
  25  git remote rename origin gitlab-origin
  26  git push -u gitlab-origin --all
```

## Created slack/email integration push/commit events

![Notification_gmail_GitLab](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/a70682c0-6bc5-44d6-8e4c-d32711a6afa0)

---

![Notification_gmail_GitHub](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/a9ca42f6-21eb-48a3-ba79-d5fce318ae1d)

---

![Notifications_GitLub_email](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/d78c66b0-2741-4060-ba9d-3d1f9c03e2f9)

---

![Notifications_GitHub_email](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/d52e69d8-c768-4faa-857b-67eaf8b0cb92)

---

## Automated push my changes to all remote repositories in bash:
```bash
#!/bin/bash

#List of remote repositories
remote_repositories=("github-origin" "gitlab-origin")

#Checking the status and availability of changes in the repository
if [[ $(git status -s) ]]; then
	echo "You have unsaved changes in your brunch. Please, save them before send"
	exit 
fi

#Pushing changes from the current local repository to all remote repositories
for remote_repo in "${remote_repositories[@]}"; do
	echo "Sending changes in $remote_repo..."
	git push -u "$remote_repo" --all
	echo "Changes send in $remote_repo."
done


echo "Done"
```
## Create alias for script
``` bash
  27  touch autopush.sh
  28  nano autopush.sh
  29  chmod +x autopush.sh
  30  alias apush=/home/02.GIT/repo-PA/autopush.sh
```
**Conclusion**
```bash
➜  repo-PA git:(main) apush                                                                             main
Sending changes in github-origin...
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
Сжатие объектов: 100% (6/6), готово.
Запись объектов: 100% (6/6), 779 bytes | 779.00 KiB/s, готово.
Total 6 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), done.
remote:
remote: Create a pull request for 'main' on GitHub by visiting:
remote:      https://github.com/IPaul32/sa2-25-23-Ivanchuk/pull/new/main
remote:
To github.com:IPaul32/sa2-25-23-Ivanchuk.git
 * [new branch]      main -> main
Ветка «bug-fix» отслеживает внешнюю ветку «bug-fix» из «github-origin».
Ветка «experimental-feature» отслеживает внешнюю ветку «experimental-feature» из «github-origin».
Ветка «feature-branch» отслеживает внешнюю ветку «feature-branch» из «github-origin».
Ветка «main» отслеживает внешнюю ветку «main» из «github-origin».
Changes send in github-origin.
Sending changes in gitlab-origin...
Перечисление объектов: 5, готово.
Подсчет объектов: 100% (5/5), готово.
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 295 bytes | 295.00 KiB/s, готово.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
remote:
remote: To create a merge request for main, visit:
remote:   https://gitlab.com/IPaul32/sa-25-23-ivanchuk/-/merge_requests/new?merge_request%5Bsource_branch%5D=main
remote:
To gitlab.com:IPaul32/sa-25-23-ivanchuk.git
   e40b71d..321290b  main -> main
Ветка «bug-fix» отслеживает внешнюю ветку «bug-fix» из «gitlab-origin».
Ветка «experimental-feature» отслеживает внешнюю ветку «experimental-feature» из «gitlab-origin».
Ветка «feature-branch» отслеживает внешнюю ветку «feature-branch» из «gitlab-origin».
Ветка «main» отслеживает внешнюю ветку «main» из «gitlab-origin».
Changes send in gitlab-origin.
Done
```

