filter process-r-x
{
Write-Output “Réémet le process $_“
$_ # Ré-émission dans le pipeline de l’objet courant
}


process-r-x