# 14. Kubernetes application deployment

## Install Helm

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod +x get_helm.sh

./get_helm.sh
```

## Helm build

1. **Create a Helm chart:** Run the command `helm create <name>`. This will create the initial structure of a Helm chart with the specified `<name>`.

2. **Package the Helm chart:** Run the command `helm package <name>`. This will package the Helm chart with the `<name>` into a .tgz archive, creating a file named `<name>-0.1.0.tgz`.

3. **Install the Helm chart:** Run the command `helm install <name> ../helm-releases/<name>-0.1.0.tgz -n default`. This will install the Helm chart `<name>` from the .tgz archive located in the "../helm-releases" directory into the Kubernetes cluster under the "default" namespace.

4. **Uninstall the Helm chart:** Run the command `helm uninstall <name>`. This will uninstall the Helm chart `<name>` from the Kubernetes cluster along with all associated resources.