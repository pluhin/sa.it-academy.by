# Homework 20: Jenkins Routine

## Assignment 1: Jenkins API

The GitHub Actions workflow
[`jenkins-user-check.yaml`](jenkins-user-check.yaml) has a required
`workflow_dispatch` input named `username`.

The workflow performs this chain:

1. Validates the input user name.
2. Authenticates as the restricted Jenkins user `automation`.
3. Gets a Jenkins CSRF crumb and session cookie.
4. Calls `user-existence-check/buildWithParameters` with the `USERNAME`
   parameter.
5. Waits for the Jenkins build and prints its console output in GitHub Actions.

The Jenkins job checks `/etc/passwd` without printing the file contents. Both
outcomes were verified:

- `root` exists;
- `homework-user-missing` does not exist.

Both GitHub Actions runs completed successfully. The automation user has only
`Overall/Read`, `Job/Read` and `Job/Build`; it has no administration or job
configuration permissions. Its password is stored in GitHub Actions Secrets
and a Kubernetes SealedSecret.

The workflow source is also available in the
[`sa2-35-26-jenkins`](https://github.com/antonzhdanko/sa2-35-26-jenkins/blob/main/.github/workflows/jenkins-user-check.yaml)
repository. The XML exported from the running job is saved as
[`user-existence-check-config.xml`](user-existence-check-config.xml).

## Assignment 2: Webhook

The `github-main-webhook` Jenkins job:

- uses Git SCM to clone
  `https://github.com/antonzhdanko/sa2-35-26-jenkins.git`;
- tracks only `*/main`;
- uses the Jenkins GitHub push trigger.

GitHub sends push events to a private Smee channel. A Smee client runs in the
Kubernetes namespace `jenkins-gitops` and forwards events to the internal
Jenkins `/github-webhook/` endpoint. The channel address is stored only in a
SealedSecret and is redacted from container logs.

A documentation commit pushed to `main` produced this verified chain:

`GitHub push -> Smee -> Jenkins GitHub trigger -> clone main -> SUCCESS`

A push to a temporary non-main branch was also tested and did not create a
new Jenkins build, confirming that only `main` changes trigger this job.

The exported job configuration is saved as
[`github-main-webhook-config.xml`](github-main-webhook-config.xml). Test results
and links to successful runs are in [`evidence`](evidence/).

No passwords, API tokens, Smee channel addresses or private keys are committed.
