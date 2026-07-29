# Volume 2 - Sophos Firewall Deployment

## Phase

Phase 1 - Core Infrastructure

## Status

✅ Completed
![Sophos Firewall](https://github.com/CHANDAN-AN/Enterprise-Infrastructure-LAB/blob/main/volumes/02-Sophos-Firewall-Deployment/screenshots/001%20(4).png)

---

# Objective

Deploy and configure the Sophos Firewall virtual machine to provide routing, network segmentation, and Internet connectivity for the enterprise lab environment.

---

# Environment

| Component | Details |
|----------|---------|
| VM Name | FW01 |
| Hypervisor | Hyper-V |
| Generation | Generation 1 |
| vCPU | 1 |
| Startup Memory | 4 GB |
| Dynamic Memory | Enabled |
| Virtual Disk | 40 GB VHDX |
| Storage Location | C:\VM\HardDisk Files\FW01.vhdx |

---

# Network Configuration

| Interface | Virtual Switch |
|-----------|----------------|
| WAN | Internet-WAN |
| LAN | Corp-LAN |

The firewall provides the gateway between the internal enterprise network and the external network while enforcing network separation.

---

# Implementation

The Sophos Firewall virtual machine was deployed on the Hyper-V host using a Generation 1 virtual machine.

Two virtual network adapters were configured:

- Internet-WAN
- Corp-LAN

The virtual hard disk was provisioned with 40 GB of storage, and Dynamic Memory was enabled to optimize resource utilization.

---

# Purpose

FW01 serves as the perimeter firewall for the Enterprise Infrastructure Lab.

Primary responsibilities include:

- Routing traffic between networks
- Providing Internet connectivity
- Acting as the default gateway for the internal network
- Supporting future firewall policies, NAT rules, VPN configuration, and security services

---

# Validation

The deployment was validated by confirming:

- Virtual machine boots successfully
- Both network adapters detected
- WAN and LAN interfaces operational
- Hyper-V networking functioning correctly
- VM running normally without hardware issues

---

# Lessons Learned

Deploying the firewall before the remaining infrastructure provides a controlled network boundary for all future servers and services.

This approach mirrors how enterprise environments are typically designed, where security and network segmentation are established before deploying production workloads.

---

# Screenshots

_To be added._

Suggested screenshots:

- Hyper-V VM Settings
- Network Adapter Configuration
- Sophos Console
- Interface Configuration
- Dashboard

---

# Related Volumes

- Volume 1 – Hyper-V Host Deployment
- Volume 3 – Domain Controller (DC01)
- Volume 4 – Domain Name System (DNS)
- Volume 5 – Active Directory Organizational Unit Structure
