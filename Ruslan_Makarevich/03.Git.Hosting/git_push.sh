 #!/usr/bin/bash


echo "Push to remote repositories!"

echo -e

	remote_repositories=($(git remote))

	for remote in "${remote_repositories[@]}" #show all git remote repositories

		do

			echo -e "$(git remote -v)"
		        #echo -e $(git push -u $remote --all) 

		done

echo -e 

echo "Push successfully completed!"
