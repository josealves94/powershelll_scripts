# verifie la politique de sécurité  de powershell sur une machine et l'active ensuite
#

$policy = "RemoteSigned"

if ((Get-ExecutionPolicy) -ne $policy )
{
    Set-ExecutionPolicy $policy -Force
    exit
}
else
{
    Write-Host "la policy $policy est déja activée vous pouvez executer vos scripts powershell sur cette machine"
    exit
}
