# 20. Jenkins. As code

## Output Jenkins task: 

```groovy
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node (hide)
Still waiting to schedule task
‘node1’ is offline
Running on node1 in /home/test/jenkins/workspace/pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone repository)
[Pipeline] deleteDir
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Avoid second fetch
Checking out Revision 405b1474fec25a2eab29f0ecbb1fa61243b9b166 (refs/remotes/origin/main)
Cloning repository https://github.com/nikolaikunai/jenkins.git
 > git init /home/test/jenkins/workspace/pipeline # timeout=10
Fetching upstream changes from https://github.com/nikolaikunai/jenkins.git
 > git --version # timeout=10
 > git --version # 'git version 2.25.1'
 > git fetch --tags --force --progress -- https://github.com/nikolaikunai/jenkins.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/nikolaikunai/jenkins.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 405b1474fec25a2eab29f0ecbb1fa61243b9b166 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
Commit message: "Add results file"
 > git checkout -b main 405b1474fec25a2eab29f0ecbb1fa61243b9b166 # timeout=10
 > git rev-list --no-walk 5e02b9ca9098cc138d4b18f690aa83e2019f596f # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Check online hosts)
[Pipeline] sh
+ sudo apt-get update
Hit:1 http://by.archive.ubuntu.com/ubuntu focal InRelease
Hit:2 http://by.archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:3 http://by.archive.ubuntu.com/ubuntu focal-backports InRelease
Hit:4 http://by.archive.ubuntu.com/ubuntu focal-security InRelease
Hit:5 https://download.docker.com/linux/ubuntu focal InRelease
Hit:6 http://ppa.launchpad.net/ansible/ansible/ubuntu focal InRelease
Ign:7 https://pkg.jenkins.io/debian-stable binary/ InRelease
Hit:8 https://pkg.jenkins.io/debian-stable binary/ Release
Err:9 https://pkg.jenkins.io/debian-stable binary/ Release.gpg
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY FCEF32E745F2C3D5
Reading package lists...
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: https://pkg.jenkins.io/debian-stable binary/ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY FCEF32E745F2C3D5
W: Failed to fetch https://pkg.jenkins.io/debian-stable/binary/Release.gpg  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY FCEF32E745F2C3D5
W: Some index files failed to download. They have been ignored, or old ones used instead.
+ sudo apt-get install nmap -y
Reading package lists...
Building dependency tree...
Reading state information...
nmap is already the newest version (7.80+dfsg1-2build1).
The following packages were automatically installed and are no longer required:
  ieee-data python3-argcomplete python3-dnspython python3-libcloud
  python3-lockfile python3-netaddr python3-selinux
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 73 not upgraded.
+ nmap -sP -n -oN ./nmap_speedtest.txt 192.168.10.55-65
Starting Nmap 7.80 ( https://nmap.org ) at 2022-07-01 14:00 UTC
Nmap scan report for 192.168.10.62
Host is up (0.00067s latency).
MAC Address: 4C:ED:FB:BF:96:47 (Asustek Computer)
Nmap done: 11 IP addresses (1 host up) scanned in 0.31 seconds
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Check speed test)
[Pipeline] sh
+ echo ----------result of speedtest----------
+ speedtest-cli
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push to branch)
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
+ git add .
+ git commit -m Add results file
[main 0332943] Add results file
 1 file changed, 6 insertions(+), 9 deletions(-)
+ git push https://NikolaiKunai:****@github.com/nikolaikunai/jenkins.git main
To https://github.com/nikolaikunai/jenkins.git
   405b147..0332943  main -> main
[Pipeline] deleteDir
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```


## Repositories's url : 

- [GitHub](https://github.com/nikolaikunai/jenkins.git)