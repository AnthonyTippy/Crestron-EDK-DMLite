#DMLite Device Script

Import-Module DMLite


#Import from IP.txt file list
$devs = @(Get-Content -Path (Join-Path $PSScriptRoot 'IP.txt'))

#Firmware File Location
$file = "ENTER FILE LOCATION"


foreach ($d in $devs){

    try{
    write-host "connecting to $d`n"

    Get-DMLiteUpdate -Device $d -LocalFile $file

    }
    catch {"$d error!"}
}



