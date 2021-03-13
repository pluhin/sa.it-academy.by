from subprocess import check_call
import shlex


git_cmd=['https://github.com/MsWik/DZ_2_dewops.git','https://gitlab.com/MsWik/DZ_2_dewops.git','https://MrPihma@bitbucket.org/MrPihma/dz_2_dewops.git']
def add(git_cmd):
    branch_main_cmd='git branch -M main'
    check_call(shlex.split(branch_main_cmd))
    for i in git_cmd:
           try:
                    delete_remote_cmd = 'git remote rm origin'
                    check_call(shlex.split(delete_remote_cmd))
           except Exception as e:
                    print({"status": "origin not found", "message": str(e)})
                    pass

           add_remote_cmd='git remote add origin '+i
           print(add_remote_cmd)
           check_call(shlex.split(add_remote_cmd))
           push_cmd='git push -u origin main'
           check_call(shlex.split(push_cmd))


add(git_cmd)


