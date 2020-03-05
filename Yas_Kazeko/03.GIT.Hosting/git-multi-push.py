#!/usr/bin/env python3
import os
import re
import itertools
import subprocess
import multiprocessing
from configparser import ConfigParser

# creates a list of remote repositories from the .git/config
def pickRemote(config):
    remotes = []
    for key in config.keys():
        g = re.match(r'remote \"(.*)\"', key)
        if g:
            remotes.append(g.group(1))
    return remotes

# push the current branch
def push(arg):
    remote, branch = arg
    print(">> pushing branch [{}] to remote [{}]".format(branch, remote))
    run = subprocess.run(['git', 'push', remote, branch],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if run.returncode != 0:
        print("[{}][{}] failed\n{}".format(remote, branch, run.stderr))
    else:
        print("<< [{}][{}] Done".format(remote, branch))


def main():
    try:
        cwd = os.path.curdir
        config = ConfigParser()
        config.read(os.path.join(cwd, '.git/config'))
        remote = pickRemote(config)
        branch = open(os.path.join(cwd, '.git/HEAD')).read().split('/')[-1].strip()
    except IOError as err:
        print("Cannot read repo configure: {}".format(err))
        exit(-1)
    print("Working on branch [{}], remotes: {}".format(branch, remote))
    pool = multiprocessing.Pool(len(remote))
    pool.map(push, zip(remote, itertools.repeat(branch)))
    pool.close()
    pool.join()


if __name__ == '__main__':
    main()
