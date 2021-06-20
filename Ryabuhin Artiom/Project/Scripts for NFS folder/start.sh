#!/bin/bash
cd /mnt/nfs
mkdir html
cd html
ls -a
git init
git remote add HESK https://github.com/CHESTER-ART/hesk
git fetch HESK
git checkout master
