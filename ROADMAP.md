# Enterprise Infrastructure Lab Roadmap

> Master implementation roadmap for the Enterprise Infrastructure Lab.

This roadmap tracks every implementation task required to complete the Enterprise Infrastructure Lab. Each task represents a milestone toward building a production-inspired enterprise environment while following industry best practices.

---

# Master Task Tracker
☑
| Volume | Implementation Task | Status |
|---------|---------------------|:------:|
| **Volume 01**<br>Hyper-V Host Deployment | Verify hardware compatibility | ☑ |
| | Install Windows Server 2022 Datacenter | ☑ |
| | Configure server hostname | ☑ |
| | Configure static IP address | ☑ |
| | Configure Windows Updates | ☑ |
| | Install Hyper-V Role | ☑ |
| | Create External Virtual Switch | ☑ |
| | Create Internal Virtual Switch | ☑ |
| | Configure virtual switch naming | ☑ |
| | Configure default VM storage locations | ☑ |
| | Configure Hyper-V settings | ☑ |
| | Validate Hyper-V functionality | ☑ |
| | Capture implementation screenshots | ☑ |
| | Create architecture diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 02**<br>Sophos Firewall Deployment | Create Sophos Firewall VM | ☑ |
| | Configure VM resources | ☑ |
| | Attach WAN adapter | ☑ |
| | Attach LAN adapter | ☑ |
| | Install Sophos Firewall | ☑ |
| | Configure administrator account | ☑ |
| | Configure hostname (FW01) | ☑ |
| | Configure WAN interface | ☑ |
| | Configure LAN interface | ☑ |
| | Configure default gateway | ☑ |
| | Configure DNS settings | ☑ |
| | Configure Internet connectivity | ☑ |
| | Validate firewall access | ☑ |
| | Validate Internet connectivity | ☑ |
| | Capture implementation screenshots | ☑ |
| | Create network diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 03**<br>Domain Controller (DC01) | Create Domain Controller VM | ☑ |
| | Configure VM resources | ☑ |
| | Configure static IP address | ☑ |
| | Rename server to DC01 | ☑ |
| | Install Active Directory Domain Services | ☑ |
| | Install DNS Server Role | ☑ |
| | Promote server to Domain Controller | ☑ |
| | Create forest (corp.ac-lab.top) | ☑ |
| | Configure DSRM password | ☑ |
| | Validate SYSVOL | ☑ |
| | Validate NETLOGON | ☑ |
| | Validate Active Directory health | ☑ |
| | Validate Domain Controller health | ☑ |
| | Capture implementation screenshots | ☑ |
| | Create architecture diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 04**<br>Domain Name System (DNS) | Review DNS architecture | ☑ |
| | Verify Forward Lookup Zone | ☑ |
| | Verify Reverse Lookup Zone | ☑ |
| | Verify SRV records | ☑ |
| | Verify Host (A) records | ☑ |
| | Verify PTR records | ☑ |
| | Validate name resolution | ☑ |
| | Validate reverse lookups | ☑ |
| | Run DCDIAG DNS tests | ☑ |
| | Verify Domain Controller registration | ☑ |
| | Capture implementation screenshots | ☑ |
| | Update DNS diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 05**<br>Active Directory Organizational Unit Structure | Design OU hierarchy | ☑ |
| | Create Administrative OU | ☑ |
| | Create Servers OU | ☑ |
| | Create Workstations OU | ☑ |
| | Create Users OU | ☑ |
| | Create Groups OU | ☑ |
| | Create Service Accounts OU | ☑ |
| | Validate OU hierarchy | ☑ |
| | Verify organizational structure | ☑ |
| | Capture implementation screenshots | ☑ |
| | Update Active Directory diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 06**<br>Dynamic Host Configuration Protocol (DHCP) | Review DHCP design | ☑ |
| | Install DHCP Server Role | ☑ |
| | Install DHCP Management Tools | ☑ |
| | Authorize DHCP Server in Active Directory | ☑ |
| | Create IPv4 Scope | ☑ |
| | Configure Address Pool | ☑ |
| | Configure Subnet Mask | ☑ |
| | Configure Exclusion Range | ☑ |
| | Configure Lease Duration | ☑ |
| | Configure Scope Option 003 (Gateway) | ☑ |
| | Configure Scope Option 006 (DNS Server) | ☑ |
| | Configure Scope Option 015 (DNS Suffix) | ☑ |
| | Activate DHCP Scope | ☑ |
| | Validate DHCP service | ☑ |
| | Validate client lease assignment | ☑ |
| | Validate DNS registration | ☑ |
| | Capture implementation screenshots | ☑ |
| | Update network diagram | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 07**<br>Windows 11 Enterprise Client | Create Windows 11 Enterprise VM | ☑ |
| | Configure VM resources | ☑ |
| | Install Windows 11 Enterprise | ☑ |
| | Install Hyper-V Integration Services | ☑ |
| | Configure computer name | ☑ |
| | Configure static IP address | ☑ |
| | Configure DNS server | ☑ |
| | Verify network connectivity | ☑ |
| | Install Windows Updates | ☑ |
| | Verify Internet connectivity | ☑ |
| | Capture implementation screenshots | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 08**<br>Join Client to Domain | Verify DNS connectivity | ☑ |
| | Verify Domain Controller connectivity | ☑ |
| | Join Windows 11 to domain | ☑ |
| | Restart workstation | ☑ |
| | Verify domain membership | ☑ |
| | Log in using domain account | ☑ |
| | Verify secure channel | ☑ |
| | Validate Active Directory computer object | ☑ |
| | Move computer to correct OU | ☑ |
| | Verify Group Policy communication | ☑ |
| | Capture implementation screenshots | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 09**<br>Administrative Accounts | Design administrative account strategy | ☑ |
| | Create Domain Administrator account | ☑ |
| | Create Server Administrator account | ☑ |
| | Create Workstation Administrator account | ☑ |
| | Create Service Administrator account | ☑ |
| | Configure account descriptions | ☑ |
| | Configure password policies | ☑ |
| | Configure account permissions | ☑ |
| | Verify administrative logon | ☑ |
| | Validate administrative access | ☑ |
| | Capture implementation screenshots | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 10**<br>Security Groups | Design security group strategy | ☑ |
| | Create Administrative Groups | ☑ |
| | Create Server Groups | ☑ |
| | Create Workstation Groups | ☑ |
| | Create User Groups | ☑ |
| | Create File Share Groups | ☑ |
| | Configure group scopes | ☑ |
| | Configure group memberships | ☑ |
| | Verify group assignments | ☑ |
| | Validate permissions | ☑ |
| | Capture implementation screenshots | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 11**<br>Group Policy Foundation | Review Group Policy design | ☑ |
| | Create Group Policy Objects | ☑ |
| | Configure password policy | ☑ |
| | Configure account lockout policy | ☑ |
| | Configure Windows Update policy | ☑ |
| | Configure Control Panel restrictions | ☑ |
| | Configure Desktop policies | ☑ |
| | Link GPOs to Organizational Units | ☑ |
| | Verify policy application | ☑ |
| | Validate Resultant Set of Policy (RSoP) | ☑ |
| | Capture implementation screenshots | ☑ |
| | Write Volume README | ☑ |
| | Commit changes to GitHub | ☑ |
| | Push changes to GitHub | ☑ |
| | Review implementation | ☑ |
| | Mark volume complete | ☑ |
| **Volume 12**<br>PowerShell Administration | Install PowerShell modules | ☐ |
| | Configure PowerShell execution policy | ☐ |
| | Configure PowerShell profile | ☐ |
| | Create administration scripts folder | ☐ |
| | Create Active Directory management scripts | ☐ |
| | Create network management scripts | ☐ |
| | Create system information scripts | ☐ |
| | Test PowerShell automation | ☐ |
| | Validate script execution | ☐ |
| | Document PowerShell scripts | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 13**<br>File Server Deployment | Create File Server VM | ☐ |
| | Configure VM resources | ☐ |
| | Install Windows Server 2022 | ☐ |
| | Configure static IP address | ☐ |
| | Rename server | ☐ |
| | Join server to domain | ☐ |
| | Install File Server role | ☐ |
| | Validate server connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 14**<br>Shared Folders | Design shared folder structure | ☐ |
| | Create Department Shares | ☐ |
| | Create Public Share | ☐ |
| | Create IT Share | ☐ |
| | Create Management Share | ☐ |
| | Configure NTFS permissions | ☐ |
| | Configure Share permissions | ☐ |
| | Verify user access | ☐ |
| | Validate permission inheritance | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 15**<br>Distributed File System (DFS) | Install DFS Namespace role | ☐ |
| | Install DFS Replication role | ☐ |
| | Create DFS Namespace | ☐ |
| | Configure Namespace folders | ☐ |
| | Configure DFS targets | ☐ |
| | Configure DFS replication | ☐ |
| | Validate namespace access | ☐ |
| | Verify replication health | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 16**<br>Windows Server Update Services (WSUS) | Install WSUS role | ☐ |
| | Configure WSUS database | ☐ |
| | Configure update storage | ☐ |
| | Configure synchronization | ☐ |
| | Configure Microsoft Update products | ☐ |
| | Configure classifications | ☐ |
| | Create Computer Groups | ☐ |
| | Configure approval rules | ☐ |
| | Verify synchronization | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 17**<br>Print Server | Install Print Server role | ☐ |
| | Configure Print Management | ☐ |
| | Install printer drivers | ☐ |
| | Create logical printers | ☐ |
| | Configure printer sharing | ☐ |
| | Configure printer permissions | ☐ |
| | Deploy printers using GPO | ☐ |
| | Verify client connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 18**<br>Certificate Services (AD CS) | Install Active Directory Certificate Services | ☐ |
| | Configure Enterprise Root CA | ☐ |
| | Configure CA settings | ☐ |
| | Configure CRL distribution | ☐ |
| | Configure certificate templates | ☐ |
| | Publish certificate templates | ☐ |
| | Issue test certificate | ☐ |
| | Validate certificate enrollment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 19**<br>Network Policy Server (NPS) | Install NPS role | ☐ |
| | Register NPS in Active Directory | ☐ |
| | Configure RADIUS clients | ☐ |
| | Configure Connection Request Policies | ☐ |
| | Configure Network Policies | ☐ |
| | Configure authentication methods | ☐ |
| | Test RADIUS authentication | ☐ |
| | Validate access policies | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 20**<br>Remote Desktop Services | Install Remote Desktop Services | ☐ |
| | Configure Session Host | ☐ |
| | Configure Licensing | ☐ |
| | Configure Collections | ☐ |
| | Configure RemoteApp | ☐ |
| | Configure User Profiles | ☐ |
| | Test remote access | ☐ |
| | Validate RDS deployment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 21**<br>Windows Admin Center | Install Windows Admin Center | ☐ |
| | Configure HTTPS certificate | ☐ |
| | Configure gateway settings | ☐ |
| | Add managed servers | ☐ |
| | Add Hyper-V host | ☐ |
| | Configure user access | ☐ |
| | Verify remote management | ☐ |
| | Validate administration features | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 22**<br>BitLocker Administration | Configure TPM settings | ☐ |
| | Enable BitLocker | ☐ |
| | Configure recovery key storage | ☐ |
| | Store recovery keys in Active Directory | ☐ |
| | Configure BitLocker Group Policy | ☐ |
| | Test recovery process | ☐ |
| | Validate encryption status | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 23**<br>Windows Security Baseline | Download Microsoft Security Baseline | ☐ |
| | Import baseline policies | ☐ |
| | Review recommended settings | ☐ |
| | Apply security baseline | ☐ |
| | Validate applied policies | ☐ |
| | Verify workstation compliance | ☐ |
| | Verify server compliance | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 24**<br>Windows Security Hardening | Review server security | ☐ |
| | Disable unnecessary services | ☐ |
| | Configure Windows Firewall | ☐ |
| | Configure Microsoft Defender | ☐ |
| | Configure auditing policies | ☐ |
| | Configure Event Logging | ☐ |
| | Validate security configuration | ☐ |
| | Perform security verification | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 25**<br>Ubuntu Server Deployment | Create Ubuntu Server VM | ☐ |
| | Configure VM resources | ☐ |
| | Install Ubuntu Server LTS | ☐ |
| | Configure static IP address | ☐ |
| | Configure hostname | ☐ |
| | Configure DNS settings | ☐ |
| | Update operating system | ☐ |
| | Install Open VM Tools | ☐ |
| | Join server to domain (optional) | ☐ |
| | Validate connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 26**<br>SSH Server | Install OpenSSH Server | ☐ |
| | Configure SSH service | ☐ |
| | Configure key-based authentication | ☐ |
| | Disable root login | ☐ |
| | Configure SSH banner | ☐ |
| | Configure idle timeout | ☐ |
| | Configure firewall rules | ☐ |
| | Verify remote access | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 27**<br>Linux File Services | Install Samba | ☐ |
| | Install NFS Server | ☐ |
| | Create shared directories | ☐ |
| | Configure Samba shares | ☐ |
| | Configure NFS exports | ☐ |
| | Configure permissions | ☐ |
| | Test Windows access | ☐ |
| | Test Linux access | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 28**<br>Apache Web Server | Install Apache2 | ☐ |
| | Enable Apache service | ☐ |
| | Configure virtual host | ☐ |
| | Configure document root | ☐ |
| | Deploy test website | ☐ |
| | Configure firewall rules | ☐ |
| | Validate HTTP access | ☐ |
| | Validate HTTPS readiness | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 29**<br>Nginx Reverse Proxy | Install Nginx | ☐ |
| | Configure reverse proxy | ☐ |
| | Configure virtual hosts | ☐ |
| | Configure SSL placeholders | ☐ |
| | Configure proxy forwarding | ☐ |
| | Test reverse proxy | ☐ |
| | Validate configuration | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 30**<br>MariaDB Database Server | Install MariaDB | ☐ |
| | Secure MariaDB installation | ☐ |
| | Configure root password | ☐ |
| | Create test database | ☐ |
| | Create database user | ☐ |
| | Configure remote access | ☐ |
| | Test database connectivity | ☐ |
| | Backup test database | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 31**<br>Docker Engine | Install Docker Engine | ☐ |
| | Install Docker Compose | ☐ |
| | Configure Docker service | ☐ |
| | Configure non-root access | ☐ |
| | Pull test container | ☐ |
| | Deploy first container | ☐ |
| | Validate container networking | ☐ |
| | Validate Docker functionality | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 32**<br>Container Management | Deploy Portainer | ☐ |
| | Configure Portainer | ☐ |
| | Connect Docker environment | ☐ |
| | Deploy sample stack | ☐ |
| | Configure container management | ☐ |
| | Validate Portainer access | ☐ |
| | Validate stack deployment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 33**<br>Linux Security Hardening | Update installed packages | ☐ |
| | Configure UFW Firewall | ☐ |
| | Install Fail2Ban | ☐ |
| | Harden SSH configuration | ☐ |
| | Configure automatic updates | ☐ |
| | Configure audit logging | ☐ |
| | Verify firewall rules | ☐ |
| | Validate server security | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 34**<br>Linux Backup Strategy | Install backup software | ☐ |
| | Configure backup destination | ☐ |
| | Configure scheduled backups | ☐ |
| | Backup configuration files | ☐ |
| | Backup databases | ☐ |
| | Test backup restoration | ☐ |
| | Verify backup integrity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 35**<br>Linux Monitoring | Install monitoring tools | ☐ |
| | Configure system metrics | ☐ |
| | Configure disk monitoring | ☐ |
| | Configure CPU monitoring | ☐ |
| | Configure memory monitoring | ☐ |
| | Configure service monitoring | ☐ |
| | Validate monitoring | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 36**<br>Linux Administration | Configure cron jobs | ☐ |
| | Configure log rotation | ☐ |
| | Configure user accounts | ☐ |
| | Configure sudo privileges | ☐ |
| | Verify scheduled tasks | ☐ |
| | Perform health checks | ☐ |
| | Validate administration tasks | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| Volume | Implementation Task | Status |
| **Volume 37**<br>Microsoft Entra ID Integration | Create Microsoft Entra tenant | ☐ |
| | Verify tenant configuration | ☐ |
| | Configure custom domain | ☐ |
| | Install Microsoft Entra Connect | ☐ |
| | Configure directory synchronization | ☐ |
| | Synchronize users and groups | ☐ |
| | Validate synchronization | ☐ |
| | Test Microsoft Entra sign-in | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 38**<br>Microsoft Intune | Create Intune environment | ☐ |
| | Configure enrollment settings | ☐ |
| | Configure device compliance policies | ☐ |
| | Configure configuration profiles | ☐ |
| | Configure Windows enrollment | ☐ |
| | Enroll Windows client | ☐ |
| | Verify device compliance | ☐ |
| | Validate Intune management | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 39**<br>Microsoft Defender | Enable Microsoft Defender | ☐ |
| | Configure antivirus policies | ☐ |
| | Configure endpoint protection | ☐ |
| | Configure attack surface reduction | ☐ |
| | Configure scheduled scans | ☐ |
| | Verify threat protection | ☐ |
| | Test malware detection | ☐ |
| | Validate protection status | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 40**<br>Microsoft 365 Administration | Create Microsoft 365 tenant | ☐ |
| | Verify licensing | ☐ |
| | Create test users | ☐ |
| | Assign licenses | ☐ |
| | Configure Microsoft 365 services | ☐ |
| | Test user access | ☐ |
| | Validate cloud services | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 41**<br>Zabbix Monitoring | Create Zabbix VM | ☐ |
| | Install Ubuntu Server | ☐ |
| | Install MariaDB | ☐ |
| | Install Apache | ☐ |
| | Install PHP dependencies | ☐ |
| | Install Zabbix Server | ☐ |
| | Install Zabbix Frontend | ☐ |
| | Install Zabbix Agent | ☐ |
| | Configure database | ☐ |
| | Configure Zabbix Server | ☐ |
| | Configure web interface | ☐ |
| | Add Windows servers | ☐ |
| | Add Linux servers | ☐ |
| | Configure monitoring templates | ☐ |
| | Verify monitoring | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 42**<br>Grafana Dashboards | Install Grafana | ☐ |
| | Configure Grafana service | ☐ |
| | Add data source | ☐ |
| | Connect Zabbix | ☐ |
| | Create infrastructure dashboard | ☐ |
| | Create server dashboard | ☐ |
| | Create network dashboard | ☐ |
| | Create storage dashboard | ☐ |
| | Validate dashboards | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 43**<br>Prometheus Monitoring | Install Prometheus | ☐ |
| | Configure Prometheus | ☐ |
| | Configure scrape targets | ☐ |
| | Install Node Exporter | ☐ |
| | Install Windows Exporter | ☐ |
| | Verify metrics collection | ☐ |
| | Validate monitoring | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 44**<br>Centralized Logging | Install logging server | ☐ |
| | Configure Syslog | ☐ |
| | Configure Windows Event Forwarding | ☐ |
| | Configure Linux log forwarding | ☐ |
| | Configure log retention | ☐ |
| | Verify log collection | ☐ |
| | Validate centralized logging | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 45**<br>Email Notifications | Configure SMTP server | ☐ |
| | Configure alert email account | ☐ |
| | Configure Zabbix email media | ☐ |
| | Configure Grafana notifications | ☐ |
| | Configure SMTP authentication | ☐ |
| | Test email alerts | ☐ |
| | Validate notifications | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 46**<br>Infrastructure Documentation | Document network topology | ☐ |
| | Document server inventory | ☐ |
| | Document IP addressing | ☐ |
| | Document Active Directory | ☐ |
| | Document monitoring systems | ☐ |
| | Document backup procedures | ☐ |
| | Validate documentation | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 47**<br>Backup Strategy | Configure Windows Server Backup | ☐ |
| | Configure Linux backups | ☐ |
| | Configure Hyper-V backups | ☐ |
| | Configure scheduled backups | ☐ |
| | Test backup jobs | ☐ |
| | Test restore procedures | ☐ |
| | Validate backup integrity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 48**<br>Disaster Recovery | Document recovery procedures | ☐ |
| | Create recovery checklist | ☐ |
| | Test Active Directory recovery | ☐ |
| | Test File Server recovery | ☐ |
| | Test VM restoration | ☐ |
| | Verify backup recovery | ☐ |
| | Validate disaster recovery plan | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 49**<br>Git Installation & Configuration | Install Git | ☐ |
| | Verify Git installation | ☐ |
| | Configure Git username | ☐ |
| | Configure Git email | ☐ |
| | Configure default branch | ☐ |
| | Configure credential manager | ☐ |
| | Generate SSH key pair | ☐ |
| | Configure GitHub authentication | ☐ |
| | Validate Git connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 50**<br>GitHub Repository Management | Create GitHub repository | ☐ |
| | Configure repository settings | ☐ |
| | Configure repository visibility | ☐ |
| | Create project structure | ☐ |
| | Configure .gitignore | ☐ |
| | Configure LICENSE | ☐ |
| | Configure README | ☐ |
| | Validate repository | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 51**<br>Visual Studio Code | Install Visual Studio Code | ☐ |
| | Install PowerShell extension | ☐ |
| | Install Docker extension | ☐ |
| | Install GitHub extension | ☐ |
| | Install YAML extension | ☐ |
| | Configure settings | ☐ |
| | Configure terminal | ☐ |
| | Verify development environment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 52**<br>Terraform Installation | Install Terraform | ☐ |
| | Verify Terraform installation | ☐ |
| | Configure Terraform environment | ☐ |
| | Create Terraform workspace | ☐ |
| | Validate Terraform commands | ☐ |
| | Create sample configuration | ☐ |
| | Test Terraform initialization | ☐ |
| | Validate deployment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 53**<br>Infrastructure as Code | Create Terraform project | ☐ |
| | Create provider configuration | ☐ |
| | Create variables file | ☐ |
| | Create outputs file | ☐ |
| | Create resource definitions | ☐ |
| | Execute Terraform plan | ☐ |
| | Execute Terraform apply | ☐ |
| | Validate deployment | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 54**<br>PowerShell Automation | Create automation repository | ☐ |
| | Create Active Directory scripts | ☐ |
| | Create Hyper-V scripts | ☐ |
| | Create Windows administration scripts | ☐ |
| | Create reporting scripts | ☐ |
| | Test automation | ☐ |
| | Validate script execution | ☐ |
| | Document scripts | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 55**<br>Bash Automation | Create Bash scripts repository | ☐ |
| | Create Linux administration scripts | ☐ |
| | Create Docker scripts | ☐ |
| | Create backup scripts | ☐ |
| | Create monitoring scripts | ☐ |
| | Test Bash scripts | ☐ |
| | Validate automation | ☐ |
| | Document scripts | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 56**<br>GitHub Actions | Create GitHub Actions workflow | ☐ |
| | Configure workflow triggers | ☐ |
| | Configure repository secrets | ☐ |
| | Configure CI workflow | ☐ |
| | Validate workflow execution | ☐ |
| | Test automatic deployment | ☐ |
| | Verify workflow logs | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 57**<br>Python Administration | Install Python | ☐ |
| | Configure Python environment | ☐ |
| | Install required packages | ☐ |
| | Create administration scripts | ☐ |
| | Test Python scripts | ☐ |
| | Validate automation | ☐ |
| | Document scripts | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 58**<br>Portfolio Documentation | Create project overview | ☐ |
| | Create architecture documentation | ☐ |
| | Document implementation process | ☐ |
| | Document lessons learned | ☐ |
| | Review all READMEs | ☐ |
| | Validate repository structure | ☐ |
| | Verify documentation quality | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 59**<br>Lab Validation | Verify Active Directory | ☐ |
| | Verify DNS | ☐ |
| | Verify DHCP | ☐ |
| | Verify Windows Servers | ☐ |
| | Verify Linux Servers | ☐ |
| | Verify Monitoring | ☐ |
| | Verify Automation | ☐ |
| | Verify Documentation | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 60**<br>Final Project Review | Review project objectives | ☐ |
| | Review infrastructure | ☐ |
| | Review documentation | ☐ |
| | Review automation | ☐ |
| | Review security | ☐ |
| | Review monitoring | ☐ |
| | Review backups | ☐ |
| | Review GitHub repository | ☐ |
| | Capture final screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Mark project ready for publication | ☐ |
| | Mark volume complete | ☐ |
| **Volume 61**<br>AWS Account & IAM Foundation | Create AWS account | ☐ |
| | Enable MFA | ☐ |
| | Configure billing alerts | ☐ |
| | Create IAM Administrator account | ☐ |
| | Create IAM groups | ☐ |
| | Create IAM users | ☐ |
| | Configure least privilege permissions | ☐ |
| | Test AWS access | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 62**<br>AWS CLI & CloudShell | Install AWS CLI | ☐ |
| | Verify AWS CLI installation | ☐ |
| | Configure AWS CLI credentials | ☐ |
| | Configure AWS default region | ☐ |
| | Test AWS CLI commands | ☐ |
| | Launch AWS CloudShell | ☐ |
| | Validate CLI connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 63**<br>Amazon EC2 | Launch EC2 instance | ☐ |
| | Configure Security Groups | ☐ |
| | Configure Key Pair | ☐ |
| | Configure Elastic IP | ☐ |
| | Connect to EC2 instance | ☐ |
| | Install required packages | ☐ |
| | Verify instance connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 64**<br>Amazon S3 | Create S3 Bucket | ☐ |
| | Configure bucket settings | ☐ |
| | Configure versioning | ☐ |
| | Configure encryption | ☐ |
| | Configure lifecycle policy | ☐ |
| | Upload test objects | ☐ |
| | Verify bucket access | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 65**<br>Amazon VPC | Create VPC | ☐ |
| | Create Public Subnet | ☐ |
| | Create Private Subnet | ☐ |
| | Configure Route Tables | ☐ |
| | Configure Internet Gateway | ☐ |
| | Configure Security Groups | ☐ |
| | Validate network connectivity | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 66**<br>Terraform on AWS | Configure Terraform provider | ☐ |
| | Configure remote backend | ☐ |
| | Create EC2 configuration | ☐ |
| | Create networking configuration | ☐ |
| | Execute Terraform plan | ☐ |
| | Execute Terraform apply | ☐ |
| | Verify deployed resources | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 67**<br>Cloud Monitoring | Configure Amazon CloudWatch | ☐ |
| | Create monitoring dashboard | ☐ |
| | Configure CloudWatch Logs | ☐ |
| | Configure CloudWatch Alarms | ☐ |
| | Test alarm notifications | ☐ |
| | Validate monitoring | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 68**<br>Cloud Security | Review IAM permissions | ☐ |
| | Configure Security Groups | ☐ |
| | Configure Network ACLs | ☐ |
| | Configure S3 bucket policies | ☐ |
| | Configure encryption | ☐ |
| | Validate security configuration | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 69**<br>Cost Optimization | Configure AWS Budgets | ☐ |
| | Configure billing alerts | ☐ |
| | Review EC2 sizing | ☐ |
| | Review S3 storage | ☐ |
| | Review unused resources | ☐ |
| | Validate cost controls | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 70**<br>Cloud Documentation | Document AWS architecture | ☐ |
| | Document IAM configuration | ☐ |
| | Document networking | ☐ |
| | Document Terraform deployment | ☐ |
| | Document monitoring | ☐ |
| | Validate documentation | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 71**<br>End-to-End Infrastructure Validation | Validate Hyper-V environment | ☐ |
| | Validate Windows infrastructure | ☐ |
| | Validate Linux infrastructure | ☐ |
| | Validate Monitoring platform | ☐ |
| | Validate Cloud integration | ☐ |
| | Validate Automation | ☐ |
| | Validate Documentation | ☐ |
| | Perform final system health checks | ☐ |
| | Capture implementation screenshots | ☐ |
| | Write Volume README | ☐ |
| | Commit changes to GitHub | ☐ |
| | Push changes to GitHub | ☐ |
| | Review implementation | ☐ |
| | Mark volume complete | ☐ |
| **Volume 72**<br>Enterprise Lab Completion | Review all 72 volumes | ☐ |
| | Verify GitHub repository structure | ☐ |
| | Verify project documentation | ☐ |
| | Verify diagrams | ☐ |
| | Verify screenshots | ☐ |
| | Verify scripts | ☐ |
| | Verify automation | ☐ |
| | Verify backups | ☐ |
| | Verify monitoring | ☐ |
| | Create final portfolio overview | ☐ |
| | Publish GitHub repository | ☐ |
| | Create LinkedIn showcase post | ☐ |
| | Mark Enterprise Lab complete | ☐ |
