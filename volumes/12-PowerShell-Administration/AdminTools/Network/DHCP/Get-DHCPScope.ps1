<#
.SYNOPSIS
    Displays DHCP scopes.

.DESCRIPTION
    Retrieves DHCP IPv4 scopes from the DHCP server.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module DhcpServer

Get-DhcpServerv4Scope -ComputerName DC01 |
    Select-Object ScopeId,
                  Name,
                  State,
                  StartRange,
                  EndRange