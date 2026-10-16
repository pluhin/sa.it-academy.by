# 19. Testing

Two things we ran: linters for infrastructure code, and a k6 load test in the
cluster.

| File | What it is |
| --- | --- |
| [`k6.yaml`](./k6.yaml) | namespace, script in a ConfigMap, Pod that runs it — the green run |
| [`k6-failing-threshold.yaml`](./k6-failing-threshold.yaml) | the same test with an unreachable threshold — the red run |

## Linters

No `sudo` on the demo host, so everything goes into your own directories:

```bash
mkdir -p ~/bin && export PATH=$HOME/bin:$HOME/.local/bin:$PATH

pip3 install --user ansible-lint

curl -sL https://github.com/yannh/kubeconform/releases/download/v0.7.0/kubeconform-linux-amd64.tar.gz \
  | tar -C ~/bin -xz kubeconform

curl -sL https://github.com/stackrox/kube-linter/releases/download/v0.7.6/kube-linter-linux.tar.gz \
  | tar -C ~/bin -xz kube-linter
```

### ansible-lint — how the playbook is written

```bash
ansible-lint mysql.yaml
ansible-lint mysql.yaml --skip-list fqcn[action]
ansible-lint mysql.yaml -f codeclimate
```

Worth knowing: `risky-file-permissions` fires on `template` without `mode:`.
The file then gets whatever umask says — on another machine that can mean a
config with a password readable by everyone.

### kubeconform — does it match the Kubernetes schema

```bash
kubeconform --summary ./
```

On a repository with CRDs you will see this, and it is **not** a problem with
your manifests:

```text
Summary: 13 resources found in 8 files - Valid: 3, Invalid: 0, Errors: 10
```

`Invalid: 0` but `Errors: 10` — kubeconform only knows vanilla Kubernetes
schemas. `HelmRelease`, `Gateway`, `VirtualService` are CRDs. Give it more
schema sources:

```bash
kubeconform --summary \
  -schema-location default \
  -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' \
  ./
# Summary: 13 resources found in 8 files - Valid: 13, Invalid: 0, Errors: 0
```

Also useful — validate a chart before it reaches the cluster:

```bash
helm template ./chart | kubeconform --summary -
```

### kube-linter — is it a good manifest

```bash
kube-linter lint ./
kube-linter lint ./ --add-all-built-in
kube-linter checks list
```

Give it the **whole directory**, not a single file. On one file you get false
positives like `non-existent-service-account`, because the ServiceAccount is
declared in a neighbouring file.

In one line: kubeconform answers "is this Kubernetes at all?", kube-linter
answers "is this good Kubernetes?".

## k6 load test

The target is a service inside the cluster, so no `hostAliases` and no external
addresses are needed — cluster DNS resolves it.

```bash
kubectl apply -f k6.yaml
kubectl -n testing logs -f pod/k6-load-test
```

70 seconds: 20s ramp up to 10 VUs, 40s plateau, 10s ramp down.

```text
checks.........................: 100.00% 1118 out of 1118
✓ failed_requests..............: 0.00%   0 out of 559
✓ http_req_duration............: avg=923µs  p(95)=1.15ms
http_reqs......................: 559     7.95/s
```

559 requests but 1118 checks — each response is checked twice (status and
body). `checks` only counts; it never fails the test.

### The part that matters: a threshold that fails

Apply `k6.yaml` first — the `testing` namespace is created there.

```bash
kubectl apply -f k6-failing-threshold.yaml
kubectl -n testing logs -f pod/k6-strict
```

```text
✗ http_req_duration............: avg=1.29ms  p(95)=1.76ms
level=error msg="thresholds on metrics 'http_req_duration' have been crossed"
```

```bash
kubectl -n testing get pod k6-strict
# k6-strict   0/1   Failed

kubectl -n testing get pod k6-strict \
  -o jsonpath='{.status.containerStatuses[0].state.terminated.exitCode}'
# 99
```

**Exit code 99 is the whole point of k6 in CI.** The test did not "draw some
graphs" — it returned a non-zero code and turned the job red. `99` rather than
`1` so you can tell "the test could not run" from "the test ran and the SLA was
not met".

`check` counts, `threshold` decides. That is the difference.

## Clean up

```bash
kubectl delete ns testing
```

## Where this belongs in a pipeline

The order is set by how long things take, not by how important they are:

```text
pre-commit     ansible-lint, kubeconform          seconds
pull request   + kube-linter, helm lint, trivy    minutes
after deploy   smoke tests on staging             minutes
on a schedule  k6, soak tests                     tens of minutes
```

```yaml
- run: ansible-lint -f codeclimate
- run: kubeconform -summary -schema-location default -schema-location '<CRDs-catalog>' ./
- run: kube-linter lint ./ --add-all-built-in
- run: trivy config . --exit-code 1 --severity HIGH,CRITICAL
```

A test nobody waits for is a test nobody runs — that is why the expensive ones
move out of the pull request and into a schedule.
