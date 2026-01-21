# Q1
#(Get-NetIPAddress -AddressFamily IPv4) | Where-Object { $_.InterfaceAlias -ilike "Ethernet" } | Select IPAddress

# Q2
#(Get-NetIPAddress -AddressFamily IPv4) | Where-Object `
#    { $_.InterfaceAlias -ilike "Ethernet" } | Select PrefixLength

# Q3/4
Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_Net*" } | sort

# Q5/6
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" `
#|   select IPAddress | Format-Table -HideTableHeaders

# Q7
# (Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet"}).ServerAddresses[0]

# Q8
clear
