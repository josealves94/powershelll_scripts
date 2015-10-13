# verifie si un lecteeur est présent sur le pc

$inp_lecteur = Read-Host "Veuillez indiquer un lecteur pour le mapper sur votre pc"

if ( "$inp_lecteur" -cmatch "[a-z]{1}$" )
{
    if (!(Get-PSDrive $inp_lecteur))
    {
        Write-Host "le lecteur $inp_lecteur - Création du mappage réseau"
        New-PSDrive -name $inp_lecteur -psprovider Filesystem -root \\solutec.lan\dfsParis
    }
    else
    {
        Write-Host "Le lecteur $inp_lecteur : existe"
    }
 }
 else
 {
    Write-Host "le format indiqué n'est pas correct"
 }