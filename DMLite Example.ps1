#DMLite Device Info Script

Import-Module DMLite

#REMOVE OLD REPORT FILES
remove-item "$home\HDMDTest.csv" -ErrorAction SilentlyContinue 

#Import from IP.txt file list
$devs = @(Get-Content -Path (Join-Path $PSScriptRoot 'IP.txt'))

foreach ($d in $devs){
    try{
    write-host "connecting to $d`n"
    $Devinfo = Get-DMLiteInfo -Device $d 

    $Devinfo | export-csv "$home\HDMDTest.csv" -NoTypeInformation -Append
    }
    catch {"$d error!"}
}

#Grab Report and export to gridview 
import-csv "$home\HDMDTest.csv"| Out-GridView
