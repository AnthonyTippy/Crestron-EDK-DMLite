# Crestron-EDK-DMLite
Crestron DMLite Module for Powershell that works similiarly to the Crestron EDK Modules.  Module can be used to perform device maintenance /management tasks at scale.

# Get Started/Installation 

1. Download and Install the "DMLite.ps1m" module (https://github.com/AnthonyTippy/Crestron-EDK-DMLite/blob/main/DMLite.psm1)
2. Copy the module to your Powershell Modules folder (Usually C:\Program Files\WindowsPowerShell\Modules)
3. Import this module at the beginning of each script using the command "Import-Module DMLite"


# Usage/ Examples 

## Get-DMLiteInfo

Get-DMLiteInfo -Device [ENTER IP ADDRESS OF DEVICE]


## Get-DMLiteUpdate

Get-DMLiteUpdate -Device [ENTER IP ADDRESS OF DEVICE] -LocalFile [ENTER FILE LOCATION OF FIRMWARE FILE]


# Example Scripts

I've attached two example scripts for both gathering device information as well as updating firmware

### DeviceInfo 
https://github.com/AnthonyTippy/Crestron-EDK-DMLite/blob/main/DMLite%20Example.ps1

### DeviceFirmwareUpdate
https://github.com/AnthonyTippy/Crestron-EDK-DMLite/blob/main/DMLite%20FW%20Example.ps1

Enjoy!
