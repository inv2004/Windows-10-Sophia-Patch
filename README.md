# Windows-10-Sophia-Patch
Some patches to have own Windows-10-Sophia-Script

## Setup
```pwsh
iwr https://github.com/inv2004/Windows-10-Sophia-Patch/releases/download/rolling/Sophia.zip -OutFile Sophia.zip
Expand-Archive .\Sophia.zip -DestinationPath .
cd Sophia
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\Sophia.ps1
.\Step2.ps1
```

Restart

```pwsh
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex
.\ScoopSet.ps1
```
