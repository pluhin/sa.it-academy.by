#!/bin/python


from git import Repo, GitCommandError    
from datetime import date
import datetime



# Create a variable for the current date
current_date = date.today()


# Get current time
current_date_time = datetime.datetime.now()
current_time = current_date_time.time()


# Path to local repository
repo_path = '/home/sasha/HW/sa.it-academy.by/'


# Repository object initialization
repo = Repo(repo_path)


# Getting a list of remote repositories
remote_repositories = repo.remotes


# Generating a list of URLs of remote repositories
remote_urls = [remote.url for remote in remote_repositories]


# Uploading all changes to the local repository
repo.git.add('--all')
print('Git add OK!')


# Fixing changes
dt = f"Date:   {current_date}  Time:  {current_time}"
repo.git.commit('-m', dt)
print('Commit OK!')


# Send changes to all remote repositories
for remote_repo in remote_repositories:
    remote_repo.push()
print('Push OK!')

