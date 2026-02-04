#Get-Content C:\xampp\apache\logs\access.log | Select-String -Last 5
#Get-Content C:\xampp\apache\logs\access.log | Select-String " 400[0-9] "
#Get-Content C:\xampp\apache\logs\access.log | Select-String " 200 " -NotMatch

# Q5
$logspath = "C:\xampp\apache\logs\"
Get-ChildItem $logspath | Select-String "error"

clear
# Q6/7
$logs = Get-Content "C:\xampp\apache\logs\access.log"

$lines = @()
for ($i=0; $i -lt $logs.Count; $i++) {
    $lines += $logs[$i].Split(" - - \[")[0]
}
$lines | Select-String ":" -NotMatch | Group-Object