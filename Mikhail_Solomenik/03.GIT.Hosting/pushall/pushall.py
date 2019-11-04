#! /usr/bin/python3
# -*- coding: utf-8 -*-

import os
import re
import subprocess
import sys
from pathlib import Path

import yaml


def get_config():
    args = sys.argv
    if len(args) == 1:
        exit('Pass config.yml as first parameter')
    cwd = Path().absolute()
    config_file = Path(cwd / args[1])
    if not config_file.is_file():
        exit('Wrong config.yml path')
    return yaml.safe_load(open(config_file))


def check_ssh(config):
    print()
    for name, repository in config['remotes'].items():
        service = repository['service']
        user = repository['user']
        service_host = config['services'][service]['host']
        username_pattern = re.compile(config['services'][service]['regex'])
        command = ['ssh', '-T', f'git@{service_host}']

        response = subprocess.run(command,
                                  stdout=subprocess.PIPE,
                                  stderr=subprocess.PIPE)

        if response.returncode == 0:
            message = response.stdout.decode()
        # github response code is 1, so we need fallowing construction
        elif response.returncode == 1:
            message = response.stderr.decode()
        else:
            print('Somthing wrong with your key:')
            print(f'\tcommand: { response.args}')
            print(f'\treturncode: {response.returncode}')
            print(f'\tstdout: {response.stdout.decode()}')
            print(f'\tstderr: { response.stderr.decode()}')
            return -1

        remote_user = re.search(username_pattern, message).group(0)
        if remote_user != user:
            print(f'You login to {service} as {remote_user}, not as {user}')
            return -1

        print(f'Remote {name} user is: {remote_user}. OK.')

    return 0


def check_remotes(config):
    command = ['git', 'remote', 'show']
    response = subprocess.run(command,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)

    remotes = response.stdout.decode().rstrip().split('\n')
    for _, repository in config['remotes'].items():
        stream = repository['stream']
        if stream not in remotes:
            print()
            print(f'stream {stream} not in git remote')
            return -1
    return 0


def push(config):
    print()
    for _, repository in config['remotes'].items():
        command = ['git', 'push', repository['stream'], '--all']
        response = subprocess.run(command,
                                  stdout=subprocess.PIPE,
                                  stderr=subprocess.PIPE)

        print(' '.join(response.args))
        if response.stdout.decode():
            print(response.stdout.decode())
        if response.stderr.decode():
            print(response.stderr.decode())

        if response.returncode != 0:
            print(f'Somthing wrong error: {response.returncode}')
            exit()


if __name__ == '__main__':
    config = get_config()
    project_location = os.path.expanduser(config['local'])
    os.chdir(project_location)

    if check_remotes(config) != 0 or check_ssh(config) != 0:
        exit()

    push(config)
