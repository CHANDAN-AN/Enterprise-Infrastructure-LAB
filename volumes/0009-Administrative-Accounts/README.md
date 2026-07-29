# Volume 09

# Administrative Accounts

## Overview

In enterprise environments, administrative tasks should never be performed using a single privileged account or the built-in **Administrator** account. Instead, organizations implement a **tiered administrative model** where privileged identities are separated based on their responsibilities.

This volume establishes a dedicated administrative account strategy for the **CORP.AC-LAB.TOP** Active Directory domain by creating role-based administrative accounts, organizing them into a dedicated Organizational Unit (OU), and assigning permissions through security groups following Microsoft's security best practices.

The objective is to demonstrate how enterprise organizations implement **Role-Based Access Control (RBAC)**, **Least Privilege**, and **Privileged Identity Separation** within Active Directory.

---

# Objectives

- Design a secure administrative account strategy
- Separate administrative identities from standard user accounts
- Create dedicated administrative accounts
- Organize privileged accounts into a dedicated OU
- Implement Role-Based Access Control (RBAC)
- Use security groups instead of assigning permissions directly to users
- Validate administrative accounts and permissions using PowerShell
- Document enterprise administrative best practices

---

# Lab Environment

| Component | Value |
|-----------|-------|
| Domain | `corp.ac-lab.top` |
| Domain Controller | `DC01` |
| Client Computer | `CLIENT-01` |
| Windows Server | Windows Server 2022 |
| Active Directory | Active Directory Domain Services |

---

# Why Separate Administrative Accounts?

One of the most common security mistakes is using a single administrator account for every administrative task.

For example:

- Managing Active Directory
- Browsing the Internet
- Reading email
- Managing servers
- Logging into workstations
- Running PowerShell

If this single account becomes compromised, an attacker immediately gains unrestricted administrative access across the entire environment.

Enterprise environments reduce this risk by separating administrative responsibilities into dedicated accounts.

Each account performs only the tasks required for its role.

This approach follows Microsoft's **Least Privilege** security model.

---

# Administrative Account Strategy

The following administrative identities were implemented.

| Account | Purpose |
|---------|----------|
| **adm-domain** | Domain-wide administration including Active Directory, DNS, DHCP, Group Policy, and enterprise configuration. |
| **adm-server** | Windows Server administration including server roles, services, updates, and maintenance. |
| **adm-workstation** | Windows client administration including workstation management, endpoint configuration, and troubleshooting. |

> A future **Service Administrator** account (`svc-admin`) will be introduced when implementing enterprise services that require privileged service identities.

---

# Why Not Use the Built-in Administrator Account?

The built-in **Administrator** account is intended primarily for:

- Initial server deployment
- Disaster recovery
- Emergency administrative access

Routine administration should instead use named administrative accounts.

Benefits include:

- Improved auditing
- Clear accountability
- Better security
- Easier permission management
- Reduced attack surface

---

# Administrative Organizational Unit

A dedicated Organizational Unit was created to separate privileged accounts from standard users.

```
CORP
│
├── Users
├── Groups
├── Administrative Accounts
│      ├── adm-domain
│      ├── adm-server
│      └── adm-workstation
│
└── Computers
```

Keeping administrative accounts in their own OU simplifies:

- Group Policy assignment
- Administrative delegation
- Auditing
- Account management

---

# Role-Based Access Control (RBAC)

Rather than assigning permissions directly to users, permissions are assigned to security groups.

Example:

```
User
    │
    ▼
Security Group
    │
    ▼
Permissions
```

For example:

```
adm-server
      │
      ▼
Server Administrators
      │
      ▼
Server Administration Permissions
```

This allows administrators to simply add or remove users from security groups without modifying server permissions individually.

Benefits include:

- Simplified administration
- Easier onboarding
- Easier offboarding
- Reduced configuration errors
- Scalable permission management

This design follows Microsoft's recommended **Role-Based Access Control (RBAC)** model.

---

# Least Privilege

Each account receives only the permissions necessary to perform its responsibilities.

| Account | Permissions |
|---------|-------------|
| adm-domain | Domain-wide administration |
| adm-server | Server administration only |
| adm-workstation | Workstation administration only |

This prevents unnecessary administrative privileges and reduces security risk.

---

# Security Groups

Two custom security groups were created.

| Security Group | Purpose |
|---------------|---------|
| Server Administrators | Windows Server administration |
| Workstation Administrators | Windows workstation administration |

These groups will later be assigned permissions through Group Policy and server configuration.

---

# Administrative Account Details

## Domain Administrator

Purpose

- Active Directory
- DNS
- DHCP
- Group Policy
- Domain-wide administration

Group Membership

- Domain Admins
- Enterprise Admins
- Schema Admins
- Domain Users

---

## Server Administrator

Purpose

- Windows Server management
- Server maintenance
- Server roles
- Server troubleshooting

Group Membership

- Domain Users
- Server Administrators

---

## Workstation Administrator

Purpose

- Windows 11 administration
- Endpoint management
- Client troubleshooting
- Software deployment

Group Membership

- Domain Users
- Workstation Administrators

---

# PowerShell Implementation

## Create Administrative Accounts Organizational Unit

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Administrative Accounts Organizational Unit (OU)
# Server : DC01
# ==============================================================================

New-ADOrganizationalUnit `
    -Name "Administrative Accounts" `
    -Path "DC=corp,DC=ac-lab,DC=top"
```

---

## Create Domain Administrator

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Domain Administrator account
# Server : DC01
# ==============================================================================

$Password = Read-Host "Enter password for adm-domain" -AsSecureString

New-ADUser `
    -Name "Domain Administrator" `
    -GivenName "Domain" `
    -Surname "Administrator" `
    -SamAccountName "adm-domain" `
    -UserPrincipalName "adm-domain@corp.ac-lab.top" `
    -DisplayName "Domain Administrator" `
    -Description "Enterprise domain administration account. Used to manage Active Directory, DNS, DHCP, Group Policy, and domain-wide administrative tasks." `
    -Path "OU=Administrative Accounts,DC=corp,DC=ac-lab,DC=top" `
    -AccountPassword $Password `
    -Enabled $true `
    -PasswordNeverExpires $true `
    -CannotChangePassword $true
```

---

## Assign Domain Administrative Permissions

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Grant administrative permissions to the Domain Administrator account
# Server : DC01
# ==============================================================================

Add-ADGroupMember "Domain Admins" "adm-domain"
Add-ADGroupMember "Enterprise Admins" "adm-domain"
Add-ADGroupMember "Schema Admins" "adm-domain"
```

---

## Create Server Administrator

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Server Administrator account
# Server : DC01
# ==============================================================================

$Password = Read-Host "Enter password for adm-server" -AsSecureString

New-ADUser `
    -Name "Server Administrator" `
    -GivenName "Server" `
    -Surname "Administrator" `
    -SamAccountName "adm-server" `
    -UserPrincipalName "adm-server@corp.ac-lab.top" `
    -DisplayName "Server Administrator" `
    -Description "Administrative account used to manage Windows Server operating systems, installed roles, services, and server maintenance activities." `
    -Path "OU=Administrative Accounts,DC=corp,DC=ac-lab,DC=top" `
    -AccountPassword $Password `
    -Enabled $true `
    -PasswordNeverExpires $true `
    -CannotChangePassword $true
```

---

## Create Server Administrators Security Group

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Server Administrators security group
# Server : DC01
# ==============================================================================

New-ADGroup `
    -Name "Server Administrators" `
    -SamAccountName "Server Administrators" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "CN=Users,DC=corp,DC=ac-lab,DC=top" `
    -Description "Members are authorized to administer Windows Server systems."
```

---

## Add Server Administrator to Security Group

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Add the Server Administrator account to the Server Administrators group
# Server : DC01
# ==============================================================================

Add-ADGroupMember `
    -Identity "Server Administrators" `
    -Members "adm-server"
```

---

## Create Workstation Administrator

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Workstation Administrator account
# Server : DC01
# ==============================================================================

$Password = Read-Host "Enter password for adm-workstation" -AsSecureString

New-ADUser `
    -Name "Workstation Administrator" `
    -GivenName "Workstation" `
    -Surname "Administrator" `
    -SamAccountName "adm-workstation" `
    -UserPrincipalName "adm-workstation@corp.ac-lab.top" `
    -DisplayName "Workstation Administrator" `
    -Description "Administrative account used to manage Windows client computers, endpoint configuration, software deployment, and workstation troubleshooting." `
    -Path "OU=Administrative Accounts,DC=corp,DC=ac-lab,DC=top" `
    -AccountPassword $Password `
    -Enabled $true `
    -PasswordNeverExpires $true `
    -CannotChangePassword $true
```

---

## Create Workstation Administrators Security Group

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Create the Workstation Administrators security group
# Server : DC01
# ==============================================================================

New-ADGroup `
    -Name "Workstation Administrators" `
    -SamAccountName "Workstation Administrators" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "CN=Users,DC=corp,DC=ac-lab,DC=top" `
    -Description "Members are authorized to administer Windows workstation devices."
```

---

## Add Workstation Administrator to Security Group

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Add the Workstation Administrator account to the Workstation Administrators group
# Server : DC01
# ==============================================================================

Add-ADGroupMember `
    -Identity "Workstation Administrators" `
    -Members "adm-workstation"
```

---

# Validation

## Verify Administrative Accounts

```powershell
# ==============================================================================
# Volume 09 - Administrative Accounts
# Purpose: Verify that all administrative accounts have been created
# Server : DC01
# ==============================================================================

Get-ADUser `
    -Filter * `
    -SearchBase "OU=Administrative Accounts,DC=corp,DC=ac-lab,DC=top" `
    -Properties Description |
Select-Object Name, SamAccountName, Enabled, Description
```

### Output

```text
Name                      SamAccountName      Enabled
----                      --------------      -------
Workstation Administrator adm-workstation    True
Domain Administrator      adm-domain          True
Server Administrator      adm-server          True
```

---

## Verify Domain Administrator

```powershell
Get-ADPrincipalGroupMembership adm-domain | Sort Name | Select Name
```

### Output

```text
Domain Admins
Domain Users
Enterprise Admins
Schema Admins
```

---

## Verify Server Administrator

```powershell
Get-ADPrincipalGroupMembership adm-server | Sort Name | Select Name
```

### Output

```text
Domain Users
Server Administrators
```

---

## Verify Workstation Administrator

```powershell
Get-ADPrincipalGroupMembership adm-workstation | Sort Name | Select Name
```

### Output

```text
Domain Users
Workstation Administrators
```

---

# Skills Demonstrated

- Active Directory administration
- Administrative account design
- Organizational Unit design
- Role-Based Access Control (RBAC)
- Security group management
- Least Privilege implementation
- Enterprise administrative strategy
- PowerShell automation
- Active Directory validation
- Windows Server administration

---

# Technologies Used

- Windows Server 2022
- Active Directory Domain Services (AD DS)
- Active Directory Users and Computers (ADUC)
- PowerShell
- RSAT

---

# Conclusion

This volume implemented a structured administrative account strategy aligned with enterprise Active Directory best practices. Rather than relying on a single privileged account, administrative responsibilities were separated into dedicated identities for domain, server, and workstation management. Access was assigned through security groups to support Role-Based Access Control (RBAC), improving scalability, simplifying permission management, and reinforcing the principle of least privilege. This approach provides a secure and maintainable foundation for future volumes involving Group Policy, delegated administration, server management, and additional infrastructure services.