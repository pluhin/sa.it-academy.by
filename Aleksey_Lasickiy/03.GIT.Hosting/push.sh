#!/bin/bash

#git push in all repositories script

git push github $1
git push gitlab $1
git push bitbucket $1
