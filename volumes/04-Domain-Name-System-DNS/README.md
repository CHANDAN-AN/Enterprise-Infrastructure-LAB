# Volume 4 - Domain Name System (DNS)

## Phase

Phase 1 - Core Infrastructure

## Status

✅ Completed

---

# Objective

Deploy and configure Microsoft DNS to provide reliable name resolution for the Enterprise Infrastructure Lab and support Active Directory Domain Services.

---

# Environment

| Component | Details |
|----------|---------|
| DNS Server | DC01 |
| Operating System | Windows Server 2022 Datacenter Evaluation |
| Domain | CORP.AC-LAB.TOP |
| DNS Type | Active Directory Integrated |
| Primary Zone | CORP.AC-LAB.TOP |

---

# Purpose

Microsoft DNS provides name resolution throughout the enterprise environment.

Core responsibilities include:

- Resolving hostnames to IP addresses
- Supporting Active Directory authentication
- Managing forward lookup zones
- Supporting future reverse lookup zones
- Providing service record (SRV) registration
- Supporting Group Policy and domain services

---

# Implementation

The DNS role was installed during the Active Directory Domain Services deployment.

Configuration included:

- Active Directory Integrated DNS
- Primary Forward Lookup Zone
- Automatic SRV record registration
- Dynamic DNS updates
- Domain controller name resolution

---

# Services Supported

DNS provides name resolution for:

- Active Directory
- Domain Controllers
- Group Policy
- File Servers
- Application Servers
- Future enterprise workloads

---

# Validation

The deployment was validated by confirming:

- DNS service operational
- Domain zone created
- Forward lookup zone functioning
- Domain controller registered
- Hostname resolution successful
- Active Directory dependency functioning correctly

---

# Lessons Learned

DNS is one of the most critical services within a Microsoft enterprise environment.

Without properly functioning DNS, users cannot authenticate, Group Policy cannot process correctly, and many Microsoft services fail to operate.

For this reason, Microsoft Active Directory is designed around DNS rather than traditional NetBIOS name resolution.

---

# Screenshots

_To be added._

Suggested screenshots:

- DNS Manager
- Forward Lookup Zone
- Host (A) Records
- SRV Records
- DNS Console Overview

---

# Related Volumes

- Volume 3 – Domain Controller (DC01)
- Volume 5 – Active Directory Organizational Unit Structure