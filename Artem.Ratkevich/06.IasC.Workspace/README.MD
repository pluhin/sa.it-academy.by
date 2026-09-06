# Homework Assignments - Student ID: 2

## Assignment 1: Understand the Naming and Addressing Scheme

### VMIDs and IP Addresses

Given:
- `student_id = 2`
- `n = student_id * 2 - 1 = 2 * 2 - 1 = 3`

| Host | Formula | VMID | IP Address | Purpose |
|------|---------|------|------------|---------|
| ws | `200 + student_id` | **2002** | `192.168.201.2` | Workstation |
| sa1 | `300 + n` | **3003** | `192.168.202.3` | Sandbox 1 |
| sa2 | `300 + n + 1` | **3004** | `192.168.202.4` | Sandbox 2 |
| k3s | `130 + student_id` | **1302** | `192.168.203.2` | K3s Master |
| k8s1 | `180 + n` | **1803** | `192.168.208.3` | K8s Worker 1 |
| k8s2 | `180 + n + 1` | **1804** | `192.168.208.4` | K8s Worker 2 |

**Network Configuration:**
- Prefix: `/16`
- Gateway: `192.168.37.1`

### Why are sandbox and k8s hosts numbered in pairs (n, n+1)?

The sandbox and k8s hosts are numbered in pairs because they represent **redundant or clustered services**:

- **Sandboxes (sa)**: These provide two isolated environments for testing, development, or pair programming scenarios. Having two allows for:
  - Simultaneous testing of different configurations
  - A/B testing environments
  - Development and staging environments side by side

- **K8s nodes (k8s)**: Kubernetes clusters require multiple nodes for:
  - **High Availability**: If one node fails, the cluster continues operating
  - **Workload Distribution**: Better load balancing and resource utilization
  - **Learning Experience**: Understanding multi-node Kubernetes operations

**Why ws and k3s use plain student_id:**
- **ws (Workstation)**: Single personal development environment - no redundancy needed
- **k3s (K3s Master)**: Lightweight Kubernetes that can run on a single node for development and learning purposes

### Why each student needs a separate VMID block and a separate pool

**Separate VMID Blocks:**
- VMIDs must be globally unique within the Proxmox cluster
- Prevents VMID collisions between students
- The numbering scheme guarantees uniqueness

**Separate Pools:**
- Provides logical grouping of resources
- Enables access control and isolation
- Students can only see and manage their own resources

**Hard Limit: The pool** is the hard limit. While VMID conflicts could potentially be resolved by renumbering, the pool-based access control is enforced by token permissions. 

---

## Assignment 2: Provision the Hosts with OpenTofu

### Initialization and Planning

```bash
cd modules/proxmox-hosts

# Initialize OpenTofu
tofu init

# Plan the infrastructure
tofu plan -var student_id=2 -var pool_id=student-02

# Output
tofu output
ansible_target = {
  "ip" = "192.168.201.2"
  "name" = "ws-2"
  "vmid" = 2002
}
inventory_table = <<EOT
| host | vmid | ip | purpose |
| --- | --- | --- | --- |
| ws-2 | 2002 | 192.168.201.2 | Ansible workshop target (08) |
| sa-3 | 3003 | 192.168.202.3 | sandbox |
| sa-4 | 3004 | 192.168.202.4 | sandbox |
| k3s-2 | 1302 | 192.168.203.2 | k3s cluster (11) |
| k8s-3 | 1803 | 192.168.208.3 | kubespray cluster (11) |
| k8s-4 | 1804 | 192.168.208.4 | kubespray cluster (11) |
EOT
k3s_nodes = [
  {
    "ip" = "192.168.203.2"
    "name" = "k3s-2"
    "vmid" = 1302
  },
]
k8s_nodes = [
  {
    "ip" = "192.168.208.3"
    "name" = "k8s-3"
    "vmid" = 1803
  },
  {
    "ip" = "192.168.208.4"
    "name" = "k8s-4"
    "vmid" = 1804
  },
]
sandboxes = [
  {
    "ip" = "192.168.202.3"
    "name" = "sa-3"
    "vmid" = 3003
  },
  {
    "ip" = "192.168.202.4"
    "name" = "sa-4"
    "vmid" = 3004
  },
]

tofu apply
```

Running tofu apply a second time shows no changes:

```bash
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```
## Homework Assignment 3: The Same Set Through Terragrunt

```bash
terragrunt init
terragrunt plan
```
### Why is the plan not empty if resources already exist?
Terragrunt uses its own state file (in a different backend, often S3 or local).

Even though resources exist in Proxmox, Terragrunt doesn't know about them → it sees them as "missing" and wants to create them.

### How to avoid managing the same resources twice?
Use the same state backend (e.g., the same S3 bucket and key) for both OpenTofu and Terragrunt.

### What does include and the generate block give you?
include pulls in shared configuration (like provider settings) from a root terragrunt.hcl.
generate creates a backend.tf or provider.tf file on the fly, so you don't have to duplicate it.

### Why is the difference between two students only in inputs?
The module logic is shared.
Only student-specific parameters (IDs, pool, counts) change – perfect for DRY (Don't Repeat Yourself) infrastructure.

### Why does pool_id live in each student's unit and not in the shared root.hcl?
Because pool_id is student-specific – it changes per user.
Keeping it in the unit allows each student to manage their own pool without affecting others.

## Homework Assignment 4: Check That the Hosts Are Ready

### SSH Access and the Passwordless Root Login Mechanism
SSH login as the root user works despite the standard restrictions imposed by Debian/Ubuntu distributions.

### Two key files involved in the process:
The container.tf and vms.tf files contain a provisioner "remote-exec" that runs an access setup script.

### IP Address Mapping
The network interface configuration of the virtual machines was successfully applied from the Cloud-Init settings (as confirmed in the Cloud-Init tab in the Proxmox UI).
