# Homework 17: Log monitoring

## What was done

- Created the `homework-17` namespace.
- Deployed two replicas of `log-generator`. Each container writes a timestamp,
  Pod name and counter to standard output every two seconds.
- Created `failing-pod`, which writes an error and exits with code `1`. Its
  `restartPolicy: Always` produces `CrashLoopBackOff` and makes the previous
  container logs available through `kubectl logs --previous`.
- Read logs from one Pod, all Pods selected by `app=log-generator`, and the
  Deployment log stream.
- Inspected the CRI log symlinks and log contents under `/var/log/containers`
  on `node2`, and checked the `kubelet` journal.

## Deployment

```bash
kubectl apply -k . --context k8s
kubectl rollout status deployment/log-generator \
  -n homework-17 --context k8s
```

## Results

The two application Pods are `Running`. The intentionally broken Pod is in
`CrashLoopBackOff`, which is the expected state for this exercise.

Evidence:

- [`kubectl get pods` screenshot](screenshots/pods-and-previous-logs.png)
- [node-level logs screenshot](screenshots/node-level-logs.png)
- [`kubectl get pods` text output](evidence/pods.txt)
- [first 10 application log lines](evidence/app-first-10-lines.txt)
- [previous failed container logs](evidence/failing-pod-previous.txt)
- [node-level container and kubelet logs](evidence/node-level-logs.txt)

The complete list of commands is available in [commands.md](commands.md).

No passwords, tokens, private keys or kubeconfig credentials are stored in
this directory.
