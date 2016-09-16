Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Install-Module Posh-SSH
#New-SSHSession -ComputerName "thomasmaurer.azure.cloudapp.net" -Credential (Get-Credential)
read-host -assecurestring | convertfrom-securestring | out-file securestring.txt
