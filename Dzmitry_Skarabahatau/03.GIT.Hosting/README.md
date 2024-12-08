## 03.GIT.Hostingt

## Homework Assignment 1: Initializing a Remote Repository

```bash
cd ~
ls -la .ssh/
ssh-keygen -t ed25519 -C dimastyj12@gmail.com
ls -a ~/.ssh 
pbcopy < ~/.ssh/id_ed25519.pub 
ssh -T git@github.com 
cd sa.it-academy.by/
cd Dzmitry_Skarabahatau/
ls
git branch 
mkdir 03.GIT.Hosting
cd 03.GIT.Hosting/
touch README.md
cd ..
git status
git add --all
