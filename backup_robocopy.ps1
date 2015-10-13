$repsource = "C:\SOURCE"
$repdest = "C:\Destination_test"
$logfile ="C:\resultat.log"

# check if the destination folder exists if not create a new one 
if (Test-Path $repdest)
{
    robocopy $repsource $repdest /E /MIR /R:2 /ETA /TEE /LOG:$logfile
}
else
{
   Write-Host "le repertoire $repdest n'existe pas"
   New-Item -Path $repdest -ItemType directory

}