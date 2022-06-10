# 14. Kubernetes application deployment

## Summary

```yaml
KIND Pod
NAME jenkins2-7c4bd7658d-z6cf9
NAMESPACE ci-cd
CREATED_AT 06/03/2022 14:04:46
IMAGES jfrog.it-academy.by/public/jenkins-ci:bb8312
STATE Running
```

## Live Manifest (Hide Managed Fields)

```yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    cni.projectcalico.org/containerID: d1dd1ab4d371b5cec70f8683eff674fbafd630a0428b538eda8098fc7becc8a2
    cni.projectcalico.org/podIP: 10.233.96.35/32
    cni.projectcalico.org/podIPs: 10.233.96.35/32
  creationTimestamp: '2022-06-03T12:04:46Z'
  generateName: jenkins2-7c4bd7658d-
  labels:
    app: jenkins2
    pod-template-hash: 7c4bd7658d
  name: jenkins2-7c4bd7658d-z6cf9
  namespace: ci-cd
  ownerReferences:
    - apiVersion: apps/v1
      blockOwnerDeletion: true
      controller: true
      kind: ReplicaSet
      name: jenkins2-7c4bd7658d
      uid: 48a64372-c540-4007-8148-9cdbda67ebc2
  resourceVersion: '1663955'
  uid: 09d2c3f8-9fc2-411e-a9b9-39b9c22ae99d
spec:
  containers:
    - env:
        - name: JAVA_OPTS
          value: '-Djenkins.install.runSetupWizard=false'
        - name: CASC_JENKINS_CONFIG
          value: /var/jenkins_home/casc_configs/jenkins.yaml
      image: 'jfrog.it-academy.by/public/jenkins-ci:bb8312'
      imagePullPolicy: IfNotPresent
      name: jenkins2
      ports:
        - containerPort: 8080
          name: http-port
          protocol: TCP
        - containerPort: 50000
          name: jnlp-port
          protocol: TCP
      resources:
        limits:
          cpu: '3'
          memory: 2000Mi
        requests:
          cpu: '2'
          memory: 1000Mi
      securityContext:
        runAsUser: 0
      terminationMessagePath: /dev/termination-log
      terminationMessagePolicy: File
      volumeMounts:
        - mountPath: /var/run
          name: docker-sock
        - mountPath: /var/jenkins_home/init.groovy.d/basic-security.groovy
          name: jenkins-auth-config
          subPath: basic-security.groovy
        - mountPath: /var/jenkins_home/casc_configs/jenkins.yaml
          name: jenkins-config-yaml
          subPath: jenkins.yaml
        - mountPath: /var/jenkins_home
          name: jenkins2-config
        - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
          name: kube-api-access-x95rr
          readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: node2
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
    - effect: NoExecute
      key: node.kubernetes.io/not-ready
      operator: Exists
      tolerationSeconds: 300
    - effect: NoExecute
      key: node.kubernetes.io/unreachable
      operator: Exists
      tolerationSeconds: 300
  volumes:
    - hostPath:
        path: /var/run
        type: ''
      name: docker-sock
    - configMap:
        defaultMode: 420
        name: jenkins2-basic-security
      name: jenkins-auth-config
    - configMap:
        defaultMode: 420
        name: jenkins2-config
      name: jenkins-config-yaml
    - name: jenkins2-config
      nfs:
        path: /mnt/IT-Academy/nfs-data/sa2-20-22/bb8312/jenkins
        server: 192.168.37.105
    - name: kube-api-access-x95rr
      projected:
        defaultMode: 420
        sources:
          - serviceAccountToken:
              expirationSeconds: 3607
              path: token
          - configMap:
              items:
                - key: ca.crt
                  path: ca.crt
              name: kube-root-ca.crt
          - downwardAPI:
              items:
                - fieldRef:
                    apiVersion: v1
                    fieldPath: metadata.namespace
                  path: namespace
status:
  conditions:
    - lastProbeTime: null
      lastTransitionTime: '2022-06-03T12:04:46Z'
      status: 'True'
      type: Initialized
    - lastProbeTime: null
      lastTransitionTime: '2022-06-03T12:04:52Z'
      status: 'True'
      type: Ready
    - lastProbeTime: null
      lastTransitionTime: '2022-06-03T12:04:52Z'
      status: 'True'
      type: ContainersReady
    - lastProbeTime: null
      lastTransitionTime: '2022-06-03T12:04:46Z'
      status: 'True'
      type: PodScheduled
  containerStatuses:
    - containerID: >-
        containerd://821e1ab66f59478f54b47f3d0705794b9e6b6422e62e6bb96133002f32ca51c5
      image: 'jfrog.it-academy.by/public/jenkins-ci:bb8312'
      imageID: >-
        jfrog.it-academy.by/public/jenkins-ci@sha256:f52b0c85b7b6681e5ece96ff49cfc06c0846bdf99b385cc795e59eea8c1f0d0f
      lastState: {}
      name: jenkins2
      ready: true
      restartCount: 0
      started: true
      state:
        running:
          startedAt: '2022-06-03T12:04:52Z'
  hostIP: 192.168.203.4
  phase: Running
  podIP: 10.233.96.35
  podIPs:
    - ip: 10.233.96.35
  qosClass: Burstable
  startTime: '2022-06-03T12:04:46Z'
```
