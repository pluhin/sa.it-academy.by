#Repositories's urls 
#1) https://gitlab.com/VladislavSivtsov/md-sa2-31-25-2version ( create second time because first version was private and I can't connect via ssh)
#2) https://github.com/VladislavSivtsov/md-sa2-31-25
#Script 
``` bash
    echo "Enter your message"
read message
git add .
git commit -m"${message}"
if [ -n "$(git status - porcelain)" ];
then
 echo "IT IS CLEAN"
else
 git status
 echo "Pushing data to remote server!!!"
 git push -u origin master
fi
#next command
chmod +x git-push.sh
sudo cp git-push.sh /usr/bin/git-push.sh
    
