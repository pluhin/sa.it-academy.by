## My Homework for 09. Jenkins. As code

### Task:
------
	Create Pipeline using Jenkinsfile. 
	My Pipeline set Jenkinsfile from github repository, deploy `nmap`, scanning specified network for online hosts (optional set ip range), create result file, push result file to github repository or output result on screen (optional).
![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/10.Jen.Homework/Pics/start.JPG)


        The Pipeline consists of follow steps:

  1. Clone git repository (`Clone`).
  2. Run script for installing `nmap`, scan ip-range, create result file  (`Run script`).
  3. Declarate variable for final massage to slack (`Declaring Variable`& `Test output`)
  4. Update repository if set option (`Git update`)
  5. View result on screen if no set option (`Git no update. View output file`)
  6. Cleaning workspace (`Delete local rep`)
  7. Slack notification result.



##### Result:
------
1. Build Pipeline:

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/10.Jen.Homework/Pics/result_pipe.JPG)


2. Slack notification with list online hosts:

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/10.Jen.Homework/Pics/result_slack.JPG)

3. Git before job:

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/10.Jen.Homework/Pics/start_git.JPG)

4. Git after job:

![](https://github.com/iggysav/sa.it-academy.by/blob/m-sa2-06-19/isavastsiuk/10.Jen.Homework/Pics/finish_git.JPG)


Jenkins output log file attached

