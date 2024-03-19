$CONTENT = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Avast Software]

[HKEY_LOCAL_MACHINE\SOFTWARE\Avast Software\Avast]
"DataFolder"="$env:SystemDrive\\ProgramData\\AVAST Software\\Avast"
"ProgramFolder"="$($PWD.Path -Replace '\\', '\\')\\Files\\RESCUE"

"@

$CONTENT | Set-Content -Path "$env:TMP\Avast.reg"

reg import "$env:TMP\Avast.reg" > $null 2>&1

Remove-Item -Path "$env:TMP\Avast.reg"

if (Test-Path .\Files\RESCUE\DEFS\ASWDEFS.INI) {
    $latest = Get-Content .\Files\RESCUE\DEFS\ASWDEFS.INI | Where-Object { $_ -match "Latest=" } | ForEach-Object { $_ -replace "Latest=", "" }
    Write-Output "ASW DEFS : $latest - Before Update"
} else {
    Write-Output "No ASW DEFS"
}

Start-Process -FilePath	"$PWD\Files\RESCUE\ASWPEANTIVIRUS.EXE" -ArgumentList "/u" -Wait

if (Test-Path .\Files\RESCUE\DEFS\ASWDEFS.INI) {
    $latest = Get-Content .\Files\RESCUE\DEFS\ASWDEFS.INI | Where-Object { $_ -match "Latest=" } | ForEach-Object { $_ -replace "Latest=", "" }
    Write-Output "ASW DEFS : $latest - After Update"
} else {
    Write-Output "No ASW DEFS"
}

Remove-Item -Path "HKLM:\SOFTWARE\Avast Software" -Recurse -Force 