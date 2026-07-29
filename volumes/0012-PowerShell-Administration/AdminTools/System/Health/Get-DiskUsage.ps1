<#
.SYNOPSIS
    Displays disk usage.

.DESCRIPTION
    Shows local disk capacity and free space.

.AUTHOR
    Chandan Anuth

.VERSION
    1.0
#>

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object `
    DeviceID,
    VolumeName,
    @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}},
    @{Name="Free(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}}