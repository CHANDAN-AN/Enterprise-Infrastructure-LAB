# Volume 07

# Windows 11 Enterprise Client

## Overview

This volume covers the deployment and initial configuration of a Windows 11 Enterprise virtual machine that will serve as the enterprise workstation within the home lab environment.

The objective is to prepare a clean Windows 11 Enterprise client before it is joined to the Active Directory domain in the next phase.

---

## Objectives

- Deploy Windows 11 Enterprise Evaluation
- Configure the virtual machine in Hyper-V
- Install the operating system
- Configure initial Windows settings
- Configure networking
- Verify network connectivity
- Prepare the workstation for domain integration

---

## Lab Environment

| Component | Value |
|-----------|-------|
| Hypervisor | Microsoft Hyper-V |
| Guest Operating System | Windows 11 Enterprise Evaluation |
| Computer Name | CLIENT-01 |
| Generation | Generation 2 |
| Firmware | UEFI |
| Secure Boot | Enabled |
| Network | Enterprise Virtual Switch |
| Domain | Not Joined (This volume only) |

---

## Virtual Machine Configuration

| Setting | Value |
|---------|-------|
| Virtual Machine Name | CLIENT-01 |
| Startup Memory | 4 GB *(adjust based on host resources)* |
| Dynamic Memory | Enabled |
| Virtual Processors | 2 *(or more depending on hardware)* |
| Virtual Hard Disk | Dynamically Expanding VHDX |
| Network Adapter | Enterprise Virtual Switch |

---

## Windows Installation

Completed the installation of:

- Windows 11 Enterprise Evaluation
- Latest available installation media
- Standard desktop experience
- Local Administrator account configured

---

## Initial Configuration

Completed the following post-installation tasks:

- Configured display and regional settings
- Verified Windows installation
- Configured network adapter
- Verified IP address assignment
- Verified gateway configuration
- Verified DNS configuration
- Installed Hyper-V Integration Services (included with Windows 11)
- Installed all available Windows updates (where applicable)

---

## Network Verification

Validated basic network connectivity using PowerShell.

Example commands:

```powershell
ipconfig /all

ping <Default Gateway>

ping <Domain Controller IP>

nslookup
```

---

## Computer Naming

Assigned the enterprise workstation name:

```
CLIENT-01
```

This naming convention will be used consistently throughout the lab.

---

## Validation

Verified:

- Windows boots successfully
- Network adapter operational
- Internet connectivity (if applicable)
- Communication with internal network
- Communication with Domain Controller by IP
- DNS resolution functioning correctly

---

## Skills Demonstrated

- Hyper-V virtual machine deployment
- Windows 11 Enterprise installation
- Virtual hardware configuration
- Enterprise workstation deployment
- Network configuration
- Windows administration
- PowerShell validation
- Initial operating system hardening
- Enterprise naming conventions

---

## Screenshots

Recommended screenshots for this volume:

- Hyper-V Manager showing CLIENT-01
- Windows 11 desktop after installation
- System Information (About)
- Computer Name
- IP Configuration (`ipconfig /all`)
- Successful ping to the Domain Controller

---

## Outcome

A fully functional Windows 11 Enterprise client has been deployed and configured.

The workstation is now ready to be joined to the Active Directory domain in the next volume.

---

## Next Volume

**Volume 08 - Join Client to Domain**

Topics include:

- Domain Join
- DNS Validation
- Active Directory Authentication
- Domain Login
- Workstation Object Verification
- Organizational Unit Placement