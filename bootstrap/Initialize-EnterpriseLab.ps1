# ===================================================================
# Enterprise Infrastructure Lab Bootstrap
# Creates the complete repository structure from EnterpriseVolumes.json
# ===================================================================

$Root = Split-Path -Parent $PSScriptRoot
$JsonFile = Join-Path $PSScriptRoot "EnterpriseVolumes.json"

if (!(Test-Path $JsonFile)) {
    Write-Host "EnterpriseVolumes.json not found." -ForegroundColor Red
    exit
}

$config = Get-Content $JsonFile -Raw | ConvertFrom-Json

$VolumesRoot = Join-Path $Root "volumes"

if (!(Test-Path $VolumesRoot)) {
    New-Item -ItemType Directory -Path $VolumesRoot | Out-Null
}

foreach ($volume in $config.volumes) {

    $VolumeFolder = Join-Path $VolumesRoot $volume.folder

    if (!(Test-Path $VolumeFolder)) {
        New-Item -ItemType Directory -Path $VolumeFolder | Out-Null
        Write-Host "Created $($volume.folder)" -ForegroundColor Green
    }

    foreach ($sub in $config.defaultSubfolders) {

        $SubFolder = Join-Path $VolumeFolder $sub

        if (!(Test-Path $SubFolder)) {
            New-Item -ItemType Directory -Path $SubFolder | Out-Null
        }
    }

    $Readme = Join-Path $VolumeFolder "README.md"

    if (!(Test-Path $Readme)) {

@"
# Volume $($volume.volume)

## $($volume.title)

### Phase

$($volume.phase)

### Status

$($volume.status)

---

## Objective

$($volume.description)

---

## Tasks

- [ ]

---

## Validation

- [ ]

---

## Screenshots

_To be added._

---

## Notes

_To be added._

"@ | Set-Content $Readme -Encoding UTF8

    }

}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Enterprise Lab Initialized" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan