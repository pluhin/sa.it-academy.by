git add .

echo "Enter the commit message:"
read commitMessage

git commit -m "$commitMessage"

git push -u origin --all
git push -u origin_github --all
git push -u origin_bitbucket --all







