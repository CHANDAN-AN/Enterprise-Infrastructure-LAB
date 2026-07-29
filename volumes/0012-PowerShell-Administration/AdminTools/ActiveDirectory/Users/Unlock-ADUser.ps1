<#
.SYNOPSIS
    Unlocks a locked Active Directory user account.

.DESCRIPTION
    Prompts for a username, verifies the account exists,
    checks whether it is locked, and unlocks it if necessary.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Import-Module ActiveDirectory

$username = Read-Host "Enter the username (SamAccountName)"

$user = Get-ADUser -Identity $username -Properties LockedOut -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "User '$username' was not found." -ForegroundColor Red
    return
}

if ($user.LockedOut) {
    Unlock-ADAccount -Identity $user
    Write-Host "User '$username' has been unlocked successfully." -ForegroundColor Green
}
else {
    Write-Host "User '$username' is not locked." -ForegroundColor Yellow
}