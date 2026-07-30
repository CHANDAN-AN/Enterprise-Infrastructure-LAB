# Volume 17 - Enterprise Print Services

## Objective

Deploy an enterprise print infrastructure by integrating a Windows Server Print Server with a Linux CUPS server. Configure centralized printer management, Active Directory publication, and client printer deployment using enterprise best practices.

---

## Enterprise Architecture

```text
                    Enterprise Print Infrastructure

                    +-----------------------+
                    |       CLIENT-01       |
                    |  Windows 11 Enterprise|
                    +-----------+-----------+
                                |
                                |
                                v
                    +-----------------------+
                    |         FS01          |
                    | Windows Print Server  |
                    | Print Management      |
                    +-----------+-----------+
                                |
                     IPP / Enterprise Printing
                                |
                                v
                    +-----------------------+
                    |        PS01UX         |
                    | Rocky Linux 9.8       |
                    | CUPS Print Server     |
                    +-----------+-----------+
                                |
                                |
                                v
                  HP LaserJet 4250 Virtual Printer
```

---

# Lab Objectives

- Deploy Windows Print Services
- Install and configure CUPS on Rocky Linux
- Configure enterprise printer queues
- Integrate Windows Print Server with Linux CUPS
- Publish printers in Active Directory
- Allow Windows clients to discover and install printers
- Validate enterprise print deployment

---

# Infrastructure

| Component | Server |
|-----------|--------|
| Domain Controller | DC01 |
| Windows Print Server | FS01 |
| Linux Print Server | PS01UX |
| Client | CLIENT-01 |
| Domain | CORP.AC-LAB.TOP |

---

# Technologies

- Windows Server 2022
- Print and Document Services
- Print Management Console
- Active Directory
- CUPS 2.3
- IPP
- Gutenprint
- HP LaserJet 4250 Driver
- Windows 11 Enterprise

---

# Deployment Process

## 1. Windows Print Server

- Installed Print and Document Services
- Verified Print Management
- Configured printer sharing
- Published printers in Active Directory

Screenshot:

```
screenshots/01-print-server-role-installed.png
```

---

## 2. Linux CUPS Server

Configured:

- CUPS Web Administration
- Remote administration
- IPP access
- Firewall rules
- Enterprise printer queues

Screenshot:

```
screenshots/02-cups-web-interface.png
```

---

## 3. Enterprise Printer Creation

Created enterprise printer:

```
CORP-PRN-02

HP LaserJet 4250

Shared
Published
```

Screenshot:

```
screenshots/03-cups-printer-created.png
```

---

## 4. Windows Print Management

Imported the Linux printer into Windows Server.

Configured:

- Printer sharing
- Active Directory publication
- IPP Class Driver

Screenshot:

```
screenshots/04-print-management-console.png
```

---

## 5. Active Directory Integration

Verified printer publication within Active Directory.

Screenshot:

```
screenshots/05-printer-published-active-directory.png
```

---

## 6. Client Deployment

CLIENT-01 successfully discovered and installed the shared printer.

Screenshot:

```
screenshots/06-client-printer-installed.png
```

---

## 7. Client Printing

Validated client connectivity by sending a Windows test page to the enterprise print queue.

Screenshot:

```
screenshots/07-client-print-queue.png
```

---

## 8. Linux Validation

Verified:

- CUPS scheduler
- Printer queues
- Shared printer availability

Screenshot:

```
screenshots/08-linux-cups-status.png
```

---

# Validation Summary

| Test | Status |
|-------|--------|
| Windows Print Services Installed | ✅ |
| Linux CUPS Installed | ✅ |
| Enterprise Printer Created | ✅ |
| IPP Connectivity | ✅ |
| Printer Shared | ✅ |
| Active Directory Publication | ✅ |
| Client Discovery | ✅ |
| Client Installation | ✅ |
| Enterprise Print Queue Validated | ✅ |

---

# Skills Demonstrated

- Windows Print Services Administration
- Linux CUPS Administration
- Enterprise Printing
- Active Directory Integration
- Windows Server Administration
- IPP Configuration
- Cross-Platform Printing
- Enterprise Infrastructure Design

---

# Outcome

A centralized enterprise printing platform was successfully deployed by integrating Windows Server Print Services with a Linux CUPS server. Printers were centrally managed, published to Active Directory, and made available to domain-joined Windows clients through the Windows Print Server, demonstrating enterprise-grade print service deployment and cross-platform interoperability.