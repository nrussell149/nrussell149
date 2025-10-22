<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Nicholas Russell
    LinkedIn        : linkedin.com/in/nicholas-russell-51a839104
    GitHub          : github.com/nrussell149
    Date Created    : 2025-10-22
    Last Modified   : 2025-10-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

# YOUR CODE GOES HERE# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the key if it does not exist
if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the MaxSize DWORD value to 0x00008000 (32768 KB)
New-ItemProperty -Path $RegPath -Name "MaxSize" -PropertyType DWord -Value 0x00008000 -Force | Out-Null

# Confirm the change
$CurrentValue = Get-ItemProperty -Path $RegPath -Name "MaxSize" | Select-Object -ExpandProperty MaxSize
Write-Host "MaxSize successfully set to $CurrentValue (decimal), path: $RegPath"
