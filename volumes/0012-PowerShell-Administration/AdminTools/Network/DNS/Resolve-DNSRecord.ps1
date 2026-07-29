<#
.SYNOPSIS
    Resolves a DNS hostname.

.DESCRIPTION
    Prompts for a hostname and resolves it using DNS.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

$HostName = Read-Host "Enter hostname"

try {
    Resolve-DnsName -Name $HostName -ErrorAction Stop |
        Select-Object Name,
                      Type,
                      IPAddress
}
catch {
    Write-Host "DNS lookup failed for '$HostName'." -ForegroundColor Red
}