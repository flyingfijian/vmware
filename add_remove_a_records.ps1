
$arecords = Import-Csv -Path C:\Users\Administrator\Desktop\arecords.csv  
foreach ($a in $arecords) {
#Add-DnsServerResourceRecordA -ZoneName veeteetime.local -CreatePtr -Name $a.name -IPv4Address $a.ip
Remove-DnsServerResourceRecord -ZoneName veeteetime.local -RRType A -Name $a.name -Verbose
}
