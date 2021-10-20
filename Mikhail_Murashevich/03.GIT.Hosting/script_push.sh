#!/bin/bash
#
# push to github, gitlab and bitbucket
#
echo "*******************"
echo "*  Push to GitHub *"
echo "*******************"
#
git remote add origin git@github.com:mikevoice/my_repo.git
git push origin --all
#
#
echo "***********************"
echo "*  Push to Bitbucket  *"
echo "***********************"
#
Git remote add bitbuck git@bitbucket.org:mikevoice/my_repo.git
git push bitbuck --all
#
#
echo "********************"
echo "*  Push to GitLab  *"
echo "********************"
git remote add gitlab git@gitlab.com:mikevoice/my_repo.git
git push gitlab --all
