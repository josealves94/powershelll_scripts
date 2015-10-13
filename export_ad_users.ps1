# export all AD-users
# il faut installer le module active directory sur Windows server 2008
# Importer le module sur Windows Server 2012 R2

#Get-ADuser -Filter * |Export-Csv export_users.txt -Delimiter ";"
# rechercher le nom de l'utilisateur dans la base active directory
 $name = Read-Host "Veuillez mettre un nom d'utilisateur figurant dans la base active directory"
  #[String]::IsNullOrEmpty($name)
  
if ( $name -ne  "" )
{

  Get-ADUser -Filter {Surname -eq $name} -SearchBase "DC=steen,DC=com" 
 
 }
 else
 {
    Write-host "veuillez mettre une valeur valide"
 }