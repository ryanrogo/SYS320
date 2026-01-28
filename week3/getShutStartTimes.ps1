function getShutStartTimes($days, $type) {
$times = Get-EventLog System -Source EventLog -After (Get-Date).AddDays(-$days)
$timesTable = @()

for ($i=0; $i -lt $times.Count; $i++) {
    $event = ""

    if ($type -ilike "shutdown") {
        if($times[$i].EventID -eq 6006) {$event = "Shutdown"}
        else { continue }
    }
    if ($type -ilike "startup") {
        if($times[$i].EventID -eq 6005) {$event = "Startup"}
        else { continue }
    }
    
    $timesTable += [pscustomobject]@{"Time" = $times[$i].TimeGenerated; `
                                       "Id" = $times[$i].EventID; `
                                    "Event" = $event; `
                                     "User" = "System";
                                    }
}

 return $timesTable
}