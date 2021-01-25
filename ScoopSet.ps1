scoop install git
scoop bucket add extras

Get-Content .\scoop.txt | foreach {
  scoop install $_
} *>&1 | tee scoop.log
