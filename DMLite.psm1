# ---------------------------------------------------------
# DMLite Module
#
# All rights go to Crestron Electronics, Inc.
# 
# This Module is designed to work and integrate with the 
# Crestron EDK Module to streamline device management and
# configuration at scale
# 
# Written by: Anthony Tippy 
# https://github.com/AnthonyTippy
# ---------------------------------------------------------
   
   
    <#
    .SYNOPSIS

	    Gets information for HDMD400 kits and other "DM Lite" devices. 
    .DESCRIPTION

	    The Get-HDMDInfo reports device information for the HDMD400 kit, and other DM lite devices with web management interface
		
    .EXAMPLE

	    Get-DMLiteInfo -Device [ENTER IP ADDRESS OF DEVICE]
		
    .INSTALLATION

       1.  Download this file and copy it to your Powershell\Modules Directory (Usually C:\Program Files\WindowsPowerShell\Modules)
       2.  Import this module at the beginning of each script using the command "Import-Module Get-HDMDInfo"

    .NOTES

	    Author: Anthony Tippy

    .VERSION

        V1.0
    #>    



function Get-DMLiteInfo {

	[CmdLetBinding()]
    param
    (
		[parameter(Mandatory=$true,Position=0,ValueFromPipeline)]
        [string]$Device
     
    )

    
process {

        try{
        Invoke-RestMethod -Method Default -Uri "http://$Device/aj.html?a=getinfo" -TimeoutSec 2 

        }
        catch{
        write-host -f red "Failed to connect to $Device`n"
        throw
        }
    

    }


}





    <#
    .SYNOPSIS

	    Allows powershell to update HDMD400 and various 'DM Lite devices'
 
    .DESCRIPTION

	    Automates the web GUI update process for various HDMD devices.
		
    .EXAMPLE

	    Get-DMLiteUpdate -Device [ENTER IP ADDRESS OF DEVICE] -LocalFile [ENTER FILE LOCATION OF FIRMWARE FILE]
		
        Module will report current device settings and then process the firmware update.

    .INSTALLATION

       1.  Download this file and copy it to your Powershell\Modules Directory (Usually C:\Program Files\WindowsPowerShell\Modules)
       2.  Import this module at the beginning of each script using the command "Import-Module Get-HDMDInfo"

    .NOTES

	    Author: Anthony Tippy

    .VERSION

        V1.0
    #> 

function Get-DMLiteUpdate {

	[CmdLetBinding()]
    param
    (
		[parameter(Mandatory=$true,Position=0,ValueFromPipeline)]
        [string]$Device,
        [Parameter(Mandatory=$true)]
		[string]$LocalFile

    )

    
process {

        try{
        #GetDevice Info
        Write-host -ForegroundColor Green "Pre-Update Device Info"
        Invoke-RestMethod -Method Default -Uri "http://$Device/aj.html?a=getinfo" -TimeoutSec 2 

            try{
            $wc = New-Object System.Net.WebClient

            $file = Get-ChildItem  -Path "$LocalFile"

            #send the file
            write-host -f green "$file Successfully Loaded to $Device. Updating - DO NOT REBOOT!"
            $Load = $wc.UploadFile("http://$Device/aj.html",$file.FullName) 
	        Start-Sleep -Seconds 5
        
            #Initiate FW Update
           #Write-host -f Green "`n$Device - Intiating Firmware Update`n"
            $FWUP = Invoke-RestMethod -Method Default -Uri "http://$Device/aj.html?a=command&cmd=FWUP" | out-null
            
            }
            catch{
            throw
            }

           
        }
        catch{
        write-host -f red "Failed to Update $Device`n"
        throw
        }
    

    }


}

#Export Modules OutHDMDI
Export-ModuleMember -Function Get-DMLiteInfo, Get-DMLiteUpdate