# 09.K8s.Install

## Final result
```
PLAY RECAP ***************************************************************************************************************
node1                      : ok=654  changed=144  unreachable=0    failed=0    skipped=829  rescued=0    ignored=4   
node2                      : ok=434  changed=90   unreachable=0    failed=0    skipped=477  rescued=0    ignored=0   

Monday 18 May 2026  11:16:28 +0000 (0:00:00.120)       0:19:50.263 ************ 
=============================================================================== 
download : Download_container | Download image if required ------------------------------------------------------- 73.36s
download : Download_container | Download image if required ------------------------------------------------------- 70.49s
download : Download_container | Download image if required ------------------------------------------------------- 57.50s
system_packages : Manage packages -------------------------------------------------------------------------------- 57.18s
download : Download_container | Download image if required ------------------------------------------------------- 45.64s
download : Download_container | Download image if required ------------------------------------------------------- 41.71s
download : Download_container | Download image if required ------------------------------------------------------- 40.63s
download : Download_file | Download item ------------------------------------------------------------------------- 36.84s
download : Download_container | Download image if required ------------------------------------------------------- 33.94s
download : Download_container | Download image if required ------------------------------------------------------- 30.41s
download : Download_container | Download image if required ------------------------------------------------------- 24.46s
download : Download_file | Download item ------------------------------------------------------------------------- 24.13s
container-engine/containerd : Download_file | Download item ------------------------------------------------------ 23.89s
download : Download_file | Download item ------------------------------------------------------------------------- 22.77s
download : Download_file | Download item ------------------------------------------------------------------------- 21.11s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.05s
download : Download_container | Download image if required ------------------------------------------------------- 20.19s
container-engine/runc : Download_file | Download item ------------------------------------------------------------ 19.56s
download : Download_container | Download image if required ------------------------------------------------------- 18.05s
container-engine/crictl : Download_file | Download item ---------------------------------------------------------- 17.85s

```
