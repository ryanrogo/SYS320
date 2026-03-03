. (Join-Path $PSScriptRoot getLogs.ps1)
. (Join-Path $PSScriptRoot obtainIOCs.ps1)

function checkForIOCs($logs, $IOCs) {
         
    return $logs | Where-Object { `
        foreach ($ioc in $IOCs) {
                if ($_.Resource -like "*$($ioc.Pattern)*") { 
                    return $true 
                }
            } 
            return $false
        }

}

$logs = getLogs
$IOCs = obtainIOCs


checkforIOCs $logs $IOCs | Format-Table | Sort-Object Time -Descending | Out-String