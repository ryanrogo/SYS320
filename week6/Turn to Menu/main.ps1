. (Join-Path $PSScriptRoot "..\..\week4\parsing\FormatApacheLogs.ps1")
. (Join-Path $PSScriptRoot "..\Local User Manage Menu\Event-Logs.ps1")
. (Join-Path $PSScriptRoot "..\..\week2\ProcessManagement1_Chrome.ps1")


#getApacheLogs
#getFailedLogins 90

clear

$Prompt = "`n"
$Prompt += "Please choose your option:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins (all users)`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Visit champlain.edur`n"
$Prompt += "5 - Exit`n"

while ($true) {

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if ($choice -eq 1) {
        getApacheLogs | Select-Object -Last 10
    }
    elseif ($choice -eq 2) {
        getFailedLogins 1000 | Select-Object -Last 10
    }
    elseif ($choice -eq 3) {
    
    }
    elseif ($choice -eq 4) {
        
        visitChamplain

    }
    elseif ($choice -eq 5) {
        Write-Host "Exiting..."
        exit
    }
    else {
        Write-Host "Invalid option, please enter a number from the menu."
    }
}