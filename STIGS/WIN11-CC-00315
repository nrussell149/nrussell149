<#
.SYNOPSIS
    This PowerShell script ensures that This PowerShell script disables the "Always install with elevated privileges" 
     policy by setting the AlwaysInstallElevated registry value to 0 to prevent MSI files from running with administrative rights.

.NOTES
    Author          : Nick Russell
    LinkedIn        : linkedin.com/in/nicholas-russell-51a839104/
    GitHub          : github.com/nrussell149
    Date Created    : 2025-10-22
    Last Modified   : 2025-10-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-cc-000315).ps1 
#>

# # Define registry path and value name
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"
$ValueName = "AlwaysInstallElevated"

Write-Host "Disabling 'Always install with elevated privileges'..." -ForegroundColor Cyan

# Create the key if it doesn't exist
if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    Write-Host "Created registry path: $RegPath"
}

# Set the value to 0 (Disabled)
New-ItemProperty -Path $RegPath -Name $ValueName -PropertyType DWord -Value 0 -Force | Out-Null
