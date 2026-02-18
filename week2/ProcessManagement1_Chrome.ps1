function visitChamplain() {
    if (Get-Process -Name chrome) {
        Get-Process -Name chrome | kill
    } else {
        Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" "--new-window www.champlain.edu"
    }
}