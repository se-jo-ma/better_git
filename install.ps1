if (!(Test-Path C:\BetterGit\commands)){
    New-Item -Type Directory -Path C:\BetterGit\commands -Force
}

Move-Item $PSScriptRoot\commands\* C:\BetterGit\commands -Force
Move-Item $PSScriptRoot\Profile.ps1 C:\BetterGit\Profile.ps1 -Force

if (!(Test-Path $PROFILE)){
    New-Item -Type File -Path $PROFILE -Force
}

$dotSourceExists = Get-Content $PROFILE | Select-String -Pattern '\BetterGit\Profile.ps1' -SimpleMatch -Quiet
if (!$dotSourceExists){
    Add-Content -Path $PROFILE -Value ". C:\BetterGit\Profile.ps1"
}

# Clean up install scripts
Remove-Item $PSScriptRoot -Recurse -Force