# Volume 08

# Windows 11 Enterprise Client Domain Join

This volume demonstrates how to join a Windows 11 Enterprise workstation to the Active Directory domain created in the previous volumes. Once joined, the workstation becomes centrally managed by Active Directory and can authenticate users using domain credentials.

---

# Objectives

Upon completion of this volume, you will be able to:

- Verify client network connectivity
- Verify DNS resolution
- Join a Windows 11 Enterprise client to the domain
- Authenticate using domain credentials
- Verify the secure channel
- Validate the computer object in Active Directory
- Confirm dynamic DNS registration

---

# Lab Environment

| Component | Value |
|-----------|-------|
| Client Name | CLIENT-01 |
| Operating System | Windows 11 Enterprise |
| Domain | corp.ac-lab.top |
| Domain Controller | DC01 |
| Domain Controller IP | 10.10.10.20 |
| Gateway | 10.10.10.1 |
| DNS Server | 10.10.10.20 |

---

# Prerequisites

Complete the following volumes first:

- Volume 01 – Hyper-V Host Deployment
- Volume 02 – Sophos Firewall Deployment
- Volume 03 – Domain Controller
- Volume 04 – Domain Name System (DNS)
- Volume 05 – Active Directory Domain Services (AD DS)
- Volume 06 – Dynamic Host Configuration Protocol (DHCP)
- Volume 07 – Windows 11 Enterprise Client

---

# Step 1 – Verify Network Configuration

Open **PowerShell**.

Run:

```powershell
ipconfig /all
```

Verify:

- Client has received an IP address
- Default Gateway is **10.10.10.1**
- DNS Server is **10.10.10.20**
- Computer name is **CLIENT-01**

---

# Step 2 – Verify Network Connectivity

Ping the firewall.

```powershell
ping 10.10.10.1
```

Ping the Domain Controller.

```powershell
ping 10.10.10.20
```

Both tests should return successful replies.

---

# Step 3 – Verify DNS Resolution

Check DNS.

```powershell
nslookup dc01.corp.ac-lab.top
```

Expected:

```
Server:  dc01.corp.ac-lab.top
Address: 10.10.10.20

Name:    dc01.corp.ac-lab.top
Address: 10.10.10.20
```

Verify the domain.

```powershell
nslookup corp.ac-lab.top
```

The domain should resolve successfully.

---

# Step 4 – Join the Domain (GUI)

Open:

```
Settings
```

Navigate to:

```
System
→ About
→ Domain or Workgroup
```

Click:

```
Change
```

Select:

```
Domain
```

Enter:

```
corp.ac-lab.top
```

Authenticate using:

```
Username:
Administrator

Password:
********
```

Windows should display:

```
Welcome to the corp.ac-lab.top domain.
```

Restart the computer.

---

# Step 5 – Join the Domain (PowerShell Alternative)

Instead of the graphical interface, you may use:

```powershell
Add-Computer `
-DomainName corp.ac-lab.top `
-Credential corp\Administrator `
-Restart
```

---

# Step 6 – Log In Using Domain Credentials

At the login screen choose:

```
Other User
```

Sign in using:

```
corp\Administrator
```

or

```
Administrator@corp.ac-lab.top
```

Windows creates the domain user profile during the first logon.

---

# Step 7 – Verify Domain Membership

Open PowerShell.

Verify the current domain.

```powershell
(Get-CimInstance Win32_ComputerSystem).Domain
```

Expected:

```
CORP.AC-LAB.TOP
```

---

Verify system information.

```powershell
systeminfo | findstr /B /C:"Domain"
```

Expected:

```
Domain:    CORP.AC-LAB.TOP
```

---

Verify the logged-on user.

```powershell
whoami
```

Expected:

```
corp\administrator
```

---

Verify the logon server.

```powershell
$env:LOGONSERVER
```

Expected:

```
\\DC01
```

---

Verify the hostname.

```powershell
hostname
```

Expected:

```
CLIENT-01
```

---

# Step 8 – Verify the Secure Channel

Run:

```powershell
Test-ComputerSecureChannel
```

Expected:

```
True
```

---

# Step 9 – Verify the Computer Object

On **DC01**, open:

```
Active Directory Users and Computers
```

Browse to:

```
Computers
```

Verify:

```
CLIENT-01
```

exists.

You may also use:

```powershell
Get-ADComputer CLIENT-01
```

---

# Step 10 – Verify DNS Registration

Open:

```
DNS Manager
```

Navigate to:

```
Forward Lookup Zones
    └── corp.ac-lab.top
```

Verify the host record:

```
CLIENT-01
```

exists.

---

# Validation Checklist

| Test | Status |
|------|:------:|
| Client received DHCP address | ✅ |
| Gateway reachable | ✅ |
| Domain Controller reachable | ✅ |
| DNS resolution successful | ✅ |
| Domain joined successfully | ✅ |
| Domain login successful | ✅ |
| `whoami` displays domain account | ✅ |
| `$env:LOGONSERVER` returns **\\DC01** | ✅ |
| `Test-ComputerSecureChannel` returns **True** | ✅ |
| Computer object exists in Active Directory | ✅ |
| DNS record created | ✅ |

---

# Troubleshooting

## Cannot find the domain

Verify the DNS server.

```powershell
ipconfig /all
```

DNS Server should be:

```
10.10.10.20
```

---

## Domain cannot be contacted

Verify DNS resolution.

```powershell
nslookup corp.ac-lab.top
```

---

## Authentication failed

Use:

```
corp\Administrator
```

Ensure the administrator password is correct.

---

## Secure channel failed

Repair the trust relationship.

```powershell
Test-ComputerSecureChannel -Repair -Credential corp\Administrator
```

---

## Computer already exists

Delete or reset the existing computer account in **Active Directory Users and Computers**, then rejoin the domain.

---

# PowerShell Commands Summary

```powershell
ipconfig /all

ping 10.10.10.1

ping 10.10.10.20

nslookup dc01.corp.ac-lab.top

nslookup corp.ac-lab.top

Add-Computer -DomainName corp.ac-lab.top -Credential corp\Administrator

(Get-CimInstance Win32_ComputerSystem).Domain

systeminfo | findstr /B /C:"Domain"

whoami

$env:LOGONSERVER

hostname

Test-ComputerSecureChannel

Get-ADComputer CLIENT-01
```

---

# Conclusion

In this volume, the Windows 11 Enterprise client was successfully joined to the **corp.ac-lab.top** Active Directory domain. Connectivity, DNS resolution, authentication, secure channel establishment, Active Directory registration, and dynamic DNS updates were all verified successfully.

The workstation is now fully managed by Active Directory and ready for centralized administration using **Group Policy**, Organizational Units (OUs), security policies, software deployment, and enterprise management features introduced in the next volume.