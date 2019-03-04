# Lesson_5: Ansible Cruise

## Home task:

1. Playbook to install Nginx server and two virtual hosts.
   - Depends from OS
   - Setup Nginx for two virtualhosts
   - Create and add index.html files
  
2. Check deployment.

## Disription:

This ansible playbook(tools) have a role:
 - Role have following structure folders:
    - nginx(Name role)
        - defaults (defaults vars for role)
        - files (files for copy omn remote hosts)
        - handlers (tasks for by condition)
        - tasks (folder include main and secondary tasks)
        
This playbook install WebServer 'Nginx' on Linux OS and copy your static web-site(index.html), check availability your WebServer.

## Report: 

Check_Port: ![](https://github.com/ZikFred/sa.it-academy.by/blob/m-sa2-06-19/emarchik/lesson_6/ansible_project/image/Check_port.PNG)

Check_url_1: ![](https://github.com/ZikFred/sa.it-academy.by/blob/m-sa2-06-19/emarchik/lesson_6/ansible_project/image/Check_url_1.PNG)
      
Check_url_2: ![](https://github.com/ZikFred/sa.it-academy.by/blob/m-sa2-06-19/emarchik/lesson_6/ansible_project/image/Check_url_2.PNG)

Results work: ![](https://github.com/ZikFred/sa.it-academy.by/blob/m-sa2-06-19/emarchik/lesson_6/ansible_project/image/Results.PNG)

Finish work: ![](https://github.com/ZikFred/sa.it-academy.by/blob/m-sa2-06-19/emarchik/lesson_6/ansible_project/image/Finish.PNG)


> In **anasible_log_x.log** ouput works  "ansible-playbook ansible_three_task.yml -vv"