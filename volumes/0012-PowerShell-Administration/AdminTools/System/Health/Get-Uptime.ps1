<#
.SYNOPSIS
    Displays system uptime.

.DESCRIPTION
    Calculates how long the computer has been running since the last boot.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

$OS = Get-CimInstance Win32_OperatingSystem
$Uptime = (Get-Date) - $OS.LastBootUpTime

[PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    LastBoot     = $OS.LastBootUpTime
    UptimeDays   = [math]::Round($Uptime.TotalDays,2)
}