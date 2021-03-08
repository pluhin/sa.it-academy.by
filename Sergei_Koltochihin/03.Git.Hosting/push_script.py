from git import Repo
import os
import sys

originsList = ["origin_bb", "origin_github", "origin_gitlab"]
pathToGitRepo = "/home/sergei/vebinar3"
commitMessage = "autocommit via script"

def gitPush(o):
    try:
        repo = Repo(pathToGitRepo)
        repo.git.add(all=True)
        repo.index.commit(commitMessage)
        origin = repo.remote(name = o)
        origin.push(all=True)
    except:
        print("Error occured while pushing")

for o in originsList: 
    gitPush(o)