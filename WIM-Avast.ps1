if (-not(Test-Path .\mount -PathType Container)) {
    New-Item -ItemType Directory -Path .\mount | Out-Null
}

if (Test-Path "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\en-us\winpe.wim") {
	Copy-Item -Path "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\en-us\winpe.wim" -Destination ".\AvastPE.wim" -ErrorAction SilentlyContinue -Force
} else {
	Write-Host "Windows ADK PE n'as pas été trouvé"
	exit 1
}

Write-Host "Image - .\AvastPE.wim"
Write-Host "DISM - Montage de l'image"
DISM /Mount-Image /ImageFile:.\AvastPE.wim /Index:1 /MountDir:.\mount | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "DISM - Une erreur est survenue"
    exit 1
}

#Copy Files
Write-Host "Copy - Copie des fichiers"
Copy-Item -Path .\Files\Windows -Destination .\mount -Recurse -ErrorAction SilentlyContinue
Copy-Item -Path .\Files\RESCUE -Destination .\mount -Recurse -ErrorAction SilentlyContinue
	
#Edit Registry
Write-Host "Registry - Modifications du registre"
reg load "HKLM\TEMP" .\mount\Windows\System32\config\SOFTWARE | Out-Null
reg import .\Avast.reg | Out-Null
reg unload "HKLM\TEMP" | Out-Null
Write-Host "DISM - Sauvegarde de l'image"
DISM /UnMount-Image /MountDir:.\mount /Commit | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "DISM - Une erreur est survenue"
    exit 1
}