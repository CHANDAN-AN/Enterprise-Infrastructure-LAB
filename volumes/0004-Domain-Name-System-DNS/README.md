# Volume 4 – DNS Server Configuration

## Overview

The Domain Name System (DNS) is a critical component of Active Directory. It enables clients and servers to locate domain controllers, resolve hostnames, and discover essential directory services.

In this volume, DNS was configured on the Domain Controller (DC01) as an Active Directory-integrated DNS server. Forward and reverse lookup zones were created, and DNS functionality was validated to ensure the environment is ready for future infrastructure services.

---

# Objectives

- Install the DNS Server role.
- Configure an Active Directory-integrated Forward Lookup Zone.
- Configure a Reverse Lookup Zone.
- Enable secure dynamic updates.
- Verify DNS name resolution.
- Validate Active Directory service records.

---

# Environment

| Component | Value |
|----------|-------|
| Server | DC01 |
| Operating System | Windows Server 2022 Datacenter Evaluation |
| Domain | CORP.AC-LAB.TOP |
| IP Address | 10.10.10.20 |
| DNS Server | 10.10.10.20 |

---

# DNS Configuration

The following DNS components were configured:

- Active Directory-integrated Forward Lookup Zone
- Reverse Lookup Zone
- Secure Dynamic Updates
- Automatic registration of Active Directory service records
- PTR record for the Domain Controller

The DNS zones are replicated through Active Directory, providing centralized management and secure updates.

---

# Implemented DNS Zones

## Forward Lookup Zone

```
CORP.AC-LAB.TOP
```

Configured as:

- Active Directory Integrated
- Secure Dynamic Updates Enabled

---

## Reverse Lookup Zone

```
10.10.10.in-addr.arpa
```

Configured to support reverse DNS lookups for the 10.10.10.0/24 network.

---

# Active Directory Integration

Once Active Directory Domain Services was installed, DNS automatically created and populated the required service records, including:

- _msdcs
- _sites
- _tcp
- _udp

These records allow domain-joined clients to locate Domain Controllers and Active Directory services automatically.

---

# Validation

The DNS deployment was validated by confirming:

- Forward DNS resolution
- Reverse DNS resolution
- Active Directory SRV record registration
- Microsoft DNS diagnostics

All validation tests completed successfully.

---

# Verification Commands

## Verify Forward Lookup

```powershell
Resolve-DnsName dc01.corp.ac-lab.top
```

Expected Result:

```
10.10.10.20
```

---

## Verify Reverse Lookup

```powershell
Resolve-DnsName 10.10.10.20
```

Expected Result:

```
DC01.CORP.AC-LAB.TOP
```

---

## Verify Active Directory SRV Records

```powershell
nslookup
```

```text
set type=SRV
_ldap._tcp.dc._msdcs.corp.ac-lab.top
```

Expected Result:

```
svr hostname = dc01.corp.ac-lab.top
port = 389
```

---

## Run DNS Diagnostics

```powershell
dcdiag /test:dns
```

Expected Result:

```
passed test DNS
```

---

# DNS Validation Results

The following tests were successfully completed:

- Forward lookup resolution
- Reverse lookup resolution
- LDAP SRV record discovery
- Active Directory DNS diagnostics
- DNS service health verification

---

# Benefits

The configured DNS infrastructure provides:

- Reliable hostname resolution
- Active Directory service discovery
- Automatic Domain Controller registration
- Secure dynamic DNS updates
- Support for future DHCP integration
- Foundation for domain-joined client computers

---

# Lessons Learned

DNS is one of the most critical services in an Active Directory environment. Proper DNS configuration ensures clients can locate Domain Controllers, authenticate users, apply Group Policies, and access directory services.

Validating forward lookup, reverse lookup, SRV records, and DNS diagnostics confirms the environment is functioning correctly before deploying additional infrastructure services.

---

# Related Volumes

- Volume 3 – Active Directory Domain Services Deployment
- Volume 5 – Active Directory Organizational Unit Structure
- Volume 6 – DHCP Server Deployment