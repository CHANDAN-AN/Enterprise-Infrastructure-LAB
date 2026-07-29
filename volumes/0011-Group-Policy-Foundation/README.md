# Volume 11

# Group Policy Foundation

## Overview

This volume establishes the foundational Group Policy (GPO) architecture for the Enterprise Infrastructure Lab. It introduces centralized configuration management using Microsoft Group Policy to enforce security baselines, workstation configuration, desktop standards and administrative restrictions across the Active Directory environment.

The objective of this implementation is to demonstrate how enterprise administrators centrally manage Windows devices and user environments without requiring manual configuration on individual computers.

All Group Policies were created following Microsoft Active Directory best practices by separating **Domain Policies**, **Computer Configuration Policies**, and **User Configuration Policies**.

![Some Group Policies](https://github.com/CHANDAN-AN/Enterprise-Infrastructure-LAB/blob/main/volumes/11-Group-Policy-Foundation/screenshots/21.png)

---

# Objectives

- Understand Group Policy architecture
- Create and organize multiple Group Policy Objects (GPOs)
- Apply policies at the correct Active Directory scope
- Configure enterprise password and account lockout policies
- Configure workstation security baselines
- Configure Windows Update management
- Restrict Control Panel access
- Implement enterprise desktop branding
- Validate policy processing
- Verify Resultant Set of Policy (RSoP)

---

# Environment

| Component | Value |
|-----------|------|
| Domain | CORP.AC-LAB.TOP |
| Domain Controller | DC01 |
| Client Computer | CLIENT-01 |
| Operating System | Windows Server 2022 / Windows 11 Enterprise |
| Management Tool | Group Policy Management Console (GPMC) |

---

# Group Policy Design

The environment was designed using multiple independent Group Policy Objects instead of placing every configuration inside the Default Domain Policy.

This approach follows enterprise best practices by allowing each policy to have a dedicated purpose, making administration, troubleshooting and future expansion significantly easier.

The policies were separated into three categories:

- Domain Policies
- Computer Policies
- User Policies

---

# Implemented Group Policy Objects

## Domain Policies

### Password Policy

Linked at:

```
CORP.AC-LAB.TOP
```

Purpose:

Enforces organization-wide password requirements.

Configuration includes:

- Password complexity
- Password history
- Minimum password length
- Maximum password age
- Minimum password age

Expected Result

- Every domain account must comply with the configured password policy.
- Password settings are enforced by Active Directory.

Status

✅ Implemented

✅ Verified

---

### Account Lockout Policy

Linked at:

```
CORP.AC-LAB.TOP
```

Purpose

Protects domain accounts against brute-force password attacks.

Configuration includes:

- Account lockout threshold
- Lockout duration
- Reset lockout counter

Expected Result

Repeated failed logon attempts automatically lock the account until the configured lockout period expires.

Status

✅ Implemented

✅ Verified

---

# Workstation Policies

Linked to:

```
Workstations OU
```

---

## Workstation Baseline

Purpose

Provides baseline workstation configuration for every Windows client.

Configuration includes:

- Computer Configuration settings
- Loopback Processing (Merge Mode)

### Loopback Processing

Configured:

```
Computer Configuration
→ Policies
→ Administrative Templates
→ System
→ Group Policy
→ Configure user Group Policy loopback processing mode
```

Mode

```
Merge
```

Purpose

Ensures User Configuration policies assigned to the workstation OU apply regardless of which user signs into the computer.

This allows workstation-specific settings to override user-specific settings when required.

Enterprise Use Cases

- Shared workstations
- Kiosks
- Reception computers
- Training rooms
- Enterprise desktop branding

Status

✅ Implemented

✅ Verified

---

## Windows Update Policy

Linked to:

```
Workstations OU
```

Purpose

Centralizes Windows Update configuration.

Expected Result

Every workstation receives a consistent Windows Update configuration managed through Group Policy.

Status

✅ Implemented

✅ Verified

---

## Remote Desktop Access

Linked to:

```
Workstations OU
```

Purpose

Automatically grants Remote Desktop access to authorized Active Directory security groups.

Configuration

```
Computer Configuration
→ Preferences
→ Control Panel Settings
→ Local Users and Groups
```

Configured Local Group

```
Remote Desktop Users
```

Added Group

```
CORP\GG_OPS_Users
```

Expected Result

Members of GG_OPS_Users automatically receive permission to log onto workstations using Remote Desktop.

Status

✅ Implemented

✅ Verified

---

## Control Panel Restrictions

Linked to:

```
Workstations OU
```

Purpose

Restricts user access to Control Panel settings to enforce workstation standards.

Expected Result

Users cannot access restricted Control Panel features.

Status

✅ Implemented

✅ Verified

---

## Wallpaper For Workstations (Non-Servers)

Linked to:

```
Workstations OU
```

Purpose

Applies the corporate workstation wallpaper to every workstation regardless of which user signs in.

Configuration

```
User Configuration
→ Policies
→ Administrative Templates
→ Desktop
→ Desktop Wallpaper
```

Wallpaper Location

```
\\DC01\NETLOGON\wallpaper.png
```

Wallpaper Style

```
Fit
```

Expected Result

Any user logging into a workstation receives the corporate workstation wallpaper.

Implementation Notes

Initially the wallpaper displayed as a black background.

Root Cause

The configured file path referenced:

```
wallpaper.jpg
```

while the NETLOGON share contained:

```
wallpaper.png
```

After correcting the file reference, the wallpaper successfully applied.

Status

✅ Implemented

✅ Verified

---

# Server Policies

Linked to:

```
Servers OU
```

---

## Wallpaper For Servers

Purpose

Provides a dedicated desktop background for Windows Servers.

This allows administrators to instantly distinguish server consoles from workstation desktops.

Expected Result

Any administrator signing into a server receives the server-specific wallpaper.

Status

✅ Implemented

⬜ Functional testing pending (additional server roles will be added in later volumes)

---

# Group Policy Linking Strategy

| Policy | Linked To |
|---------|-----------|
| Password Policy | Domain |
| Account Lockout Policy | Domain |
| Workstation Baseline | Workstations OU |
| Windows Update | Workstations OU |
| Remote Desktop Access | Workstations OU |
| Control Panel Restrictions | Workstations OU |
| Wallpaper For Workstations (Non-Servers) | Workstations OU |
| Wallpaper For Servers | Servers OU |

---

# Policy Validation

The following validation methods were performed.

## gpupdate

```
gpupdate /force
```

Successfully refreshed both Computer and User policies.

---

## Group Policy Results

```
gpresult /r
```

Used throughout implementation to validate:

- Applied GPOs
- Filtered GPOs
- Computer Configuration
- User Configuration
- Group memberships

---

## Desktop Branding Validation

Validated by:

- Logging onto CLIENT-01
- Verifying Loopback Processing
- Confirming wallpaper deployment
- Confirming workstation branding applied successfully

Status

✅ Successful

---

# Lessons Learned

This implementation demonstrates several important enterprise Group Policy concepts.

- Domain Policies should remain separate from workstation policies.
- Computer Configuration follows the computer object.
- User Configuration follows the user object unless Loopback Processing is enabled.
- Loopback Processing allows workstation-specific user settings regardless of who signs in.
- Using multiple focused GPOs is significantly easier to maintain than storing every configuration inside a single policy.
- Group Policy troubleshooting should always include `gpresult` and verification of GPO scope, inheritance and file accessibility.

---

# Screenshots

Include screenshots of:

- Group Policy Management Console
- All created GPOs
- Password Policy
- Account Lockout Policy
- Windows Update Policy
- Workstation Baseline
- Loopback Processing configuration
- Remote Desktop Access configuration
- Control Panel Restrictions
- Wallpaper For Workstations (Non-Servers)
- Wallpaper For Servers
- Workstations OU linked GPOs
- Servers OU linked GPOs
- `gpresult /r`
- CLIENT-01 showing the applied corporate wallpaper

---

# Outcome

This volume successfully established the enterprise Group Policy foundation for the lab environment.

The Active Directory domain now centrally manages password security, account protection, workstation configuration, desktop branding, Windows Update behaviour, Remote Desktop permissions and user restrictions using properly scoped and organized Group Policy Objects.

This architecture provides a scalable foundation for future enterprise infrastructure components such as file servers, application servers, software deployment, BitLocker management, certificate services, security hardening and advanced Group Policy administration.