## Preparation
1) forked data https://github.com/pluhin/sa.it-academy.by to my Github-repository
2) created VM on Ubuntu 24.04 (2GB RAM, 20GB HDD)
3) wrote commands in console
sudo apt update && sudo apt install git -y
git --version
git config --global user.name "AnatoliyRadevich1"
git config --global user.email "*I hid my e-mail*"
git clone https://github.com/AnatoliyRadevich1/sa.it-academy.by
git checkout md-sa2-37-26
pwd
ls -lah
mkdir Anatoliy_Radevich
cd Anatoliy_Radevich/
mkdir Homework1
cd Homework1/
touch README.md
sudo nano README.md
*Typed text in file README.md and saved it*
*Opened folder with cloned project*
git add .
git commit -m "Add homework"
git push origin md-sa2-37-26
*In my repository pushed the button "Pull request"*
