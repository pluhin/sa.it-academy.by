## Home task 9


### Task:
------
	Implemented Pipeline for check all online hosts in range `192.168.253.0/24`. All tasks based on the Ansible Ad-Hoc commands. 
        The Pipeline consists of follow steps:

  1. Check host availability by `ping` (`01.Check host`).
  2. Install or upgrade latest version `nmap` (`02.Install-upgrade nmap`).
  3. Check online hosts by `nmap` on range `192.168.253.0/24` (`03.Check online hosts`)
  4. Remove `nmap` (`04.Remove nmap`)
  5. Print list online hosts & remove temporary file (`05.Print list online hosts`)


##### Result:
------
1. Build Pipeline:

![](https://github.com/volat1977/sa.it-academy.by/blob/m-sa2-06-19/akomlik/lesson_9/Pipeline_done.png)


2. List online hosts:

![](https://github.com/volat1977/sa.it-academy.by/blob/m-sa2-06-19/akomlik/lesson_9/nmapscan.png)
