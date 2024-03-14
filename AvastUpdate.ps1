$CONTENT = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Avast Software]

[HKEY_LOCAL_MACHINE\SOFTWARE\Avast Software\Avast]
"DataFolder"="$env:SystemDrive\\ProgramData\\AVAST Software\\Avast"
"ProgramFolder"="$($PWD.Path -Replace '\\', '\\')\\Files\\RESCUE"

"@

$CONTENT | Set-Content -Path "$env:TMP\Avast.reg"

reg import "$env:TMP\Avast.reg" | Out-Null

Remove-Item -Path "$env:TMP\Avast.reg"

Start-Process -FilePath	"$PWD\Files\RESCUE\ASWPEANTIVIRUS.EXE" -ArgumentList "/u" -Wait

Remove-Item -Path "HKLM:\SOFTWARE\Avast Software" -Recurse -Force 