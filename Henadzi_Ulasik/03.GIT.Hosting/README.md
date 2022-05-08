# homework 03.GIT.Hosting  

## Links:

- [GitHub](https://github.com/Vlasik-Henadzi/demo_git)
- [GitLab](https://gitlab.com/Vlasik_Henadzi/demo_git)
- [BitBucket](https://bitbucket.org/vlasik-henadzi/demo_git)


##Commands
``` bash
  157  git remote add origin git@bitbucket.org:vlasik-henadzi/demo_git.git
  158  git push origin --all
  159  git remote rename origin origin_hub
  160  git remote add origin https://gitlab.com/Vlasik_Henadzi/demo_git.git
  161  git push origin --all
  162  git remote rename origin origin_lab
  163  git remote add origin git@github.com:Vlasik-Henadzi/demo_git.git
  164  git push origin --all
  165  history
  166  ./script
```

##Automate pushing script
``` bash
#!/bin/bash 
git push -u origin_hub;
git push -u origin_lab;
git push -u origin;
```