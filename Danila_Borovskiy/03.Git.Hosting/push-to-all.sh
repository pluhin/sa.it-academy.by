currentBranch=$(git rev-parse --abbrev-ref HEAD)
reposLength=$(git remote | wc -l)
counter=0

for remote in $(git remote); do
  echo "Processing remote: $remote / $currentBranch"

  git push $remote $currentBranch
  ((counter++))

  echo "---------------"
  printf "Progress: (%d / %d)\n\n" "$counter" "$reposLength"
done
