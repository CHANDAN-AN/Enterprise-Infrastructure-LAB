# Volume 20 — Remote Desktop Services (RDS)

![Status](https://img.shields.io/badge/Status-Completed-success)
![Platform](https://img.shields.io/badge/Platform-Windows%20Server-blue)
![RDS](https://img.shields.io/badge/RDS-Remote%20Desktop%20Services-blue)

> **Purpose:** Build a practical, enterprise-style Remote Desktop Services (RDS) environment that provides centralized remote desktop and application access, while integrating with Active Directory Domain Services (AD DS), Public Key Infrastructure (PKI), Active Directory Certificate Services (AD CS), and Sophos firewall-based Virtual Local Area Network (VLAN) segmentation.

![Remote Desktop Services](https://github.com/CHANDAN-AN/Enterprise-Infrastructure-LAB/blob/main/volumes/20-Remote-Desktop-Services-RDS/screenshots/844.png)

---

## 1. What is RDS?

**RDS (Remote Desktop Services)** is a Microsoft Windows Server role that allows users and administrators to remotely access Windows desktops, applications, and server sessions.

RDS uses **RDP (Remote Desktop Protocol)** to establish remote sessions.

In this lab, RDS is used to provide:

- Remote desktop sessions
- Published applications through RemoteApp
- Centralized session management
- Web-based access through RD Web Access
- Centralized licensing
- Secure certificate-based access
- Controlled network access through Sophos

### RDS vs RDP

| Term | Meaning |
|---|---|
| RDS | Remote Desktop Services — the Windows Server service/platform |
| RDP | Remote Desktop Protocol — the protocol used for remote connections |
| RemoteApp | An individual application published through RDS |

---

# 2. Lab Architecture

```text
                         CORP.AC-LAB.TOP
                       Active Directory
                              │
               ┌──────────────┼──────────────┐
               │              │              │
               ▼              ▼              ▼
             DC01           DC02           CA01
          Domain          Domain       Certificate
        Controller       Controller      Authority
                                             │
                                             │ PKI
                                             ▼
                                      ┌───────────────┐
                                      │     RDS01     │
                                      │               │
                                      │ 10.10.30.121  │
                                      │ VLAN 30       │
                                      │               │
                                      │ RDS Session   │
                                      │ Host          │
                                      │ Connection    │
                                      │ Broker        │
                                      │ Web Access    │
                                      │ Licensing     │
                                      └───────┬───────┘
                                              │
                                         RDS-Production
                                              │
                                              ▼
                                           RemoteApp
                                           Notepad
                                              ▲
                                              │
                                          TCP 443
                                              │
                                      ┌───────┴───────┐
                                      │    Sophos     │
                                      │    Firewall   │
                                      └───────┬───────┘
                                              │
                                              ▼
                                      ┌───────────────┐
                                      │   CLIENT-01   │
                                      │ 10.10.40.100  │
                                      │    VLAN 40    │
                                      └───────────────┘
```

---

# 3. Environment

| Component | Configuration |
|---|---|
| Domain | `CORP.AC-LAB.TOP` |
| RDS Server | `RDS01.CORP.AC-LAB.TOP` |
| RDS IP | `10.10.30.121` |
| RDS VLAN | VLAN 30 — Production Servers |
| Client | `CLIENT-01` |
| Client IP | `10.10.40.100` |
| Client VLAN | VLAN 40 — Corporate Clients |
| Domain Controllers | `DC01`, `DC02` |
| Certificate Authority | `CA01.CORP.AC-LAB.TOP` |
| Certification Authority | `CORP-CA01-CA` |
| RDS Collection | `RDS-Production` |
| Collection Type | `PooledUnmanaged` |
| RemoteApp | Notepad |
| Licensing | Per User |
| License Server | `RDS01.CORP.AC-LAB.TOP` |

---

# 4. RDS Roles

The deployment uses the following RDS roles.

### Remote Desktop Session Host

The **RD Session Host** runs the Windows desktop sessions and published applications.

In this lab:

```text
RDS01.CORP.AC-LAB.TOP
```

### Remote Desktop Connection Broker

The **RD Connection Broker** manages connections, sessions, collections, and session routing.

### Remote Desktop Web Access

The **RD Web Access** role provides the web portal through which users can access published RemoteApp and Remote Desktop resources.

```text
https://rds01.corp.ac-lab.top/RDWeb
```

### Remote Desktop Licensing

The **RD Licensing** role manages Remote Desktop Services Client Access License (RDS CAL) licensing.

This lab uses:

```text
Per User
```

---

# 5. Prerequisites

Before deploying RDS, verify:

- Windows Server is installed.
- The server is joined to `CORP.AC-LAB.TOP`.
- Domain Name System (DNS) is functioning.
- The RDS server has a static Internet Protocol (IP) address.
- Active Directory Domain Services (AD DS) is available.
- An Enterprise Certification Authority (CA) is available.
- Required firewall communication is permitted.
- The RDS server can resolve the domain and required infrastructure servers.

Verify DNS:

```powershell
Resolve-DnsName rds01.corp.ac-lab.top
```

**What it does:** confirms that Domain Name System (DNS) resolves the RDS server correctly.

---

# 6. Deploy RDS

Install the required Remote Desktop Services roles on the RDS server.

The resulting deployment contains:

```text
RDS01.CORP.AC-LAB.TOP

Remote Desktop Session Host
Remote Desktop Connection Broker
Remote Desktop Web Access
Remote Desktop Licensing
```

Verify:

```powershell
Get-RDServer
```

**What it does:** displays the servers participating in the Remote Desktop Services deployment and their assigned RDS roles.

---

# 7. Create the RDS Session Collection

Create the production collection:

```text
RDS-Production
```

The collection contains:

```text
RDS01.CORP.AC-LAB.TOP
```

Verify:

```powershell
Get-RDSessionCollection `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**What it does:** displays the Remote Desktop Services session collections configured in the deployment.

Verify the Session Host:

```powershell
Get-RDSessionHost `
    -CollectionName "RDS-Production" `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**What it does:** confirms which server is acting as the Session Host for the collection and whether new connections are allowed.

---

# 8. Configure RemoteApp

A RemoteApp publishes an individual Windows application instead of presenting the entire server desktop.

For this lab:

```text
Application:
Notepad
```

The application is published through:

```text
RDS-Production
```

The expected user flow is:

```text
Client
  ↓
RD Web Access
  ↓
RemoteApp
  ↓
Connection Broker
  ↓
RDS-Production
  ↓
RDS01 Session Host
  ↓
Notepad
```

The Notepad RemoteApp was successfully launched as part of final validation.

---

# 9. Enterprise Certificate Integration

RDS Web Access and other RDS components should use a certificate trusted by the enterprise rather than relying on an automatically generated self-signed certificate.

This lab uses:

```text
Certification Authority:
CORP-CA01-CA
```

A dedicated certificate template was created:

```text
CORP RDS Server Certificate
```

The certificate was configured for:

```text
Subject:
CN=RDS01.CORP.AC-LAB.TOP

Subject Alternative Name (SAN):
DNS=RDS01.CORP.AC-LAB.TOP

Enhanced Key Usage (EKU):
Server Authentication
```

---

# 10. Verify the RDS Certificate

The final certificate installed on RDS01 is:

```text
Subject:
CN=RDS01.CORP.AC-LAB.TOP

Issuer:
CN=CORP-CA01-CA, DC=CORP, DC=AC-LAB, DC=TOP

Thumbprint:
8F02CDF059CD60657C58AE0ADD21414E66C3D447

Valid:
08/09/2026 – 08/08/2028
```

Verify it:

```powershell
Get-ChildItem Cert:\LocalMachine\My\8F02CDF059CD60657C58AE0ADD21414E66C3D447 |
Format-List Subject,Issuer,Thumbprint,HasPrivateKey,EnhancedKeyUsageList,DnsNameList,NotBefore,NotAfter
```

**What it does:** verifies the RDS certificate identity, issuing Certificate Authority (CA), private key, Server Authentication purpose, and validity period.

---

# 11. Assign the RDS Certificate

Assign the enterprise certificate to the RDS roles.

## RD Redirector

```powershell
Set-RDCertificate -Role RDRedirector `
    -Thumbprint 8F02CDF059CD60657C58AE0ADD21414E66C3D447 `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP" `
    -Force
```

**What it does:** assigns the enterprise-issued certificate to the Remote Desktop Redirector role.

## RD Publishing

```powershell
Set-RDCertificate -Role RDPublishing `
    -Thumbprint 8F02CDF059CD60657C58AE0ADD21414E66C3D447 `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP" `
    -Force
```

**What it does:** assigns the enterprise-issued certificate to the Remote Desktop Publishing role.

## RD Web Access

```powershell
Set-RDCertificate -Role RDWebAccess `
    -Thumbprint 8F02CDF059CD60657C58AE0ADD21414E66C3D447 `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP" `
    -Force
```

**What it does:** assigns the enterprise-issued certificate to Remote Desktop Web Access.

Verify all roles:

```powershell
Get-RDCertificate `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**What it does:** displays the certificate status for the RDS deployment roles.

Expected:

```text
RDRedirector   Trusted
RDPublishing   Trusted
RDWebAccess    Trusted
```

Remote Desktop Gateway (RD Gateway) is not used in this laboratory deployment.

---

# 12. Configure RDS Licensing

The deployment uses:

```text
Per User
```

License server:

```text
RDS01.CORP.AC-LAB.TOP
```

Verify:

```powershell
Get-RDLicenseConfiguration
```

**What it does:** displays the configured Remote Desktop Services licensing mode and license server.

Expected:

```text
Mode      LicenseServer
----      -------------
PerUser   {RDS01.CORP.AC-LAB.TOP}
```

Verify the licensing service:

```powershell
Get-Service TermServLicensing
```

**What it does:** confirms that the Remote Desktop Licensing service is running.

Expected:

```text
Running
```

---

# 13. Verify the Actual RDSH Licensing Mode

The Remote Desktop Session Host (RDSH) configuration must agree with the deployment licensing configuration.

Check it with:

```powershell
$obj = Get-CimInstance `
    -Namespace "Root/CIMV2/TerminalServices" `
    -ClassName Win32_TerminalServiceSetting

$obj | Select-Object LicensingType
```

**What it does:** reads the actual licensing mode configured on the Remote Desktop Session Host.

The final configuration is:

```text
LicensingType:
2
```

The deployment configuration is:

```text
Per User
```

and the license server is:

```text
RDS01.CORP.AC-LAB.TOP
```

---

# 14. Sophos Firewall Integration

RDS01 is located in the Production Servers Virtual Local Area Network (VLAN):

```text
VLAN 30
10.10.30.0/24
```

The corporate client is located in:

```text
VLAN 40
10.10.40.0/24
```

The required traffic is:

```text
CLIENT-01
10.10.40.100
       │
       │ HTTPS
       │ TCP 443
       ▼
Sophos Firewall
       │
       │ Inter-VLAN Routing
       ▼
RDS01
10.10.30.121
```

A specific Sophos firewall rule was created to permit the required client-to-RDS Hypertext Transfer Protocol Secure (HTTPS) traffic.

The design intentionally avoids an unrestricted:

```text
Any → Any
```

rule.

---

# 15. Validate RDS Network Connectivity

Verify TCP 443:

```powershell
Test-NetConnection rds01.corp.ac-lab.top -Port 443
```

**What it does:** tests whether the client can reach Remote Desktop Web Access on Hypertext Transfer Protocol Secure (HTTPS) port 443.

Expected:

```text
TcpTestSucceeded : True
```

Verify Domain Name System (DNS):

```powershell
Resolve-DnsName rds01.corp.ac-lab.top
```

**What it does:** confirms that the RDS Fully Qualified Domain Name (FQDN) resolves to the correct server address.

---

# 16. Access RD Web

Open:

```text
https://rds01.corp.ac-lab.top/RDWeb
```

The Remote Desktop Web Access portal should display the published RemoteApp.

The user authenticates using the domain account and can launch the published application.

---

# 17. End-to-End Validation

The following complete path was validated:

```text
CLIENT-01
    │
    │ DNS
    ▼
rds01.corp.ac-lab.top
    │
    │ HTTPS / TCP 443
    ▼
Sophos Firewall
    │
    │ Inter-VLAN Routing
    ▼
RDS01
    │
    ├── RD Web Access
    ├── RD Connection Broker
    ├── RD Session Host
    └── RD Licensing
            │
            ▼
      RDS-Production
            │
            ▼
        RemoteApp
            │
            ▼
         Notepad
```

Validation results:

| Test | Result |
|---|---|
| DNS resolution | PASS |
| RDS deployment | PASS |
| RDS Session Host | PASS |
| RDS Connection Broker | PASS |
| RD Web Access | PASS |
| RDS collection | PASS |
| RemoteApp publication | PASS |
| RemoteApp launch | PASS |
| Enterprise certificate | PASS |
| Certificate trust | PASS |
| RDS licensing | PASS |
| License server | PASS |
| Licensing service | PASS |
| Sophos inter-VLAN connectivity | PASS |
| HTTPS TCP 443 | PASS |

---

# 18. Useful Validation Commands

### RDS deployment

```powershell
Get-RDServer
```

**Purpose:** displays the RDS deployment servers and roles.

### RDS collections

```powershell
Get-RDSessionCollection `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**Purpose:** displays configured RDS collections.

### Session Hosts

```powershell
Get-RDSessionHost `
    -CollectionName "RDS-Production" `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**Purpose:** verifies the Session Host assigned to the collection.

### RDS certificates

```powershell
Get-RDCertificate `
    -ConnectionBroker "RDS01.CORP.AC-LAB.TOP"
```

**Purpose:** verifies certificate status for RDS roles.

### Licensing

```powershell
Get-RDLicenseConfiguration
```

**Purpose:** verifies the licensing mode and license server.

### Licensing service

```powershell
Get-Service TermServLicensing
```

**Purpose:** verifies that Remote Desktop Licensing is running.

### Network connectivity

```powershell
Test-NetConnection rds01.corp.ac-lab.top -Port 443
```

**Purpose:** verifies HTTPS connectivity to RDS Web Access.

---

# 19. Final Configuration

```text
Domain:
CORP.AC-LAB.TOP

RDS Server:
RDS01.CORP.AC-LAB.TOP

IP Address:
10.10.30.121

VLAN:
VLAN 30 — Production Servers

RDS Collection:
RDS-Production

Collection Type:
PooledUnmanaged

RemoteApp:
Notepad

Licensing:
Per User

License Server:
RDS01.CORP.AC-LAB.TOP

Certificate Authority:
CORP-CA01-CA

Certificate Template:
CORP RDS Server Certificate

RDS Certificate:
8F02CDF059CD60657C58AE0ADD21414E66C3D447

Certificate Validity:
08/09/2026 – 08/08/2028
```

---

# 20. Completion Checklist

- [x] Remote Desktop Services (RDS) deployed
- [x] Remote Desktop Session Host configured
- [x] Remote Desktop Connection Broker configured
- [x] Remote Desktop Web Access configured
- [x] Remote Desktop Licensing configured
- [x] RDS-Production collection created
- [x] Session Host added
- [x] RemoteApp published
- [x] Notepad RemoteApp tested
- [x] Enterprise Certificate Authority integrated
- [x] RDS certificate template created
- [x] RDS certificate enrolled
- [x] RDS certificate assigned
- [x] Certificate trust validated
- [x] Per User licensing configured
- [x] License server configured
- [x] Sophos inter-VLAN access configured
- [x] HTTPS TCP 443 validated
- [x] RD Web Access validated
- [x] End-to-end RemoteApp validated

---

# 21. Final Status

## 🟢 Volume 20 — Remote Desktop Services (RDS)

**Status: COMPLETE**

The laboratory now has a functional enterprise-style Remote Desktop Services (RDS) deployment integrated with:

- Active Directory Domain Services (AD DS)
- Domain Name System (DNS)
- Active Directory Certificate Services (AD CS)
- Public Key Infrastructure (PKI)
- Sophos Firewall
- Virtual Local Area Network (VLAN) segmentation

The deployment provides centralized remote access and RemoteApp delivery while maintaining controlled network access and enterprise certificate trust.

---