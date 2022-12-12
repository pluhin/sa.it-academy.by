
PLAY [nginx] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ng15]

TASK [1. Check nginx installed] ************************************************
ok: [ng15]

TASK [2. Check version nginx] **************************************************
changed: [ng15]

TASK [3. Present info about version nginx] *************************************
ok: [ng15] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}

TASK [4. Create folder for index.html] *****************************************
ok: [ng15] => (item=site1.loc)
ok: [ng15] => (item=site2.loc)

TASK [5. Copy template index.html] *********************************************
ok: [ng15] => (item=site1.loc)
ok: [ng15] => (item=site2.loc)

TASK [6. Copy config file] *****************************************************
ok: [ng15] => (item=site1.loc)
ok: [ng15] => (item=site2.loc)

TASK [7. Create link for vsite_pool] *******************************************
changed: [ng15] => (item=site1.loc)
changed: [ng15] => (item=site2.loc)

TASK [8. Add record into hosts] ************************************************
changed: [ng15] => (item=site1.loc)
changed: [ng15] => (item=site2.loc)

TASK [9. Restart nginx] ********************************************************
changed: [ng15]

TASK [10. check site connection] ***********************************************
ok: [ng15] => (item=site1.loc)
ok: [ng15] => (item=site2.loc)

TASK [11. Check site info] *****************************************************
ok: [ng15] => {
    "msg": "All items completed"
}

PLAY RECAP *********************************************************************
ng15                       : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

