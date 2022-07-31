#!bin/bash
echo "Enter your message"
read message
git add .
git commit -m"${message}"
git push origin_bb master
git push origin_gh master
git push origin_gl master
exit
