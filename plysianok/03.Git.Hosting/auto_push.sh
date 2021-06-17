for item in $(git remote); do
    git push -u $item --all
done
echo "Remote repository is pushed"
