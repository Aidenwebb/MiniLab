# Home Minilab Summary

## Infrastructure

### Hardware

#### Fanless MiniPc

**Cost:** £150 from AliExpress (March 2023)

**Spec:**

| Item    | Description             |
| ------- | ----------------------- |
| Purpose | Opnsense Router         |
| CPU     | Intel Celeron N5100     |
| RAM     | 8GB DDR 4               |
| SSD     | 128GB NVMe              |
| NIC     | 4x Intel I225/I226 2.5G |

#### HP Elitedesk 800 G2 Mini

**Cost:**

- £100 each from eBay (January 2023)
- \+ £50 for 1TB NVMe SSD from Amazon (March 2023)

| Item     | Description                              |
| -------- | ---------------------------------------- |
| Purpose  | VM Host Cluster                          |
| CPU      | Intel(R) Core(TM) i5-6500T CPU @ 2.50GHz |
| RAM      | 16GB DDR4                                |
| Boot SSD | 256GB Samsung Evo 870 SATA SSD           |
| Data SSD | 1TB Crucial P3 NVMe SSD                  |
| OS       | Proxmox VE 7.4 (Debian)                  |

**Labels:**

- `EDG2-01`
- `EDG2-02`
- `EDG2-03`

#### Netgear GS108Ev3

**Cost:** £30 from Amazon (January 2021)

#### Netgear GS116Ev3

**Cost:** £80 from Amazon (December 2019)

#### UniFi AP AC Pro

#### Netgear GS110TPv2

#### Netgear GS108T

#### VM Hosts

- 3x Clustered [HP Elitedesk 800 G2 Mini](#hp-elitedesk-800-g2-mini)

#### VMs

### Networking

#### Diagram

#### VLANs

| VLAN | Name               | CIDR            | Purpose                         |
| ---- | ------------------ | --------------- | ------------------------------- |
| 0    | Lab Default        | 192.168.10.0/24 | Default LAN                     |
| 4    | Management         | 192.168.4.0/24  | Oob Management Devices          |
| 5    | CEPH_Net           | 192.168.5.0/24  | CEPH network traffic - unrouted |
| 6    | Cluster_Net        | 192.168.6.0/24  | PVE Cluster Traffic             |
| 7    | CEPH_Cluster_Net   | 192.168.7.0/24  | CEPH Cluster Traffic            |
| 10   | Lab Default Bridge | 192.168.10.0/24 | Bridged to Default for access   |
