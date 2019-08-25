from git import Repo
import os
import sys
import re

'''
This scrips pushes commits from current branch to all remote repositories except "prepod"
How-to:
1. Go to you git working directory (where .git folder is being located)
2. Run `git add file` and git commit -m `text` commands
3. Run the script in order to push changes to your upstream hostings: python sync.py
'''

PATH_OF_GIT_REPO = r'.git'  # make sure .git folder is properly configured
# COMMIT_MESSAGE = input("Specify a comment please: ")
# COMMIT_MESSAGE = str(COMMIT_MESSAGE).strip()
CFG = f"{PATH_OF_GIT_REPO}/config"
repo = Repo(PATH_OF_GIT_REPO)

def git_push(PATH_OF_GIT_REPO, REMOTE):
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        #repo.git.add(update=True)
        #repo.git.add(A=True)
        #repo.git.add()
        #repo.index.commit(COMMIT_MESSAGE)
        #repo.git.commit("--amend")
        origin = repo.remote(name=REMOTE)
        #origin.fetch()
        print(f'Push to {REMOTE} in progress...')
        origin.push(force=True)
        print(f'Successfully pushed to: {REMOTE}\n')
    except Exception as e:
        print(f'\nSome error occurred while pushing the code to {REMOTE}: ',e)

def readcfg(CFG):
    # get upstreams from config
    res = []
    if os.path.exists(PATH_OF_GIT_REPO):
        with open(CFG) as f:
            data = f.readline()
            c = 1
            while data:
                data = f.readline()
                search = r'(^\[remote\ *)(\"(.+?)\")'
                match = re.findall(search, data)
                if match:
                    res.append(match[0][2])
                c += 1
    else:
        print("Config not found! Change you path to git working directory and try again. Exiting...")
        sys.exit(1)
    return res

w = readcfg(CFG)

for REMOTE in w:
    REMOTE = str(REMOTE).strip()
    if REMOTE != 'prepod':
        git_push(PATH_OF_GIT_REPO, REMOTE)

