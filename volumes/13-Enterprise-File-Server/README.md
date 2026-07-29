# Volume 13 – Enterprise File Server

## Overview

In this volume, a dedicated Enterprise File Server was deployed to provide centralized storage services within the **CORP.AC-LAB.TOP** Active Directory environment.

The server was prepared as the foundation for future enterprise services including departmental file shares, home folders, DFS Namespaces, DFS Replication, File Server Resource Manager (FSRM), quotas, and other storage-related technologies.

No file shares or permissions were configured during this volume. The objective was to build and validate the File Server platform before deploying enterprise storage services.

---

# Objectives

- Deploy a dedicated File Server
- Join the server to the Active Directory domain
- Configure enterprise networking
- Review storage configuration
- Install the File Server role
- Validate Active Directory integration
- Verify SMB services
- Confirm production readiness

---

# Environment

| Component | Value |
|-----------|-------|
| Server Name | FS01 |
| Operating System | Windows Server 2022 |
| Domain | CORP.AC-LAB.TOP |
| Role | Enterprise File Server |
| IP Address | 10.10.10.103 |
| DNS Server | 10.10.10.20 (DC01) |
| Gateway | 10.10.10.1 |

---

# Infrastructure Planning

The File Server was designed as a dedicated member server responsible for providing centralized storage services within the domain.

Future responsibilities include:

- Departmental File Shares
- Public Shares
- Home Directories
- User Profiles
- DFS Namespace
- DFS Replication
- File Screening
- Storage Quotas
- Shadow Copies

---

# Storage Configuration

Current storage configuration:

| Disk | Purpose |
|------|---------|
| Disk 0 | Operating System |

Partition layout:

```text
Disk 0

├── EFI System Partition
├── Microsoft Reserved Partition
├── C: (SYSTEM)
└── Recovery Partition
```

Storage validation included:

- GPT partition style
- NTFS file system
- Healthy disk status
- Available storage capacity
- Volume labeling

---

# File Server Role Installation

Installed Role Services:

```text
File and Storage Services
└── File and iSCSI Services
     └── File Server
```

Management tools were installed together with the File Server role.

---

# Enterprise Validation

The following validation tests were successfully completed.

## Active Directory

- Domain membership verified
- Secure channel validated
- Domain Controller discovery successful

---

## DNS

Verified DNS registration.

```powershell
Resolve-DnsName FS01
```

Result:

- IPv4 record present
- IPv6 record present

---

## SMB Configuration

Verified SMB configuration.

```powershell
Get-SmbServerConfiguration
```

Results:

| Setting | Value |
|---------|-------|
| SMB 2 | Enabled |
| SMB 1 | Disabled |

SMB 1 remains disabled following Microsoft security best practices.

---

## Network Connectivity

Validated connectivity to the Domain Controller.

```powershell
Test-NetConnection DC01 -Port 445
```

Result:

- TCP Port 445 reachable
- SMB communication successful

---

## System Health

Validated:

- File Server service operational
- Storage healthy
- No recent System Event Log errors
- Remote administration functioning

---

# Skills Learned

During this volume the following concepts were introduced:

- Windows File Services
- File Server Role
- SMB Protocol
- Enterprise Storage Planning
- Active Directory Integration
- DNS Validation
- Remote Administration
- Server Health Validation
- Windows Server Roles and Features

---

# Best Practices

The following enterprise practices were followed throughout this deployment:

- Dedicated member server for file services
- Domain-integrated authentication
- File Server role separated from Domain Controller
- SMB 1 disabled
- DNS hosted on Domain Controller
- Validation completed before production use
- Platform prepared before configuring shares and permissions

---

# Outcome

A fully operational Enterprise File Server (**FS01**) was successfully deployed and integrated into the **CORP.AC-LAB.TOP** Active Directory environment.

The platform is now prepared for future implementation of:

- Enterprise File Shares
- NTFS Permissions
- Share Permissions
- Access-Based Enumeration (ABE)
- AGDLP Permission Model
- Drive Mapping via Group Policy
- DFS Namespace
- DFS Replication
- File Server Resource Manager (FSRM)

---

# Commands Used

```powershell
ipconfig /all

Test-ComputerSecureChannel

Resolve-DnsName DC01

Resolve-DnsName FS01

Test-WSMan localhost

nltest /dsgetdc:CORP.AC-LAB.TOP

Get-Disk

Get-Volume

Get-Partition

Get-PhysicalDisk

Set-Volume -DriveLetter C -NewFileSystemLabel "SYSTEM"

Install-WindowsFeature FS-FileServer -IncludeManagementTools

Get-WindowsFeature FS-FileServer

Get-Service LanmanServer

Get-SmbServerConfiguration

Test-NetConnection DC01 -Port 445

Get-WinEvent -LogName System -MaxEvents 20 |
Where-Object LevelDisplayName -eq "Error"
```

---

# Volume Status

| Task | Status |
|------|--------|
| Infrastructure Planning | ✅ Complete |
| Server Deployment | ✅ Complete |
| Storage Configuration | ✅ Complete |
| File Server Role Installation | ✅ Complete |
| Enterprise Integration | ✅ Complete |
| Validation | ✅ Complete |
| Documentation | ✅ Complete |

---

## Next Volume

**Volume 14 – Enterprise File Shares & Permissions**

The next volume will build on this platform by implementing:

- Enterprise folder structure
- SMB shares
- NTFS permissions
- Share permissions
- AGDLP permission model
- Access-Based Enumeration (ABE)
- Permission validation
- Enterprise storage security