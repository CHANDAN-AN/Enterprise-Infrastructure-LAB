# Volume 21 – Windows Admin Center (WAC)

> **Status: 🟡 WORK IN PROGRESS — WAC Troubleshooting Required**
>
> Windows Admin Center has been installed and configured on `WAC01`, but the WAC web interface remains stuck at **“Starting Windows Admin Center…”**.
>
> The deployment is therefore **not marked complete**. Troubleshooting is intentionally documented below so the project can resume from the exact point reached without repeating the investigation.

---

## 🎯 Objective

Deploy **Windows Admin Center (WAC)** as the centralized web-based management platform for the Windows infrastructure in the `CORP.AC-LAB.TOP` enterprise lab.

WAC is intended to provide centralized management of Windows infrastructure, including:

- Windows Server management
- Hyper-V management
- PowerShell / remote administration
- Server roles and features
- Storage and networking
- Active Directory-related administration
- Future infrastructure integration

---

## 🏗️ Target Architecture

```text
                         CORP.AC-LAB.TOP
                                |
                         +--------------+
                         |    WAC01     |
                         | Windows Admin|
                         |   Center     |
                         +------+-------+
                                |
                         HTTPS / TCP 443
                                |
                         VLAN 20
                    Infrastructure VLAN
                                |
              +-----------------+-----------------+
              |                 |                 |
           DC01              DC02             Servers
        AD DS / DNS        Redundancy       Infrastructure
        AD CS / DHCP
```

WAC01 is positioned in **VLAN 20 – Infrastructure / Identity**, consistent with the lab's VLAN design. The network master plan identifies VLAN 20 as the infrastructure/identity network and places core infrastructure such as DC01/DC02 there. fileciteturn15file4

---

# 1. WAC Server

| Item | Configuration |
|---|---|
| Hostname | `WAC01` |
| FQDN | `WAC01.CORP.AC-LAB.TOP` |
| Domain | `CORP.AC-LAB.TOP` |
| VLAN | VLAN 20 |
| IP Address | `10.10.20.100` |
| Gateway | `10.10.20.1` |
| DNS | `10.10.20.20`, `10.10.20.21` |
| WAC Version | `2.7.4.18` |
| Installation Type | Standard |
| Authentication | Windows Authentication |
| External HTTPS Port | `443` |
| Internal Service Ports | `6601–6610` |
| TLS | Enterprise certificate |
| Certificate Authority | `CORP-CA01-CA` |

---

# 2. WAC Installation

Windows Admin Center was installed on `WAC01` using the GUI installer.

### Installation configuration

```text
Installation mode:
Custom setup

Login Authentication:
Windows Authentication (NTLM or Kerberos)

Network access:
Remote access

External Port:
443

Internal Port Range:
6601–6610

FQDN:
WAC01.CORP.AC-LAB.TOP

Trusted Hosts:
Trusted domain computers

Automatic Updates:
Notify only

Diagnostic Data:
Required diagnostic data
```

The installation log ultimately reported successful completion, including database initialization, WAC service registration, HTTP.SYS registration, firewall configuration, and launcher startup.

---

# 3. Enterprise PKI / TLS

WAC uses an internal certificate issued by:

```text
Certificate Authority:
CORP-CA01-CA
```

The original certificate was SAN-only and had an empty Subject.

A correction was made to the `CORP Computer Certificate` template on CA01:

```text
Subject Name:
Build from Active Directory information

Subject name format:
Common name

SAN:
DNS name
```

A new certificate was then enrolled.

### Current WAC certificate

```text
Subject:
CN=WAC01.CORP.AC-LAB.TOP

SAN:
DNS=WAC01.CORP.AC-LAB.TOP

Thumbprint:
5B544B1741C97FA870A92556AF8711C762794A3D

Private Key:
Present

Validity:
2026-08-19 → 2027-08-19
```

The certificate includes **Server Authentication**.

---

# 4. Certificate Private-Key Permissions

The WAC service runs as:

```text
NT AUTHORITY\NetworkService
```

The private-key ACL was verified.

Current permissions:

```text
SYSTEM             → FullControl
NETWORK SERVICE    → Read, Synchronize
Administrators     → FullControl
```

Therefore the WAC service account has read access to the certificate private key.

---

# 5. WAC Service

The WAC Windows service was verified as:

```text
Service:
WindowsAdminCenter

Executable:
C:\Program Files\WindowsAdminCenter\Service\WindowsAdminCenter.exe

Run As:
NT Authority\NetworkService
```

The service can start successfully.

---

# 6. HTTPS Configuration

WAC is configured for:

```text
HTTPS:
https://WAC01.CORP.AC-LAB.TOP

External Port:
443
```

HTTP.SYS was successfully registered on TCP 443 using the WAC certificate.

The browser successfully reaches the WAC endpoint and presents the Windows Authentication prompt.

This confirms that:

```text
DNS          ✅
Network      ✅
TCP 443      ✅
HTTPS        ✅
Certificate  ✅
Authentication ✅
```

---

# 7. Current WAC Problem

## 🔴 Web Interface Does Not Finish Loading

After successful Windows authentication, the WAC browser interface remains indefinitely at:

```text
Starting Windows Admin Center...
```

This occurs in:

- Normal Edge session
- Edge InPrivate session

Therefore browser cache/session state was not identified as the cause.

---

# 8. Troubleshooting Performed

## 8.1 Certificate private-key access

Initially WAC reported:

```text
Unable to configure HTTPS endpoint.
No server certificate was specified...
```

The certificate private key was investigated and confirmed to exist.

The actual private-key container was identified under:

```text
C:\ProgramData\Microsoft\Crypto\RSA\MachineKeys
```

`NETWORK SERVICE` was verified to have read access.

### Result

```text
Certificate private-key permissions:
RESOLVED / VERIFIED
```

---

## 8.2 WAC installation files

The WAC ProgramData structure was verified:

```text
C:\ProgramData\WindowsAdminCenter
```

including:

```text
CredSSP
Database
Extensions
Logs
Plugins
Updater
UX
```

The installation log ultimately reported:

```text
Installation of Windows Admin Center completed successfully.
```

The installer also successfully initialized the WAC database and registered the WAC service.

### Result

```text
WAC installation:
COMPLETED
```

---

## 8.3 WAC configuration

The WAC service configuration was inspected.

The primary configuration file is:

```text
C:\Program Files\WindowsAdminCenter\Service\appsettings.json
```

The configuration contains:

```text
Kestrel
    https://*:443

Certificate
    Location: LocalMachine
    Store: My

WindowsAdminCenter
    EndpointFqdn: WAC01.CORP.AC-LAB.TOP
    ServiceFqdn: WAC01.CORP.AC-LAB.TOP
```

The certificate configuration initially contained an empty Subject selector.

The WAC configuration commands were then successfully loaded:

```text
Set-WACCertificateSubjectName
Set-WACCertificateAcl
```

The corrected certificate was configured and the WAC service restarted.

### Result

```text
Certificate configuration:
CORRECTED / RETESTED

Web UI:
STILL NOT LOADING
```

---

# 9. Browser Troubleshooting

Browser Developer Tools were used to investigate the frontend.

The WAC JavaScript and CSS assets were observed loading successfully.

The WAC page nevertheless remained stuck at:

```text
Starting Windows Admin Center...
```

A JavaScript console error was observed, but the browser did not expose enough information from the displayed error to conclusively identify the failing WAC component.

### Result

```text
Static frontend assets:
LOADING

WAC application initialization:
FAILED / INCOMPLETE
```

---

# 10. Current Root-Cause Status

The root cause is **not yet conclusively identified**.

The following have been successfully verified:

```text
[✓] WAC installed
[✓] WAC service registered
[✓] WAC service starts
[✓] WAC01 domain joined
[✓] WAC01 DNS configured
[✓] VLAN 20 connectivity
[✓] HTTPS 443 reachable
[✓] Enterprise TLS certificate
[✓] Certificate private key
[✓] NETWORK SERVICE private-key access
[✓] Windows Authentication
[✓] WAC frontend static files
[✗] WAC frontend initialization
[?] Final root cause
```

---

# 11. 🟡 Work-In-Progress / Return Later

> ## ⚠️ WAC TROUBLESHOOTING PAUSED
>
> **This section is intentionally preserved so troubleshooting can resume later.**
>
> WAC deployment is **not considered complete**.
>
> The current symptom is:
>
> ```text
> WAC authentication succeeds
>             ↓
> WAC page loads
>             ↓
> "Starting Windows Admin Center..."
>             ↓
> UI never completes initialization
> ```
>
> The investigation has already verified the basic network, HTTPS, certificate, private-key permissions, Windows Authentication, service registration, and WAC installation components.
>
> **Next troubleshooting session:** resume from WAC application/UX initialization rather than repeating certificate installation and basic connectivity checks.

### Known troubleshooting evidence

```text
WAC version:
2.7.4.18

WAC hostname:
WAC01

WAC FQDN:
WAC01.CORP.AC-LAB.TOP

HTTPS:
443

Certificate:
5B544B1741C97FA870A92556AF8711C762794A3D

Service account:
NT AUTHORITY\NetworkService

Current browser symptom:
Starting Windows Admin Center...
```

### Do not repeat unnecessarily

The following have already been investigated:

- Certificate existence
- Certificate private key
- Certificate SAN
- Certificate EKU
- Certificate private-key ACL
- WAC service account
- WAC HTTPS port
- HTTP.SYS registration
- WAC installation directory
- WAC installation completion
- Browser InPrivate test

---

# 12. Remaining Work

The following items remain open.

## WAC Application

- [ ] Determine why WAC UX initialization does not complete
- [ ] Identify the JavaScript/application startup failure
- [ ] Review WAC application/UX logs
- [ ] Validate WAC gateway API/backend initialization
- [ ] Confirm WAC dashboard loads successfully

## Infrastructure Integration

Once WAC is operational:

- [ ] Add `DC01`
- [ ] Add `DC02` when available
- [ ] Add infrastructure servers
- [ ] Add Hyper-V management target
- [ ] Validate PowerShell management
- [ ] Validate server monitoring/management functions
- [ ] Validate storage management
- [ ] Validate networking management

## Security / Access

- [ ] Validate Windows Authentication
- [ ] Validate domain administrator access
- [ ] Validate least-privilege management access where applicable
- [ ] Validate HTTPS certificate trust from management clients

## Final Validation

- [ ] WAC dashboard loads
- [ ] Server connections succeed
- [ ] Hyper-V management succeeds
- [ ] PowerShell management succeeds
- [ ] HTTPS validated
- [ ] Authentication validated
- [ ] WAC event logs clean
- [ ] Documentation updated

---

# 13. Validation Commands

### WAC service

```powershell
Get-Service WindowsAdminCenter
```

**What it does:** verifies whether the WAC Windows service is running.

### WAC service account

```powershell
Get-CimInstance Win32_Service -Filter "Name='WindowsAdminCenter'" |
Select-Object Name, State, StartName, PathName
```

**What it does:** shows the WAC service state, account, and executable path.

### WAC certificate

```powershell
Get-ChildItem Cert:\LocalMachine\My |
Where-Object Thumbprint -eq "5B544B1741C97FA870A92556AF8711C762794A3D" |
Select-Object Subject, DnsNameList, Thumbprint, HasPrivateKey, NotBefore, NotAfter
```

**What it does:** verifies the WAC certificate identity, SAN, private key, and validity.

### HTTPS connectivity

```powershell
Test-NetConnection WAC01.CORP.AC-LAB.TOP -Port 443
```

**What it does:** verifies TCP connectivity to the WAC HTTPS endpoint.

---

# 14. Target WAC Access

```text
https://WAC01.CORP.AC-LAB.TOP
```

Authentication:

```text
Windows Authentication
```

---

# 15. Security Notes

The repository documentation should not contain:

- Passwords
- Private keys
- API tokens
- VPN secrets
- Sensitive credentials
- Unnecessary MAC addresses
- Other security-sensitive information

Private RFC1918 lab addressing may be documented where useful. This follows the network master-plan documentation policy. fileciteturn15file4

---

# 16. Completion Criteria

Volume 21 will only be marked **COMPLETE** when:

- [ ] WAC web interface loads successfully
- [ ] WAC authentication works
- [ ] HTTPS is validated
- [ ] WAC manages at least one Windows Server
- [ ] Hyper-V management is validated
- [ ] PowerShell/remote management is validated
- [ ] Required infrastructure targets are added
- [ ] Final validation is completed
- [ ] Architecture/documentation is updated

Until then:

> **🟡 Volume 21 — WORK IN PROGRESS / TROUBLESHOOTING REQUIRED**

---

# 17. Final Status

## 🟡 Volume 21 — Windows Admin Center

**Status: WORK IN PROGRESS**

WAC has been installed, domain-integrated, configured for HTTPS and Windows Authentication, and the enterprise certificate infrastructure has been validated.

However, the WAC web application currently remains stuck at:

```text
Starting Windows Admin Center...
```

The troubleshooting effort is intentionally paused.

**This volume is NOT complete.**

The lab roadmap should proceed without treating WAC as a completed dependency. When troubleshooting resumes, continue from **Section 11 – Work-In-Progress / Return Later** rather than restarting the entire deployment.
