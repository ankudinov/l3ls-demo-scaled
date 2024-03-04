# AVD_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| AVD_FABRIC | l3leaf | L01 | 192.168.0.101/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L02 | 192.168.0.102/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l2leaf | L2L01 | 192.168.0.201/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l2leaf | L2L20 | 192.168.0.220/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L03 | 192.168.0.103/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L04 | 192.168.0.104/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L05 | 192.168.0.105/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L06 | 192.168.0.106/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L07 | 192.168.0.107/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L08 | 192.168.0.108/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L09 | 192.168.0.109/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L10 | 192.168.0.110/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L11 | 192.168.0.111/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L12 | 192.168.0.112/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L13 | 192.168.0.113/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L14 | 192.168.0.114/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L15 | 192.168.0.115/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L16 | 192.168.0.116/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L17 | 192.168.0.117/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L18 | 192.168.0.118/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L19 | 192.168.0.119/24 | cEOS | Provisioned | - |
| AVD_FABRIC | l3leaf | L20 | 192.168.0.120/24 | cEOS | Provisioned | - |
| AVD_FABRIC | spine | S01 | 192.168.0.11/24 | cEOS | Provisioned | - |
| AVD_FABRIC | spine | S02 | 192.168.0.12/24 | cEOS | Provisioned | - |
| AVD_FABRIC | spine | S03 | 192.168.0.13/24 | cEOS | Provisioned | - |
| AVD_FABRIC | spine | S04 | 192.168.0.14/24 | cEOS | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | L01 | Ethernet11 | l2leaf | L2L01 | Ethernet11 |
| l3leaf | L01 | Ethernet21 | spine | S01 | Ethernet1 |
| l3leaf | L01 | Ethernet22 | spine | S02 | Ethernet1 |
| l3leaf | L01 | Ethernet23 | spine | S03 | Ethernet1 |
| l3leaf | L01 | Ethernet24 | spine | S04 | Ethernet1 |
| l3leaf | L01 | Ethernet31 | mlag_peer | L02 | Ethernet31 |
| l3leaf | L01 | Ethernet32 | mlag_peer | L02 | Ethernet32 |
| l3leaf | L02 | Ethernet11 | l2leaf | L2L01 | Ethernet12 |
| l3leaf | L02 | Ethernet21 | spine | S01 | Ethernet2 |
| l3leaf | L02 | Ethernet22 | spine | S02 | Ethernet2 |
| l3leaf | L02 | Ethernet23 | spine | S03 | Ethernet2 |
| l3leaf | L02 | Ethernet24 | spine | S04 | Ethernet2 |
| l2leaf | L2L20 | Ethernet11 | l3leaf | L19 | Ethernet12 |
| l2leaf | L2L20 | Ethernet12 | l3leaf | L20 | Ethernet12 |
| l3leaf | L03 | Ethernet21 | spine | S01 | Ethernet3 |
| l3leaf | L03 | Ethernet22 | spine | S02 | Ethernet3 |
| l3leaf | L03 | Ethernet23 | spine | S03 | Ethernet3 |
| l3leaf | L03 | Ethernet24 | spine | S04 | Ethernet3 |
| l3leaf | L03 | Ethernet31 | mlag_peer | L04 | Ethernet31 |
| l3leaf | L03 | Ethernet32 | mlag_peer | L04 | Ethernet32 |
| l3leaf | L04 | Ethernet21 | spine | S01 | Ethernet4 |
| l3leaf | L04 | Ethernet22 | spine | S02 | Ethernet4 |
| l3leaf | L04 | Ethernet23 | spine | S03 | Ethernet4 |
| l3leaf | L04 | Ethernet24 | spine | S04 | Ethernet4 |
| l3leaf | L05 | Ethernet21 | spine | S01 | Ethernet5 |
| l3leaf | L05 | Ethernet22 | spine | S02 | Ethernet5 |
| l3leaf | L05 | Ethernet23 | spine | S03 | Ethernet5 |
| l3leaf | L05 | Ethernet24 | spine | S04 | Ethernet5 |
| l3leaf | L05 | Ethernet31 | mlag_peer | L06 | Ethernet31 |
| l3leaf | L05 | Ethernet32 | mlag_peer | L06 | Ethernet32 |
| l3leaf | L06 | Ethernet21 | spine | S01 | Ethernet6 |
| l3leaf | L06 | Ethernet22 | spine | S02 | Ethernet6 |
| l3leaf | L06 | Ethernet23 | spine | S03 | Ethernet6 |
| l3leaf | L06 | Ethernet24 | spine | S04 | Ethernet6 |
| l3leaf | L07 | Ethernet21 | spine | S01 | Ethernet7 |
| l3leaf | L07 | Ethernet22 | spine | S02 | Ethernet7 |
| l3leaf | L07 | Ethernet23 | spine | S03 | Ethernet7 |
| l3leaf | L07 | Ethernet24 | spine | S04 | Ethernet7 |
| l3leaf | L07 | Ethernet31 | mlag_peer | L08 | Ethernet31 |
| l3leaf | L07 | Ethernet32 | mlag_peer | L08 | Ethernet32 |
| l3leaf | L08 | Ethernet21 | spine | S01 | Ethernet8 |
| l3leaf | L08 | Ethernet22 | spine | S02 | Ethernet8 |
| l3leaf | L08 | Ethernet23 | spine | S03 | Ethernet8 |
| l3leaf | L08 | Ethernet24 | spine | S04 | Ethernet8 |
| l3leaf | L09 | Ethernet21 | spine | S01 | Ethernet9 |
| l3leaf | L09 | Ethernet22 | spine | S02 | Ethernet9 |
| l3leaf | L09 | Ethernet23 | spine | S03 | Ethernet9 |
| l3leaf | L09 | Ethernet24 | spine | S04 | Ethernet9 |
| l3leaf | L09 | Ethernet31 | mlag_peer | L10 | Ethernet31 |
| l3leaf | L09 | Ethernet32 | mlag_peer | L10 | Ethernet32 |
| l3leaf | L10 | Ethernet21 | spine | S01 | Ethernet10 |
| l3leaf | L10 | Ethernet22 | spine | S02 | Ethernet10 |
| l3leaf | L10 | Ethernet23 | spine | S03 | Ethernet10 |
| l3leaf | L10 | Ethernet24 | spine | S04 | Ethernet10 |
| l3leaf | L11 | Ethernet21 | spine | S01 | Ethernet11 |
| l3leaf | L11 | Ethernet22 | spine | S02 | Ethernet11 |
| l3leaf | L11 | Ethernet23 | spine | S03 | Ethernet11 |
| l3leaf | L11 | Ethernet24 | spine | S04 | Ethernet11 |
| l3leaf | L11 | Ethernet31 | mlag_peer | L12 | Ethernet31 |
| l3leaf | L11 | Ethernet32 | mlag_peer | L12 | Ethernet32 |
| l3leaf | L12 | Ethernet21 | spine | S01 | Ethernet12 |
| l3leaf | L12 | Ethernet22 | spine | S02 | Ethernet12 |
| l3leaf | L12 | Ethernet23 | spine | S03 | Ethernet12 |
| l3leaf | L12 | Ethernet24 | spine | S04 | Ethernet12 |
| l3leaf | L13 | Ethernet21 | spine | S01 | Ethernet13 |
| l3leaf | L13 | Ethernet22 | spine | S02 | Ethernet13 |
| l3leaf | L13 | Ethernet23 | spine | S03 | Ethernet13 |
| l3leaf | L13 | Ethernet24 | spine | S04 | Ethernet13 |
| l3leaf | L13 | Ethernet31 | mlag_peer | L14 | Ethernet31 |
| l3leaf | L13 | Ethernet32 | mlag_peer | L14 | Ethernet32 |
| l3leaf | L14 | Ethernet21 | spine | S01 | Ethernet14 |
| l3leaf | L14 | Ethernet22 | spine | S02 | Ethernet14 |
| l3leaf | L14 | Ethernet23 | spine | S03 | Ethernet14 |
| l3leaf | L14 | Ethernet24 | spine | S04 | Ethernet14 |
| l3leaf | L15 | Ethernet21 | spine | S01 | Ethernet15 |
| l3leaf | L15 | Ethernet22 | spine | S02 | Ethernet15 |
| l3leaf | L15 | Ethernet23 | spine | S03 | Ethernet15 |
| l3leaf | L15 | Ethernet24 | spine | S04 | Ethernet15 |
| l3leaf | L15 | Ethernet31 | mlag_peer | L16 | Ethernet31 |
| l3leaf | L15 | Ethernet32 | mlag_peer | L16 | Ethernet32 |
| l3leaf | L16 | Ethernet21 | spine | S01 | Ethernet16 |
| l3leaf | L16 | Ethernet22 | spine | S02 | Ethernet16 |
| l3leaf | L16 | Ethernet23 | spine | S03 | Ethernet16 |
| l3leaf | L16 | Ethernet24 | spine | S04 | Ethernet16 |
| l3leaf | L17 | Ethernet21 | spine | S01 | Ethernet17 |
| l3leaf | L17 | Ethernet22 | spine | S02 | Ethernet17 |
| l3leaf | L17 | Ethernet23 | spine | S03 | Ethernet17 |
| l3leaf | L17 | Ethernet24 | spine | S04 | Ethernet17 |
| l3leaf | L17 | Ethernet31 | mlag_peer | L18 | Ethernet31 |
| l3leaf | L17 | Ethernet32 | mlag_peer | L18 | Ethernet32 |
| l3leaf | L18 | Ethernet21 | spine | S01 | Ethernet18 |
| l3leaf | L18 | Ethernet22 | spine | S02 | Ethernet18 |
| l3leaf | L18 | Ethernet23 | spine | S03 | Ethernet18 |
| l3leaf | L18 | Ethernet24 | spine | S04 | Ethernet18 |
| l3leaf | L19 | Ethernet21 | spine | S01 | Ethernet19 |
| l3leaf | L19 | Ethernet22 | spine | S02 | Ethernet19 |
| l3leaf | L19 | Ethernet23 | spine | S03 | Ethernet19 |
| l3leaf | L19 | Ethernet24 | spine | S04 | Ethernet19 |
| l3leaf | L19 | Ethernet31 | mlag_peer | L20 | Ethernet31 |
| l3leaf | L19 | Ethernet32 | mlag_peer | L20 | Ethernet32 |
| l3leaf | L20 | Ethernet21 | spine | S01 | Ethernet20 |
| l3leaf | L20 | Ethernet22 | spine | S02 | Ethernet20 |
| l3leaf | L20 | Ethernet23 | spine | S03 | Ethernet20 |
| l3leaf | L20 | Ethernet24 | spine | S04 | Ethernet20 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.30.255.0/24 | 256 | 160 | 62.5 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| L01 | Ethernet21 | 172.30.255.1/31 | S01 | Ethernet1 | 172.30.255.0/31 |
| L01 | Ethernet22 | 172.30.255.3/31 | S02 | Ethernet1 | 172.30.255.2/31 |
| L01 | Ethernet23 | 172.30.255.5/31 | S03 | Ethernet1 | 172.30.255.4/31 |
| L01 | Ethernet24 | 172.30.255.7/31 | S04 | Ethernet1 | 172.30.255.6/31 |
| L02 | Ethernet21 | 172.30.255.9/31 | S01 | Ethernet2 | 172.30.255.8/31 |
| L02 | Ethernet22 | 172.30.255.11/31 | S02 | Ethernet2 | 172.30.255.10/31 |
| L02 | Ethernet23 | 172.30.255.13/31 | S03 | Ethernet2 | 172.30.255.12/31 |
| L02 | Ethernet24 | 172.30.255.15/31 | S04 | Ethernet2 | 172.30.255.14/31 |
| L03 | Ethernet21 | 172.30.255.17/31 | S01 | Ethernet3 | 172.30.255.16/31 |
| L03 | Ethernet22 | 172.30.255.19/31 | S02 | Ethernet3 | 172.30.255.18/31 |
| L03 | Ethernet23 | 172.30.255.21/31 | S03 | Ethernet3 | 172.30.255.20/31 |
| L03 | Ethernet24 | 172.30.255.23/31 | S04 | Ethernet3 | 172.30.255.22/31 |
| L04 | Ethernet21 | 172.30.255.25/31 | S01 | Ethernet4 | 172.30.255.24/31 |
| L04 | Ethernet22 | 172.30.255.27/31 | S02 | Ethernet4 | 172.30.255.26/31 |
| L04 | Ethernet23 | 172.30.255.29/31 | S03 | Ethernet4 | 172.30.255.28/31 |
| L04 | Ethernet24 | 172.30.255.31/31 | S04 | Ethernet4 | 172.30.255.30/31 |
| L05 | Ethernet21 | 172.30.255.33/31 | S01 | Ethernet5 | 172.30.255.32/31 |
| L05 | Ethernet22 | 172.30.255.35/31 | S02 | Ethernet5 | 172.30.255.34/31 |
| L05 | Ethernet23 | 172.30.255.37/31 | S03 | Ethernet5 | 172.30.255.36/31 |
| L05 | Ethernet24 | 172.30.255.39/31 | S04 | Ethernet5 | 172.30.255.38/31 |
| L06 | Ethernet21 | 172.30.255.41/31 | S01 | Ethernet6 | 172.30.255.40/31 |
| L06 | Ethernet22 | 172.30.255.43/31 | S02 | Ethernet6 | 172.30.255.42/31 |
| L06 | Ethernet23 | 172.30.255.45/31 | S03 | Ethernet6 | 172.30.255.44/31 |
| L06 | Ethernet24 | 172.30.255.47/31 | S04 | Ethernet6 | 172.30.255.46/31 |
| L07 | Ethernet21 | 172.30.255.49/31 | S01 | Ethernet7 | 172.30.255.48/31 |
| L07 | Ethernet22 | 172.30.255.51/31 | S02 | Ethernet7 | 172.30.255.50/31 |
| L07 | Ethernet23 | 172.30.255.53/31 | S03 | Ethernet7 | 172.30.255.52/31 |
| L07 | Ethernet24 | 172.30.255.55/31 | S04 | Ethernet7 | 172.30.255.54/31 |
| L08 | Ethernet21 | 172.30.255.57/31 | S01 | Ethernet8 | 172.30.255.56/31 |
| L08 | Ethernet22 | 172.30.255.59/31 | S02 | Ethernet8 | 172.30.255.58/31 |
| L08 | Ethernet23 | 172.30.255.61/31 | S03 | Ethernet8 | 172.30.255.60/31 |
| L08 | Ethernet24 | 172.30.255.63/31 | S04 | Ethernet8 | 172.30.255.62/31 |
| L09 | Ethernet21 | 172.30.255.65/31 | S01 | Ethernet9 | 172.30.255.64/31 |
| L09 | Ethernet22 | 172.30.255.67/31 | S02 | Ethernet9 | 172.30.255.66/31 |
| L09 | Ethernet23 | 172.30.255.69/31 | S03 | Ethernet9 | 172.30.255.68/31 |
| L09 | Ethernet24 | 172.30.255.71/31 | S04 | Ethernet9 | 172.30.255.70/31 |
| L10 | Ethernet21 | 172.30.255.73/31 | S01 | Ethernet10 | 172.30.255.72/31 |
| L10 | Ethernet22 | 172.30.255.75/31 | S02 | Ethernet10 | 172.30.255.74/31 |
| L10 | Ethernet23 | 172.30.255.77/31 | S03 | Ethernet10 | 172.30.255.76/31 |
| L10 | Ethernet24 | 172.30.255.79/31 | S04 | Ethernet10 | 172.30.255.78/31 |
| L11 | Ethernet21 | 172.30.255.81/31 | S01 | Ethernet11 | 172.30.255.80/31 |
| L11 | Ethernet22 | 172.30.255.83/31 | S02 | Ethernet11 | 172.30.255.82/31 |
| L11 | Ethernet23 | 172.30.255.85/31 | S03 | Ethernet11 | 172.30.255.84/31 |
| L11 | Ethernet24 | 172.30.255.87/31 | S04 | Ethernet11 | 172.30.255.86/31 |
| L12 | Ethernet21 | 172.30.255.89/31 | S01 | Ethernet12 | 172.30.255.88/31 |
| L12 | Ethernet22 | 172.30.255.91/31 | S02 | Ethernet12 | 172.30.255.90/31 |
| L12 | Ethernet23 | 172.30.255.93/31 | S03 | Ethernet12 | 172.30.255.92/31 |
| L12 | Ethernet24 | 172.30.255.95/31 | S04 | Ethernet12 | 172.30.255.94/31 |
| L13 | Ethernet21 | 172.30.255.97/31 | S01 | Ethernet13 | 172.30.255.96/31 |
| L13 | Ethernet22 | 172.30.255.99/31 | S02 | Ethernet13 | 172.30.255.98/31 |
| L13 | Ethernet23 | 172.30.255.101/31 | S03 | Ethernet13 | 172.30.255.100/31 |
| L13 | Ethernet24 | 172.30.255.103/31 | S04 | Ethernet13 | 172.30.255.102/31 |
| L14 | Ethernet21 | 172.30.255.105/31 | S01 | Ethernet14 | 172.30.255.104/31 |
| L14 | Ethernet22 | 172.30.255.107/31 | S02 | Ethernet14 | 172.30.255.106/31 |
| L14 | Ethernet23 | 172.30.255.109/31 | S03 | Ethernet14 | 172.30.255.108/31 |
| L14 | Ethernet24 | 172.30.255.111/31 | S04 | Ethernet14 | 172.30.255.110/31 |
| L15 | Ethernet21 | 172.30.255.113/31 | S01 | Ethernet15 | 172.30.255.112/31 |
| L15 | Ethernet22 | 172.30.255.115/31 | S02 | Ethernet15 | 172.30.255.114/31 |
| L15 | Ethernet23 | 172.30.255.117/31 | S03 | Ethernet15 | 172.30.255.116/31 |
| L15 | Ethernet24 | 172.30.255.119/31 | S04 | Ethernet15 | 172.30.255.118/31 |
| L16 | Ethernet21 | 172.30.255.121/31 | S01 | Ethernet16 | 172.30.255.120/31 |
| L16 | Ethernet22 | 172.30.255.123/31 | S02 | Ethernet16 | 172.30.255.122/31 |
| L16 | Ethernet23 | 172.30.255.125/31 | S03 | Ethernet16 | 172.30.255.124/31 |
| L16 | Ethernet24 | 172.30.255.127/31 | S04 | Ethernet16 | 172.30.255.126/31 |
| L17 | Ethernet21 | 172.30.255.129/31 | S01 | Ethernet17 | 172.30.255.128/31 |
| L17 | Ethernet22 | 172.30.255.131/31 | S02 | Ethernet17 | 172.30.255.130/31 |
| L17 | Ethernet23 | 172.30.255.133/31 | S03 | Ethernet17 | 172.30.255.132/31 |
| L17 | Ethernet24 | 172.30.255.135/31 | S04 | Ethernet17 | 172.30.255.134/31 |
| L18 | Ethernet21 | 172.30.255.137/31 | S01 | Ethernet18 | 172.30.255.136/31 |
| L18 | Ethernet22 | 172.30.255.139/31 | S02 | Ethernet18 | 172.30.255.138/31 |
| L18 | Ethernet23 | 172.30.255.141/31 | S03 | Ethernet18 | 172.30.255.140/31 |
| L18 | Ethernet24 | 172.30.255.143/31 | S04 | Ethernet18 | 172.30.255.142/31 |
| L19 | Ethernet21 | 172.30.255.145/31 | S01 | Ethernet19 | 172.30.255.144/31 |
| L19 | Ethernet22 | 172.30.255.147/31 | S02 | Ethernet19 | 172.30.255.146/31 |
| L19 | Ethernet23 | 172.30.255.149/31 | S03 | Ethernet19 | 172.30.255.148/31 |
| L19 | Ethernet24 | 172.30.255.151/31 | S04 | Ethernet19 | 172.30.255.150/31 |
| L20 | Ethernet21 | 172.30.255.153/31 | S01 | Ethernet20 | 172.30.255.152/31 |
| L20 | Ethernet22 | 172.30.255.155/31 | S02 | Ethernet20 | 172.30.255.154/31 |
| L20 | Ethernet23 | 172.30.255.157/31 | S03 | Ethernet20 | 172.30.255.156/31 |
| L20 | Ethernet24 | 172.30.255.159/31 | S04 | Ethernet20 | 172.30.255.158/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.0.254.0/24 | 256 | 20 | 7.82 % |
| 192.0.255.0/24 | 256 | 4 | 1.57 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| AVD_FABRIC | L01 | 192.0.254.3/32 |
| AVD_FABRIC | L02 | 192.0.254.4/32 |
| AVD_FABRIC | L03 | 192.0.254.5/32 |
| AVD_FABRIC | L04 | 192.0.254.6/32 |
| AVD_FABRIC | L05 | 192.0.254.7/32 |
| AVD_FABRIC | L06 | 192.0.254.8/32 |
| AVD_FABRIC | L07 | 192.0.254.9/32 |
| AVD_FABRIC | L08 | 192.0.254.10/32 |
| AVD_FABRIC | L09 | 192.0.254.11/32 |
| AVD_FABRIC | L10 | 192.0.254.12/32 |
| AVD_FABRIC | L11 | 192.0.254.13/32 |
| AVD_FABRIC | L12 | 192.0.254.14/32 |
| AVD_FABRIC | L13 | 192.0.254.15/32 |
| AVD_FABRIC | L14 | 192.0.254.16/32 |
| AVD_FABRIC | L15 | 192.0.254.17/32 |
| AVD_FABRIC | L16 | 192.0.254.18/32 |
| AVD_FABRIC | L17 | 192.0.254.19/32 |
| AVD_FABRIC | L18 | 192.0.254.20/32 |
| AVD_FABRIC | L19 | 192.0.254.21/32 |
| AVD_FABRIC | L20 | 192.0.254.22/32 |
| AVD_FABRIC | S01 | 192.0.255.1/32 |
| AVD_FABRIC | S02 | 192.0.255.2/32 |
| AVD_FABRIC | S03 | 192.0.255.3/32 |
| AVD_FABRIC | S04 | 192.0.255.4/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.0.253.0/24 | 256 | 20 | 7.82 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| AVD_FABRIC | L01 | 192.0.253.3/32 |
| AVD_FABRIC | L02 | 192.0.253.3/32 |
| AVD_FABRIC | L03 | 192.0.253.5/32 |
| AVD_FABRIC | L04 | 192.0.253.5/32 |
| AVD_FABRIC | L05 | 192.0.253.7/32 |
| AVD_FABRIC | L06 | 192.0.253.7/32 |
| AVD_FABRIC | L07 | 192.0.253.9/32 |
| AVD_FABRIC | L08 | 192.0.253.9/32 |
| AVD_FABRIC | L09 | 192.0.253.11/32 |
| AVD_FABRIC | L10 | 192.0.253.11/32 |
| AVD_FABRIC | L11 | 192.0.253.13/32 |
| AVD_FABRIC | L12 | 192.0.253.13/32 |
| AVD_FABRIC | L13 | 192.0.253.15/32 |
| AVD_FABRIC | L14 | 192.0.253.15/32 |
| AVD_FABRIC | L15 | 192.0.253.17/32 |
| AVD_FABRIC | L16 | 192.0.253.17/32 |
| AVD_FABRIC | L17 | 192.0.253.19/32 |
| AVD_FABRIC | L18 | 192.0.253.19/32 |
| AVD_FABRIC | L19 | 192.0.253.21/32 |
| AVD_FABRIC | L20 | 192.0.253.21/32 |
