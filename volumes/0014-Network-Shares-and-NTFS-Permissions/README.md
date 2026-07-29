# Volume 14 – Enterprise Shared Folders

> **Enterprise Infrastructure Lab**  
> Designing and implementing a secure departmental file server using Windows Server, Active Directory, SMB Shares, NTFS Permissions and Role-Based Access Control (RBAC).

---

# 🏗 Enterprise Architecture

```text
                                      CORP.AC-LAB.TOP
                                             │
                                             │
                                   Active Directory
                                             │
                           ┌─────────────────┼─────────────────┐
                           │                 │                 │
                    Security Groups    Administrative     File Server
                                           Access             FS01
                           │                 │                 │
                           └─────────────────┼─────────────────┘
                                             │
                                             ▼
                                   D:\Shares\Departments
                                             │
       ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
       │               │               │               │               │
       ▼               ▼               ▼               ▼               ▼
   Finance$          HR$             IT$        Operations$        Sales$
       │               │               │               │               │
       ▼               ▼               ▼               ▼               ▼
 GG_FIN_Users    GG_HR_Users    GG_IT_Users    GG_OPS_Users    GG_SALES_Users
       │               │               │               │               │
       └──────────────────────────────────────────────────────────────────────┘
                              NTFS Permissions (Modify)
```

---

# 🎯 Objective

Design and deploy a secure enterprise file server that provides departmental storage while enforcing Role-Based Access Control (RBAC) through Active Directory Security Groups.

---

# 🏢 Environment

| Component | Value |
|-----------|-------|
| Server | FS01 |
| Operating System | Windows Server 2022 |
| Domain | CORP.AC-LAB.TOP |
| File System | NTFS |
| Protocol | SMB 3.x |
| Authentication | Active Directory |
| Access Model | RBAC |
| Share Type | Hidden Administrative Shares ($) |

---

# 📁 Folder Structure

```text
D:\
└── Shares
    ├── Departments
    │   ├── Finance
    │   ├── HR
    │   ├── IT
    │   ├── Operations
    │   └── Sales
    ├── Home
    ├── Profiles
    ├── Public
    ├── Redirected
    └── Software
```

---

# 📂 SMB Shares

| Share | Path | Access-Based Enumeration |
|--------|------|-------------------------|
| Finance$ | D:\Shares\Departments\Finance | ✅ |
| HR$ | D:\Shares\Departments\HR | ✅ |
| IT$ | D:\Shares\Departments\IT | ✅ |
| Operations$ | D:\Shares\Departments\Operations | ✅ |
| Sales$ | D:\Shares\Departments\Sales | ✅ |

---

# 🔐 Share Permissions

Following Microsoft best practice, share permissions remain simple while NTFS permissions enforce security.

| Principal | Permission |
|------------|------------|
| Everyone | Full Control |

> NTFS permissions provide the actual security boundary.

---

# 🔒 NTFS Permission Model

Each departmental folder is secured using Active Directory Security Groups.

| Folder | Security Group | Permission |
|----------|----------------|------------|
| Finance | GG_FIN_Users | Modify |
| HR | GG_HR_Users | Modify |
| IT | GG_IT_Users | Modify |
| Operations | GG_OPS_Users | Modify |
| Sales | GG_SALES_Users | Modify |

Administrative permissions:

- Administrators — Full Control
- SYSTEM — Full Control

---

# 👥 Active Directory Integration

The design follows Role-Based Access Control (RBAC).

```
Users
   │
   ▼
Department Security Group
   │
   ▼
NTFS Permissions
   │
   ▼
SMB Share
```

No users were assigned permissions directly.

---

# 🔐 Access Control Principles

- Principle of Least Privilege
- Role-Based Access Control (RBAC)
- Group-based permissions
- Hidden administrative shares
- Access-Based Enumeration (ABE)
- Separate Share and NTFS permissions

---

# 🧪 Validation

The following validation tests were successfully completed.

## Department Access

| Test | Result |
|------|--------|
| HR user can access HR$ | ✅ Pass |
| Finance user can access Finance$ | ✅ Pass |
| IT user can access IT$ | ✅ Pass |
| Operations user can access Operations$ | ✅ Pass |
| Sales user can access Sales$ | ✅ Pass |

---

## Permission Boundaries

| Test | Result |
|------|--------|
| HR cannot access Finance | ✅ Pass |
| Finance cannot access IT | ✅ Pass |
| Sales cannot access Operations | ✅ Pass |
| Users only see authorised departmental shares | ✅ Pass |

---

## Administrative Validation

Validated:

- SMB Shares
- NTFS Permissions
- Active Directory Group Membership
- Access-Based Enumeration
- Share Availability

All validation completed successfully.

---

# 📖 Key Concepts Learned

- Windows SMB File Services
- Enterprise Share Design
- NTFS Permissions
- Share Permissions
- Role-Based Access Control (RBAC)
- Active Directory Security Groups
- Access-Based Enumeration (ABE)
- Least Privilege Administration
- Enterprise File Server Design

---

# ✅ Outcome

This volume successfully implemented an enterprise departmental file server using Windows Server and Active Directory.

The environment now provides:

- Secure departmental storage
- Group-based access management
- Hidden SMB shares
- Access-Based Enumeration
- Standardised NTFS permissions
- Enterprise RBAC implementation
- Centralised access management through Active Directory

---

**Status:** ✅ Completed
```