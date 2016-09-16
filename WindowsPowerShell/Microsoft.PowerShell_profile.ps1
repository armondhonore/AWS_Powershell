
Set-AWSCredentials -StoredCredentials armond
Set-DefaultAWSRegion us-east-1

# This is a hack this needs to include the full path
.\awsenv.ps1

function prompt 
{
    $realLASTEXITCODE = $LASTEXITCODE
 
    $prompt = "PS "
    if ($StoredAWSCredentials -ne $null)
    {
        $prompt += "$StoredAWSCredentials"
    }
     
    if ($StoredAWSRegion -ne $null) 
    { 
        $prompt += "@"
        $prompt += "$StoredAWSRegion"
    }
     
    $prompt += " "
    $prompt += $pwd.ProviderPath
    $prompt += "> "
 
    $global:LASTEXITCODE = $realLASTEXITCODE
    $prompt
}