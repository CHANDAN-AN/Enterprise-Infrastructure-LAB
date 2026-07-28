<#
.SYNOPSIS
    Tests connectivity to the domain controller.

.DESCRIPTION
    Verifies that the domain controller responds to ping and
    reports the result.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

$DomainController = "DC01"

if (Test-Connection -ComputerName $DomainController -Count 2 -Quiet) {
    Write-Host "SUCCESS: $DomainController is reachable." -ForegroundColor Green
}
else {
    Write-Host "ERROR: $DomainController is not reachable." -ForegroundColor Red
}