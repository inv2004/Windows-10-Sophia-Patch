# Windows-10-Sophia-Patch
Some patches to have own Windows-10-Sophia-Script

## Setup
```
iwr https://github.com/inv2004/Windows-10-Sophia-Patch/releases/download/rolling/Sophia.zip -OutFile Sophia.zip
Expand-Archive .\Sophia.zip
cd Sophia/Sophia
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\Sophia.ps1
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process -Force
```
