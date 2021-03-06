param(
    [string]$Organization = "",
    [string]$Owner = "",
    [switch]$SkipRandomPassword
)

Push-Location $PSScriptRoot

. ./AutomationHelpers.ps1

try {
    DeleteScheduledTask

    InstallCFCell
    CleanUpVM
    SysprepVM -Organization $Organization -Owner $Owner -SkipRandomPassword $SkipRandomPassword
} catch [Exception] {
    Write-Log "Failed to prepare the VM. See 'c:\provisions\log.log' for more info."
    Exit 1
}

Pop-Location
