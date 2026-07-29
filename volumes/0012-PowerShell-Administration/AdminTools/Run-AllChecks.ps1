Write-Host "======================================="
Write-Host " Enterprise Infrastructure Lab Toolkit "
Write-Host "======================================="

& "C:\AdminTools\ActiveDirectory\Users\Get-ADUsers.ps1"
& "C:\AdminTools\Network\Connectivity\Test-DomainController.ps1"
& "C:\AdminTools\System\Inventory\Get-SystemInfo.ps1"
& "C:\AdminTools\System\Health\Invoke-HealthCheck.ps1"