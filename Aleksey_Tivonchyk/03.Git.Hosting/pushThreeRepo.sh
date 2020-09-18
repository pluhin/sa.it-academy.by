#!/bin/bash
echo "===>>>Pushing GitHub..."
git push -u github_repo -f && echo "Pushed GitHub"
sleep 1
echo "===>>>Pushing GitLab"
git push -u gitlab_repo -f && echo "Pushed GitLab"
sleep 1
echo "===>>>Pushing Bitbucket"
git push -u bitbucket_repo -f && echo "Pushed Bitbucket"
echo "Done, bye"
