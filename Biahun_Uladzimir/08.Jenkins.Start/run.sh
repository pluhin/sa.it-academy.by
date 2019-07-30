#!/bin/bash


cd setup

ansible-playbook jn.yaml -i inventory/main.yaml --vault-password-file .vault_pass.txt