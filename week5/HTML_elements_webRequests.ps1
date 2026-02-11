$scaped_page = Invoke-WebRequest -TimeoutSec 10 http://localhost/ToBeScraped.html
#$scaped_page.links.Count

#$scaped_page.links | select href, outerText

$h2s = $scaped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText
#$h2s


$div1s = $scaped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
    $_.getAttributeNode("class").Value -ilike "div-1" } | select innerText

$div1s