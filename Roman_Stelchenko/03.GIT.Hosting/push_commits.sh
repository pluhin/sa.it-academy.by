#!/bin/bash
set -e


function echo_with_datetime() {
    echo "$(date --rfc-3339='ns'): ${1}"
}

echo_with_datetime "Push to all remote repositories started"

repositories="$(git remote)"

[[ -z "${repositories}" ]] && echo_with_datetime "No remote repositories found" && exit 1

echo_with_datetime "Detected remote repositories: ${repositories}"
echo_with_datetime "Current branch: $(git branch --show-current)"

for repo in $repositories; do
  echo_with_datetime "Push changes to ${repo}"
  git push -u "${repo}"
done

echo_with_datetime "Push to all remote repositories finished"
