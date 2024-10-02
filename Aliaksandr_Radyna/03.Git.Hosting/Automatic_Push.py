import git
import os
import json
import subprocess

#Config file location with repo info
path_to_config_file = os.path.dirname(os.path.abspath(__file__))
with open(f"{path_to_config_file}" + "\config.json", "r") as json_File:
    config_file = json.load(json_File)

# Main functionality
repos_path = config_file["repo_path"]

repo = git.Repo(repos_path)
n=0
for remote in repo.remotes:
    n=n+1
    print(f"Repository {n}: {remote.name}")
    print("Push start")
    repo.git.push()
print(f"Push to {n} repositories completed")