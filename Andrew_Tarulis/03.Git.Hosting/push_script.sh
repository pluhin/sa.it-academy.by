#!/bin/bash
# put this script to /bin derictory

BRANCH1=$1
git push --set-upstream github $BRANCH1
git push --set-upstream gitlab $BRANCH1
git push --set-upstream bitbucket $BRANCH1
