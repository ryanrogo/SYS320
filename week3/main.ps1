. (Join-Path $PSScriptRoot getRecentLogons.ps1)
. (Join-Path $PSScriptRoot getShutStartTimes.ps1)

$loginoutsTable = getRecentLogons 15
$loginoutsTable

$shutdownsTable = getShutStartTimes 25 "shutdown"
$shutdownsTable

$startupsTable = getShutStartTimes 25 "startup"
$startupsTable