# Aiden's Homelab

This project uses Infrastructure as Code and GitOps to automate the provisioning of my homelab.

## Overview

### Hardware

- 1x `Generic fanless 4 NIC mini PC`
  - CPU: `Intel Celeron N5100 @ 1.10 Ghz`
  - RAM: `8GB`
  - SSD: `128GB`
- 3x `HP Elitedesk 800 G2`
  - CPU: `Intel I5-6500T @ 2.5 Ghz`
  - RAM: `64GB / 24GB / 16GB` respectively
  - SSD:
    - Boot: `128GB`
    - Storage: `1TB NVMe`
- 1x `TP Link TL-SG2008`
  - Ports: `8`
  - Link Speed: `1000Mbps`

### Roles

- Router:
  - OS: `OpnSense`
  - Hardware: `Generic fanless 4 NIC mini PC`

### Goals

- [ ] Automate provisioning of baremetal hosts
