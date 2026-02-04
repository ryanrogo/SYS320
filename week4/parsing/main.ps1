. (Join-Path $PSScriptRoot FormatApacheLogs.ps1)

$logs = getApacheLogs

Write-Host ($logs | Format-Table -AutoSize | Out-String)

Write-Host ($logs | Where-Object { $_.Resource -ilike "*page2.html" -and $_.Referrer -ilike "*index.html*"} `
    | Format-Table | Out-String)