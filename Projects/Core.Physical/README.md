# MiniLab Core

The core of the lab, I'll wrap this in to ansible at some point. For now, this is a placeholder.

## Infrastructure

### Hardware

#### Fanless MiniPc

| Item    | Description                            |
| ------- | -------------------------------------- |
| Purpose | VM Host for PfSense & UniFi Controller |
| CPU     | Intel Celeron N5100                    |
| RAM     | 8GB DDR 4                              |
| SSD     | 128GB NVMe                             |
| NIC     | 4x Intel I225/I226 2.5G                |

#### HP Elitedesk 800 G2 Mini

| Item     | Description                              |
| -------- | ---------------------------------------- |
| Purpose  | VM Host Cluster                          |
| CPU      | Intel(R) Core(TM) i5-6500T CPU @ 2.50GHz |
| RAM      | 16GB DDR4                                |
| Boot SSD | 256GB Samsung Evo 870 SATA SSD           |
| Data SSD | 1TB Crucial P3 NVMe SSD                  |
| OS       | Proxmox VE 7.3-3 (Debian)                |

#### VM Hosts

* 1x [Fanless MiniPc](#fanless-minipc)
* 3x Clustered [HP Elitedesk 800 G2 Mini](#hp-elitedesk-800-g2-mini)

#### VMs

**Host**: [Fanless MiniPc](#fanless-minipc)
| VM Name          | Purpose                   | IP Address | Notes |
| ---------------- | ------------------------- | ---------- | ----- |
| PfSense          | Core Router and Firewall  |            |       |
| Unifi Controller | Control WiFi access point |            |       |

### Networking

#### VLANs

| VLAN | Name          | Subnet     | Purpose                                                        |
| ---- | ------------- | ---------- | -------------------------------------------------------------- |
| 9    | IOT           | 10.10.9.0  | IOT Devices                                                    |
| 10   | Management    | 10.10.10.0 | Management of systems                                          |
| 11   | User Network  | 10.10.11.0 | User devices                                                   |
| 12   | Guest Network | 10.10.12.0 | Guest devices                                                  |
| 13   | Internal DMZ  | 10.10.13.0 | Edge/Ingress/Gateway for services exposed to internal networks |
| 14   | External DMZ  | 10.10.14.0 | Edge/Ingress/Gateway for services exposed to the internet      |
| 15   | Data Store    | 10.10.15.0 | Home to file servers and shares, such as the NAS               |
| 16   | Databases     | 10.10.16.0 | Home to database servers such as PostgreSQL and MariaDB        |



#### Modem

Location: Livingroom\
Hardware: 

| Local Port | VLANs | Connection                          | Remote Port | Purpose            |
| ---------- | ----- | ----------------------------------- | ----------- | ------------------ |
| WAN        |       | ISP                                 |             | Uplink to Internet |
| LAN        |       | [MiniPc - Router](#minipc---router) |             |                    |


#### MiniPc - Vm Host

Location: Livingroom\
Hardware: [Fanless MiniPc](#fanless-minipc)

| Local Port | VLANs | Connection     | Remote Port             | Purpose                          |
| ---------- | ----- | -------------- | ----------------------- | -------------------------------- |
| 1          | 10    | Open           | Hotplug                 | Management interface for VM Host |
| 4          |       |                |                         | Unused                           |
| Bridge10   | 10    | Fanless MiniPc | Fanless MiniPc - Router |                                  |

#### MiniPc - Router

Location: Livingroom\
Hardware: [MiniPc - Vm Host](#minipc---vm-host)

| Local Port | VLANs | Connection                  | Remote Port | Purpose                      |
| ---------- | ----- | --------------------------- | ----------- | ---------------------------- |
| 2          |       | [Modem](#modem)             | LAN         | Router Uplink to Modem       |
| 3          | Trunk | [Core Switch](#core-switch) | 2           | Router Trunk to Core Switch  |
| 3.10       | 10    |                             |             | Management Network Gateway   |
| 3.11       | 11    |                             |             | User Device Network Gateway  |
| 3.12       | 12    |                             |             | Guest Device Network Gateway |
| 3.13       | 13    |                             |             | Internal DMZ Network Gateway |
| 3.14       | 14    |                             |             | External DMZ Network Gateway |
| 3.15       | 15    |                             |             | Data Store Network Gateway   |
| 3.16       | 16    |                             |             | Database Network Gateway     |

#### Core Switch

Location: Livingroom
Hardware: 

| Local Port | VLANs          | Connection                              | Remote Port | Purpose                             |
| ---------- | -------------- | --------------------------------------- | ----------- | ----------------------------------- |
| 1          | 10             | Open                                    | Hotplug     | Management interface                |
| 2          | Trunk          | [MiniPc - Router](#minipc---router)     | 3           | Uplink to Router                    |
| 3          | Trunk          | [Office Hub Switch](#office-hub-switch) | 2           | Distribute to the Office Hub Switch |
| 4          | Untagged-to-11 | Unmanaged TV Switch                     | 1           | Distribute to TV and Media PC       |
| 5          | Untagged-to-11 |                                         |             | Pi Hole DNS/DHCP for LAN            |
| 6          |                |                                         |             |                                     |
| 7          |                |                                         |             |                                     |
| 8          |                |                                         |             |                                     |

#### Office Hub Switch

Location: Office\
Hardware:

| Local Port | VLANs | Connection                                    | Remote Port | Purpose              |
| ---------- | ----- | --------------------------------------------- | ----------- | -------------------- |
| 1          | 10    | Open                                          | Hotplug     | Management interface |
| 2          | Trunk | [Core Switch](#core-switch)                   | 3           | Uplink               |
| 3          | Trunk | [Office Spoke Switch](#office-spoke-switch)   | 2           | Distribution         |
| 4          | Trunk | [Desktop Spoke Switch](#desktop-spoke-switch) | 2           | Distribution         |
| 5          |       |                                               |             |                      |
| 6          |       |                                               |             |                      |
| 7          |       |                                               |             |                      |
| 8          |       |                                               |             |                      |

#### Office Spoke Switch

Location: Office\
Hardware:

| Local Port | VLANs          | Connection                                      | Remote Port | Purpose                                       |
| ---------- | -------------- | ----------------------------------------------- | ----------- | --------------------------------------------- |
| 1          | 10             | Open                                            | Hotplug     | Management interface                          |
| 2          | Trunk          | [Office Hub Switch](#office-hub-switch)         | 3           | Uplink                                        |
| 3          | Untagged-to-11 | [Unmanaged Desk Switch](#unmanaged-desk-switch) | 1           | Distribution to partners Desktop Spoke Switch |
| 4          | 15             | NAS                                             | 1           | NAS interface on Management Network           |
| 5          | 10             | NAS                                             | 2           | NAS interface on Datastore Network            |
| 6          | Trunk          | PVE-EDG2-01                                     | 1           | VM Host interface on multiple networks        |
| 7          | Trunk          | PVE-EDG2-02                                     | 1           | VM Host interface on multiple networks        |
| 8          | Trunk          | PVE-EDG2-03                                     | 1           | VM Host interface on multiple networks        |
| 9          |                |                                                 |             |                                               |
| 10         |                |                                                 |             |                                               |
| 11         |                |                                                 |             |                                               |
| 12         |                |                                                 |             |                                               |
| 13         |                |                                                 |             |                                               |
| 14         |                |                                                 |             |                                               |
| 15         |                |                                                 |             |                                               |
| 16         |                |                                                 |             |                                               |

#### Desktop Spoke Switch

Location: Office - my desk\
Hardware:

| Local Port | VLANs          | Connection                              | Remote Port | Purpose                              |
| ---------- | -------------- | --------------------------------------- | ----------- | ------------------------------------ |
| 1          | 10             | Open                                    | Hotplug     | Management interface                 |
| 2          | Trunk          | [Office Hub Switch](#office-hub-switch) | 3           | Uplink                               |
| 3          | Untagged-to-11 | Desktop PC - Onboard                    | 1           | Connect to User Device LAN           |
| 4          | 10             | Desktop PC - NIC                        | 1           | Connect to Management LAN            |
| 5          | Untagged-to-11 | Desktop PC - NIC                        | 2           | Connect VM Bridge to User Device LAN |
| 6          | Trunk          | Desktop PC - NIC                        | 3           | Connect to adjustable VLAN           |
| 7          |                |                                         |             |                                      |
| 8          |                |                                         |             |                                      |
