$default_username = "root"
$default_password = cat .\securestring.txt | convertto-securestring -AsPlainText -Force
$env:default_cred = New-Object System.Management.Automation.PsCredential($default_username, $default_password)