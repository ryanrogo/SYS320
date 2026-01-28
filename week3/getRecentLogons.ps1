function getRecentLogons($days){
$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

$loginoutsTable = @()

for ($i=0; $i -lt $loginouts.Count; $i++) {
    $event = ""

    if($loginouts[$i].InstanceId -eq 7001) {$event = "Logon"}
    elseif($loginouts[$i].InstanceId -eq 7002) {$event = "Logoff"}
    else { continue }

    $user = $loginouts[$i].ReplacementStrings[1]

    $user = New-Object System.Security.Principal.SecurityIdentifier $user
    $user = $user.Translate([System.Security.Principal.NTAccount])
    
    $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                           "Id" = $loginouts[$i].InstanceId; `
                                        "Event" = $event; `
                                         "User" = $user;
                                        }
}

 return $loginoutsTable
}