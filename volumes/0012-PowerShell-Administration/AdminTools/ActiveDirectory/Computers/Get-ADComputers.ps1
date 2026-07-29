<#
.SYNOPSIS
    Lists all Active Directory computer accounts.

.DESCRIPTION
    Retrieves all computer accounts from Active Directory
    and displays key information.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

Get-ADComputer -Filter * -Properties OperatingSystem, Enabled |
    Sort-Object Name |
    Select-Object Name,
                  OperatingSystem,
                  Enabled