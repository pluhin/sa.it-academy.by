from git import Repo
import os
import sys
import re

def git_push(PATH_OF_GIT_REPO, REMOTE):
    try:
        repo = Repo(PATH_OF_GIT_REPO)
        #repo.git.add(update=True)
        #repo.git.add()
        origin = repo.remote(name=(str(REMOTE)))
        origin.fetch()
        origin.pull()
        origin.push()
        print('Successfull push to: ', REMOTE)
    except Exception as e:
        print('Some error occured while pushing the code: ',e)


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
        print("Config not found! Exiting!")
        sys.exit(1)
    return res


PATH_OF_GIT_REPO = r'.git'  # make sure .git folder is properly configured
COMMIT_MESSAGE = input("Specify the comment please: ")
CFG = f"{PATH_OF_GIT_REPO}/config"
    #git_push()
w = readcfg(CFG)
repo = Repo(PATH_OF_GIT_REPO)
repo.index.commit(COMMIT_MESSAGE)

for REMOTE in w:
    git_push(PATH_OF_GIT_REPO, REMOTE)
