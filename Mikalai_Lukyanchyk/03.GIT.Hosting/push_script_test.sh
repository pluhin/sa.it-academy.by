git add --all
Echo "Enter a commit"
read commit
git commit -m "$commit"
for remo in $(git remote)
do
git push --all $remo
done
