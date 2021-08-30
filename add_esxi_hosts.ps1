
$datacenter = "ae1"
 
# List of ESXi Hosts to Add to New Data Center
# Use the IP Addresses or FQDNs of the ESXi hosts to be added
# Example using IP: $esxhosts = "192.168.1.25","192.168.1.26"
# Example using FQDN: $esxhosts = "esx0.lab.local","esx1.lab.local"
$esxhosts = @('a-esx01.xaas1.local','a-esx02.xaas1.local','a-esx03.xaas1.local')
 
# Prompt for ESXi Root Credentials
Write-Host "Enter ESXi Root Creds"
$esxcred = Get-Credential 
 
Write-Host "Creating Datacenter $datacenter" -ForegroundColor green

$location = Get-Folder -NoRecursion | New-Folder -Name root

New-DataCenter -Location $location -Name $datacenter 

$dclocation = Get-Datacenter 
 
foreach ($esx in $esxhosts) {
Write-Host "Adding ESX Host $esx to $datacenter" -ForegroundColor green
  Add-VMHost -Name $esx -Location ae1 -Credential $esxcred -Force -RunAsync -Confirm:$false
}
 
Write-Host "Done!" -ForegroundColor green