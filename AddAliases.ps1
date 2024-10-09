$userPrincipalName = "user@domain.com"
$aliasesFilePath = "aliases.txt"

if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
    Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber
}
Import-Module ExchangeOnlineManagement

Connect-ExchangeOnline -UserPrincipalName $userPrincipalName

$aliases = Get-Content -Path $aliasesFilePath
$success = $true

foreach ($alias in $aliases) {
    $mailbox = Get-Mailbox -Identity $userPrincipalName
    if ($mailbox.EmailAddresses -contains "smtp:$alias") {
        Write-Host "Alias $alias already exists." -ForegroundColor Yellow
    } else {
        try {
            Set-Mailbox -Identity $userPrincipalName -EmailAddresses @{add=$alias}
            $mailbox = Get-Mailbox -Identity $userPrincipalName
            if ($mailbox.EmailAddresses -contains "smtp:$alias") {
                Write-Host "Alias $alias added successfully." -ForegroundColor Green
            } else {
                throw "Alias $alias was not added successfully."
            }
        } catch {
            Write-Host "Failed to add alias: $alias" -ForegroundColor Red
            $success = $false
        }
    }
}

if ($success) {
    Write-Host "Done!" -ForegroundColor Green
} else {
    Write-Host "There were errors adding some aliases!" -ForegroundColor DarkMagenta
}
