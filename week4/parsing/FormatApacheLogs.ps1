function getApacheLogs() {
$lines = Get-Content "C:\xampp\apache\logs\access.log"

$logTable = @()

for ($i=0; $i -lt $lines.Length; $i++) {
    $data = $lines[$i].Split(" ")
    
    
    $logTable += [pscustomobject]@{"IP" = $data[0]; `
                                   #"Client" = $data[1]; `
                                   #"Requestor" = $data[2]; `
                                   "Time" = $data[3]; `
                                   #"Timezone" = $data[4]; `
                                   "Method" = $data[5]; `
                                   "Resource" = $data[6]; `
                                   "Protocol" = $data[7]; `
                                   "Code" = $data[8]; `
                                   "Size" = $data[9]; `
                                   "Referrer" = $data[10]; `
                                   "UserAgent" = $data[11..($data.Count -1)];
                                  }
}

return $logTable
}