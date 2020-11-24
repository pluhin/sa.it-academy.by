#!/bin/bash

ROOT_DIR=`pwd`
repos_array=("$(ls $ROOT_DIR)")


push_repos () {
    local repo_folder=$1
    local remote_name=$2

    echo -e "\n==> Update $ROOT_DIR/$repo_folder with $remote_name remote name."
    git push -u $remote_name HEAD   
}


for repo_folder in ${repos_array[*]}
do
    if [ -d "$ROOT_DIR/$repo_folder" -a -d "$ROOT_DIR/$repo_folder/.git" ]; then
        cd "$ROOT_DIR/$repo_folder"
        remote_names=("$(git remote show)")
        for remote in ${remote_names[*]}
        do
            push_repos "$repo_folder" "$remote"
        done
    fi
done