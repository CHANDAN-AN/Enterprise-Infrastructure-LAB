<#
.SYNOPSIS
    Lists all Active Directory groups.

.DESCRIPTION
    Retrieves all Active Directory groups
    and displays key information.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

Get-ADGroup -Filter * |
    Sort-Object Name |
    Select-Object Name,
                  GroupCategory,
                  GroupScope