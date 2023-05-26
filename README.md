# Aiden's Homelab

This project uses Infrastructure as Code and GitOps to automate the provisioning of my homelab.

## Overview

### Hardware

- 3x `HP Elitedesk 800 G2`
  - CPU: `Intel I5-6500T @ 2.5 Ghz`
  - RAM: `40GB / 24GB / 16GB` respectively
  - SSD:
    - Boot: `128GB`
    - Storage: `1TB NVMe`
- 1x `TP Link TL-SG2008`
  - Ports: `8`
  - Link Speed: `1000Mbps`

### Goals

- [ ] Automate provisioning of baremetal hosts
- [ ] Automate provisioning of VMs
- [X] Automate Kubernetes cluster provisioning
  - [X] 3 Control Plane Nodes
  - [X] 3 Worker Nodes
- [ ] Automate Kubernetes cluster management
  - [ ] Automate cluster upgrades
  - [ ] Automate certificate management
- [ ] Create GitOps Workflow
  - [ ] Automate deployment of applications
- [ ] Automate DNS record updates for publicly exposed services
- [ ] Install common applications
