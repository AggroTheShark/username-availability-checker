Import-Module BurntToast

# Ensure TLS 1.2 is used for secure connection
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Path to file with usernames to check and GitHub logo
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$usernamesFile = "$scriptPath\usernames.txt"
$logo = "$scriptPath\resources\github.png"

# Check if the file exists
if ( Test-Path $usernamesFile )
{
    # Read usernames from the file (ignoring empty lines)
    $usernames = Get-Content $usernamesFile | Where-Object { $_ -ne "" }

    foreach ( $username in $usernames )
    {
        $url = "https://github.com/$username";

        try
        {
            # Try to connect to GitHub account
            Invoke-RestMethod -Uri $url -Method Head -Headers @{"User-Agent"="Mozilla/5.0"} -ErrorAction SilentlyContinue
        }
        catch # 404 expected
        {
            if ($_.Exception.Response.StatusCode -eq 404)
            {
                # Send a desktop notification
                New-BurntToastNotification -AppLogo $logo -Text "GitHub Username Available","The username $username is now free!"

                # Delay between checks
                Start-Sleep -Seconds 2
            }
        }
    }
}
else { Write-Host "Usernames file not found: $usernamesFile" }