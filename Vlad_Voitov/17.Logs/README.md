# Screenshot of kubectl get pods with your logging Pod(s).

![alt text](<screenshots/screen1.png>)

# First 10 lines of logs from your app Pod (kubectl logs).

```bash
root@devops:/home/vlad/17.Logs# kubectl logs printer-deployment-dd49c4c8b-r9p4n
printer-deployment: count=0 time=2025-12-11T01:22:59Z
printer-deployment: count=1 time=2025-12-11T01:23:00Z
printer-deployment: count=2 time=2025-12-11T01:23:01Z
printer-deployment: count=3 time=2025-12-11T01:23:02Z
printer-deployment: count=4 time=2025-12-11T01:23:03Z
printer-deployment: count=5 time=2025-12-11T01:23:04Z
printer-deployment: count=6 time=2025-12-11T01:23:05Z
printer-deployment: count=7 time=2025-12-11T01:23:06Z
printer-deployment: count=8 time=2025-12-11T01:23:07Z
printer-deployment: count=9 time=2025-12-11T01:23:08Z
printer-deployment: count=10 time=2025-12-11T01:23:09Z
```
# Logs of the failing Pod using --previous.

```bash
root@devops:/home/vlad/17.Logs# kubectl logs failing-app-alt --previous -n log-monitoring
2025-12-11T01:39:47+00:00 failing-app-alt: about to exit with code 1
```

# One screenshot or snippet from node-level logs (/var/log/containers or journalctl).

![alt text](<screenshots/screen2.png>)