# export all AD-users
# il faut installer le module active directory sur Windows server 2008
# Importer le module sur Windows Server 2012 R2
# lancer le script sur un dc

# rechercher un utilisateur dans la base active directory fonctionne seulement sur Windows server



function find_userad()
{
    $os_version = (Get-WmiObject -class Win32_OperatingSystem).Caption
    $inp_name = Read-Host "Veuillez indiquer un utilisateur de la base AD"

   
if ($os_version -match "Server")
{
     $username = Get-ADUser -Filter {samAccountName -eq $inp_name}
    if (!$username)
    {

	      Write-error "Cet utilisateur n'\existe pas"
    }
    else
    {
        # export csv 
 	     Write-Host "$inp_name " | Export-Csv utilisateurs.csv -Delimiter ";"
    
    }
    
}
else
{
    Write-Host "L'os utilisé n'est pas Windows Server"   
}

}


find_userad