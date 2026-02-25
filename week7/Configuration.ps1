$configPath = "C:\Users\champuser\SYS320\week7\configuration.txt"

function readConfiguration() {
    $lines = Get-Content -Path $configPath

    $infoTable = @()
    $infoTable += [pscustomobject]@{"Days" = $lines[0]; `
                                    "ExecutionTime" = $lines[1];
                                    }
    return $infoTable
}

function changeConfiguration() {
    Write-Host "Enter the amount of days for log evaluation:"
    $days = Read-Host

    Write-Host "Enter the time for automated execution:"
    $time = Read-Host

    if ($days -notmatch "[0-9]+") {
        Write-Host "Invalid day format... exiting"
        exit
    } 
    if ($time -notmatch "[0-9]+:[0-9]+ (AM|PM)") {
        Write-Host "Invalid time format... exiting"
        exit
    }

    $days | Out-File -FilePath $configPath
    $time | Out-File -FilePath $configPath -Append

    Write-Host "Changed configuration file successfully"
}

function configurationMenu() {
    $prompt = "`n"
    $prompt += "Select an option:`n"
    $prompt += "1 - Show Configuration`n"
    $prompt += "2 - Change Configuration`n"
    $prompt += "3 - Exit`n"

    while ($true) {
        Write-Host $prompt | Out-String
        $choice = Read-Host

        if ($choice -eq 1) {
            $data = readConfiguration
            Write-Host ($data | Format-Table | Out-String)
        }
        elseif ($choice -eq 2) {
            changeConfiguration
        }
        elseif ($choice -eq 3) {
            Write-Host "Exiting..."
            exit
        }
        else {
            Write-Host "Invalid input, please try again.`n"
        }
    }
}