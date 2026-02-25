function SendAlertEmail($Body) {
    $from = "ryan.rogowski@mymail.champlain.edu"
    $to = "ryan.rogowski@mymail.champlain.edu"
    $subject = "Suspicious Activity"

    $password = Get-Content "C:\Users\champuser\SYS320\week7\file.txt" | ConvertTo-SecureString
    $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $from, $password

    Send-MailMessage -From $from -To $to -Subject $subject -Body $Body -SmtpServer "smtp.gmail.com" `
        -Port 587 -UseSsl -Credential $credential
}