# 12.Kubernetes.First_deployment

## Nginx server deployment
```bash
kubectl apply -f {filename}
```

### 00-namespace.yml
```yaml
kind: Namespace
apiVersion: v1
metadata:
  name: hw-12
  labels:
    name: hw-12
```

### 01-config-map.yml
```yaml
kind: ConfigMap 
apiVersion: v1 
metadata:
  name: nginx-configmap 
  namespace: hw-12
data:
  index.html: |
    <html>
    <h1>Welcome</h1>
    </br>
    <h1>This is a configmap Index.html </h1>
    </br>
    </html>
```
### 03-nginx.yml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  namespace: hw-12 
spec:
  type: NodePort 
  selector:
    app: nginx-app
    type: front-end
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30011
---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: hw-12 
  labels:
    app: nginx-app
    type: front-end
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app
      type: front-end
  template:
    metadata:
      labels:
        app: nginx-app
        type: front-end
    spec:
      volumes:
      - name: nginx-indexhtml
        configMap:
          name: nginx-configmap
      containers:
        - name: nginx-container
          image: nginx:latest
          resources:
            requests:
              cpu: 50m
              memory: 50Mi
            limits:
              cpu: 150m
              memory: 150Mi
          volumeMounts:
          - mountPath: /usr/share/nginx/html/
            name: nginx-indexhtml
```
###


##Additional task:
```log
2022-05-28T20:43:39.8945166Z Requested labels: self-hosted
2022-05-28T20:43:39.8945270Z Job defined at: artem-devitsky/12.Kubernetes.First_deployment/.github/workflows/find_tabs_push.yaml@refs/heads/main
2022-05-28T20:43:39.8945294Z Waiting for a runner to pick up this job...
2022-05-28T20:43:40.2661046Z Job is about to start running on the runner: test-runner (repository)
2022-05-28T20:43:45.7857996Z Current runner version: '2.292.0'
2022-05-28T20:43:45.7865132Z Runner name: 'test-runner'
2022-05-28T20:43:45.7865573Z Runner group name: 'Default'
2022-05-28T20:43:45.7866198Z Machine name: 'test-runner'
2022-05-28T20:43:45.7868324Z ##[group]GITHUB_TOKEN Permissions
2022-05-28T20:43:45.7868830Z Actions: write
2022-05-28T20:43:45.7869046Z Checks: write
2022-05-28T20:43:45.7869251Z Contents: write
2022-05-28T20:43:45.7869455Z Deployments: write
2022-05-28T20:43:45.7869670Z Discussions: write
2022-05-28T20:43:45.7869878Z Issues: write
2022-05-28T20:43:45.7870073Z Metadata: read
2022-05-28T20:43:45.7870287Z Packages: write
2022-05-28T20:43:45.7870496Z Pages: write
2022-05-28T20:43:45.7870695Z PullRequests: write
2022-05-28T20:43:45.7870945Z RepositoryProjects: write
2022-05-28T20:43:45.7871194Z SecurityEvents: write
2022-05-28T20:43:45.7871402Z Statuses: write
2022-05-28T20:43:45.7871609Z ##[endgroup]
2022-05-28T20:43:45.7875425Z Secret source: Actions
2022-05-28T20:43:45.7875963Z Prepare workflow directory
2022-05-28T20:43:45.8838665Z Prepare all required actions
2022-05-28T20:43:45.9052780Z Getting action download info
2022-05-28T20:43:46.2227631Z Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
2022-05-28T20:43:47.0549772Z Download action repository 'tj-actions/changed-files@v19' (SHA:a6d456f542692915c5289ea834fb89bc07c11208)
2022-05-28T20:43:47.7327823Z Download action repository 'actions/upload-artifact@v2' (SHA:82c141cc518b40d92cc801eee768e7aafc9c2fa2)
2022-05-28T20:43:48.4881555Z Getting action download info
2022-05-28T20:43:48.7702492Z Download action repository 'tj-actions/glob@v7.16' (SHA:7e147c5f2fb842ce53357a35f14589222ee81b7f)
2022-05-28T20:43:49.5839329Z ##[group]Run actions/checkout@v2
2022-05-28T20:43:49.5839709Z with:
2022-05-28T20:43:49.5839919Z   fetch-depth: 0
2022-05-28T20:43:49.5840334Z   repository: artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:49.5841468Z   token: ***
2022-05-28T20:43:49.5841694Z   ssh-strict: true
2022-05-28T20:43:49.5841968Z   persist-credentials: true
2022-05-28T20:43:49.5842196Z   clean: true
2022-05-28T20:43:49.5842386Z   lfs: false
2022-05-28T20:43:49.5842608Z   submodules: false
2022-05-28T20:43:49.5842840Z   set-safe-directory: true
2022-05-28T20:43:49.5843080Z ##[endgroup]
2022-05-28T20:43:49.7965292Z Syncing repository: artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:49.7967501Z ##[group]Getting Git version info
2022-05-28T20:43:49.7968181Z Working directory is '/runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment'
2022-05-28T20:43:49.7968781Z [command]/usr/bin/git version
2022-05-28T20:43:49.7985886Z git version 2.36.1
2022-05-28T20:43:49.8015876Z ##[endgroup]
2022-05-28T20:43:49.8042830Z Temporarily overriding HOME='/runner/_work/_temp/e452230c-d378-4044-b7d6-9e2660d79ac8' before making global git config changes
2022-05-28T20:43:49.8044000Z Adding repository directory to the temporary git global config as a safe directory
2022-05-28T20:43:49.8044715Z [command]/usr/bin/git config --global --add safe.directory /runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment
2022-05-28T20:43:49.8118074Z Deleting the contents of '/runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment'
2022-05-28T20:43:49.8124674Z ##[group]Initializing the repository
2022-05-28T20:43:49.8128748Z [command]/usr/bin/git init /runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment
2022-05-28T20:43:49.8200914Z hint: Using 'master' as the name for the initial branch. This default branch name
2022-05-28T20:43:49.8201533Z hint: is subject to change. To configure the initial branch name to use in all
2022-05-28T20:43:49.8202128Z hint: of your new repositories, which will suppress this warning, call:
2022-05-28T20:43:49.8202456Z hint: 
2022-05-28T20:43:49.8202855Z hint: 	git config --global init.defaultBranch <name>
2022-05-28T20:43:49.8203108Z hint: 
2022-05-28T20:43:49.8203490Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2022-05-28T20:43:49.8204437Z hint: 'development'. The just-created branch can be renamed via this command:
2022-05-28T20:43:49.8204730Z hint: 
2022-05-28T20:43:49.8205005Z hint: 	git branch -m <name>
2022-05-28T20:43:49.8211600Z Initialized empty Git repository in /runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment/.git/
2022-05-28T20:43:49.8224933Z [command]/usr/bin/git remote add origin https://github.com/artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:49.8280669Z ##[endgroup]
2022-05-28T20:43:49.8281614Z ##[group]Disabling automatic garbage collection
2022-05-28T20:43:49.8286226Z [command]/usr/bin/git config --local gc.auto 0
2022-05-28T20:43:49.8380595Z ##[endgroup]
2022-05-28T20:43:49.8381103Z ##[group]Setting up auth
2022-05-28T20:43:49.8391247Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-28T20:43:49.8441903Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-28T20:43:49.8777956Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-28T20:43:49.8832048Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-28T20:43:49.9152707Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2022-05-28T20:43:49.9218995Z ##[endgroup]
2022-05-28T20:43:49.9219673Z ##[group]Fetching the repository
2022-05-28T20:43:49.9232718Z [command]/usr/bin/git -c protocol.version=2 fetch --prune --progress --no-recurse-submodules origin +refs/heads/*:refs/remotes/origin/* +refs/tags/*:refs/tags/*
2022-05-28T20:43:50.5881517Z remote: Enumerating objects: 66, done.        
2022-05-28T20:43:50.5882594Z remote: Counting objects:   1% (1/66)        
2022-05-28T20:43:50.5883286Z remote: Counting objects:   3% (2/66)        
2022-05-28T20:43:50.5883915Z remote: Counting objects:   4% (3/66)        
2022-05-28T20:43:50.5884249Z remote: Counting objects:   6% (4/66)        
2022-05-28T20:43:50.5884546Z remote: Counting objects:   7% (5/66)        
2022-05-28T20:43:50.5884818Z remote: Counting objects:   9% (6/66)        
2022-05-28T20:43:50.5885111Z remote: Counting objects:  10% (7/66)        
2022-05-28T20:43:50.5885393Z remote: Counting objects:  12% (8/66)        
2022-05-28T20:43:50.5885716Z remote: Counting objects:  13% (9/66)        
2022-05-28T20:43:50.5886155Z remote: Counting objects:  15% (10/66)        
2022-05-28T20:43:50.5886462Z remote: Counting objects:  16% (11/66)        
2022-05-28T20:43:50.5902283Z remote: Counting objects:  18% (12/66)        
2022-05-28T20:43:50.5902641Z remote: Counting objects:  19% (13/66)        
2022-05-28T20:43:50.5903128Z remote: Counting objects:  21% (14/66)        
2022-05-28T20:43:50.5903814Z remote: Counting objects:  22% (15/66)        
2022-05-28T20:43:50.5904140Z remote: Counting objects:  24% (16/66)        
2022-05-28T20:43:50.5904454Z remote: Counting objects:  25% (17/66)        
2022-05-28T20:43:50.5905758Z remote: Counting objects:  27% (18/66)        
2022-05-28T20:43:50.5906074Z remote: Counting objects:  28% (19/66)        
2022-05-28T20:43:50.5906345Z remote: Counting objects:  30% (20/66)        
2022-05-28T20:43:50.5906602Z remote: Counting objects:  31% (21/66)        
2022-05-28T20:43:50.5906877Z remote: Counting objects:  33% (22/66)        
2022-05-28T20:43:50.5907157Z remote: Counting objects:  34% (23/66)        
2022-05-28T20:43:50.5907448Z remote: Counting objects:  36% (24/66)        
2022-05-28T20:43:50.5907723Z remote: Counting objects:  37% (25/66)        
2022-05-28T20:43:50.5916516Z remote: Counting objects:  39% (26/66)        
2022-05-28T20:43:50.5916922Z remote: Counting objects:  40% (27/66)        
2022-05-28T20:43:50.5917262Z remote: Counting objects:  42% (28/66)        
2022-05-28T20:43:50.5918086Z remote: Counting objects:  43% (29/66)        
2022-05-28T20:43:50.5918352Z remote: Counting objects:  45% (30/66)        
2022-05-28T20:43:50.5918635Z remote: Counting objects:  46% (31/66)        
2022-05-28T20:43:50.5918917Z remote: Counting objects:  48% (32/66)        
2022-05-28T20:43:50.5919176Z remote: Counting objects:  50% (33/66)        
2022-05-28T20:43:50.5919456Z remote: Counting objects:  51% (34/66)        
2022-05-28T20:43:50.5919725Z remote: Counting objects:  53% (35/66)        
2022-05-28T20:43:50.5919991Z remote: Counting objects:  54% (36/66)        
2022-05-28T20:43:50.5920244Z remote: Counting objects:  56% (37/66)        
2022-05-28T20:43:50.5920534Z remote: Counting objects:  57% (38/66)        
2022-05-28T20:43:50.5920810Z remote: Counting objects:  59% (39/66)        
2022-05-28T20:43:50.5921060Z remote: Counting objects:  60% (40/66)        
2022-05-28T20:43:50.5921328Z remote: Counting objects:  62% (41/66)        
2022-05-28T20:43:50.5921591Z remote: Counting objects:  63% (42/66)        
2022-05-28T20:43:50.5921848Z remote: Counting objects:  65% (43/66)        
2022-05-28T20:43:50.5922123Z remote: Counting objects:  66% (44/66)        
2022-05-28T20:43:50.5922388Z remote: Counting objects:  68% (45/66)        
2022-05-28T20:43:50.5922642Z remote: Counting objects:  69% (46/66)        
2022-05-28T20:43:50.5922920Z remote: Counting objects:  71% (47/66)        
2022-05-28T20:43:50.5923190Z remote: Counting objects:  72% (48/66)        
2022-05-28T20:43:50.5923458Z remote: Counting objects:  74% (49/66)        
2022-05-28T20:43:50.5923718Z remote: Counting objects:  75% (50/66)        
2022-05-28T20:43:50.5924147Z remote: Counting objects:  77% (51/66)        
2022-05-28T20:43:50.5924455Z remote: Counting objects:  78% (52/66)        
2022-05-28T20:43:50.5924712Z remote: Counting objects:  80% (53/66)        
2022-05-28T20:43:50.5924988Z remote: Counting objects:  81% (54/66)        
2022-05-28T20:43:50.5925259Z remote: Counting objects:  83% (55/66)        
2022-05-28T20:43:50.5925517Z remote: Counting objects:  84% (56/66)        
2022-05-28T20:43:50.5925784Z remote: Counting objects:  86% (57/66)        
2022-05-28T20:43:50.5926097Z remote: Counting objects:  87% (58/66)        
2022-05-28T20:43:50.5926470Z remote: Counting objects:  89% (59/66)        
2022-05-28T20:43:50.5926885Z remote: Counting objects:  90% (60/66)        
2022-05-28T20:43:50.5930643Z remote: Counting objects:  92% (61/66)        
2022-05-28T20:43:50.5931317Z remote: Counting objects:  93% (62/66)        
2022-05-28T20:43:50.5934889Z remote: Counting objects:  95% (63/66)        
2022-05-28T20:43:50.5935684Z remote: Counting objects:  96% (64/66)        
2022-05-28T20:43:50.5937969Z remote: Counting objects:  98% (65/66)        
2022-05-28T20:43:50.5938444Z remote: Counting objects: 100% (66/66)        
2022-05-28T20:43:50.5938799Z remote: Counting objects: 100% (66/66), done.        
2022-05-28T20:43:50.5939208Z remote: Compressing objects:   2% (1/40)        
2022-05-28T20:43:50.5941710Z remote: Compressing objects:   5% (2/40)        
2022-05-28T20:43:50.5942073Z remote: Compressing objects:   7% (3/40)        
2022-05-28T20:43:50.5942388Z remote: Compressing objects:  10% (4/40)        
2022-05-28T20:43:50.5943120Z remote: Compressing objects:  12% (5/40)        
2022-05-28T20:43:50.5943516Z remote: Compressing objects:  15% (6/40)        
2022-05-28T20:43:50.5946803Z remote: Compressing objects:  17% (7/40)        
2022-05-28T20:43:50.5950298Z remote: Compressing objects:  20% (8/40)        
2022-05-28T20:43:50.5953739Z remote: Compressing objects:  22% (9/40)        
2022-05-28T20:43:50.5955315Z remote: Compressing objects:  25% (10/40)        
2022-05-28T20:43:50.5955876Z remote: Compressing objects:  27% (11/40)        
2022-05-28T20:43:50.5956414Z remote: Compressing objects:  30% (12/40)        
2022-05-28T20:43:50.5956936Z remote: Compressing objects:  32% (13/40)        
2022-05-28T20:43:50.5957525Z remote: Compressing objects:  35% (14/40)        
2022-05-28T20:43:50.5958066Z remote: Compressing objects:  37% (15/40)        
2022-05-28T20:43:50.5958978Z remote: Compressing objects:  40% (16/40)        
2022-05-28T20:43:50.5959500Z remote: Compressing objects:  42% (17/40)        
2022-05-28T20:43:50.5960032Z remote: Compressing objects:  45% (18/40)        
2022-05-28T20:43:50.5960593Z remote: Compressing objects:  47% (19/40)        
2022-05-28T20:43:50.5961216Z remote: Compressing objects:  50% (20/40)        
2022-05-28T20:43:50.5961743Z remote: Compressing objects:  52% (21/40)        
2022-05-28T20:43:50.5962270Z remote: Compressing objects:  55% (22/40)        
2022-05-28T20:43:50.5962799Z remote: Compressing objects:  57% (23/40)        
2022-05-28T20:43:50.5963344Z remote: Compressing objects:  60% (24/40)        
2022-05-28T20:43:50.5963899Z remote: Compressing objects:  62% (25/40)        
2022-05-28T20:43:50.5964426Z remote: Compressing objects:  65% (26/40)        
2022-05-28T20:43:50.5964955Z remote: Compressing objects:  67% (27/40)        
2022-05-28T20:43:50.5965468Z remote: Compressing objects:  70% (28/40)        
2022-05-28T20:43:50.5966022Z remote: Compressing objects:  72% (29/40)        
2022-05-28T20:43:50.5966600Z remote: Compressing objects:  75% (30/40)        
2022-05-28T20:43:50.5967126Z remote: Compressing objects:  77% (31/40)        
2022-05-28T20:43:50.5967640Z remote: Compressing objects:  80% (32/40)        
2022-05-28T20:43:50.5968158Z remote: Compressing objects:  82% (33/40)        
2022-05-28T20:43:50.5968697Z remote: Compressing objects:  85% (34/40)        
2022-05-28T20:43:50.5969238Z remote: Compressing objects:  87% (35/40)        
2022-05-28T20:43:50.5969746Z remote: Compressing objects:  90% (36/40)        
2022-05-28T20:43:50.5970430Z remote: Compressing objects:  92% (37/40)        
2022-05-28T20:43:50.5971011Z remote: Compressing objects:  95% (38/40)        
2022-05-28T20:43:50.5971521Z remote: Compressing objects:  97% (39/40)        
2022-05-28T20:43:50.5972200Z remote: Compressing objects: 100% (40/40)        
2022-05-28T20:43:50.5972920Z remote: Compressing objects: 100% (40/40), done.        
2022-05-28T20:43:50.7560752Z remote: Total 66 (delta 21), reused 62 (delta 17), pack-reused 0        
2022-05-28T20:43:50.8580112Z From https://github.com/artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:50.8581435Z  * [new branch]      main       -> origin/main
2022-05-28T20:43:50.8616327Z [command]/usr/bin/git branch --list --remote origin/main
2022-05-28T20:43:50.8673870Z   origin/main
2022-05-28T20:43:50.8687413Z [command]/usr/bin/git rev-parse refs/remotes/origin/main
2022-05-28T20:43:50.8735912Z f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:50.8741364Z ##[endgroup]
2022-05-28T20:43:50.8742907Z ##[group]Determining the checkout info
2022-05-28T20:43:50.8746413Z ##[endgroup]
2022-05-28T20:43:50.8746907Z ##[group]Checking out the ref
2022-05-28T20:43:50.8753460Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2022-05-28T20:43:50.9034173Z Switched to a new branch 'main'
2022-05-28T20:43:50.9040371Z branch 'main' set up to track 'origin/main'.
2022-05-28T20:43:50.9052880Z ##[endgroup]
2022-05-28T20:43:50.9138810Z [command]/usr/bin/git log -1 --format='%H'
2022-05-28T20:43:50.9185419Z 'f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33'
2022-05-28T20:43:50.9616132Z ##[group]Run tj-actions/changed-files@v19
2022-05-28T20:43:50.9616544Z with:
2022-05-28T20:43:50.9616961Z   token: ***
2022-05-28T20:43:50.9617385Z   separator:  
2022-05-28T20:43:50.9617759Z   files_separator: 

2022-05-28T20:43:50.9618063Z   files_ignore_separator: 

2022-05-28T20:43:50.9618470Z   sha: f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:50.9618877Z   since_last_remote_commit: false
2022-05-28T20:43:50.9619246Z   use_fork_point: false
2022-05-28T20:43:50.9619600Z   quotepath: true
2022-05-28T20:43:50.9619980Z ##[endgroup]
2022-05-28T20:43:51.0100247Z ##[group]Run # "Set base sha..."
2022-05-28T20:43:51.0100604Z [36;1m# "Set base sha..."[0m
2022-05-28T20:43:51.0100852Z [36;1mif [[ -n "" ]]; then[0m
2022-05-28T20:43:51.0101107Z [36;1m  echo "::set-output name=base_sha::"[0m
2022-05-28T20:43:51.0101819Z [36;1melif [[ "false" == "true" && "c1bd8b64d2a7369501519f0073269262c0013944" != "0000000000000000000000000000000000000000" ]]; then[0m
2022-05-28T20:43:51.0102263Z [36;1m    echo "::set-output name=base_sha::c1bd8b64d2a7369501519f0073269262c0013944"[0m
2022-05-28T20:43:51.0102543Z [36;1mfi[0m
2022-05-28T20:43:51.0136027Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-28T20:43:51.0136339Z ##[endgroup]
2022-05-28T20:43:51.0351582Z ##[group]Run # "Calculating the previous and current SHA..."
2022-05-28T20:43:51.0351997Z [36;1m# "Calculating the previous and current SHA..."[0m
2022-05-28T20:43:51.0352367Z [36;1mbash $GITHUB_ACTION_PATH/diff-sha.sh[0m
2022-05-28T20:43:51.0380696Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-28T20:43:51.0381034Z env:
2022-05-28T20:43:51.0381297Z   GITHUB_SERVER_URL: https://github.com
2022-05-28T20:43:51.0381626Z   GITHUB_REPOSITORY: artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:51.0381944Z   GITHUB_BASE_REF: 
2022-05-28T20:43:51.0382163Z   GITHUB_HEAD_REF: 
2022-05-28T20:43:51.0382453Z   GITHUB_ACTION_PATH: /runner/_work/_actions/tj-actions/changed-files/v19
2022-05-28T20:43:51.0382947Z   INPUT_SHA: f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:51.0383343Z   INPUT_BASE_SHA: 
2022-05-28T20:43:51.0383972Z   INPUT_TOKEN: ***
2022-05-28T20:43:51.0384173Z   INPUT_PATH: 
2022-05-28T20:43:51.0384402Z   INPUT_USE_FORK_POINT: false
2022-05-28T20:43:51.0384635Z ##[endgroup]
2022-05-28T20:43:51.0469856Z ##[group]changed-files-diff-sha
2022-05-28T20:43:51.0470247Z Resolving repository path...
2022-05-28T20:43:51.0497438Z Setting up 'temp_changed_files' remote...
2022-05-28T20:43:51.0550915Z No 'temp_changed_files' remote found
2022-05-28T20:43:51.0551383Z Creating 'temp_changed_files' remote...
2022-05-28T20:43:51.0598631Z Getting HEAD SHA...
2022-05-28T20:43:51.6822277Z remote: Total 0 (delta 0), reused 0 (delta 0), pack-reused 0        
2022-05-28T20:43:51.6873101Z From https://github.com/artem-devitsky/12.Kubernetes.First_deployment
2022-05-28T20:43:51.6873774Z  * [new branch]      main       -> temp_changed_files/main
2022-05-28T20:43:51.7010256Z ##[endgroup]
2022-05-28T20:43:51.7061005Z ##[group]Run tj-actions/glob@v7.16
2022-05-28T20:43:51.7061259Z with:
2022-05-28T20:43:51.7061475Z   files-separator: 

2022-05-28T20:43:51.7061693Z   escape-paths: true
2022-05-28T20:43:51.7061942Z   excluded-files-separator: 

2022-05-28T20:43:51.7062228Z   base-sha: c1bd8b64d2a7369501519f0073269262c0013944
2022-05-28T20:43:51.7062522Z   sha: f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:51.7062785Z   include-deleted-files: true
2022-05-28T20:43:51.7063020Z   separator: |
2022-05-28T20:43:51.7063273Z   files-from-source-file-separator: 

2022-05-28T20:43:51.7063722Z   excluded-files-from-source-file-separator: 

2022-05-28T20:43:51.7064036Z   follow-symbolic-links: true
2022-05-28T20:43:51.7064296Z   strip-top-level-dir: true
2022-05-28T20:43:51.7064528Z ##[endgroup]
2022-05-28T20:43:51.8054931Z [command]/usr/bin/git rev-parse --show-toplevel
2022-05-28T20:43:51.8118450Z /runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment
2022-05-28T20:43:51.8154111Z [command]/usr/bin/git diff --diff-filter=D --name-only c1bd8b64d2a7369501519f0073269262c0013944 f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:51.8211570Z 
2022-05-28T20:43:51.8287837Z ##[group]Run bash $GITHUB_ACTION_PATH/entrypoint.sh
2022-05-28T20:43:51.8288174Z [36;1mbash $GITHUB_ACTION_PATH/entrypoint.sh[0m
2022-05-28T20:43:51.8317264Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2022-05-28T20:43:51.8317537Z env:
2022-05-28T20:43:51.8317826Z   GITHUB_ACTION_PATH: /runner/_work/_actions/tj-actions/changed-files/v19
2022-05-28T20:43:51.8318125Z   INPUT_FILES_PATTERN_FILE: 
2022-05-28T20:43:51.8318362Z   INPUT_SEPARATOR:  
2022-05-28T20:43:51.8318580Z   INPUT_PATH: 
2022-05-28T20:43:51.8318838Z   INPUT_PREVIOUS_SHA: c1bd8b64d2a7369501519f0073269262c0013944
2022-05-28T20:43:51.8319347Z   INPUT_CURRENT_SHA: f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33
2022-05-28T20:43:51.8319631Z   INPUT_TARGET_BRANCH: main
2022-05-28T20:43:51.8319875Z   INPUT_CURRENT_BRANCH: main
2022-05-28T20:43:51.8320108Z   INPUT_QUOTEPATH: true
2022-05-28T20:43:51.8320324Z ##[endgroup]
2022-05-28T20:43:51.8424558Z ##[group]changed-files
2022-05-28T20:43:51.8424854Z Resolving repository path...
2022-05-28T20:43:51.8426196Z Retrieving changes between c1bd8b64d2a7369501519f0073269262c0013944 (main) → f4a53ceb72c4c8f5cbdee627b33a4645a2c88e33 (main)
2022-05-28T20:43:51.8426731Z Getting diff...
2022-05-28T20:43:52.2163329Z Added files: 
2022-05-28T20:43:52.2164471Z Copied files: 
2022-05-28T20:43:52.2165189Z Deleted files: 
2022-05-28T20:43:52.2166392Z Modified files: .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml
2022-05-28T20:43:52.2166763Z Renamed files: 
2022-05-28T20:43:52.2166966Z Type Changed files: 
2022-05-28T20:43:52.2167220Z Unmerged files: 
2022-05-28T20:43:52.2167466Z Unknown files: 
2022-05-28T20:43:52.2167960Z All changed and modified files: .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml
2022-05-28T20:43:52.2168596Z All changed files: .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml
2022-05-28T20:43:52.2169292Z All modified files: .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml
2022-05-28T20:43:52.2173843Z ##[endgroup]
2022-05-28T20:43:52.2315778Z ##[group]Run for file_name in .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml
2022-05-28T20:43:52.2316351Z [36;1mfor file_name in .github/workflows/find_tabs_push.yaml README.md manifests/self-hosted-runner/04-runner.yml[0m
2022-05-28T20:43:52.2316675Z [36;1mdo[0m
2022-05-28T20:43:52.2316941Z [36;1m  tabs_count=$(grep -P "\t" "${file_name}"|wc -l)[0m
2022-05-28T20:43:52.2317304Z [36;1m  echo "File: ${file_name} changed and content ${tabs_count} of tabs"|tee -a report.log[0m
2022-05-28T20:43:52.2317606Z [36;1mdone[0m
2022-05-28T20:43:52.2346180Z shell: /usr/bin/bash -e {0}
2022-05-28T20:43:52.2346466Z ##[endgroup]
2022-05-28T20:43:52.2442496Z File: .github/workflows/find_tabs_push.yaml changed and content 0 of tabs
2022-05-28T20:43:52.2478816Z File: README.md changed and content 0 of tabs
2022-05-28T20:43:52.2514855Z File: manifests/self-hosted-runner/04-runner.yml changed and content 0 of tabs
2022-05-28T20:43:52.2591091Z ##[group]Run actions/upload-artifact@v2
2022-05-28T20:43:52.2591357Z with:
2022-05-28T20:43:52.2591569Z   path: report.log
2022-05-28T20:43:52.2591785Z   name: artifact
2022-05-28T20:43:52.2591998Z   if-no-files-found: warn
2022-05-28T20:43:52.2592228Z ##[endgroup]
2022-05-28T20:43:52.3364348Z With the provided path, there will be 1 file uploaded
2022-05-28T20:43:52.3370574Z Starting artifact upload
2022-05-28T20:43:52.3371475Z For more detailed logs during the artifact upload process, enable step-debugging: https://docs.github.com/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging#enabling-step-debug-logging
2022-05-28T20:43:52.3373796Z Artifact name is valid!
2022-05-28T20:43:52.7240496Z Container for artifact "artifact" successfully created. Starting upload of file(s)
2022-05-28T20:43:53.3623895Z Total size of all the files uploaded is 138 bytes
2022-05-28T20:43:53.3625955Z File upload process has finished. Finalizing the artifact upload
2022-05-28T20:43:53.6282932Z Artifact has been finalized. All files have been successfully uploaded!
2022-05-28T20:43:53.6283173Z 
2022-05-28T20:43:53.6283349Z The raw size of all the files that were specified for upload is 199 bytes
2022-05-28T20:43:53.6283804Z The size of all the files that were uploaded is 138 bytes. This takes into account any gzip compression used to reduce the upload size, time and storage
2022-05-28T20:43:53.6284108Z 
2022-05-28T20:43:53.6284867Z Note: The size of downloaded zips can differ significantly from the reported size. For more information see: https://github.com/actions/upload-artifact#zipped-artifact-downloads 
2022-05-28T20:43:53.6285698Z 
2022-05-28T20:43:53.6285842Z Artifact artifact has been successfully uploaded!
2022-05-28T20:43:53.6455177Z Post job cleanup.
2022-05-28T20:43:53.6498065Z Post job cleanup.
2022-05-28T20:43:53.7144509Z Post job cleanup.
2022-05-28T20:43:53.9072057Z [command]/usr/bin/git version
2022-05-28T20:43:53.9296491Z git version 2.36.1
2022-05-28T20:43:53.9308970Z Copying '/home/runner/.gitconfig' to '/runner/_work/_temp/99a6feb7-8285-4226-898d-715e2a42515c/.gitconfig'
2022-05-28T20:43:53.9310884Z Temporarily overriding HOME='/runner/_work/_temp/99a6feb7-8285-4226-898d-715e2a42515c' before making global git config changes
2022-05-28T20:43:53.9312206Z Adding repository directory to the temporary git global config as a safe directory
2022-05-28T20:43:53.9313647Z [command]/usr/bin/git config --global --add safe.directory /runner/_work/12.Kubernetes.First_deployment/12.Kubernetes.First_deployment
2022-05-28T20:43:53.9541598Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2022-05-28T20:43:53.9688886Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
2022-05-28T20:43:54.0178034Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2022-05-28T20:43:54.0217005Z http.https://github.com/.extraheader
2022-05-28T20:43:54.0340111Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2022-05-28T20:43:54.0389170Z [command]/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
2022-05-28T20:43:54.0991700Z Cleaning up orphan processes
```
