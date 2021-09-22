#!/bin/bash
time_now=$(date  +%Y%m%d_%H%M%S)

git add .
git commit -m 'upd '$time_now''
git update-index --chmod=+x *.sh

for i in `git remote`; do echo "start push to $i" && git push $i -f; done

exit 0
