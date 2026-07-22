# Volume 5 - Active Directory Organizational Unit Structure

## Phase

Phase 1 - Core Infrastructure

## Status

✅ Completed

---

# Objective

Design and implement an Organizational Unit (OU) structure within Active Directory to logically organize users, computers, servers, groups, and service accounts while simplifying administration and Group Policy deployment.

---

# Environment

| Component | Details |
|----------|---------|
| Domain | CORP.AC-LAB.TOP |
| Domain Controller | DC01 |
| Directory Service | Active Directory Domain Services |

---

# Purpose

Organizational Units (OUs) provide a logical structure for managing Active Directory objects.

A well-designed OU hierarchy enables:

- Simplified administration
- Delegation of administrative permissions
- Targeted Group Policy deployment
- Logical separation of enterprise resources
- Improved scalability

---

# Design Principles

The Active Directory structure was designed using Microsoft's best practices by separating objects according to their administrative function rather than their physical location.

This approach simplifies future expansion and makes Group Policy management significantly easier.

---

# Organizational Structure

The following Organizational Units were created to support enterprise administration.

```
CORP.AC-LAB.TOP
│
├── Servers
├── Workstations
├── Users
├── Groups
├── Service Accounts
└── Administrative Accounts
```

---

# Benefits

The implemented structure provides:

- Centralized administration
- Easier Group Policy targeting
- Separation of privileged accounts
- Improved security management
- Consistent resource organization
- Better scalability for future infrastructure growth

---

# Validation

The deployment was validated by confirming:

- Organizational Units created successfully
- Objects can be moved into appropriate OUs
- Active Directory replication completed successfully
- OU hierarchy visible in Active Directory Users and Computers

---

# Lessons Learned

Designing the Organizational Unit structure before deploying additional servers and users establishes a scalable administrative framework.

As the environment grows, Group Policy Objects (GPOs), delegated permissions, and security settings can be applied efficiently to specific Organizational Units without affecting unrelated systems.

---

# Screenshots

_To be added._

Suggested screenshots:

- Active Directory Users and Computers
- OU Hierarchy
- Root Domain Structure
- Example User Objects
- Example Computer Objects

---

# Related Volumes

- Volume 3 – Domain Controller (DC01)
- Volume 4 – DNS Configuration
- Volume 6 – DHCP Configuration
- Volume 8 – Group Policy Baseline