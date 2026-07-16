# Homework 19: Jenkins Start

## Jenkins deployment

Jenkins is deployed to Kubernetes through Argo CD and Helm:

- namespace: `jenkins-gitops`;
- Helm chart: `jenkins-homework` version `0.1.3`;
- configuration: Jenkins Configuration as Code;
- persistent storage: 5 Gi PVC;
- container runs as UID/GID `1000`;
- Argo CD status: `Synced / Healthy`.

The image and chart sources are stored in
[`sa2-35-26-jenkins`](https://github.com/antonzhdanko/sa2-35-26-jenkins).

## Plugins

The required plugins are installed into the custom Jenkins image with
`jenkins-plugin-cli`:

- Ansible (`ansible`);
- Notify.Events (`notify-events`).

The live Plugin Manager API reports both plugins as active. Job DSL is also
installed so the homework job can be created reproducibly through JCasC.

## Restricted user

The local user `viewer` is configured with Matrix Authorization. It has only:

- `Overall/Read`;
- `Job/Read`.

The user can open Jenkins and view `belarus-daily-info`, but receives HTTP 403
when trying to configure or start the job and when opening Jenkins security or
plugin administration. The administrator and viewer passwords are read from
different Kubernetes Secrets. The viewer Secret is stored in Git only as a
SealedSecret, so the password itself is not committed.

## Daily job

The Freestyle job `belarus-daily-info` uses the schedule `H H * * *` and:

1. Checks the current date against the Belarus public holiday JSON feed.
2. Downloads current exchange rates from the official National Bank of the
   Republic of Belarus API.
3. Displays USD, EUR and RUB rates in BYN in the console output.

The actual XML exported from the running Jenkins instance is available in
[`belarus-daily-info-config.xml`](belarus-daily-info-config.xml).

The verification build finished with `SUCCESS`. Its console output and the
plugin/permission checks are saved in [`evidence`](evidence/).

No passwords, API keys, webhook tokens or private keys are committed.
