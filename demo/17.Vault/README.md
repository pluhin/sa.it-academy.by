# 17. Vault

What we ran on the demo, in order. Commands only.

| | |
| --- | --- |
| [`vault_demo_01_dev_docker/`](./vault_demo_01_dev_docker/) | Vault dev-mode in Docker Compose: kv, policy, AppRole, dynamic DB creds |
| [`vault_demo_02_install_k8s/`](./vault_demo_02_install_k8s/) | Vault in Kubernetes with Helm: init, unseal, kv-v2, kubernetes auth |
| [`vault_demo_03_agent_injector/`](./vault_demo_03_agent_injector/) | Agent Injector: the secret lands in a file inside the Pod |
| [`vault_demo_04_vso/`](./vault_demo_04_vso/) | Vault Secrets Operator: the secret lands as a native k8s Secret |
| [`cli-cheatsheet.md`](./cli-cheatsheet.md) | Vault CLI reference |

Demos 3 and 4 need demo 2 done first.

Three things that will bite you:

- `helm repo add hashicorp` fails from the academy network (`403`) — clone the chart from GitHub.
- In Vault 2.x the `secret/` mount does not exist until you enable it. Without it you get `403 preflight capability check`.
- There is no default StorageClass in the cluster — set it in the values or the PVC stays `Pending`.
