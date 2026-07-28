# Volume 12 – PowerShell Administration & Automation Foundation

## 📖 Overview

This volume establishes a standardized PowerShell administration environment for the Enterprise Infrastructure Lab.

A reusable administration toolkit was developed to simplify common Windows Server administration tasks, automate routine operations, and provide a foundation for future scripting and automation throughout the lab.

---

# 🎯 Objectives

- Configure a standardized PowerShell environment
- Build a structured administration toolkit
- Organize reusable scripts
- Validate PowerShell Remoting
- Prepare the lab for future automation

---

# 📂 Administration Toolkit

All scripts are organized under the **AdminTools** directory.

```text
AdminTools
├── ActiveDirectory
├── Network
├── System
├── Reports
├── Modules
├── Logs
├── Templates
└── Archive
```

---

# ⚙ Active Directory

| Script | Purpose |
|---------|---------|
| [Get-ADUsers.ps1](./AdminTools/ActiveDirectory/Users/Get-ADUsers.ps1) | Lists Active Directory users. |
| [Get-LockedUsers.ps1](./AdminTools/ActiveDirectory/Users/Get-LockedUsers.ps1) | Displays locked user accounts. |
| [Unlock-ADUser.ps1](./AdminTools/ActiveDirectory/Users/Unlock-ADUser.ps1) | Unlocks Active Directory user accounts. |
| [Get-ADComputers.ps1](./AdminTools/ActiveDirectory/Computers/Get-ADComputers.ps1) | Lists domain-joined computers. |
| [Get-ADGroups.ps1](./AdminTools/ActiveDirectory/Groups/Get-ADGroups.ps1) | Lists Active Directory security groups. |

---

# 🌐 Networking

| Script | Purpose |
|---------|---------|
| [Test-DomainController.ps1](./AdminTools/Network/Connectivity/Test-DomainController.ps1) | Verifies Domain Controller connectivity. |
| [Resolve-DNSRecord.ps1](./AdminTools/Network/DNS/Resolve-DNSRecord.ps1) | Resolves DNS records. |
| [Get-DHCPScope.ps1](./AdminTools/Network/DHCP/Get-DHCPScope.ps1) | Displays DHCP scope information. |

---

# 🖥 System Administration

| Script | Purpose |
|---------|---------|
| [Get-SystemInfo.ps1](./AdminTools/System/Inventory/Get-SystemInfo.ps1) | Displays operating system and computer information. |
| [Get-DiskUsage.ps1](./AdminTools/System/Health/Get-DiskUsage.ps1) | Reports local disk usage. |
| [Get-Uptime.ps1](./AdminTools/System/Health/Get-Uptime.ps1) | Displays system uptime. |
| [Invoke-HealthCheck.ps1](./AdminTools/System/Health/Invoke-HealthCheck.ps1) | Performs a basic infrastructure health check. |

---

# 📊 Reporting

| Script | Purpose |
|---------|---------|
| [Export-ADInventory.ps1](./AdminTools/Reports/Export-ADInventory.ps1) | Exports Active Directory user information to a CSV report. |

---

# 🤖 Automation

| Script | Purpose |
|---------|---------|
| [Run-AllChecks.ps1](./AdminTools/Run-AllChecks.ps1) | Executes multiple administration scripts from a single entry point. |

---

# ✅ Validation

The PowerShell environment was successfully validated by confirming:

- PowerShell execution policy
- Required RSAT modules
- Active Directory administration
- DNS administration
- DHCP administration
- PowerShell Remoting (WinRM)
- Remote command execution
- Infrastructure health checks
- Automation workflow

---

# 🛠 Technologies Used

- Windows PowerShell 5.1
- Active Directory PowerShell Module
- Group Policy PowerShell Module
- DNS Server Module
- DHCP Server Module
- PowerShell Remoting (WinRM)
- Windows Server 2022
- Windows 10 Enterprise

---

# 🎉 Outcome

This volume delivers a reusable PowerShell administration toolkit that supports common infrastructure management tasks, health monitoring, reporting, and automation. The toolkit serves as the scripting foundation for future volumes of the Enterprise Infrastructure Lab.