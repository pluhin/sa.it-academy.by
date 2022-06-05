#!/bin/bash

echo "*  Push to GitHub *"
git push origin_github --all

echo "*  Push to Bitbucket  *"
git push origin_bitbucket_new --all

echo "*  Push to GitLab  *"
git push origin_gitlab --all
