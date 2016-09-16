#init creds - this is set in the profile but doesn't carry over
.\set-creds.ps1

# The values for the running instance class from model Amazon.EC2.Model.RunningInstance
# class docs http://docs.aws.amazon.com/sdkfornet1/latest/apidocs/html/T_Amazon_EC2_Model_RunningInstance.htm

# ip or hostname to ssh to remote server
$ip = $env:Instance.RunningInstance.IpAddress
$fqdn = $env:Instance.RunningInstance.PublicDnsName

New-SSHSession -AcceptKey -ComputerName $ip -Credential $env:default_cred  -Verbose

Set-SCPFile -LocalFile .\provision.sh -RemoteFile "provision.sh" -ComputerName $ip -Credential $env:default_cred  -Verbose

#provision the server
Invoke-SSHCommand -Index 0 -Command "sh provision.sh"



