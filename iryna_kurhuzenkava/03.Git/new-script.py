import subprocess as cmd

message = "commit17"

git_repo = {"github_repo": "git@github.com:iryna-kurhuzenkava/03GIT.git",
            "gitlab_repo": "git@gitlab.com:kurhuzenkava/03GIT.git",
            "bitbucket_repo": "git@bitbucket.org:iryna-kurhuzenkava/03git.git"}

def git_push_automation():
    for repo, url in git_repo.items():
       try:
           cmd.run(f'git add --all') 
           cmd.run(f'git commit -m "{message}"') 
           cmd.run(f'git remote add {repo} {url}')
           cmd.run(f'git push -f {repo} master') 
           print("Success")
       except:
           print("Error git automation")

git_push_automation()