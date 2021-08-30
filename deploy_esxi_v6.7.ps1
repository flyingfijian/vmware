##Global Values
$vmhost = "a-esxi-10.veeteetime.local"
$vmhostdatastore = "vsanDatastore (1)"
$esxihostname = "a-esx03.xaas1.local"##
$esxinetwork = "VCF-MGMT"
$esxiipaddress = "10.70.11.102"##
$esxinetmask = "255.255.254.0"
$esxigateway = "10.70.10.1"
$esxivlan  = "5"
$esxidns = "10.70.10.254"
$esxidomain = "xaas1.local"##
$esxintp = "10.70.10.234"
$esxisyslog = "10.70.10.242"
$esxipassword = "VMware1!"
$esxissh = "True"
$esxivmfs = "False"


$ovfpath = "C:\Users\Administrator\Downloads\Nested_ESXi6.7u3_Appliance_Template_v1.ova"
$ovfconfig = Get-OvfConfiguration -Ovf $ovfpath

function Deploy-ESXi {
    $ovfconfig.Common.guestinfo.hostname.Value = $esxihostname
    $ovfconfig.Common.guestinfo.ipaddress.Value = $esxiipaddress
    $ovfconfig.Common.guestinfo.netmask.Value = $esxinetmask
    $ovfconfig.Common.guestinfo.gateway.Value = $esxigateway
    $ovfconfig.Common.guestinfo.vlan.Value = $esxivlan
    $ovfconfig.Common.guestinfo.dns.Value = $esxidns
    $ovfconfig.Common.guestinfo.domain.Value = $esxidomain
    $ovfconfig.Common.guestinfo.ntp.Value = $esxintp
    $ovfconfig.Common.guestinfo.syslog.Value = $esxisyslog
    $ovfconfig.Common.guestinfo.password.Value = $esxipassword
    $ovfconfig.Common.guestinfo.ssh.Value = $esxissh
    $ovfconfig.Common.guestinfo.createvmfs.Value = $esxivmfs
    $ovfconfig.NetworkMapping.VM_Network.Value = $esxinetwork

Import-VApp -Source $ovfpath -Name $esxihostname -VMHost $vmhost -Datastore $vmhostdatastore -DiskStorageFormat Thin -OvfConfiguration $ovfconfig
#Start-VM -VM $esxihostname
}

Deploy-ESXi
