##LINKS

git@github.com:NataliaBelogolovaya/demo_rep.git  
git@gitlab.com:belogolovayanv/demo_lab.git

#SCRIPT CODE
```python
#!/bin/python

import os
import sys

status2=os.system('git config --list | grep -P "remote.*url" > repositories.txt') # git config --list
repos=[] #for loop to pushing
with open('repositories.txt', 'r+') as f:
  for line in f:
    url=line.split('=',1)[1].replace('\n','')
    repos.append(url)
    
for url in repos: 
  print(url) 
  print(os.system('git push ' + url)) #push to remote repository
print(os.system('rm repositories.txt'))
print("---Successful!---")
```