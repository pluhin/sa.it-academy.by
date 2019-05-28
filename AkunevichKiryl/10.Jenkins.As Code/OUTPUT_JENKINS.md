Started by user kir
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/TEST
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] git (show)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 4
drwxr-xr-x. 2 jenkins jenkins  22 May 22 08:49 docs
-rw-r--r--. 1 jenkins jenkins 764 May 22 10:12 README.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Edit README)
[Pipeline] sh
+ echo BY_Akunevich_Kiryl_AnD_2282
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (View README)
[Pipeline] sh
+ cat README.md
# sa.it-academy.by
Main purpose of this repository is collaboration of homework  for study groups
## Links
- How to join to the course [IT Academy site](https://www.it-academy.by/)
- Shared slides: [GDRIVE](https://drive.google.com/open?id=0B7-pec-Rldg3fmZyRTdHb1NzUmwzcUxGdVNBNEpndTFVa00wcHFVLUlIbHpiS0FrbEd5QzQ)
- [Calendar](https://calendar.google.com/calendar/embed?src=g0hu9oa3gerlib7gmo74ghbvsk@group.calendar.google.com&ctz=Europe/Minsk&pli=1)

## Contacts & communication 
- Slack channels for groups [sa-itacademy-by.slack.com](https://sa-itacademy-by.slack.com), invite only
- Author's email [pluhin@gmail.com](pluhin@gmail.com)

## CI/CD
BY_Akunevich_Kiryl_AnD_24629
BY_Akunevich_Kiryl_AnD_11714
BY_Akunevich_Kiryl_AnD_24196
BY_Akunevich_Kiryl_AnD_7189
BY_Akunevich_Kiryl_AnD_2282
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Packing test)
[Pipeline] sh
+ git add -A
[Pipeline] sh
+ git commit -m 'By Akynevich_kiryl_'
[master a1aeb94] By Akynevich_kiryl_
 Committer: Jenkins Automation Server <jenkins@192.168.100.5>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
[Pipeline] sh
+ git push --all
To git@github.com:greedguy1991/sa.it-academy.by.git
   5db5ba8..a1aeb94  master -> master
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://greedguy1991.slack.com/services/hooks/jenkins-ci/, teamDomain: Kiryl_Akunevich, channel: #devops, color: <empty>, botUser: false, tokenCredentialId: Slack
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
Started by user kir
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/TEST
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] git (show)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 4
drwxr-xr-x. 2 jenkins jenkins  22 May 22 08:49 docs
-rw-r--r--. 1 jenkins jenkins 764 May 22 10:12 README.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Edit README)
[Pipeline] sh
+ echo BY_Akunevich_Kiryl_AnD_2282
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (View README)
[Pipeline] sh
+ cat README.md
# sa.it-academy.by
Main purpose of this repository is collaboration of homework  for study groups
## Links
- How to join to the course [IT Academy site](https://www.it-academy.by/)
- Shared slides: [GDRIVE](https://drive.google.com/open?id=0B7-pec-Rldg3fmZyRTdHb1NzUmwzcUxGdVNBNEpndTFVa00wcHFVLUlIbHpiS0FrbEd5QzQ)
- [Calendar](https://calendar.google.com/calendar/embed?src=g0hu9oa3gerlib7gmo74ghbvsk@group.calendar.google.com&ctz=Europe/Minsk&pli=1)

## Contacts & communication 
- Slack channels for groups [sa-itacademy-by.slack.com](https://sa-itacademy-by.slack.com), invite only
- Author's email [pluhin@gmail.com](pluhin@gmail.com)

## CI/CD
BY_Akunevich_Kiryl_AnD_24629
BY_Akunevich_Kiryl_AnD_11714
BY_Akunevich_Kiryl_AnD_24196
BY_Akunevich_Kiryl_AnD_7189
BY_Akunevich_Kiryl_AnD_2282
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Packing test)
[Pipeline] sh
+ git add -A
[Pipeline] sh
+ git commit -m 'By Akynevich_kiryl_'
[master a1aeb94] By Akynevich_kiryl_
 Committer: Jenkins Automation Server <jenkins@192.168.100.5>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
[Pipeline] sh
+ git push --all
To git@github.com:greedguy1991/sa.it-academy.by.git
   5db5ba8..a1aeb94  master -> master
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://greedguy1991.slack.com/services/hooks/jenkins-ci/, teamDomain: Kiryl_Akunevich, channel: #devops, color: <empty>, botUser: false, tokenCredentialId: Slack
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
