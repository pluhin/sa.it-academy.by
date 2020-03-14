git_remote=$(git remote);

echo -e "\nExisting remote repositories\n"


for item in ${git_remote[*]}; do
    echo -e "$item"
done

for item in ${git_remote[*]}; do
    echo -e "\nProcess $item"
    git push $item master
done
