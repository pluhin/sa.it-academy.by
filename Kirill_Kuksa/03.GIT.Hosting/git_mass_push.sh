#! /bin/bash

# git remote -v
# origin_bit	git@bitbucket.org:kirilltd/03.git.hosting.git (fetch)
# origin_bit	git@bitbucket.org:kirilltd/03.git.hosting.git (push)
# origin_hub	git@github.com:kirilltd/03.Git.Hosting.git (fetch)
# origin_hub	git@github.com:kirilltd/03.Git.Hosting.git (push)
# origin_lab	git@gitlab.com:kirill_kuksa/03.git.hosting.git (fetch)
# origin_lab	git@gitlab.com:kirill_kuksa/03.git.hosting.git (push)

for repo in `git remote`
do
  echo $repo
  git push $repo `git branch --show-current`
done