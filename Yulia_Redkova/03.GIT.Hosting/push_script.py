#usr/bin/python3
import os

print("Script to push all changes to all remote repositories")

repo_list = os.popen('git remote show').read().split()
print("Remote repos:")
print(repo_list)

for i in repo_list:
   push_command = ('git push {}'.format(i))
   os.system(push_command)
   print(push_command)



