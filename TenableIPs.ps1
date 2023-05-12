$OutputFilename = "C:\Path to save location\Filename.txt"

$response = Invoke-WebRequest -Uri 'https://docs.tenable.com/ip-ranges/data.json' -UseBasicParsing
$ips = $response | ConvertFrom-Json
$output = foreach ($ip in $ips)
{
write-output $($ip.prefixes.ip_prefix)"`r`n"
}

$output | Out-File -Encoding ascii $OutputFilename