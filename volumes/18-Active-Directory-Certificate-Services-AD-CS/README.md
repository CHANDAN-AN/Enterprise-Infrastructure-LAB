# Volume 18 – Active Directory Certificate Services (AD CS)

> **Enterprise Public Key Infrastructure (PKI) | Microsoft Enterprise CA | Certificate Auto-Enrollment | TLS Certificates | Sophos Firewall | Proxmox VE**

---

## 📌 Project Summary

This volume implements a Microsoft Active Directory-integrated **Public Key Infrastructure (PKI)** for the `CORP.AC-LAB.TOP` enterprise lab.

The project went beyond simply installing Active Directory Certificate Services. A functioning **Enterprise Root Certification Authority** was deployed and integrated with Active Directory, certificate templates and auto-enrollment were configured, certificates were issued to Windows infrastructure, and the PKI was extended to non-domain infrastructure appliances.

The internal Certificate Authority was then used to replace untrusted/self-signed HTTPS certificates on the **Sophos Firewall** and **Proxmox VE** management interfaces with certificates issued by the organization's own trusted CA.

### Key engineering work completed

- Deployed **CA01 (Certificate Authority)** as the Microsoft Enterprise Root CA.
- Integrated AD CS with the `CORP.AC-LAB.TOP` Active Directory domain.
- Configured enterprise certificate templates.
- Enabled certificate auto-enrollment through Group Policy.
- Enrolled certificates for domain controllers, servers and workstations.
- Configured the Web Server certificate template for infrastructure appliances.
- Generated private keys and Certificate Signing Requests (CSRs) on Linux-based Proxmox VE nodes.
- Submitted external CSRs to the Microsoft Enterprise CA using `certreq`.
- Issued certificates containing appropriate DNS Subject Alternative Names (SANs).
- Replaced Proxmox VE self-signed management certificates with enterprise CA-issued certificates.
- Deployed an enterprise CA-issued certificate to **FW01 (Sophos Firewall)**.
- Validated certificate/private-key matching using OpenSSL.
- Validated certificate subjects, issuers, SANs and trust chains.
- Verified trusted HTTPS access from domain workstations.

---

# 🏆 Result

The environment moved from isolated systems using locally generated/self-signed HTTPS certificates to a centrally managed enterprise trust model.

| Component | Before AD CS | After AD CS |
|---|---|---|
| CA01 (Certificate Authority) | No enterprise PKI | Enterprise Root CA operational |
| DC01 (Domain Controller) | Domain services without centrally managed certificate enrollment | Enterprise certificate issued through internal PKI |
| DC02 (Domain Controller) | Domain services without centrally managed certificate enrollment | Enterprise certificate issued through internal PKI |
| Domain Servers | No centralized certificate lifecycle | Certificates issued through Enterprise CA |
| Domain Workstations | No centralized enrollment | Certificate auto-enrollment through GPO |
| FW01 (Sophos Firewall) | HTTPS management interface using untrusted/self-signed certificate | Trusted certificate issued by CORP-CA01-CA |
| PROXMOX01 | Proxmox-generated self-signed web certificate | Enterprise CA-issued TLS certificate |
| PROXMOX02 | Proxmox-generated self-signed web certificate | Enterprise CA-issued TLS certificate |
| PROXMOX03 | Proxmox-generated self-signed web certificate | Enterprise CA-issued TLS certificate |
| Browser Experience | Certificate warnings / `Not secure` | Trusted HTTPS when accessed through certificate DNS name |
| Certificate Management | Independent/self-signed certificates | Centralized Microsoft Enterprise PKI |

---

# 🏗 Architecture

```text
                         CORP.AC-LAB.TOP
                               │
                    Active Directory Domain
                               │
                 ┌─────────────┴─────────────┐
                 │                           │
                DC01                       DC02
        (Domain Controller)        (Domain Controller)
                 │
                 │ Active Directory
                 │
                 ▼
              CA01
      (Certificate Authority)
     Microsoft Enterprise Root CA
              CORP-CA01-CA
                 │
       ┌─────────┼───────────────┐
       │         │               │
       │         │               │
       ▼         ▼               ▼
   Windows    FW01           Proxmox Cluster
   Systems   (Sophos)        │      │      │
                              ▼      ▼      ▼
                            PVE01  PVE02  PVE03

                  Enterprise Certificates
                           │
                           ▼
                     Trusted HTTPS
```

---

# 🔐 PKI Information

| Setting | Configuration |
|---|---|
| Active Directory Domain | `CORP.AC-LAB.TOP` |
| Certification Authority Server | CA01 (Certificate Authority) |
| CA Type | Enterprise Root CA |
| CA Name | `CORP-CA01-CA` |
| Domain Controller | DC01 (Domain Controller) |
| Secondary Domain Controller | DC02 (Domain Controller) |
| Certificate Services | Microsoft Active Directory Certificate Services |
| PKI Type | Internal Enterprise PKI |
| Appliance Certificate Template | Web Server |
| Proxmox Key Type | RSA |
| Proxmox Key Size | 4096-bit |
| Proxmox Certificate Lifetime Observed | 2026-2028 |
| Certificate Hash Algorithm | SHA-256 |

---

# 1. Install Active Directory Certificate Services

## Server

The AD CS role was installed on:

```text
CA01 (Certificate Authority)
```

CA01 is a domain-joined Windows Server in:

```text
CORP.AC-LAB.TOP
```

---

## GUI Installation

On **CA01 (Certificate Authority)**:

Open:

```text
Server Manager
    ↓
Manage
    ↓
Add Roles and Features
```

Select:

```text
Role-based or feature-based installation
```

Select:

```text
CA01
```

Under **Server Roles**, enable:

```text
Active Directory Certificate Services
```

Accept the required management tools.

Continue through the wizard.

Under AD CS Role Services select:

```text
Certification Authority
```

Install the role.

---

# 2. Configure the Certification Authority

After installation, Server Manager displays the AD CS post-deployment configuration notification.

Select:

```text
Configure Active Directory Certificate Services
```

Use an account with the appropriate enterprise administrative permissions.

Configure:

```text
Role Service:
Certification Authority
```

CA type:

```text
Enterprise CA
```

CA hierarchy:

```text
Root CA
```

Private key:

```text
Create a new private key
```

The resulting CA was:

```text
CORP-CA01-CA
```

CA01 now functions as:

```text
CA01
(Certificate Authority)
        │
        └── CORP-CA01-CA
             Enterprise Root CA
```

---

# 3. Verify the Certification Authority

Open:

```text
Server Manager
    ↓
Tools
    ↓
Certification Authority
```

The console should display:

```text
Certification Authority (Local)
└── CORP-CA01-CA
    ├── Revoked Certificates
    ├── Issued Certificates
    ├── Pending Requests
    ├── Failed Requests
    └── Certificate Templates
```

This console became the central administrative interface for the internal PKI.

---

# 4. Verify CA Configuration

On **CA01 (Certificate Authority)**:

```powershell
certutil -config - -ping
```

Certificate templates can also be inspected using:

```powershell
certutil -template
```

This allowed the templates and their enrollment permissions to be reviewed.

---

# 5. Certificate Templates

The Enterprise CA provides certificate templates that control:

- certificate purpose
- key usage
- enrollment permissions
- auto-enrollment
- certificate lifetime
- cryptographic settings
- subject configuration

Open:

```text
Certification Authority
    ↓
CORP-CA01-CA
    ↓
Certificate Templates
```

Certificate template management can be opened with:

```powershell
certtmpl.msc
```

---

# 6. Domain Computer Certificate Enrollment

Certificate enrollment was configured for Active Directory systems.

The PKI supports certificates for systems including:

```text
DC01
DC02
FS01
FS02
WSUS01
ADMIN-01
CLIENT-01
```

The CA console was used to verify issued certificates.

---

# 7. Group Policy Auto-Enrollment

Certificate auto-enrollment was configured through Group Policy.

Open:

```powershell
gpmc.msc
```

Navigate to the applicable domain computer policy:

```text
Computer Configuration
    ↓
Policies
    ↓
Windows Settings
    ↓
Security Settings
    ↓
Public Key Policies
```

Configure:

```text
Certificate Services Client – Auto-Enrollment
```

Set:

```text
Configuration Model:
Enabled
```

Enable:

```text
Renew expired certificates,
update pending certificates,
and remove revoked certificates
```

and:

```text
Update certificates that use certificate templates
```

---

# 8. Force Group Policy Update

On a domain computer:

```powershell
gpupdate /force
```

Certificate auto-enrollment can also be triggered with:

```powershell
certutil -pulse
```

---

# 9. Verify Computer Certificates

Open the Local Computer certificate store:

```powershell
certlm.msc
```

Navigate to:

```text
Certificates (Local Computer)
    ↓
Personal
    ↓
Certificates
```

The enrolled machine certificate should appear.

The trusted CA can also be inspected under:

```text
Trusted Root Certification Authorities
    ↓
Certificates
```

---

# 10. Enterprise PKI Trust Model

Domain-joined systems trust the Enterprise CA through Active Directory.

The resulting trust model is:

```text
CORP-CA01-CA
      │
      ├── DC01
      ├── DC02
      ├── FS01
      ├── FS02
      ├── WSUS01
      ├── ADMIN-01
      ├── CLIENT-01
      ├── FW01
      ├── PROXMOX01
      ├── PROXMOX02
      └── PROXMOX03
```

---

# 11. Web Server Certificate Template

A Web Server certificate template was used for HTTPS infrastructure services.

Open:

```powershell
certtmpl.msc
```

Locate:

```text
Web Server
```

The template provides certificates suitable for:

```text
Server Authentication
```

The template was made available through the Enterprise CA.

From the Certification Authority console:

```text
Certificate Templates
    ↓
Right-click
    ↓
New
    ↓
Certificate Template to Issue
```

Select:

```text
Web Server
```

This allowed CSRs from appliances such as Sophos Firewall and Proxmox VE to be signed by the Microsoft Enterprise CA.

---

# 12. Securing FW01 (Sophos Firewall)

## Objective

FW01 originally presented its own locally generated/self-signed HTTPS certificate.

As a result, administrative access to the firewall produced browser certificate warnings.

The objective was:

```text
BEFORE

Administrator
     │
     │ HTTPS
     ▼
FW01.CORP.AC-LAB.TOP
     │
     └── Self-Signed Certificate
              │
              ▼
        Browser Warning
```

After PKI integration:

```text
AFTER

CA01 (Certificate Authority)
        │
        │ Issues Certificate
        ▼
FW01.CORP.AC-LAB.TOP
        │
        │ Trusted HTTPS
        ▼
Administrator Workstation
```

---

# 13. Generate Certificate Request for FW01

The certificate request was generated for the Sophos Firewall using its DNS identity.

The certificate must represent the DNS name actually used by administrators.

Example:

```text
FW01.CORP.AC-LAB.TOP
```

The CSR was then submitted to:

```text
CA01 (Certificate Authority)
```

using the Microsoft Web Server certificate template.

---

# 14. Submit FW01 CSR to CA01

Copy the firewall CSR to a Windows administrative system with access to the Enterprise CA.

Example location:

```text
C:\Temp\
```

Submit the request:

```powershell
certreq -submit -attrib "CertificateTemplate:WebServer" C:\Temp\fw01.csr C:\Temp\fw01.cer
```

Select:

```text
CORP-CA01-CA
```

if prompted for a Certification Authority.

A successful request returns output similar to:

```text
Certificate retrieved(Issued)
```

---

# 15. Verify FW01 Certificate

Inspect the resulting certificate:

```powershell
certutil -dump C:\Temp\fw01.cer
```

Verify:

```text
Issuer:
CORP-CA01-CA

Subject:
FW01.CORP.AC-LAB.TOP

Enhanced Key Usage:
Server Authentication
```

Also confirm that the required DNS identity exists in the certificate's Subject Alternative Name.

---

# 16. Import Certificate into Sophos Firewall

Log into:

```text
FW01 (Sophos Firewall)
```

Open the certificate management area in the Sophos WebAdmin interface.

Import the CA-issued certificate together with the corresponding private key where required by the Sophos import workflow.

The certificate should represent:

```text
FW01.CORP.AC-LAB.TOP
```

and be issued by:

```text
CORP-CA01-CA
```

---

# 17. Assign the Certificate to Sophos WebAdmin

After importing the certificate, configure the firewall's administrative HTTPS service to use the newly imported certificate.

The logical process is:

```text
Sophos Firewall
      ↓
Administration / Admin Settings
      ↓
WebAdmin Certificate
      ↓
Select CA-issued FW01 Certificate
      ↓
Apply
```

Reconnect using the FQDN:

```text
https://FW01.CORP.AC-LAB.TOP
```

The browser should now trust the certificate from a workstation that trusts `CORP-CA01-CA`.

---

# 18. Validate FW01

Verify:

```text
Certificate Issuer:
CORP-CA01-CA

DNS Identity:
FW01.CORP.AC-LAB.TOP

Browser:
Trusted HTTPS
```

The important point is that administrators must connect using a hostname contained in the certificate.

Using the IP address instead may still cause a certificate-name mismatch.

---

# 19. PROXMOX01 Certificate Deployment

Proxmox VE normally creates its own certificate for the management interface.

The goal was to replace it with a certificate issued by:

```text
CA01 (Certificate Authority)
CORP-CA01-CA
```

PROXMOX01 was running:

```text
Proxmox VE 9.2.5
```

Verified with:

```bash
pveversion
```

Observed output:

```text
pve-manager/9.2.5/20242970da7fbcef
(running kernel: 7.0.14-8-pve)
```

---

# 20. Generate PROXMOX01 Private Key

On **PROXMOX01**:

```bash
openssl genrsa -out /root/proxmox01.key 4096
```

The private key remains on PROXMOX01.

This is important because the private key should not be transferred to the CA unnecessarily.

---

# 21. Generate PROXMOX01 CSR

Generate the CSR with the server FQDN and Subject Alternative Names.

The certificate identity used was:

```text
PROXMOX01.CORP.AC-LAB.TOP
```

SANs:

```text
DNS:PROXMOX01.CORP.AC-LAB.TOP
DNS:PROXMOX01
```

The CSR was stored as:

```text
/root/proxmox01.csr
```

A representative OpenSSL request configuration is:

```ini
[req]
default_bits = 4096
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[dn]
C = CA
ST = Ontario
L = Toronto
O = CORP
OU = IT
CN = PROXMOX01.CORP.AC-LAB.TOP

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = PROXMOX01.CORP.AC-LAB.TOP
DNS.2 = PROXMOX01
```

Generate the CSR:

```bash
openssl req -new \
-key /root/proxmox01.key \
-out /root/proxmox01.csr \
-config /root/proxmox01.cnf
```

---

# 22. Verify PROXMOX01 CSR SANs

Before submitting the CSR:

```bash
openssl req -in /root/proxmox01.csr -noout -text | grep -A2 "Subject Alternative Name"
```

Expected:

```text
X509v3 Subject Alternative Name:
    DNS:PROXMOX01.CORP.AC-LAB.TOP, DNS:PROXMOX01
```

---

# 23. Transfer PROXMOX01 CSR to Windows

The CSR was transferred to a Windows administrative system.

Example destination:

```text
C:\Temp\proxmox01.csr
```

The private key:

```text
/root/proxmox01.key
```

remained on PROXMOX01.

---

# 24. Submit PROXMOX01 CSR to CA01

From Windows PowerShell:

```powershell
certreq -submit -attrib "CertificateTemplate:WebServer" C:\Temp\proxmox01.csr C:\Temp\proxmox01.cer
```

The request is submitted to:

```text
CA01 (Certificate Authority)
    ↓
CORP-CA01-CA
```

A successful request returns:

```text
Certificate retrieved(Issued)
```

---

# 25. Verify PEM Certificate Format

The returned certificate was checked:

```powershell
Get-Content C:\Temp\proxmox01.cer -First 2
```

A PEM-formatted certificate begins with:

```text
-----BEGIN CERTIFICATE-----
```

---

# 26. Transfer Certificate Back to PROXMOX01

Transfer:

```text
proxmox01.cer
```

back to PROXMOX01.

The certificate was prepared as:

```text
/root/proxmox01-fixed.pem
```

During this process, an attempted Base64 decode returned:

```bash
base64 -d /root/proxmox01.pem > /root/proxmox01-fixed.pem
```

with:

```text
base64: invalid input
```

The certificate was subsequently corrected into valid PEM format before installation.

---

# 27. Validate PROXMOX01 Certificate

On PROXMOX01:

```bash
openssl x509 -in /root/proxmox01-fixed.pem -noout -subject -issuer
```

Actual result:

```text
subject=C=CA, ST=Ontario, L=Toronto, O=CORP, OU=IT, CN=PROXMOX01.CORP.AC-LAB.TOP

issuer=DC=TOP, DC=AC-LAB, DC=CORP, CN=CORP-CA01-CA
```

This confirmed that the certificate belonged to PROXMOX01 and had been issued by the internal Enterprise CA.

---

# 28. Verify Certificate and Private Key Match

Before installing the certificate, the public modulus of the certificate was compared with the modulus of the private key.

Certificate:

```bash
openssl x509 -noout -modulus -in /root/proxmox01-fixed.pem | openssl sha256
```

Private key:

```bash
openssl rsa -noout -modulus -in /root/proxmox01.key | openssl sha256
```

Actual result:

```text
SHA2-256(stdin)= 547bcda404f4a088c0d6fde06027bbe96453a66c1e47c6f6d6d1b491bf780de0
SHA2-256(stdin)= 547bcda404f4a088c0d6fde06027bbe96453a66c1e47c6f6d6d1b491bf780de0
```

The hashes matched.

Therefore:

```text
Certificate Public Key
        =
PROXMOX01 Private Key
```

This was an important validation step before replacing the Proxmox web certificate.

---

# 29. Install Certificate on PROXMOX01

The custom certificate was installed with:

```bash
pvenode cert set /root/proxmox01-fixed.pem /root/proxmox01.key --force
```

Proxmox reported:

```text
Setting custom certificate files
```

The installed certificate information showed:

```text
filename:
pveproxy-ssl.pem

subject:
/C=CA/ST=Ontario/L=Toronto/O=CORP/OU=IT/CN=PROXMOX01.CORP.AC-LAB.TOP

issuer:
/DC=TOP/DC=AC-LAB/DC=CORP/CN=CORP-CA01-CA

public-key-type:
rsaEncryption

public-key-bits:
4096
```

SANs:

```text
PROXMOX01.CORP.AC-LAB.TOP
PROXMOX01
```

Validity:

```text
Not Before:
2026-08-01 22:58:30

Not After:
2028-07-31 22:58:30
```

---

# 30. Restart Proxmox Web Proxy

Restart:

```bash
systemctl restart pveproxy
```

Check status:

```bash
systemctl status pveproxy
```

Actual result:

```text
Active: active (running)
```

The service confirmed:

```text
Using '/etc/pve/local/pveproxy-ssl.pem' as certificate for the web interface.
```

This confirmed that the Proxmox management interface was using the custom enterprise certificate.

---

# 31. Validate PROXMOX01 HTTPS

Access:

```text
https://proxmox01.corp.ac-lab.top:8006
```

The browser should now show a trusted HTTPS connection from domain systems trusting `CORP-CA01-CA`.

---

# 32. PROXMOX02 Certificate Deployment

PROXMOX02 was configured using the same enterprise certificate process.

The certificate identity was:

```text
PROXMOX02.CORP.AC-LAB.TOP
```

SANs:

```text
DNS:PROXMOX02.CORP.AC-LAB.TOP
DNS:PROXMOX02
```

---

# 33. Generate PROXMOX02 Private Key

On PROXMOX02:

```bash
openssl genrsa -out /root/proxmox02.key 4096
```

---

# 34. Generate PROXMOX02 CSR

The CSR was generated as:

```text
/root/proxmox02.csr
```

with:

```text
CN=PROXMOX02.CORP.AC-LAB.TOP
```

and SANs:

```text
PROXMOX02.CORP.AC-LAB.TOP
PROXMOX02
```

---

# 35. Verify PROXMOX02 CSR

The SANs were verified using:

```bash
openssl req -in /root/proxmox02.csr -noout -text | grep -A2 "Subject Alternative Name"
```

Actual output:

```text
X509v3 Subject Alternative Name:
    DNS:PROXMOX02.CORP.AC-LAB.TOP, DNS:PROXMOX02
Signature Algorithm: sha256WithRSAEncryption
```

The CSR was therefore ready for CA submission.

---

# 36. Submit PROXMOX02 CSR

The CSR was copied to Windows:

```text
C:\Temp\proxmox02.csr
```

It was submitted using:

```powershell
certreq -submit -attrib "CertificateTemplate:WebServer" C:\Temp\proxmox02.csr C:\Temp\proxmox02.cer
```

CA response:

```text
RequestId: 22
Certificate retrieved(Issued)
```

This confirmed successful issuance from:

```text
CA01 (Certificate Authority)
CORP-CA01-CA
```

---

# 37. Verify PROXMOX02 Certificate Format

On Windows:

```powershell
Get-Content C:\Temp\proxmox02.cer -First 2
```

Actual output:

```text
-----BEGIN CERTIFICATE-----
MIIHsDCCBZigAwIBAgIT...
```

Therefore the certificate was already PEM encoded.

---

# 38. Install PROXMOX02 Certificate Through GUI

Unlike PROXMOX01, PROXMOX02 was deployed using the Proxmox GUI.

Open:

```text
PROXMOX02
    ↓
System
    ↓
Certificates
```

Click:

```text
Upload Custom Certificate
```

The dialog provides:

```text
Private Key (Optional)
```

and:

```text
Certificate Chain
```

Use:

```text
From File
```

to upload the required certificate/key material.

The certificate issued by `CORP-CA01-CA` was installed as the custom Proxmox web certificate.

---

# 39. Verify PROXMOX02 Certificate in GUI

Navigate to:

```text
PROXMOX02
    ↓
System
    ↓
Certificates
```

Select:

```text
pveproxy-ssl.pem
```

Choose:

```text
View Certificate
```

The installed certificate displayed:

```text
Name:
pveproxy-ssl.pem

Issuer:
/DC=TOP/DC=AC-LAB/DC=CORP/CN=CORP-CA01-CA

Subject:
/C=CA/ST=Ontario/L=Toronto/O=CORP/OU=IT/CN=PROXMOX02.CORP.AC-LAB.TOP

Public Key Type:
rsaEncryption

Public Key Size:
4096
```

Validity:

```text
Valid Since:
2026-08-01 23:16:42

Expires:
2028-07-31 23:16:42
```

Subject Alternative Names:

```text
PROXMOX02.CORP.AC-LAB.TOP
PROXMOX02
```

---

# 40. Validate PROXMOX02 HTTPS

Reconnect using:

```text
https://proxmox02.corp.ac-lab.top:8006
```

The browser then displayed the HTTPS padlock without the previous certificate warning.

This confirmed all three conditions were satisfied:

```text
✓ Trusted issuing CA
✓ Correct certificate chain
✓ DNS hostname matches certificate SAN
```

---

# 41. PROXMOX03

PROXMOX03 was subsequently configured using the same PKI workflow.

Certificate identity:

```text
PROXMOX03.CORP.AC-LAB.TOP
```

The process follows:

```text
Generate Private Key
        ↓
Generate CSR
        ↓
Include FQDN + Hostname SAN
        ↓
Submit CSR to CA01 (Certificate Authority)
        ↓
Issue using Web Server Template
        ↓
Install Custom Certificate
        ↓
Validate HTTPS
```

---

# 42. Proxmox Certificate Workflow Summary

```text
PROXMOX01 / 02 / 03
        │
        │ Generate 4096-bit RSA Private Key
        ▼
      Private Key
        │
        │ Generate CSR
        ▼
       CSR
        │
        │ Transfer CSR only
        ▼
CA01 (Certificate Authority)
        │
        │ Web Server Template
        ▼
   CORP-CA01-CA
        │
        │ Signs Request
        ▼
Enterprise Certificate
        │
        │ Return Certificate
        ▼
     Proxmox Node
        │
        │ Install Certificate
        ▼
 pveproxy-ssl.pem
        │
        ▼
    Trusted HTTPS
```

---

# 43. Security Principle – Private Keys

The private keys generated on Proxmox were maintained separately from the CA signing process.

For example:

```text
/root/proxmox01.key
/root/proxmox02.key
```

The CSR contains the public key and identity information required for certificate issuance.

Therefore the process follows:

```text
Private Key
     │
     ├────────────── stays on server
     │
     ▼
Generate CSR
     │
     ▼
CSR → CA
     │
     ▼
Signed Certificate
     │
     ▼
Certificate → Server
```

The CA does not need the server's private key to sign the CSR.

---

# 44. DNS Requirement

Certificates were issued for DNS identities rather than relying on IP addresses.

Examples:

```text
FW01.CORP.AC-LAB.TOP

PROXMOX01.CORP.AC-LAB.TOP

PROXMOX02.CORP.AC-LAB.TOP

PROXMOX03.CORP.AC-LAB.TOP
```

DNS resolution must therefore function correctly.

Example validation:

```powershell
Resolve-DnsName PROXMOX01.CORP.AC-LAB.TOP
```

```powershell
Resolve-DnsName PROXMOX02.CORP.AC-LAB.TOP
```

```powershell
Resolve-DnsName FW01.CORP.AC-LAB.TOP
```

---

# 45. Why Subject Alternative Names Matter

Modern browsers validate the DNS name against the certificate's **Subject Alternative Name (SAN)** extension.

For PROXMOX01:

```text
DNS:PROXMOX01.CORP.AC-LAB.TOP
DNS:PROXMOX01
```

For PROXMOX02:

```text
DNS:PROXMOX02.CORP.AC-LAB.TOP
DNS:PROXMOX02
```

Therefore both the FQDN and short hostname can be represented by the certificate.

For normal administration, the FQDN is preferred:

```text
https://proxmox01.corp.ac-lab.top:8006
```

---

# 46. Certificate Issuance Verification

On:

```text
CA01 (Certificate Authority)
```

open:

```text
Certification Authority
    ↓
CORP-CA01-CA
    ↓
Issued Certificates
```

The console contains the certificates issued by the Enterprise CA.

The appliance certificates were issued through the:

```text
Web Server
```

certificate template.

Because manually submitted CSR requests can display the administrative requester account rather than the target appliance as the **Requester Name**, the certificate itself should be opened to inspect its actual **Subject** and **Subject Alternative Names**.

This explains why entries for FW01 and Proxmox may not immediately appear under those hostnames in the Requester Name column.

---

# 47. Certificate Validation Commands

## Windows

View certificate:

```powershell
certutil -dump C:\Temp\proxmox02.cer
```

Check PEM:

```powershell
Get-Content C:\Temp\proxmox02.cer -First 2
```

Force auto-enrollment:

```powershell
certutil -pulse
```

Update Group Policy:

```powershell
gpupdate /force
```

Open certificate store:

```powershell
certlm.msc
```

Open certificate templates:

```powershell
certtmpl.msc
```

Open Certification Authority:

```powershell
certsrv.msc
```

---

## Linux / Proxmox

Inspect certificate:

```bash
openssl x509 -in /root/proxmox01-fixed.pem -noout -subject -issuer
```

Inspect complete certificate:

```bash
openssl x509 -in /root/proxmox01-fixed.pem -noout -text
```

Inspect CSR:

```bash
openssl req -in /root/proxmox01.csr -noout -text
```

Check SAN:

```bash
openssl req -in /root/proxmox01.csr -noout -text | grep -A2 "Subject Alternative Name"
```

Check certificate modulus:

```bash
openssl x509 -noout -modulus -in /root/proxmox01-fixed.pem | openssl sha256
```

Check private key modulus:

```bash
openssl rsa -noout -modulus -in /root/proxmox01.key | openssl sha256
```

Check Proxmox version:

```bash
pveversion
```

Restart Proxmox proxy:

```bash
systemctl restart pveproxy
```

Verify proxy:

```bash
systemctl status pveproxy
```

---

# 48. Troubleshooting Encountered

## Certificate Base64 Conversion Error

During PROXMOX01 deployment:

```bash
base64 -d /root/proxmox01.pem > /root/proxmox01-fixed.pem
```

returned:

```text
base64: invalid input
```

The problem was related to treating certificate data as raw Base64 when the certificate representation required proper PEM formatting.

A valid PEM certificate has:

```text
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
```

Always verify the format before performing unnecessary Base64 conversion.

---

## Browser Still Shows Certificate Warning

Possible causes:

```text
1. Browser cached previous certificate
2. Proxmox proxy has not reloaded certificate
3. CA certificate is not trusted
4. Accessing server through IP instead of FQDN
5. FQDN does not exist in SAN
6. Wrong certificate installed
7. Certificate/private key mismatch
```

Validation:

```bash
systemctl restart pveproxy
```

Then reconnect using:

```text
https://proxmox02.corp.ac-lab.top:8006
```

instead of:

```text
https://10.x.x.x:8006
```

---

# 49. PKI Validation Checklist

| Validation | Status |
|---|---|
| AD CS installed | ✅ |
| Enterprise Root CA configured | ✅ |
| CA integrated with Active Directory | ✅ |
| CA operational | ✅ |
| Certificate templates available | ✅ |
| Web Server template published | ✅ |
| Auto-enrollment configured | ✅ |
| Group Policy integration validated | ✅ |
| Domain certificates issued | ✅ |
| CA trust chain validated | ✅ |
| FW01 certificate issued | ✅ |
| FW01 HTTPS secured | ✅ |
| PROXMOX01 CSR generated | ✅ |
| PROXMOX01 SAN validated | ✅ |
| PROXMOX01 certificate issued | ✅ |
| PROXMOX01 key/certificate match validated | ✅ |
| PROXMOX01 certificate installed | ✅ |
| PROXMOX01 HTTPS trusted | ✅ |
| PROXMOX02 CSR generated | ✅ |
| PROXMOX02 SAN validated | ✅ |
| PROXMOX02 certificate issued | ✅ |
| PROXMOX02 certificate installed through GUI | ✅ |
| PROXMOX02 HTTPS trusted | ✅ |
| PROXMOX03 certificate deployed | ✅ |
| CA Issued Certificates reviewed | ✅ |
| PKI health validated | ✅ |

---

# 50. Before vs After Architecture

## Before

```text
                  No Central Enterprise PKI

FW01 ────────────── Self-Signed Certificate ──────── Browser Warning

PROXMOX01 ───────── Proxmox Self-Signed Certificate ─ Browser Warning

PROXMOX02 ───────── Proxmox Self-Signed Certificate ─ Browser Warning

PROXMOX03 ───────── Proxmox Self-Signed Certificate ─ Browser Warning


Windows Systems
      │
      └── No centralized enterprise certificate lifecycle
```

---

## After

```text
                       Active Directory
                    CORP.AC-LAB.TOP
                           │
                           ▼
                         CA01
                (Certificate Authority)
                           │
                    CORP-CA01-CA
                  Enterprise Root CA
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
   Domain Systems         FW01          Proxmox VE
          │             (Sophos)       Cluster Nodes
          │                │          │     │     │
          │                │          ▼     ▼     ▼
          │                │        PVE01 PVE02 PVE03
          │                │          │     │     │
          └────────────────┴──────────┴─────┴─────┘
                           │
                           ▼
                 Enterprise Certificates
                           │
                           ▼
                      Trusted HTTPS
```

---

# 51. Skills Demonstrated

This volume demonstrates practical experience with:

### Microsoft Infrastructure

- Active Directory Certificate Services
- Enterprise Certification Authorities
- Active Directory integration
- Group Policy
- Certificate auto-enrollment
- Certificate templates
- Windows certificate stores
- Enterprise trust management

### Public Key Infrastructure

- PKI architecture
- Root Certification Authorities
- X.509 certificates
- Certificate Signing Requests
- Certificate lifecycle
- Server authentication
- Certificate trust chains
- Subject Alternative Names
- RSA cryptography
- SHA-256
- Certificate/private-key validation

### Linux / Proxmox

- OpenSSL
- RSA private-key generation
- CSR generation
- PEM certificates
- Proxmox VE certificate management
- `pvenode`
- `pveproxy`
- systemd service management

### Security Appliances

- Sophos Firewall certificate management
- HTTPS management certificate replacement
- Internal enterprise CA integration
- Secure administrative interfaces

### Cross-Platform Integration

The implementation demonstrates certificate interoperability between:

```text
Microsoft Active Directory
        +
Microsoft AD CS
        +
Windows Server
        +
Windows 11
        +
Sophos Firewall
        +
Linux/OpenSSL
        +
Proxmox VE
```

---

# 52. Enterprise Value

The project demonstrates how an organization can establish its own trusted internal identity infrastructure instead of allowing every server and appliance to operate with independent self-signed certificates.

The resulting architecture provides:

```text
Centralized Trust
        +
Centralized Certificate Issuance
        +
Automated Domain Enrollment
        +
Secure HTTPS Administration
        +
Certificate Identity Validation
        +
Cross-Platform PKI
```

This creates the foundation required for future enterprise services such as:

- RADIUS / NPS certificate authentication
- 802.1X
- VPN certificate authentication
- internal web services
- mutual TLS
- LDAPS
- IIS HTTPS
- Linux HTTPS services
- monitoring platforms
- secure management interfaces

---

# 53. Final Outcome

**Volume 18 successfully delivered a functional Microsoft Enterprise Public Key Infrastructure rather than simply an installed AD CS role.**

The environment now has:

- an operational **Enterprise Root Certification Authority**
- centralized certificate issuance
- Active Directory integration
- Group Policy certificate auto-enrollment
- trusted certificates for domain infrastructure
- certificate issuance for non-domain devices
- trusted Sophos Firewall HTTPS administration
- trusted Proxmox VE HTTPS administration
- validated certificate chains
- validated Subject Alternative Names
- validated certificate/private-key relationships

The final certificate path is:

```text
                     CORP-CA01-CA
                Enterprise Root CA
                        │
                        │
           ┌────────────┼─────────────┐
           │            │             │
           ▼            ▼             ▼
     Windows PKI      Sophos       Proxmox VE
       Clients         FW01        01 / 02 / 03
           │            │             │
           └────────────┴─────────────┘
                        │
                        ▼
              Trusted Enterprise TLS
```

---

## ✅ Volume Status

```text
Volume 18 – Active Directory Certificate Services

Status: COMPLETE ✅

Enterprise Root CA:          OPERATIONAL
Active Directory Integration: VALIDATED
Certificate Templates:        CONFIGURED
Auto-Enrollment:              CONFIGURED
Domain Certificates:          ISSUED
Sophos FW01 Certificate:      DEPLOYED
PROXMOX01 Certificate:        DEPLOYED
PROXMOX02 Certificate:        DEPLOYED
PROXMOX03 Certificate:        DEPLOYED
HTTPS Trust:                  VALIDATED
PKI Health:                   OPERATIONAL
```

---

## 📦 Deliverables

- ✅ Enterprise Root Certification Authority
- ✅ Internal Enterprise PKI
- ✅ Active Directory certificate integration
- ✅ Certificate templates
- ✅ Certificate auto-enrollment
- ✅ Web Server certificate issuance
- ✅ Domain computer certificates
- ✅ Sophos Firewall trusted HTTPS certificate
- ✅ Proxmox VE trusted HTTPS certificates
- ✅ Cross-platform CSR workflow
- ✅ Certificate validation procedures
- ✅ Enterprise PKI documentation

---

**Enterprise Infrastructure Lab — Volume 18 Complete**