# Crestron-EDK-DMLite
Crestron DMLite Module for Powershell that works similiarly to the Crestron EDK Modules.  Module can be used to perform device mantainance/management tasks at scale.

# Get Started/Installation 

1. Download and Install the "DMLite.ps1m" module (https://github.com/AnthonyTippy/Crestron-EDK-DMLite/blob/main/DMLite.psm1)
2. Copy the module to your Powershell Modules folder (Usually C:\Program Files\WindowsPowerShell\Modules)
3. Import this module at the beginning of each script using the command "Import-Module DMLite"

# Commands
1. Get-DMLiteInfo - Gets information from DMLite Devices
2. Get-DMLiteUpdate -Processes firmware update on DMLite Devices

# Usage/ Examples 

## Get-DMLiteInfo

Get-DMLiteInfo -Device [ENTER IP ADDRESS OF DEVICE]


## Get-DMLiteUpdate

Get-DMLiteUpdate -Device [ENTER IP ADDRESS OF DEVICE] -LocalFile [ENTER FILE LOCATION OF FIRMWARE FILE]



