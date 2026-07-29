# Volume 16 – Windows Server Update Services (WSUS)

> **Phase 2 – Enterprise Infrastructure Services**

---

# Enterprise Patch Management Infrastructure

```text
                                           Microsoft Update
                                                  │
                                           HTTPS (Internet)
                                                  │
                                         ┌─────────────────┐
                                         │    WSUS-01      │
                                         │ Windows Server  │
                                         │ 2022 Datacenter │
                                         │                 │
                                         │ • WSUS Role     │
                                         │ • WID Database  │
                                         │ • D:\WSUS Store │
                                         └────────┬────────┘
                                                  │
                       ───────────────────────────┼──────────────────────────
                                                  │
                                   Group Policy (Windows Update)
                                                  │
             ┌──────────────────────────┬─────────┴─────────┬─────────────────────────┐
             │                          │                   │                         │
      ┌───────────────┐         ┌───────────────┐   ┌───────────────┐         ┌───────────────┐
      │    DC01       │         │     FS01      │   │   CLIENT-01   │         │   ADMIN-01    │
      │ Server 2022   │         │ Server 2022   │   │ Windows 11    │         │ Windows 11    │
      └───────┬───────┘         └───────┬───────┘   └───────┬───────┘         └───────┬───────┘
              │                         │                   │                         │
              └─────────────────────────┴───────────────────┴─────────────────────────┘
                                    Reports Compliance to WSUS
```

---

# Objective

Deploy a centralized enterprise patch management platform using **Windows Server Update Services (WSUS)** to manage Microsoft updates for Windows Server and Windows client operating systems.

The implementation centralizes update synchronization, approval, deployment, and compliance reporting through Active Directory Group Policy.

---

# Environment

| Component | Configuration |
|------------|---------------|
| WSUS Server | WSUS-01 |
| Operating System | Windows Server 2022 Datacenter |
| Database | Windows Internal Database (WID) |
| Update Storage | D:\WSUS |
| Synchronization Source | Microsoft Update |
| Client Policy | Active Directory Group Policy |
| Targeting Method | Server-side targeting |
| Computer Groups | Servers / Workstations |

---

# Lab Topology

## Servers

| Server | Role |
|---------|------|
| DC01 | Domain Controller |
| WSUS-01 | Windows Server Update Services |
| FS01 | File Server |

---

## Clients

| Client | Operating System |
|---------|------------------|
| CLIENT-01 | Windows 11 Enterprise Evaluation |
| ADMIN-01 | Windows 11 Enterprise Evaluation |

---

# Design Decisions

## Database

- Windows Internal Database (WID)

Chosen because:

- Small enterprise deployment
- No SQL Server dependency
- Microsoft recommended for environments of this size

---

## Update Storage

```
D:\WSUS
```

Advantages:

- Keeps update binaries separate from the operating system volume
- Simplifies storage expansion
- Enterprise best practice

---

## Synchronization Source

```
Microsoft Update
```

Synchronization performed over HTTPS.

---

## Computer Targeting

Computer Groups:

```
Servers
Workstations
```

This allows updates to be approved independently for:

- Production servers
- User workstations

---

# Products

The environment contains only two operating system families.

Enabled:

- Windows 11
- Microsoft Server Operating System-21H2 (Windows Server 2022)

Optional:

- Microsoft Defender Antivirus

Unused products were excluded to reduce synchronization overhead.

---

# Update Classifications

Enabled:

- Critical Updates
- Security Updates

Excluded:

- Drivers
- Driver Sets
- Feature Packs
- Upgrades
- Service Packs
- Update Rollups
- Tools
- Applications

The configuration focuses on enterprise security patching while avoiding unnecessary content.

---

# Group Policy Configuration

Separate Group Policy Objects were created.

## Servers

Applied to:

```
Servers OU
```

Configured to use:

```
http://WSUS-01:8530
```

---

## Workstations

Applied to:

```
Workstations OU
```

Configured to use:

```
http://WSUS-01:8530
```

Automatic Updates configured for controlled enterprise deployment.

---

# Deployment Process

## 1. Install WSUS Role

- Windows Server Update Services
- WID Database
- Management Console

---

## 2. Post-Installation Tasks

- Configure content directory
- Initialize WSUS
- Configure synchronization source

---

## 3. Configure Products

Selected only operating systems present in the lab.

---

## 4. Configure Update Classifications

Security-focused deployment.

---

## 5. Initial Synchronization

Successfully synchronized metadata from Microsoft Update.

---

## 6. Configure Group Policy

Configured clients to obtain updates from WSUS.

---

## 7. Client Registration

Validated successful client reporting.

---

## 8. Maintenance

Performed:

- Synchronization
- Server Cleanup Wizard
- Product review
- Classification review

---

# Validation

Verified:

- WSUS Console operational
- Synchronization successful
- Client communication successful
- Group Policy applied
- Windows Update service operational
- Clients reporting to WSUS
- Computer Groups functioning correctly
- Update metadata synchronized

---

# PowerShell Validation

Example validation commands used during deployment:

```powershell
Get-WsusServer
```

```powershell
Get-Service wuauserv
```

```powershell
Get-ComputerInfo
```

```powershell
Get-HotFix
```

```powershell
gpupdate /force
```

```powershell
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
```

---

# Enterprise Patch Workflow

```text
Microsoft Update
        │
        ▼
Synchronize WSUS
        │
        ▼
Review Updates
        │
        ▼
Approve Updates
        │
        ▼
Client Detection
        │
        ▼
Download
        │
        ▼
Installation
        │
        ▼
Compliance Reporting
        │
        ▼
Monthly Maintenance
```

---

# Best Practices

- Separate Servers and Workstations into dedicated computer groups.
- Synchronize only required Microsoft products.
- Enable only necessary update classifications.
- Store update content on a dedicated data volume.
- Perform regular WSUS cleanup.
- Review approvals before deployment.
- Use Group Policy to centrally manage Windows Update configuration.

---

# Lessons Learned

- WSUS synchronizes update metadata rather than immediately deploying updates.
- Clients determine update applicability based on their operating system and installed updates.
- Product selection directly affects future synchronization scope.
- The Server Cleanup Wizard removes obsolete content but does not delete valid update metadata.
- Proper Group Policy configuration is essential for successful client registration and compliance reporting.

---

# Final Validation Checklist

| Task | Status |
|------|--------|
| WSUS Installed | ✅ |
| WID Configured | ✅ |
| Update Storage Configured | ✅ |
| Microsoft Update Synchronization | ✅ |
| Products Configured | ✅ |
| Update Classifications Configured | ✅ |
| Group Policy Configured | ✅ |
| Client Registration Successful | ✅ |
| Computer Groups Configured | ✅ |
| Synchronization Verified | ✅ |
| WSUS Cleanup Completed | ✅ |
| Enterprise Patch Management Operational | ✅ |

---

# Outcome

A fully operational enterprise Windows Server Update Services (WSUS) deployment was successfully implemented to provide centralized Microsoft update management, controlled patch deployment, and compliance reporting for Windows Server 2022 and Windows 11 systems within the Enterprise Infrastructure Lab.

---