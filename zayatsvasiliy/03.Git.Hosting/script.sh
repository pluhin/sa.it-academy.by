array_remote=($(git remote))
count=0

for t in "${array_remote[@]}"; do 
    ((count++))
    echo "Iteration number $count: git push all branch remote repo - $t"
    
   # if git push -u "$t" --all > /dev/null; then
if git push -u "$t" --all; then
   echo "Result iteration $count: ok in  $t"
    else
        echo "Result iteration $count: fail in $t"
    fi
done
