# 02.GIT.Local

## History:

```bash
	1  git --version
    2  mkdir
    3  mkdir 02.GIT.Local
    4  cd 02.GIT.Local/
    5  clear
    6  git init
    7  git config user.name "Artsiom"
    8  echo '1 commit' > commit.txt
    9  git status
   10  git add --all
   11  git commit -m '1 commit for master'
   12  git config user.email "agbusko@gmail.com"
   13  git commit -m '1 commit for master'
   14  git log --oneline
   15  echo '2 commit' >> commit.txt
   16  git add --all
   17  git commit -m '2 commit for master'
   18  git checkout -b dev
   19  echo '3 commit' >> commit.txt
   20  git add --all
   21  git commit -m '3 commit for dev'
   22  echo '4 commit' >> commit.txt
   23  git add --all
   24  git commit -m '4 commit for dev'
   25  git checkout -b features/do_one
   26  git branch
   27  echo '5 commit' >> commit.txt
   28  git add --all
   29  git commit -m '5 commit for features/do_one'
   30  git checkout master
   31  git branch
   32  git checkout -b hotfix/we_gonna_die
   33  echo '6 commit' >> commit.txt
   34  git commit -m '6 commit for hotfix/we_gonna_die'
   35  git add --all
   36  git commit -m '6 commit for hotfix/we_gonna_die'
   37  clear
   38  git checkout master
   39  git merge dev
   40  git merge features/do_one
   41  git merge hotfix/we_gonna_die
   42  git checkout hotfix/we_gonna_die
   43  git branch
   44  nano commit.txt
   45  git merge hotfix/we_gonna_die
   46  git add --all
   47  git merge hotfix/we_gonna_die
   48  git commit -m 'conflict resolution'
   49  git merge hotfix/we_gonna_die
   50  git log --oneline
   51  git checkout dev
   52  git rebase master
   53  git checkout features/do_one
   54  git rebase dev
   55  history >> README.md
 ```
 
## Commits:

 * master
	* 40cf42e conflict resolution
	* f80b288 6 commit for hotfix/we_gonna_die
	* 8502778 5 commit for features/do_one
	* 4b5b074 4 commit for dev
	* de4d630 3 commit for dev
	* 26a69af 2 commit for master
	* 1ebf290 1 commit for master
 * dev
	* 40cf42e conflict resolution
	* f80b288 6 commit for hotfix/we_gonna_die
	* 8502778 5 commit for features/do_one
	* 4b5b074 4 commit for dev
	* de4d630 3 commit for dev
	* 26a69af 2 commit for master
	* 1ebf290 1 commit for master
 * features/do_one
	* 40cf42e conflict resolution
	* f80b288 6 commit for hotfix/we_gonna_die
	* 8502778 5 commit for features/do_one
	* 4b5b074 4 commit for dev
	* de4d630 3 commit for dev
	* 26a69af 2 commit for master
	* 1ebf290 1 commit for master
 * hotfix/we_gonna_die
	* f80b288 6 commit for hotfix/we_gonna_die
	* 26a69af 2 commit for master
	* 1ebf290 1 commit for master