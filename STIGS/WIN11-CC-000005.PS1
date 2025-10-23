<#
.SYNOPSIS
  This PowerShell script disables camera access from the Windows 11 lock screen by setting the NoLockScreenCamera 
  registry value to 1 under HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization  

.NOTES
    Author          : Nicholas Russell
    LinkedIn        : linkedin.com/innicholas-russell-51a839104//
    GitHub          : github.com/nrussell149
    Date Created    : 2025-10-22
    Last Modified   : 2025-10-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-cc-000005).ps1 
#>


# Registry path for lock screen camera policy
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenCamera"

# Ensure the key exists
if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy value to 1 (Disabled)
New-ItemProperty -Path $RegPath -Name $ValueName -PropertyType DWord -Value 1 -Force | Out-Null

# Verify result
$CurrentValue = (Get-ItemProperty -Path $RegPath -Name $ValueName).$ValueName

Write-Host "Camera access from the lock screen has been disabled." -ForegroundColor Green
Write-Host "$RegPath\$ValueName = $CurrentValue (1 = Disabled)"
Write-Host "`nRun 'gpupdate /force' or restart for the
