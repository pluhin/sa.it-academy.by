    #usr/bin/python3.10
    import os


    rep_list = os.popen('git remote show').read().split()
    for i in rep_list:
        push = (f"git push {i}")
        os.system(push)