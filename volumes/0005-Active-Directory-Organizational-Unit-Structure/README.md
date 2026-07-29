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

# Design Considerations

The Organizational Unit structure was designed around business functions instead of physical locations.

This approach provides:

- Easier Group Policy deployment
- Simpler administrative delegation
- Better separation of privileged accounts
- Logical organization of servers and workstations
- Scalability for future infrastructure growth

---

# Design Principles

The Active Directory structure was designed using Microsoft's best practices by separating objects according to their administrative function rather than their physical location.

This approach simplifies future expansion and makes Group Policy management significantly easier.

---

# Organizational Structure

The following Organizational Units were created to support enterprise administration.
The Active Directory environment is organized using a functional Organizational Unit (OU) hierarchy. This structure separates administrative resources, departments, servers, workstations, and security groups to simplify management and support future growth.

```text
CORP.AC-LAB.TOP
│
├── Administration
│   ├── Tier 0
│   ├── Admin Accounts
│   ├── Admin Groups
│   └── Service Accounts
│
├── Departments
│   ├── Executives
│   ├── Finance
│   ├── HR
│   ├── IT
│   ├── Operations
│   └── Sales
│
├── Servers
│   ├── Infrastructure
│   ├── Domain Controllers
│   ├── File Servers
│   ├── Database Servers
│   ├── Web Servers
│   ├── Monitoring
│   └── Backup
│
├── Workstations
│   ├── Finance
│   ├── HR
│   ├── IT
│   ├── Operations
│   ├── Sales
│   ├── Kiosks
│   └── Test Machines
│
├── Groups
│   ├── Administrative Groups
│   ├── Department Groups
│   ├── Distribution Groups
│   └── Security Groups
│
├── Service Accounts
└── Disabled Objects
```

---

# Benefits

The implemented Organizational Unit structure provides:

- Dedicated administration containers for privileged accounts
- Department-specific containers for users
- Separate Organizational Units for production servers
- Department-based workstation management
- Centralized management of security and distribution groups
- Isolated containers for disabled objects and service accounts
- Simplified future Group Policy deployment

---

# Validation

The deployment was validated by confirming:

- All Organizational Units were successfully created.
- The OU hierarchy is visible in Active Directory Users and Computers.
- Administrative, departmental, server, and workstation containers are organized correctly.
- Objects can be placed into their respective Organizational Units.
- Active Directory replication completed successfully.

---

# Lessons Learned

Designing the Organizational Unit structure before deploying users, computers, and Group Policies creates a scalable Active Directory environment.

Separating administrative resources, departments, servers, and workstations allows future security policies and delegated administration to be implemented without restructuring the directory.

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