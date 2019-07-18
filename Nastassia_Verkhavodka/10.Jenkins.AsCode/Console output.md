### Output
```
Started by user nastiaver
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Jenkins.AsCode
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:verkhovodko/jenkins_pipeline.git # timeout=10
Fetching upstream changes from git@github.com:verkhovodko/jenkins_pipeline.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:verkhovodko/jenkins_pipeline.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 278af0631c2bf562cd7295aa3589c98e2a8a9cd8 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 278af0631c2bf562cd7295aa3589c98e2a8a9cd8
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 278af0631c2bf562cd7295aa3589c98e2a8a9cd8
Commit message: "Add 9.md file"
 > git rev-list --no-walk 278af0631c2bf562cd7295aa3589c98e2a8a9cd8 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (View branches)
[Pipeline] sh
+ echo Remote branches are:
Remote branches are:
[Pipeline] sh
+ git branch -r
  origin/ansible_cruise
  origin/ansible_run
  origin/ansible_workshop
  origin/master
[Pipeline] sh
+ echo Local branches are:
Local branches are:
[Pipeline] sh
+ git branch
* master
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 240
-rw-r--r-- 1 jenkins jenkins   6281 Jul 18 14:09 05.Ansible_run.md
-rw-r--r-- 1 jenkins jenkins   3392 Jul 18 14:09 06.Ansible.cruise.md
-rw-r--r-- 1 jenkins jenkins     64 Jul 18 14:09 07.Ansible.Workshop.md
-rw-r--r-- 1 jenkins jenkins     71 Jul 18 14:09 5.md
-rw-r--r-- 1 jenkins jenkins     71 Jul 18 14:15 6.md
-rw-r--r-- 1 jenkins jenkins     71 Jul 18 14:23 9.md
-rw-r--r-- 1 jenkins jenkins     19 Jul 18 14:09 README.md
-rw-r--r-- 1 jenkins jenkins 180632 Jul 18 14:09 Redmine project.png
-rw-r--r-- 1 jenkins jenkins    680 Jul 18 14:09 add_user.yaml
-rw-r--r-- 1 jenkins jenkins     11 Jul 18 15:01 build_info.ini
drwxr-xr-x 2 jenkins jenkins   4096 Jul 18 14:09 inventory
-rw-r--r-- 1 jenkins jenkins    137 Jul 18 14:09 main.yaml
-rw-r--r-- 1 jenkins jenkins    419 Jul 18 14:09 play.yaml
drwxr-xr-x 3 jenkins jenkins   4096 Jul 18 14:09 roles
-rw-r--r-- 1 jenkins jenkins     99 Jul 18 14:09 web.yaml
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] sh
+ test -f README.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] sh
+ echo version=12
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] sh
+ tar -zcvf /tmp/12.tar.gz ./
./
./06.Ansible.cruise.md
./web.yaml
./inventory/
./inventory/main.yaml
./README.md
./.git/
./.git/HEAD
./.git/COMMIT_EDITMSG
./.git/logs/
./.git/logs/HEAD
./.git/logs/refs/
./.git/logs/refs/heads/
./.git/logs/refs/heads/master
./.git/logs/refs/remotes/
./.git/logs/refs/remotes/origin/
./.git/logs/refs/remotes/origin/ansible_cruise
./.git/logs/refs/remotes/origin/ansible_workshop
./.git/logs/refs/remotes/origin/ansible_run
./.git/logs/refs/remotes/origin/master
./.git/description
./.git/refs/
./.git/refs/tags/
./.git/refs/heads/
./.git/refs/heads/master
./.git/refs/remotes/
./.git/refs/remotes/origin/
./.git/refs/remotes/origin/ansible_cruise
./.git/refs/remotes/origin/ansible_workshop
./.git/refs/remotes/origin/ansible_run
./.git/refs/remotes/origin/master
./.git/branches/
./.git/info/
./.git/info/exclude
./.git/FETCH_HEAD
./.git/objects/
./.git/objects/ea/
./.git/objects/ea/2dcc192317209f72ed6e820bd7e8bd9231e976
./.git/objects/94/
./.git/objects/94/8a066d6949487bb0362f076e9fd7a85bd22283
./.git/objects/d2/
./.git/objects/d2/1e8e821f4e5b2871b52b2d650608f4acf8dc03
./.git/objects/a3/
./.git/objects/a3/21f6d02670c7f70f4e3335d6fdd0a68b861740
./.git/objects/pack/
./.git/objects/fe/
./.git/objects/fe/3e1388a65e548da735d71d640c6019ecd1fcd4
./.git/objects/69/
./.git/objects/69/e20bd9c7a00cb9681a20011e00df0bd5d24fb1
./.git/objects/78/
./.git/objects/78/d6511eb4b6503dd4b07e8a6ad9a28c56a31e31
./.git/objects/cb/
./.git/objects/cb/028495ab516518bffc4b4ac4b4512a51fdf407
./.git/objects/76/
./.git/objects/76/9c84b3276223e68b3513ffa530e289c396fae0
./.git/objects/24/
./.git/objects/24/b6b86c35fc3bf3047746cbcc9d2e77e625efad
./.git/objects/24/4ebfdaa466eefb24c5782be1f0622331c824a8
./.git/objects/31/
./.git/objects/31/4539cc00a62cecb95f39f8c2df5e7c3ddb79be
./.git/objects/fb/
./.git/objects/fb/9fad75788a01c645349ccdbe6f9c4b4bb321f3
./.git/objects/9b/
./.git/objects/9b/00a46995b05d52e5d75637f6a54a4257533f2e
./.git/objects/0d/
./.git/objects/0d/4f46d2ccf8a86154097e79013eae1a5514081d
./.git/objects/56/
./.git/objects/56/b3a2054138b2cf79adbb096c292ae47e21e9f7
./.git/objects/56/68e2fa5fdf7740278d1a2f0f8a336a92df9945
./.git/objects/8c/
./.git/objects/8c/35d86c1d72422563f464775732b8c00676b906
./.git/objects/c1/
./.git/objects/c1/986f8d6ac16bef3ed1ead58ebce048e92388dd
./.git/objects/f0/
./.git/objects/f0/4de796f255374b87a2c516a76a4b0d6a8e3057
./.git/objects/b5/
./.git/objects/b5/67a28da26302fed118c1ee34b1a7ee410b8ae5
./.git/objects/b5/60bc4f2415676bd662bdd59bdc6e2b44a3a4e3
./.git/objects/ab/
./.git/objects/ab/840913d4b74c840f493248965408e70df10189
./.git/objects/23/
./.git/objects/23/e2d163bec6589537c0b5df555dd1f675186c06
./.git/objects/99/
./.git/objects/99/746ddf2ad471510b087caca3c8ef80e42020e1
./.git/objects/eb/
./.git/objects/eb/8e696d7ca2e210f2df6051a3558cc0f24a74c8
./.git/objects/27/
./.git/objects/27/8af0631c2bf562cd7295aa3589c98e2a8a9cd8
./.git/objects/info/
./.git/objects/8f/
./.git/objects/8f/4abcc8bfc50298748e79d08202e7e3e6619e3f
./.git/objects/c3/
./.git/objects/c3/b4c29dcf6035404d6cfd2b6887a183d4c6d812
./.git/objects/dd/
./.git/objects/dd/4f67573fb06a67b70ddd09d609177783700bd1
./.git/objects/bd/
./.git/objects/bd/5f5f61f5df2a7c0481c6291f0d812e2cd57258
./.git/objects/d7/
./.git/objects/d7/fce95dc4fd3e9fbfe0f47f89d7047fbf3e802d
./.git/objects/00/
./.git/objects/00/28901c72d02753df75fafd2526f3e668d63a91
./.git/objects/e7/
./.git/objects/e7/838e95df71c5a41cb360f18546695e8daa12e6
./.git/objects/15/
./.git/objects/15/3c30b1c0aea6ff5b6987de6bd87fb092c0d331
./.git/objects/5a/
./.git/objects/5a/70468d59d4f7b2ff2cb73327ad199a295c39d3
./.git/objects/9e/
./.git/objects/9e/f60e217e46b6a416e61b669f06f2ea74ef28ed
./.git/objects/e1/
./.git/objects/e1/c88c39d5dfb80bcdedc5d84c6cd050f95cce9b
./.git/objects/ff/
./.git/objects/ff/c742143f4534e42e0735ccaf084ac3e9c0e93f
./.git/objects/bc/
./.git/objects/bc/8d72b06de935f258812fc25af825ba876b40f8
./.git/objects/c4/
./.git/objects/c4/bf28f0782e898289c2462f44471f46f0b853c5
./.git/objects/0a/
./.git/objects/0a/5e9166ddd22ccaa4ef1688ba187068a46682e9
./.git/hooks/
./.git/hooks/pre-push.sample
./.git/hooks/commit-msg.sample
./.git/hooks/fsmonitor-watchman.sample
./.git/hooks/prepare-commit-msg.sample
./.git/hooks/post-update.sample
./.git/hooks/applypatch-msg.sample
./.git/hooks/pre-receive.sample
./.git/hooks/pre-applypatch.sample
./.git/hooks/pre-commit.sample
./.git/hooks/pre-rebase.sample
./.git/hooks/update.sample
./.git/config
./.git/index
./05.Ansible_run.md
./main.yaml
./add_user.yaml
./build_info.ini
./roles/
./roles/web/
./roles/web/templates/
./roles/web/templates/hosts.j2
./roles/web/defaults/
./roles/web/defaults/main.yaml
./roles/web/files/
./roles/web/files/index.html
./roles/web/files/nginx.repo
./roles/web/tasks/
./roles/web/tasks/nginx_RedHat.yaml
./roles/web/tasks/main.yaml
./roles/web/tasks/nginx_debian.yaml
./play.yaml
./5.md
./Redmine project.png
./6.md
./07.Ansible.Workshop.md
./9.md
[Pipeline] sh
+ ls -l /tmp/12.tar.gz
-rw-r--r-- 1 jenkins jenkins 361549 Jul 18 15:05 /tmp/12.tar.gz
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clean)
[Pipeline] sh
+ rm /tmp/12.tar.gz
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: sa-itacademy-by, channel: jenkins, color: #00FF00, botUser: false, tokenCredentialId: 6061f6b8-93a2-4dd4-a6f0-98d67e2037e9, iconEmoji <empty>, username <empty>
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
``` 