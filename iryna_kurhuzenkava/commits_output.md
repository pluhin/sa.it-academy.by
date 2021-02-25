
kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (master)
$ git commit -m "Initial Commit"
[master (root-commit) 56a8f9a] Initial Commit
 1 file changed, 1 insertion(+)
 create mode 100644 file01.txt


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (master)
$ git commit -a -m "commit 2"
warning: LF will be replaced by CRLF in file01.txt.
The file will have its original line endings in your working directory
[master b88cc02] commit 2
 1 file changed, 2 insertions(+)



kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (dev)
$ git commit -a -m "commit dev 01"
warning: LF will be replaced by CRLF in file01.txt.
The file will have its original line endings in your working directory
[dev eb8f39a] commit dev 01
 1 file changed, 1 insertion(+), 1 deletion(-)



kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (dev)
$ git commit -a -m "commit dev 02"
warning: LF will be replaced by CRLF in file01.txt.
The file will have its original line endings in your working directory
[dev 7025d43] commit dev 02
 1 file changed, 1 insertion(+)



kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (features)
$ git commit -a -m "commit features 01"
warning: LF will be replaced by CRLF in file01.txt.
The file will have its original line endings in your working directory
[features ac36258] commit features 01
 1 file changed, 1 insertion(+)


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (master)
$ git merge hotfix
Already up to date.


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (master)
$ git commit -a -m "commit hotfix to master"
[master 6e9d45b] commit hotfix to master
 1 file changed, 1 insertion(+), 1 deletion(-)



kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (features|REBASE 1/3)
$ git commit -a -m "conflict"
[detached HEAD b867d9c] conflict
 1 file changed, 1 insertion(+), 1 deletion(-)


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (dev)
$ git commit -a -m "commit 3"
On branch dev
nothing to commit, working tree clean


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (features)
$ git commit -a -m "commit features final"
On branch features
nothing to commit, working tree clean


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (dev)
$ git commit -a -m "commit dev final"
On branch dev
nothing to commit, working tree clean


kurhuzenkava.iryna@iryna3066 MINGW64 /tmp/git_ex01 (master)
$ git commit -a -m "commit master final"
On branch master
nothing to commit, working tree clean


