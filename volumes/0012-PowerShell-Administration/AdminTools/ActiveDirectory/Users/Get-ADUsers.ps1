<#
.SYNOPSIS
    Lists all Active Directory users.

.DESCRIPTION
    Retrieves enabled and disabled user accounts from Active Directory
    and displays key account information.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties Enabled, Department |
    Sort-Object Name |
    Select-Object Name,
                  SamAccountName,
                  Enabled,
                  Department