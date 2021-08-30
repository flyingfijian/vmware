$esxhosts = @('a-esx01.xaas1.local','a-esx02.xaas1.local','a-esx03.xaas1.local')

foreach ($esx in $esxhosts) {
    Write-Host "Adding Datastore $esx" -ForegroundColor green
    New-Datastore -Nfs -VMHost $esx -Name share1 -Path /nfs/share1 -NfsHost 172.16.1.10
    New-Datastore -Nfs -VMHost $esx -Name share2 -Path /nfs/share2 -NfsHost 172.16.1.10
    New-Datastore -Nfs -VMHost $esx -Name share3 -Path /nfs/share3 -NfsHost 172.16.1.10
    }
     


