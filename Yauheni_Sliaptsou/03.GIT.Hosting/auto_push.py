import subprocess

remotes = ["github", "bitbucket", "gitlab"]

for remote in remotes:
    print subprocess.check_output(['git', 'push', remote, "m-sa2-12-20"])
