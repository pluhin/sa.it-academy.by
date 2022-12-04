#Copy SSH-key to hosts
#ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass

#Output ssh keys
#ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers -u root


#Start ansible-playbook with encryption vaults
#ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
