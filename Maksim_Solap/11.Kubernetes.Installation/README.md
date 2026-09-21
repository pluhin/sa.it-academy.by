# 11.Kubernetes.installation

### K3s
<img width="1830" height="447" alt="image" src="https://github.com/user-attachments/assets/0303cb1a-1a7c-4049-9b43-733ada9315fc" />

### K8s
<img width="1826" height="474" alt="image" src="https://github.com/user-attachments/assets/0690f8d1-299b-4f70-9795-f8bf39d0b823" />

---

### Created GitHub action K8s-monitor.yml to check status of pods and create notification to Slack if you have crashed/failed pods

* To implement monitoring, was used a **Self-Hosted Runner**:

- **How ​​it works:** A lightweight agent (daemon) from GitHub runs on the local machine. It initiates a secure outbound connection (Websocket/HTTPS) to GitHub servers and continuously listens to the task queue.
- **Security:** We **did not need to open ports** on the home router to the outside world, nor did we have to export sensitive `kubeconfig` files to the cloud. `kubectl` commands are executed locally within the secure perimeter of your machine.


<img width="1374" height="858" alt="image" src="https://github.com/user-attachments/assets/84a95b19-1501-43db-9e33-02d4aa4872c3" />

### Success Notification

<img width="785" height="364" alt="image" src="https://github.com/user-attachments/assets/84a81103-bfb4-47a2-8d2e-3c40556fb516" />

### For checking broken pod used broken-pod.yml
<img width="857" height="431" alt="image" src="https://github.com/user-attachments/assets/bf68093c-1e4b-47e6-8a29-31c6725123e8" />
