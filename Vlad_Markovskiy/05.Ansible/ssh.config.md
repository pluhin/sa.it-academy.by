## Jump server config

```bash
####################
##Home Jump Srever
Host home_bastion
     User updater
     HostName 192.168.43.40
Host 192.168.55.* 
     ProxyJump home_bastion
```
