  667  mkdir local_repository
  668  cd local_repository/
  669  git init
  670  nano .gitkeep
  671  git commit -m "Created Local repository"
  672  git add .gitkeep
  673  git commit -m "Created Local repository"
  674  nano test.txt
  675  git add test.txt
  676  git commit -m "Added text file to the second commit"
  677  git checkout -b dev
  678  git log
  679  mkdir dev
  680  cd dev
  681  nano .gitkeep
  682  git status
  683  git add ./
  684  git commit -m "Create folder to dev branch"
  685  nano text_dev.txt
  686  git status
  687  git add text_dev.txt
  688  git commit -m "Add file to folder of dev"
  689  git log
  690  git branc --all
  691  git branch --all
  692  git checkout -b features/do_one
  693  mkdir features/do_one
  694  mkdir features
  695  cd features/
  696  mkdir do_one
  697  cd do_one/
  698  nano .gitkeep
  699  git status
  700  git add ../
  701  git commit -m "Create folder to features/do_one branch"
  702  git branche -all
  703  git branch -all
  704  git branch
  705  git checkout master
  706  git checkout -b hotfix/we_gonna_die
  707  git branch
  708  cd ../
  709  ls
  710  cd /home/dkeldanovich/local_repository/
  711  ls
  712  ls -a
  713  git checkout -b hotfix/we_gonna_die
  714  mkdir hotfix
  715  cd hotfix/
  716  mkdir we_gonna_die
  717  cd we_gonna_die/
  718  nano .gitkeep
  719  git status
  720  git add ../
  721  git commit -m "Create folder for hotfix/we_gonna_die"
  722  git log
  723  git log --all
  724  git log --oneline --decorate
  725  git log -- all --oneline --decorate
  726  git log --all --oneline --decorate
  727  git log --all --oneline --decorate --graph
  728  git checkout master
  729  git log --all --oneline --decorate --graph
  730  cd /home/dkeldanovich/local_repository/
  731  git log --all --oneline --decorate --graph
  732  ls
  733  git checkout hotfix/we_gonna_die
  734  ls
  735  git checkout features/do_one
  736  git log
  737  git checkout master
  738  git merge features/do_one
  739  git log
  740  ls
  741  git log --all --oneline --decorate --graph
  742  git branch
  743  git merge hotfix/we_gonna_die
  744  ls
 
