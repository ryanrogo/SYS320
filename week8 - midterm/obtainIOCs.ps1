function obtainIOCs() {
    $page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.6/IOC.html

    $IOCtableElement = $page.ParsedHtml.body.getElementsByTagName("td")

    $IOCs = @()

    for ($i = 0; $i -lt $IOCtableElement.length; $i+=2) {

        $IOCs += [pscustomobject]@{"Pattern" = $IOCtableElement[$i].outerText; `
                                   "Description" = $IOCtableElement[$i+1].outerText;
                                  }
    }

    return $IOCs
}

#$IOCS = obtainIOCs

#Write-Host ($IOCs | Format-Table -AutoSize | Out-String)