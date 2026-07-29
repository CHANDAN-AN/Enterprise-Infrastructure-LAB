# Volume 06

# Dynamic Host Configuration Protocol (DHCP)

## Overview

This volume focuses on deploying and configuring the **Dynamic Host Configuration Protocol (DHCP)** role within the Enterprise Infrastructure Lab. DHCP provides centralized and automated IP address management for network clients, reducing administrative overhead while ensuring consistent network configuration across the environment.

The DHCP server was deployed on the existing **Windows Server 2022 Domain Controller (DC01)** and fully integrated with **Active Directory Domain Services (AD DS)** and **Domain Name System (DNS)**.

---

# Objectives

- Deploy the DHCP Server role
- Install DHCP Management Tools
- Authorize the DHCP Server in Active Directory
- Configure an IPv4 DHCP scope
- Configure DHCP scope options
- Validate DHCP service functionality
- Verify client lease assignment
- Validate dynamic DNS registration

---

# Environment

| Component | Value |
|----------|-------|
| Hypervisor | Microsoft Hyper-V |
| Firewall | Sophos Firewall |
| Domain Controller | DC01 |
| Operating System | Windows Server 2022 Datacenter |
| Active Directory Domain | CORP.AC-LAB.TOP |
| DNS Server | DC01 |
| DHCP Server | DC01 |
| Network | 10.10.10.0/24 |
| Gateway | 10.10.10.1 |

---

# Network Design

Current network architecture:

```
Internet
    │
Sophos Firewall
10.10.10.1
    │
──────────────────────────────
Enterprise LAN
10.10.10.0/24
──────────────────────────────
        │
        ├── DC01
        │     Active Directory
        │     DNS
        │     DHCP
        │
        ├── Ubuntu Server
        │
        ├── Test Client
        │
        └── Future Infrastructure
```

---

# DHCP Scope Configuration

| Setting | Value |
|---------|-------|
| Scope Name | CORP LAN Scope |
| Network | 10.10.10.0/24 |
| Scope Range | 10.10.10.100 - 10.10.10.200 |
| Subnet Mask | 255.255.255.0 |
| Lease Duration | 8 Days |
| Gateway | 10.10.10.1 |
| DNS Server | 10.10.10.20 |
| DNS Domain | corp.ac-lab.top |

---

# Address Allocation Strategy

Infrastructure devices use **static IP addresses**, while client systems obtain addresses dynamically from DHCP.

### Static Devices

| Device | Address |
|---------|----------|
| Sophos Firewall | 10.10.10.1 |
| DC01 | 10.10.10.20 |
| Ubuntu Server | Static |

### DHCP Pool

```
10.10.10.100
        │
        ▼
10.10.10.200
```

---

# DHCP Options Configured

## Option 003

Default Gateway

```
10.10.10.1
```

---

## Option 006

DNS Server

```
10.10.10.20
```

---

## Option 015

DNS Domain Name

```
corp.ac-lab.top
```

---

# Active Directory Authorization

The DHCP server was successfully authorized within Active Directory to prevent unauthorized (rogue) DHCP servers from servicing clients on the network.

Validation:

```
Get-DhcpServerInDC
```

Result:

```
IPAddress
10.10.10.20

DNS Name
dc01.corp.ac-lab.top
```

---

# Validation

The following validation checks were successfully completed.

## DHCP Service

- DHCP role installed
- DHCP service running
- Scope active
- Server authorized

Validation commands:

```powershell
Get-Service DHCPServer

Get-DhcpServerInDC

Get-DhcpServerv4Scope
```

---

## Client Validation

A test client successfully obtained an IP address automatically from the configured DHCP scope.

Verified:

- IP Address assigned
- Correct subnet mask
- Default gateway received
- DNS server received
- DNS suffix applied

---

## DNS Validation

Dynamic DNS registration was successfully validated.

Clients registered correctly within the Active Directory-integrated DNS zone.

---

# Lessons Learned

During this implementation:

- Successfully deployed Microsoft's DHCP Server role.
- Integrated DHCP with Active Directory.
- Configured a production-style DHCP scope.
- Configured DHCP options for gateway, DNS server, and DNS suffix.
- Validated automatic IP assignment.
- Confirmed dynamic DNS functionality.
- Reinforced enterprise best practices for centralized IP address management.

---

# Future Enhancements

Future volumes will expand DHCP functionality to support:

- Multiple VLANs
- Multiple DHCP scopes
- DHCP Relay (IP Helper)
- DHCP Reservations
- DHCP Policies
- DHCP Failover
- PXE Boot Support

---

# Screenshots

> Insert implementation screenshots here.

Examples:

- DHCP Role Installed
- DHCP Console
- IPv4 Scope
- Scope Options
- Active Directory Authorization
- Test Client IP Configuration
- DNS Registration
- DHCP Lease

---

# Implementation Status

| Task | Status |
|------|--------|
| Review DHCP Design | ✅ |
| Install DHCP Server Role | ✅ |
| Install DHCP Management Tools | ✅ |
| Authorize DHCP Server | ✅ |
| Create IPv4 Scope | ✅ |
| Configure Address Pool | ✅ |
| Configure Subnet Mask | ✅ |
| Configure Exclusion Range | ✅ |
| Configure Lease Duration | ✅ |
| Configure Option 003 | ✅ |
| Configure Option 006 | ✅ |
| Configure Option 015 | ✅ |
| Activate Scope | ✅ |
| Validate DHCP Service | ✅ |
| Validate Client Lease | ✅ |
| Validate DNS Registration | ✅ |
| Documentation Complete | ✅ |

---

# Conclusion

The Enterprise Infrastructure Lab now includes a fully operational Microsoft DHCP deployment integrated with Active Directory and DNS. Clients are able to automatically obtain network configuration while maintaining centralized management, scalability, and adherence to enterprise networking best practices.

This implementation establishes the foundation for future network segmentation, VLAN deployment, DHCP relay, and advanced IP address management as the lab continues to evolve.