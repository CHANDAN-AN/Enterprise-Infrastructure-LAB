# Volume 3 - Domain Controller (DC01)

## Phase

Phase 1 - Core Infrastructure

## Status

✅ Completed

---

# Objective

Deploy the first Windows Server Domain Controller (DC01) to provide centralized authentication, directory services, DNS integration, and identity management for the Enterprise Infrastructure Lab.

---

# Environment

| Component | Details |
|----------|---------|
| Server Name | DC01 |
| Operating System | Windows Server 2022 Datacenter Evaluation |
| Hypervisor | Hyper-V |
| Generation | Generation 2 |
| vCPU | 1 |
| Startup Memory | 3 GB |
| Virtual Disk | 40 GB VHDX |
| Domain | CORP.AC-LAB.TOP |
| IP Address | 10.10.10.20 |
| Default Gateway | 10.10.10.1 |

---

# Roles

DC01 serves as the primary infrastructure server for the lab.

Core responsibilities include:

- Active Directory Domain Services (AD DS)
- Domain Authentication
- User and Computer Management
- DNS Services
- Group Policy Processing
- Enterprise Identity Management

---

# Implementation

The Windows Server virtual machine was deployed on Hyper-V as a Generation 2 virtual machine.

After installation:

- Assigned a static IP address
- Promoted the server to the first Domain Controller
- Created the CORP.AC-LAB.TOP Active Directory forest
- Configured integrated DNS
- Validated domain functionality
- Prepared the environment for future enterprise services

---

# Network Configuration

| Setting | Value |
|---------|-------|
| Hostname | DC01 |
| IP Address | 10.10.10.20 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 10.10.10.1 |
| Domain | CORP.AC-LAB.TOP |

---

# Validation

The deployment was validated by confirming:

- Domain Controller operational
- Active Directory functioning correctly
- Domain successfully created
- Static IP configured
- DNS responding correctly
- Enterprise domain available for authentication

---

# Lessons Learned

Deploying Active Directory immediately after the firewall establishes the identity foundation for the entire enterprise environment.

Nearly every Microsoft enterprise service—including DNS, Group Policy, Certificate Services, file servers, and application servers—depends on a healthy Active Directory infrastructure.

---

# Screenshots

_To be added._

Suggested screenshots:

- Server Manager Dashboard
- Active Directory Users and Computers
- DNS Manager
- Server Manager Roles
- System Properties showing domain membership

---

# Related Volumes

- Volume 1 – Hyper-V Host Deployment
- Volume 2 – Sophos Firewall Deployment
- Volume 4 – DNS Configuration
- Volume 5 – Active Directory OU Structure