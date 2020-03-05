Configuration O365
{
    Import-DscResource -ModuleName Office365DSC
    $password = ConvertTo-SecureString 'MySecretPassword' -AsPlainText -Force
    $GlobalAdmin = New-Object System.Management.Automation.PSCredential ('MyGlobalAdmin@office365dsc.onmicrosoft.com', $password)
    
    Node localhost
    {
        # Add code changes
    }
}

$ConfigData = @{
    AllNodes = @(
        @{
            NodeName                    = "localhost"
            PsDSCAllowPlaintextPassword = $true
        }
    )
}

O365 -ConfigurationData $ConfigData
Start-DscConfiguration O365 -Wait -Verbose -Force