$env:default_ami = "ami-12345678"
$env:default_InstanceType = "t2.micro"
$env:default_KeyName = "mainkey"
$env:default_SecurityGroupId = "sg-12345678"
$env:default_subnetId = "sg-12345678"

# The non interactie credentals still needs woork!! a clear txt pwd I had issues when trying to use an encrypted password
#Note Setting env vars for user and pass cause failuers 
#$env:default_username = "root"
#$env:default_password = cat .\securestring.txt | convertto-securestring -AsPlainText -Force
#$env:default_cred = New-Object System.Management.Automation.PsCredential($env:default_username, $env:default_password)

$default_username = "root"
$default_password = cat .\securestring.txt | convertto-securestring -AsPlainText -Force
$env:default_cred = New-Object System.Management.Automation.PsCredential($default_username, $default_password)