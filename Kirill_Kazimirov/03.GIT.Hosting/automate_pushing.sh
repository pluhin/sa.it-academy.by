allRepos=($(git remote))
echo "start" 
for repo in "${allRepos[@]}"; do
    echo "Send to $repo"
    git push -u "$repo" --all    
    echo "changes were sent"    
done
echo "end"
