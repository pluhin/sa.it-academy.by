# Git. Hosting

##Commands:
```bash 
  238  ssh-keygen
  239  cat /c/Users/User/.ssh/id_ed25519.pub

  241  git init
  242  ls -la
  243  cd git-local/
  244  git init
  245  touch README.md
  246  git add README.md
  247  git commit -m "init commit"
  248  git branch -M main
  249  git remote add origin git@github.com:ArthurF-java/git-local.git
  250  git push -u origin main
  251  git remote rename origin origin-github
  252  git remote add origin-gitlab git@gitlab.com:fonichkin.arthur/git-local.git
  253  git push -u origin-gitlab --all
  255  git config --global user.email fonichkin.arthur@gmail.com

  256  alias pushall="C:/git/push_all_remotes.sh"

  262  date >> README.md
  263  git add README.md
  264  git commit -m "all remotes test commit"
  265  pushall
  266  history
```

##Script:
```bash
CURRENT_BRANCH=`git branch --show-current`
REMOTES=`git remote`

for remote in $REMOTES; do
    echo "Pushing to remote: $remote on branch: $CURRENT_BRANCH"
    git push "$remote" "$CURRENT_BRANCH"
done

echo "Push to all remotes complete!"
```

##Repositories:
```bash
 1 https://github.com/ArthurF-java/git-local/tree/testF
 2 https://gitlab.com/fonichkin.arthur/git-local/-/tree/testF?ref_type=heads
```



