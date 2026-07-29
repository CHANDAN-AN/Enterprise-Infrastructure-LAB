<#
.SYNOPSIS
    Displays all locked Active Directory user accounts.

.DESCRIPTION
    Retrieves any user accounts that are currently locked out
    and displays key account information.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

Search-ADAccount -LockedOut |
    Sort-Object Name |
    Select-Object Name,
                  SamAccountName,
                  ObjectClass