$resp = New-EC2Instance `
	-ImageId $env:default_ami `
	-MinCount 1 `
	-MaxCount 1 `
	-InstanceType $env:default_InstanceType `
	-SecurityGroups $env:default_SecurityGroupId `
	--KeyName my-key-pair $env:default_KeyName `
	--SubnetId $env:default_subnetId
echo $resp

while ($true) {

	$instance = Get-EC2Instance -Filter @{Name = "reservation-id"; Values = $resp.ReservationId}
	$instance_state = $instance.RunningInstance.State
	$env:current_instance=$instance

	if ($instance_state -eq "running") {
    	break;
    }

    "$(Get-Date) Current State = $instance_state, Waiting for Desired State=running"
    Sleep -Seconds 5
}

