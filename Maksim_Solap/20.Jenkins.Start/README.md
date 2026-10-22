# 20.Jenkins.Start

---

## Homework Assignment 1: Deploy Jenkins and close the doors

### 1. Answers to Theoretical Questions
* **Why are there significantly more installed plugins displayed than what was selected manually?**
  When installing specific plugins (e.g., `Ansible` or `notify-events`), Jenkins automatically downloads their **transitive dependencies**—associated plugins required for the base tool to function correctly (such as Credentials API, SSH Credentials, Structs, API connectors, etc.).
* **Where does the Jenkins state live, and what exactly should be backed up?**
  The entire application state is stored inside the `JENKINS_HOME` directory (located along the `/var/jenkins_home` path inside the cluster pod). To create a full, restorable backup, you must save:
  * All `.xml` files from the root directory (server core configurations and security settings).
  * The `jobs/` directory (pipeline structures and build history).
  * The `users/` directory (local user accounts).
  * The `secrets/` directory (cryptographic keys for internal secrets and passwords).
* **What is the difference between a Security Realm and an Authorization Strategy?**
  * **Security Realm:** Handles authentication (**"Who are you?"**). It defines the mechanism used to verify user credentials (e.g., Jenkins' built-in user database, LDAP, Active Directory, or GitHub OAuth).
  * **Authorization Strategy:** Handles authorization (**"What are you allowed to do?"**). It determines the access rights of an authenticated user to specific Jenkins objects (e.g., Matrix-based security).

### 2. Proof of Completion (Screenshots)

#### Screenshot 1.1: List of installed plugins (Ansible, notify-events)

<img width="975" height="129" alt="image" src="https://github.com/user-attachments/assets/c01ba1c5-a238-4eb8-9764-41dca77a4d0f" />

#### Screenshot 1.2: Read-Only User Interface

<img width="975" height="536" alt="image" src="https://github.com/user-attachments/assets/49465c58-8a15-4fcb-bee3-b9ff8af4ec8c" />

<img width="975" height="685" alt="image" src="https://github.com/user-attachments/assets/261cb12b-a787-4504-8740-ab6fe8f53247" />


---

## Homework Assignment 2: A job driven from outside

### 1. Answers to Theoretical Questions
* **Why does Jenkins ask for a crumb, and why does a request without a cookie get a 403 error?**
  A **Crumb** is a dynamic token used for **CSRF protection** (Cross-Site Request Forgery). Jenkins strictly binds the generated Crumb to a unique session identifier stored in the **Session Cookie**. If a valid Crumb is provided but the session cookie is missing, Jenkins treats it as a completely new session, fails to find the matching security token within it, and blocks the request with a `403 Forbidden` code.
* **Why does a webhook beat Poll SCM, and when is polling still the right answer?**
  * **Webhook Advantage:** Operates on a **Push model** (event-driven). The build triggers instantaneously the moment a commit occurs, without wasting CPU resources on constant, empty checks.
  * **When Polling is still relevant:** Operates on a **Pull model**. It remains indispensable when the Jenkins server is hidden inside a completely isolated network perimeter (behind a restrictive Firewall/NAT) with no public IP or proxy tunnels available, making it physically impossible for GitHub/GitLab to reach out and deliver a webhook payload.

### 2. Implementation & Integration Steps

#### 2.1: Create a job that checks whether a user exists in `/etc/passwd`. The user name comes in as a build parameter.

img width="975" height="429" alt="image" src="https://github.com/user-attachments/assets/6f6ac844-0cdf-488a-b677-97a351ee797f" />

**Successful Jenkins Build Console Output:**
```bash
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/check-user-profile
[check-user-profile] $ /bin/bash /tmp/jenkins14317467359155622537.sh
=== Проверка существования пользователя в системе ===
УСПЕХ: Пользователь 'root' существует.
Finished: SUCCESS
```

#### 2.2: Trigger that job over the API: create a token, get a crumb, start a build with the parameter, and read the result back.

```
$ curl -X POST -u ${API_TOKEN} http://jenkins.k8s-7.sa/job/check-user-profile/buildWithParameters?USER_NAME=root

```
<img width="975" height="338" alt="image" src="https://github.com/user-attachments/assets/f6080188-08c7-4e9b-90ef-9b77324888b8" />

#### 2.3: Create a GitHub Action that takes a user name as input and calls your job over the API.
The pipeline requests a username via the GitHub user interface, constructs the API payload, and sends it directly to your Jenkins server located behind the NAT.
<img width="975" height="470" alt="image" src="https://github.com/user-attachments/assets/024b8266-c40f-4659-9435-3770cbb3173a" />
<img width="975" height="484" alt="image" src="https://github.com/user-attachments/assets/8258373a-d51b-4cfe-9f74-dad2e099489a" />

#### 2.4: In a separate job, connect a repository and add a webhook so that builds run only on changes to main.
Since Jenkins is not directly reachable from the public internet, a **Webhook Proxy URL** (`https://smee.io`) has been configured. Additionally, a proxy forwarding agent was deployed inside the cluster infrastructure via the `web-hook-proxy.yaml` manifest to receive payloads and forward them to Jenkins:

```bash
Forwarding https://smee.ioVtYIKecpeKaqAOU to http://cluster.local
```

**Deploying the Proxy Forwarder to the Cluster:**
```bash
kubectl apply -f web-hook-proxy.yaml -n default
```
<img width="975" height="429" alt="image" src="https://github.com/user-attachments/assets/1235733c-b604-4a7c-a446-52a63822c905" />

<img width="975" height="415" alt="image" src="https://github.com/user-attachments/assets/3bcb5171-d646-4b4b-99ca-fb2423eb3217" />


<img width="975" height="469" alt="image" src="https://github.com/user-attachments/assets/a527d173-73c9-4c0b-9c5a-2faf8e0861e5" />
