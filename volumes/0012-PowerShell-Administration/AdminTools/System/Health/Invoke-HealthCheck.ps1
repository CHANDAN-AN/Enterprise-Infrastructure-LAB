<#
.SYNOPSIS
    Performs a basic health check of the local workstation.

.DESCRIPTION
    Verifies domain controller connectivity, reports uptime,
    checks local disk usage, and displays the current execution policy.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

$DomainController = "DC01"

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Enterprise Infrastructure Health Check " -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Domain Controller Connectivity
if (Test-Connection -ComputerName $DomainController -Count 2 -Quiet) {
    Write-Host "[PASS] Domain Controller Reachable" -ForegroundColor Green
}
else {
    Write-Host "[FAIL] Domain Controller Unreachable" -ForegroundColor Red
}

# Uptime
$OS = Get-CimInstance Win32_OperatingSystem
$Uptime = (Get-Date) - $OS.LastBootUpTime

Write-Host ("[INFO] Uptime: {0:N2} days" -f $Uptime.TotalDays) -ForegroundColor Yellow

# Disk Usage
Write-Host ""
Write-Host "Disk Usage" -ForegroundColor Cyan

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
              @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}},
              @{Name="Free(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}} |
Format-Table -AutoSize

Write-Host ""
Write-Host ("Execution Policy: {0}" -f (Get-ExecutionPolicy)) -ForegroundColor Cyan