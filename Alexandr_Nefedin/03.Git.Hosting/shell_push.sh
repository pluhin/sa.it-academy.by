#!/bin/bash

echo "*  Push to GitHub *"
git push origin --all

echo "*  Push to Bitbucket  *"
git push bitbucket --all

echo "*  Push to GitLab  *"
git push gitlab --all
