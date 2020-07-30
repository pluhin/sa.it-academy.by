```bash
 4003  cd /tmp
 4004  mkdir 02.ansible
 4005  cd 02.ansible
 4006  cat /etc/ansible/hosts > inv.yaml
 4007  vim inv.yaml
 4008  ansible-inventory -i inv.yaml --graph
 4009  vim inv.yaml
 4010  ansible-inventory -i inv.yaml --graph
 4011  vim inv.yaml
 4012  ansible-inventory -i inv.yaml --graph
 4013  ansible-inventory -i inv.yaml --host host
 4014  ansible-inventory -i inv.yaml --host host1
 4015  vim inv.yaml
 4016  ansible-inventory -i inv.yaml --host host1
 4017  ansible-inventory -i inv.yaml --host host2
 4018  ansible-inventory -i inv.yaml --host bastion
 4019  vim inv.yaml
 4020  ansible-inventory -i inv.yaml --graph
 4021  ls
 4022  vim play.yaml
 4023  ansible-playbook play.yaml -i inv.yaml
 4024  vim play.yaml
 4025  ansible-playbook play.yaml -i inv.yaml
 4026  vim play.yaml
 4027  vim inv.yaml
 4028  ansible-playbook play.yaml -i inv.yaml
 4029  vim inv.yaml
 4030  vim play.yaml
 4031  vim inv.yaml
 4032  ansible-playbook play.yaml -i inv.yaml
 4033  vim play.yaml
 4034  vim /etc/ansible/ansible.cfg
 4035  vim play.yaml
 4036  ansible-playbook play.yaml -i inv.yaml -t vars
 4037  ansible-playbook play.yaml -i inv.yaml --skip-tags vars
 4038  ansible-playbook play.yaml -i inv.yaml -t facts
 4039  vim play.yaml
 4040  vim /tmp/ansible_local.log
 4041  ansible host1 -m setup -i inv.yaml
 4042  ansible-playbook play.yaml -i inv.yaml -t facts
 4043  vim inv.yaml
 4044  vim /etc/ansible/hosts
 4045  vim inv.yaml
 4046  vim play.yaml
 4047  ansible-playbook play.yaml -i inv.yaml -t facts -e "group=ec" --ask-pass
 4048  vim play.yaml
 4049  ansible-playbook play.yaml -i inv.yaml -t facts -e "group=ec" --ask-pass
 4050  vim play.yaml
 4051  vim inv.yaml
 4052  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass
 4053  vim play.yaml
 4054  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass
 4055  vim play.yaml
 4056  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass
 4057  vim play.yaml
 4058  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass -t all_test
 4059  vim play.yaml
 4060  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass
 4061  vim play.yaml
 4062  ansible-playbook play.yaml -i inv.yaml  -e "group=ec" --ask-pass
 4063  vim add_user.yaml
 4064  vim inv.yaml
 4065  vim add_user.yaml
 4066  ansible-playbook add_user.yaml -i inv.yaml  -e "user_to_add=plu"
 4067  vim add_user.yaml
 4068  ansible-playbook add_user.yaml -i inv.yaml  -e "user_to_add=plu" -t cheek
 4069  vim add_user.yaml
 4070  ansible-playbook add_user.yaml -i inv.yaml  -e "user_to_add=plu" -t check

```
