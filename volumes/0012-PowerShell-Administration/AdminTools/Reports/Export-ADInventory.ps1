<#
.SYNOPSIS
    Exports Active Directory users to a CSV report.

.DESCRIPTION
    Retrieves user accounts and exports them to the Reports folder.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

$ReportFolder = "C:\AdminTools\Reports"

if (-not (Test-Path $ReportFolder)) {
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

$ReportFile = Join-Path $ReportFolder ("AD_Users_{0}.csv" -f (Get-Date -Format "yyyyMMdd_HHmmss"))

Get-ADUser -Filter * -Properties Department, Enabled |
Select-Object Name,
              SamAccountName,
              Department,
              Enabled |
Export-Csv -Path $ReportFile -NoTypeInformation

Write-Host "Report exported to:" -ForegroundColor Green
Write-Host $ReportFile