function add_computer()
{
 do {
    Write-Host "Programme pour ajouter ou supprimer votre machine d'un domaine Microsoft"
    $domain = Read-Host "Veuillez indiquer le nom de domaine de votre organisation par ex : contoso (format  windows 2000)"
    $prompt = Read-Host "Plusieurs choix disponibles : (A) pour ajouter et (S) pour supprimer"

switch($prompt)
{
    A {  Write-Host "Ajout de la machine au domaine $domain en cours / redemarrage de la machine dans quelques secondes "
    # Start-sleep -s 10
    # add-computer -domainname $domain ; restart-computer 
    }
    S {Write-host "Suppresion de la machine du domaine $domain en cours / redemarrage de la machine dans quelques secondes" 
    #   remove-computer -credential $domain\Administrateur -passthru ; restart-computer
    }
    default {continue}

}



} while ($prompt -notmatch "[AS]" )

}

add_computer