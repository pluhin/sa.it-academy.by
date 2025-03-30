https://github.com/toyvoKalevala/DevOpsTraining
https://gitlab.com/toyvokalevala/03.git.hosting

```bash
#!/bin/bash

# An array of repositories URLs
repo_urls=(
    "github"
    "gitlab"
)

# Directory of the local repository
repo_dir="./"

# Loop push any changes, every few minutes
while true; do
    sleep 1m

    # Loop through the repo URLs and push changes for each one
    for repo_url in "${repo_urls[@]}"; do
        # Navigate to the repository directory
        cd "$repo_dir" || continue

        # Push the changes to the remote repo's 'master' branch
        git push $repo_url master
    done
done
```