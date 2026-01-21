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
cd $PSScriptRoot

$files=(Get-ChildItem)
for ($j=0; $j -le $files.Length; $j++) {
    if ($files[$j].Name -ilike "*ps1") {
            Write-Host $files[$j].Name
       }
}

# Q9

$folderpath = "$PSScriptRoot\outfolder"
if (Get-Item $folderpath) {
    Write-Host "Folder Already Exists"
} else {
    New-Item -ItemType "Directory" -Path $folderpath
}

# Q10
cd $PSScriptRoot
$files=(Get-ChildItem)

$files | Get-ChildItem | Where-Object { $_.Name -ilike "*.ps1" } | `
Export-Csv -Path ".\outfolder\out.csv"

# Q11
clear

$files = Get-ChildItem -Path "$PSScriptRoot" -Recurse -Force
$files | Where-Object { $_.Name -like "*.csv" } `
    | Rename-Item -NewName { $_.Name -replace ".csv", ".log" }
Get-ChildItem -Recurse -File