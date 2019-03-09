## My Homework for 05.Ansible. Run:



### Print out remote host parameters:
------

Output info with check in Slack channel (playbook: `play.yaml`):

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/05.Ans.Homework/Pics/slack_info.JPG)





### Playbook for the ansible user: 
------

1. Create new user (e.g. `sova`), set authorisation key, add to sudo:nopasswd for update command with check os_family (playbook: `play04.yaml`):

`root@DevOps:~# ansible-playbook -i ./inventories/prod.yml play04.yaml --ask-vault-pass -e "user_add=sova"`

Result output in slack:

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/05.Ans.Homework/Pics/slack_add_user.JPG)



Result output in term:
![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/05.Ans.Homework/Pics/output_add_user.JPG)


2. Check new user on servers (playbook: `slack.yaml`):
![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/05.Ans.Homework/Pics/slack_check_user.JPG)


3. Check execute command update with :nopasswd on behalf of the new user (playbook: `slack03.yaml`)
![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/05.Ans.Homework/Pics/slack_check_update.JPG)

4. For remove user use playbook `rem.yaml`
 