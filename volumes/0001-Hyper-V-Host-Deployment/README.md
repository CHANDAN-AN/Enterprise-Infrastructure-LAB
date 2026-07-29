# Volume 1 - Hyper-V Host Deployment

## Phase

Phase 1 - Core Infrastructure

## Status

✅ Completed

---

# Objective

Deploy and configure the Hyper-V host that serves as the foundation for the Enterprise Infrastructure Lab. This host provides the virtualization platform required to run all virtual machines used throughout the project.

---

# Environment

| Component | Details |
|----------|---------|
| Hostname | HOMESERVER |
| Operating System | Windows Server 2022 Datacenter Evaluation |
| Hypervisor | Hyper-V |
| CPU | Intel Core i5-11500 (6 Cores / 12 Logical Processors) |
| Memory | 64 GB RAM |
| Storage | 1 TB SSD |
| Physical Network Adapters | 1 |

---

# Implementation

The Hyper-V role was installed on the physical host and configured as the virtualization platform for the enterprise lab.

The host was prepared to support multiple virtual machines while maintaining separation between management and lab networking through dedicated Hyper-V virtual switches.

This server acts as the primary virtualization host for the entire lab environment.

---

# Network Configuration

The Hyper-V host uses:

- 1 Physical Network Adapter
- 2 Hyper-V Virtual Switches

| Internal | Corp-LAN |
|----|---------|
| External | Internet-WAN |

- Dedicated networking for the lab environment
- Isolated virtual infrastructure for enterprise workloads

---

# Virtual Machines

The initial virtual machines deployed on the Hyper-V host are:

| VM | Purpose |
|----|---------|
| FW01 | Sophos Firewall |
| DC01 | Active Directory Domain Controller |

Additional virtual machines will be deployed throughout later volumes.

---

# Validation

The deployment was validated by confirming:

- Hyper-V role installed successfully
- Virtual switches created successfully
- Virtual machines powered on successfully
- Host resources allocated correctly
- Virtual networking functioning as expected

---

# Lessons Learned

Deploying the Hyper-V host establishes the foundation for every subsequent volume in the Enterprise Infrastructure Lab.

Building the environment in phases makes troubleshooting easier and provides a structured approach for expanding the infrastructure over time.

---

# Screenshots

_To be added._

Suggested screenshots:

- Hyper-V Manager
- Hyper-V Virtual Switch Manager
- Host Specifications
- Virtual Machine List
- Server Manager (Hyper-V Role)

---

# Related Volumes

- Volume 2 – Sophos Firewall Deployment
- Volume 3 – Domain Controller (DC01)
- Volume 4 – Domain Name System (DNS)
- Volume 5 – Active Directory Organizational Unit Structure