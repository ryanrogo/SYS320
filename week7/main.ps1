. (Join-Path $PSScriptRoot Configuration.ps1)
. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

$configuration = readConfiguration

$failed = atRiskUsers $configuration.Days

SendAlertEmail ($failed | Format-Table | Out-String)

ChooseTimeToRun $configuration.ExecutionTime