# Volume 10

# Security Groups

## Overview

Security Groups are one of the core components of Active Directory and are used to simplify user management and resource access. Rather than assigning permissions directly to individual users, administrators assign permissions to Security Groups and then add users to those groups. This approach reduces administrative overhead, improves security, and follows Microsoft's recommended best practices for enterprise environments.

In this volume, Global Security Groups were created to represent each department within the organization. These groups form the identity layer of the Active Directory infrastructure and will later be used with Group Policy Objects (GPOs), file shares, NTFS permissions, printers, and other enterprise resources.

---

# Objectives

- Understand the purpose of Active Directory Security Groups
- Create departmental Global Security Groups
- Organize groups using a dedicated Organizational Unit (OU) structure
- Add departmental users to the appropriate Security Groups
- Validate group memberships using both the GUI and PowerShell
- Prepare the Active Directory environment for future role-based access control (RBAC)

---

# Why Security Groups?

Instead of assigning permissions directly to individual user accounts, Windows Server uses Security Groups to centrally manage access to resources.

Without Security Groups:

```text
User
    ↓
Folder Permission

User
    ↓
Printer Permission

User
    ↓
Application Permission
```

With Security Groups:

```text
Users
    ↓
Global Security Group
    ↓
Permissions
    ↓
Resources
```

This design allows administrators to manage access by modifying group membership rather than changing permissions on every individual resource.

---

# Security Group Types

Active Directory supports two primary group types.

### Security Groups

Security Groups are used for authentication and authorization. They contain a Security Identifier (SID), allowing Windows to grant or deny access to resources such as:

- Shared folders
- NTFS permissions
- Printers
- Applications
- VPN access
- Group Policy filtering

### Distribution Groups

Distribution Groups are intended for email distribution lists and cannot be used to assign security permissions.

---

# Group Scope

This lab uses **Global Security Groups**.

Global Groups are designed to represent users with a common business function, such as a department or role.

Examples:

- Information Technology
- Human Resources
- Finance
- Sales
- Executive
- Operations

Global Groups answer the question:

> **Who is this user?**

---

# Organizational Structure

The following Organizational Unit (OU) structure was implemented:

```text
Groups
├── Administrative Groups
├── Department Groups
├── Distribution Groups
└── Security Groups
```

Departmental Global Security Groups were created inside the **Department Groups** OU.

---

# Naming Convention

The following naming standard is used throughout the lab.

| Prefix | Meaning |
|---------|---------|
| GG | Global Group |
| DL | Domain Local Group *(future volumes)* |
| Users | Standard department users |

Examples:

```text
GG_IT_Users
GG_FIN_Users
GG_HR_Users
GG_EXEC_Users
GG_OPS_Users
GG_SALES_Users
```

---

# Department Groups Created

| Group Name | Purpose |
|------------|---------|
| GG_EXEC_Users | Executive department users |
| GG_FIN_Users | Finance department users |
| GG_HR_Users | Human Resources department users |
| GG_IT_Users | Information Technology department users |
| GG_OPS_Users | Operations department users |
| GG_SALES_Users | Sales department users |

Each group contains the users belonging to its respective department.

---

# Group Membership

Departmental users were added to their corresponding Global Security Groups using **Active Directory Users and Computers (ADUC)**.

Example:

```text
GG_IT_Users

├── IT Manager
├── IT User 01
└── IT User 02
```

---

# Identity vs Authorization

One of the most important design principles in Active Directory is separating **identity** from **permissions**.

Global Security Groups identify **who users are**.

Permissions will be assigned later using **Domain Local Groups**, following Microsoft's AGDLP model.

```text
Users
    │
    ▼
Global Groups
    │
    ▼
Domain Local Groups
    │
    ▼
Permissions
    │
    ▼
Resources
```

This design simplifies administration and makes the environment easier to scale.

---

# Validation

The following validation tasks were completed:

- Verified Security Group creation
- Verified Group Scope (Global)
- Verified Group Type (Security)
- Added departmental users
- Verified group membership from the Group object
- Verified group membership from the User object
- Added descriptions to all departmental Security Groups
- Validated configuration using Active Directory Users and Computers (ADUC)
- Verified group membership using PowerShell

Example:

```powershell
Get-ADGroupMember GG_IT_Users

Get-ADPrincipalGroupMembership "IT Manager"
```

---

# Best Practices

- Never assign permissions directly to users.
- Always assign permissions to Security Groups.
- Use consistent naming conventions.
- Keep groups organized within dedicated OUs.
- Separate standard user accounts from administrative accounts.
- Document the purpose of each group using the Description field.
- Follow the Principle of Least Privilege.
- Design groups to represent business roles rather than individual resources.

---

# Outcome

The Active Directory environment now contains a structured set of departmental Global Security Groups representing the organization's business units. These groups provide the identity layer required for enterprise access management and establish the foundation for future implementation of Group Policy, file servers, NTFS permissions, shared folders, printers, and role-based access control (RBAC).