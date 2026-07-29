# Volume 15 – Distributed File System (DFS)

<p align="center">

# 📁 Distributed File System (DFS)

Enterprise Namespace • High Availability • Data Replication • Unified Access

</p>

---

## Architecture Overview

```text
                              CORP.AC-LAB.TOP
                                      │
                                      │
                 \\CORP.AC-LAB.TOP\Departments
                                      │
              ┌───────────────────────┴───────────────────────┐
              │                                               │
              ▼                                               ▼
       Namespace Server                               Namespace Server
            FS01                                           FS02
              │                                               │
              │<========== DFS Replication ==========>│
              │          Multi-Master (Full Mesh)            │
              │                                               │
      D:\Shares\Departments                         D:\Shares\Departments
              │                                               │
      ┌───────┴───────────────────────────────────────────────┐
      │                                                       │
 Executive   Finance   HR   IT   Operations   Sales
```

---

# Objective

Deploy Microsoft Distributed File System (DFS) to provide:

- Domain-based DFS Namespace
- High Availability
- Centralized namespace
- Automatic namespace referrals
- Multi-master DFS Replication
- Transparent failover
- Simplified user access

Instead of users accessing:

```text
\\FS01\Departments
```

users access:

```text
\\CORP.AC-LAB.TOP\Departments
```

without knowing which server currently hosts the data.

---

# Lab Environment

| Component | Value |
|-----------|-------|
| Domain | CORP.AC-LAB.TOP |
| Namespace | Departments |
| Namespace Type | Domain-based |
| Namespace Mode | Windows Server 2008 |
| Namespace Servers | FS01, FS02 |
| Replication | DFS-R |
| Topology | Full Mesh |
| Replicated Folder | Departments |
| Local Path | D:\Shares\Departments |

---

# Enterprise Design

## Namespace

```text
\\CORP.AC-LAB.TOP\Departments
```

Contains departmental folders:

```text
Departments
│
├── Executive
├── Finance
├── HR
├── IT
├── Operations
└── Sales
```

---

# DFS Namespace

## Namespace Servers

| Server | Status |
|---------|--------|
| FS01 | Enabled |
| FS02 | Enabled |

Benefits:

- High Availability
- Automatic referral
- No dependency on a single server
- Client failover

---

# DFS Replication

Replication Group

```text
Departments-ReplicationGroup
```

Replicated Folder

```text
Departments
```

Members

```text
FS01
FS02
```

Replication Type

```text
Multi-Master
```

Both servers are writable.

Changes made on either server replicate automatically.

---

# Replication Topology

```text
          FS01
            ▲
            │
            │
            ▼
          FS02
```

Full Mesh

- Bidirectional replication
- Automatic synchronization
- Automatic conflict handling

---

# Department Structure

```text
Departments
│
├── Executive
├── Finance
├── HR
├── IT
├── Operations
└── Sales
```

Each department retains:

- NTFS Permissions
- Share Permissions
- Ownership
- Security ACLs

---

# Deployment Summary

## Installed Roles

- DFS Namespaces
- DFS Replication

---

## Created Namespace

```text
\\CORP.AC-LAB.TOP\Departments
```

---

## Added Namespace Servers

- FS01
- FS02

---

## Added Namespace Folders

- Executive
- Finance
- HR
- IT
- Operations
- Sales

---

## Created Replication Group

```text
Departments-ReplicationGroup
```

---

## Added Replication Members

- FS01
- FS02

---

## Configured

- Full Mesh Topology
- Continuous Replication
- Default Schedule
- 4 GB Staging Quota

---

# Validation

The following tests were successfully completed.

## Namespace Resolution

Validated

```text
\\CORP.AC-LAB.TOP\Departments
```

resolved correctly.

---

## Namespace Server Redundancy

Validated

Namespace available from:

- FS01
- FS02

---

## Folder Replication

Validated

Created files replicated successfully between:

```text
FS01
⇅
FS02
```

---

## Permission Replication

Validated

NTFS permissions replicated successfully.

ACL changes propagated correctly.

---

## Failover

Validated

Namespace remained accessible through alternate namespace server.

---

## Enterprise Benefits

### Before DFS

```text
Users

↓

\\FS01\Departments
```

Problems

- Single point of failure
- Server name exposed
- Manual migration required
- Difficult scaling

---

### After DFS

```text
Users

↓

\\CORP.AC-LAB.TOP\Departments

↓

FS01
or

FS02
```

Benefits

- Transparent access
- High Availability
- Automatic referrals
- Easier migrations
- Simplified administration

---

# Screenshots

## DFS Namespace

![DFS Namespace](images/55.png)

---

## Namespace Servers

![Namespace Servers](images/56.png)

---

## Replication Membership

![Replication Membership](images/57.png)

---

## Replication Connections

![Replication Connections](images/58.png)

---

## Replicated Folder

![Replicated Folder](images/59.png)

---

# Lessons Learned

- Domain-based namespaces simplify user access.
- DFS Replication provides multi-master synchronization.
- Namespace referrals improve availability.
- Centralized paths eliminate dependency on individual file servers.
- NTFS permissions replicate alongside data.
- DFS enables seamless file server maintenance and future migrations without changing user paths.

---

# Troubleshooting

<details>

<summary><strong>Hyper-V Enhanced Session Mode</strong></summary>

While validating domain user logons, Hyper-V Enhanced Session Mode caused VMConnect to authenticate using **Remote Desktop Services** instead of a console session.

This generated Security Event:

```text
Logon Type: 10
Status: 0xC000015B
Failure Reason:
The user has not been granted the requested logon type at this machine.
```

Disabling **Enhanced Session Mode** restored standard console authentication (**Logon Type 2**) and resolved the issue.

This was an environmental Hyper-V behavior and **not** a DFS or Active Directory configuration issue.

</details>

---

# Technologies Used

- Windows Server 2022
- Active Directory Domain Services
- DFS Namespaces
- DFS Replication (DFS-R)
- SMB File Services
- NTFS Permissions
- PowerShell
- Hyper-V

---

# Completion Status

| Task | Status |
|------|--------|
| Install DFS Roles | ✅ |
| Create Domain Namespace | ✅ |
| Configure Namespace Servers | ✅ |
| Create Department Folders | ✅ |
| Configure Folder Targets | ✅ |
| Configure DFS Replication | ✅ |
| Validate Replication | ✅ |
| Validate Namespace Access | ✅ |
| Validate Failover | ✅ |
| Document Deployment | ✅ |

---

**Volume Status:** ✅ **Completed**