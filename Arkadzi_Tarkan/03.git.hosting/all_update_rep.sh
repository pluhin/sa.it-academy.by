#!/bin/bash

GIT=`which git`
REPO_DIR_BIT_TEST=/home/arkadzit/git_devops_course/test/bit_test/
REPO_DIR_GITLAB_TEST=/home/arkadzit/git_devops_course/test/gitlab_test/
REPO_DIR_TEST_GITHUB=/home/arkadzit/git_devops_course/test/test_github/

cd ${REPO_DIR_BIT_TEST}
${GIT} add --all .
echo "bitbucket commit"
read com_bit
${GIT} commit -m "$com_bit"
${GIT} push git@bitbucket.org:arkadzit/bit_test.git

cd ${REPO_DIR_GITLAB_TEST}
${GIT} add -A
echo "gitlab commit"
read com_lab
${GIT} commit -m "$com_lab"
${GIT} push git@gitlab.com:arkadzit/gitlab_test.git

cd ${REPO_DIR_TEST_GITHUB}
${GIT} add --all .
echo "githab commit"
read com_hab
${GIT} commit -m "$com_hab"
${GIT} push git@github.com:arkadzit/test_github.git
