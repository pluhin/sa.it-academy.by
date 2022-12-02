
#!/bin/bash
reps=$(git remote)
for origin in $reps
do
git push -u $origin --all
done
