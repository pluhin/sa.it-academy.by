# 18.Jenkins.As_code

## Otput 

[Output report](https://github.com/Kulinych/test/blob/master/report.txt) 


## Jenkins pipeline output 
```bash
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on 1 in /home/jenkins/workspace/home 18
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Git clone)
[Pipeline] deleteDir
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository https://github.com/Kulinych/test.git
 > git init /home/jenkins/workspace/home 18 # timeout=10
Fetching upstream changes from https://github.com/Kulinych/test.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
 > git fetch --tags --progress https://github.com/Kulinych/test.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision 1aa2b06b0d5383b2866bfcfb8be987d0d8a48e84 (refs/remotes/origin/master)
Commit message: "Update home 18 37"
 > git config remote.origin.url https://github.com/Kulinych/test.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 1aa2b06b0d5383b2866bfcfb8be987d0d8a48e84 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 1aa2b06b0d5383b2866bfcfb8be987d0d8a48e84 # timeout=10
 > git rev-list --no-walk d4b8ed21e9055c8b86da9d6fc1d932fe85867397 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Count host)
[Pipeline] sh
+ awk '/Up$/{print $2}'
+ wc -l
+ nmap -n -sn '192.168.202.*' '192.168.203.*' -oG -
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Speedtest)
[Pipeline] sh
+ echo @@@@@@@@@@@@@@@@@
+ curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
+ python -
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Github upload)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
Warning: A secret was passed to "sh" using Groovy String interpolation, which is insecure.
		 Affected argument(s) used the following variable(s): [PASS]
		 See https://jenkins.io/redirect/groovy-string-interpolation for details.
+ git add -A
+ git commit -m 'Update home 18 38'
[master 32c757f] Update home 18 38
 1 file changed, 11 insertions(+)
 create mode 100644 report.txt
+ git push https://kulinych:****@github.com/kulinych/test.git
warning: push.default is unset; its implicit value is changing in
Git 2.0 from 'matching' to 'simple'. To squelch this message
and maintain the current behavior after the default changes, use:

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use:

  git config --global push.default simple

See 'git help config' and search for 'push.default' for further information.
(the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
'current' instead of 'simple' if you sometimes use older versions of Git)

remote: This repository moved. Please use the new location:        
remote:   https://github.com/Kulinych/test.git        
To https://kulinych:****@github.com/kulinych/test.git
   1aa2b06..32c757f  master -> master
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: <empty>, teamDomain: sa-itacademy-by, channel: #coolnoti, color: #00FF00, botUser: false, tokenCredentialId: slack, notifyCommitters: false, iconEmoji: <empty>, username: <empty>, timestamp: <empty>
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
'``
