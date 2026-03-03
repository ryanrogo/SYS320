# assuming that access.log is in the same directory as this

function getLogs() {
    $data = Get-Content $PSScriptRoot\access.log

    $logTable = @()

    for ($i=0; $i -lt $data.Length; $i++) {
        $parts = $data[$i].Split(" ")

        # Commented out as not required
        $logTable += [pscustomobject]@{"IP" = $parts[0]; `
                                      # "Client" = $parts[1]; `
                                      # "Requestor" = $parts[2]; `
                                       "Time" = $parts[3]; `
                                      # "Timezone" = $parts[4]; `
                                       "Method" = $parts[5]; `
                                       "Resource" = $parts[6]; `
                                       "Protocol" = $parts[7]; `
                                       "Code" = $parts[8]; `
                                      # "Size" = $parts[9]; `
                                       "Referrer" = $parts[10]; `
                                      # "UserAgent" = $parts[11..($parts.Count -1)]; 
                                      }
    }
    return $logTable
}


#$logs = getLogs

#Write-Host ($logs | Format-Table -AutoSize | Out-String)