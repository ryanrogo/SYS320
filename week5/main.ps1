. (Join-Path $PSScriptRoot gatherClasses.ps1)
. (Join-Path $PSScriptRoot daysTranslator.ps1)

$FullTable = gatherClasses

$FullTable = daysTranslator $FullTable

# all classes taugh by Prof Furkan Paligu
$FullTable | Select-Object "Class Code", "Instructor", "Location", "Days", "Time Start", "Time End" | `
    Where { $_."Instructor" -ilike "Furkan Paligu" }

clear 
# FREE 105 on Wednesday
$FullTable | Where-Object { ($_.Location -ilike "FREE 105") -and ($_.days -ilike "Wednesday") } | `
    Sort-Object "Time Start" -Descending | Format-Table "Time Start", "Time End", "Class Code"


# Profs that teach SYS, NET, SEC, FOR, CSI, DAT
$ITSinstructors = $FullTable | Where-Object {   ($_."Class Code" -ilike "SYS*") -or `
                                                ($_."Class Code" -ilike "NET*") -or `
                                                ($_."Class Code" -ilike "SEC*") -or `
                                                ($_."Class Code" -ilike "FOR*") -or `
                                                ($_."Class Code" -ilike "CSI*") -or `
                                                ($_."Class Code" -ilike "DAT*") } `
                             | Sort-Object "Instructor" `
                             | Select-Object "Instructor" -Unique

$instructors = $ITSinstructors.Instructor

clear

$FullTable | Where-Object {$_.Instructor -in $instructors} `
| Group-Object "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending