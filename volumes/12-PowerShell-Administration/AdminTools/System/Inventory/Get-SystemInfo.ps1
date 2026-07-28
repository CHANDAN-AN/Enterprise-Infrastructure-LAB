<#
.SYNOPSIS
    Displays basic computer information.

.DESCRIPTION
    Retrieves operating system and hardware details for the local computer.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Get-ComputerInfo |
Select-Object `
    CsName,
    WindowsProductName,
    WindowsVersion,
    OsHardwareAbstractionLayer,
    BiosManufacturer,
    BiosName,
    CsDomain