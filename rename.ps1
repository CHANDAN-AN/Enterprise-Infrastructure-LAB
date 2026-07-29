# =====================================================================
# Enterprise Infrastructure LAB
# Folder Renaming Script (Volumes 16-72)
#
# This script:
#   - Leaves Volumes 01-15 untouched.
#   - Renames existing folders 18-72 into the new roadmap numbering (16-70).
#   - Duplicates the last folder to create Volumes 71 and 72.
#   - Verifies every rename before continuing.
#   - Stops immediately if any operation fails.
#
# Run from:
#   C:\VSCode Projects\Enterprise-Infrastructure-LAB
# =====================================================================

$ErrorActionPreference = "Stop"

$VolumesRoot = Join-Path $PSScriptRoot "volumes"

if (-not (Test-Path $VolumesRoot)) {
    Write-Host "ERROR: volumes folder not found." -ForegroundColor Red
    exit 1
}

# ---------------------------------------------------------------------
# Mapping
# ---------------------------------------------------------------------

$RenameMap = @(
    @{Old="18-Print-Server"; New="16-Windows-Server-Update-Services-WSUS"},
    @{Old="19-Windows-Server-Update-Services-WSUS"; New="17-Enterprise-Print-Services"},
    @{Old="20-Service-Accounts"; New="18-Active-Directory-Certificate-Services-AD-CS"},
    @{Old="21-Delegation-of-Administration"; New="19-Network-Policy-Server-NPS"},
    @{Old="22-Fine-Grained-Password-Policies-FGPP"; New="20-Remote-Desktop-Services-RDS"},
    @{Old="23-Local-Administrator-Password-Solution-LAPS"; New="21-Windows-Admin-Center"},
    @{Old="24-Active-Directory-Certificate-Services-AD-CS-PKI"; New="22-BitLocker-Administration"},
    @{Old="25-BitLocker-Drive-Encryption"; New="23-Microsoft-Security-Baseline"},
    @{Old="26-Microsoft-Defender-for-Servers"; New="24-Windows-Security-Hardening"},
    @{Old="27-Sophos-Firewall-Rules"; New="25-Ubuntu-Server-Enterprise-Deployment"},
    @{Old="28-Network-Address-Translation-NAT"; New="26-Secure-Shell-SSH-Services"},
    @{Old="29-DNS-Forwarders"; New="27-Enterprise-Linux-File-Services"},
    @{Old="30-Virtual-Local-Area-Networks-VLANs"; New="28-Apache-Web-Services"},
    @{Old="31-DNS-Conditional-Forwarders"; New="29-Nginx-Reverse-Proxy"},
    @{Old="32-Site-to-Site-Virtual-Private-Network-VPN"; New="30-MariaDB-Database-Platform"},
    @{Old="33-Remote-Access-VPN"; New="31-Docker-Engine-Platform"},
    @{Old="34-DHCP-Failover"; New="32-Portainer-Container-Management"},
    @{Old="35-Ubuntu-Server-Deployment"; New="33-Linux-Security-Hardening"},
    @{Old="36-Linux-Integration-with-Active-Directory"; New="34-Linux-Backup-Strategy"},
    @{Old="37-Samba-File-Services"; New="35-Linux-Infrastructure-Monitoring"},
    @{Old="38-Network-File-System-NFS"; New="36-Linux-Systems-Administration"},
    @{Old="39-Syslog-Server"; New="37-Microsoft-Entra-ID"},
    @{Old="40-Windows-Event-Forwarding-WEF"; New="38-Microsoft-Intune"},
    @{Old="41-Zabbix-Monitoring"; New="39-Microsoft-Defender-for-Business"},
    @{Old="42-Performance-Monitoring"; New="40-Microsoft-365-Administration"},
    @{Old="43-Grafana-Dashboards"; New="41-Azure-AD-Connect-Microsoft-Entra-Connect"},
    @{Old="44-Windows-Server-Backup"; New="42-Hybrid-Identity-Validation"},
    @{Old="45-Veeam-Backup-and-Replication"; New="43-Azure-Virtual-Networks"},
    @{Old="46-Hyper-V-Checkpoints-and-Recovery"; New="44-Azure-Virtual-Machines"},
    @{Old="47-Disaster-Recovery-Testing"; New="45-Azure-Storage-Services"},
    @{Old="48-PowerShell-Automation"; New="46-Azure-Backup"},
    @{Old="49-Scheduled-Tasks"; New="47-Azure-Monitor"},
    @{Old="50-Desired-State-Configuration-DSC"; New="48-Azure-Site-Recovery"},
    @{Old="51-Windows-Admin-Center-WAC"; New="49-Zabbix-Infrastructure-Monitoring"},
    @{Old="52-Git-and-GitHub"; New="50-Grafana-Dashboards"},
    @{Old="53-Internet-Information-Services-IIS"; New="51-Centralized-Logging-Platform"},
    @{Old="54-Docker"; New="52-Windows-Event-Forwarding-WEF"},
    @{Old="55-Docker-Compose"; New="53-Network-Performance-Monitoring"},
    @{Old="56-Terraform"; New="54-Infrastructure-Health-Validation"},
    @{Old="57-Continuous-Integration-Continuous-Deployment-CI-CD"; New="55-Veeam-Backup-and-Replication"},
    @{Old="58-Microsoft-Entra-ID-Connect"; New="56-Hyper-V-Backup-Strategy"},
    @{Old="59-Azure-Virtual-Network-VNet"; New="57-Active-Directory-Disaster-Recovery"},
    @{Old="60-Azure-Site-to-Site-VPN"; New="58-File-Server-Recovery"},
    @{Old="61-Azure-Virtual-Machines-VMs"; New="59-Business-Continuity-Planning"},
    @{Old="62-Hybrid-Identity"; New="60-Disaster-Recovery-Validation"},
    @{Old="63-Deploy-Domain-Controller-DC02"; New="61-GitHub-Enterprise-Workflow"},
    @{Old="64-Domain-Name-System-DNS-Redundancy"; New="62-PowerShell-Automation-Framework"},
    @{Old="65-Hyper-V-Replica"; New="63-Terraform-Infrastructure-as-Code"},
    @{Old="66-File-Server-Redundancy"; New="64-Ansible-Configuration-Management"},
    @{Old="67-Windows-Failover-Clustering-Optional"; New="65-CI-CD-Infrastructure-Pipeline"},
    @{Old="68-Configuration-Management-Database-CMDB"; New="66-Infrastructure-Documentation-Automation"},
    @{Old="69-Change-Management"; New="67-Security-Auditing-and-Compliance"},
    @{Old="70-Standard-Operating-Procedures-SOPs"; New="68-Infrastructure-Performance-Optimisation"},
    @{Old="71-Incident-Response-Runbooks"; New="69-Enterprise-Operational-Runbooks"},
    @{Old="72-Operations-Manual"; New="70-Enterprise-Architecture-Documentation"}
)

# ---------------------------------------------------------------------
# Rename one by one
# ---------------------------------------------------------------------

Write-Host ""
Write-Host "Starting folder renaming..." -ForegroundColor Cyan
Write-Host ""

foreach ($Item in $RenameMap) {

    $OldPath = Join-Path $VolumesRoot $Item.Old
    $NewPath = Join-Path $VolumesRoot $Item.New

    if (-not (Test-Path $OldPath)) {
        throw "Source folder missing: $($Item.Old)"
    }

    if (Test-Path $NewPath) {
        throw "Destination already exists: $($Item.New)"
    }

    Write-Host "Renaming:"
    Write-Host "  $($Item.Old)"
    Write-Host "      ->"
    Write-Host "  $($Item.New)"

    Rename-Item -LiteralPath $OldPath -NewName $Item.New

    if (-not (Test-Path $NewPath)) {
        throw "Verification failed after renaming $($Item.Old)"
    }

    Write-Host "Verified." -ForegroundColor Green
    Write-Host ""
}

# ---------------------------------------------------------------------
# Duplicate Volume 70
# ---------------------------------------------------------------------

Write-Host ""
Write-Host "Creating Volumes 71 and 72..." -ForegroundColor Cyan
Write-Host ""

$Vol70 = Join-Path $VolumesRoot "70-Enterprise-Architecture-Documentation"

if (-not (Test-Path $Vol70)) {
    throw "Volume 70 not found."
}

$Vol71 = Join-Path $VolumesRoot "71-Enterprise-Infrastructure-Validation"
$Vol72 = Join-Path $VolumesRoot "72-Project-Completion-and-Portfolio-Publication"

if (Test-Path $Vol71 -or Test-Path $Vol72) {
    throw "Volume 71 or 72 already exists."
}

Copy-Item $Vol70 $Vol71 -Recurse

if (-not (Test-Path $Vol71)) {
    throw "Failed creating Volume 71."
}

Write-Host "Volume 71 created." -ForegroundColor Green

Copy-Item $Vol70 $Vol72 -Recurse

if (-not (Test-Path $Vol72)) {
    throw "Failed creating Volume 72."
}

Write-Host "Volume 72 created." -ForegroundColor Green

# ---------------------------------------------------------------------
# Final Verification
# ---------------------------------------------------------------------

Write-Host ""
Write-Host "Final Verification..." -ForegroundColor Cyan

1..72 | ForEach-Object {

    $Prefix = "{0:D2}-" -f $_

    $Match = Get-ChildItem $VolumesRoot -Directory |
             Where-Object { $_.Name.StartsWith($Prefix) }

    if ($Match.Count -ne 1) {
        throw "Verification failed for Volume $Prefix"
    }
}

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host "All folder renames completed successfully." -ForegroundColor Green
Write-Host "Volumes 01-72 verified." -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Green