function export()
{
    Write-Host "Export d'une commande vers un fichier csv"
    $cmd = Read-Host "Veuillez entrer une commande powershell " 
    $cmd | Export-Csv process_list.csv -Delimiter ";"
    Write-Host  "Export terminé"
}

function count_el()
{
    $list = 1..100
    Write-Host "la boucle foreach powershell"
    foreach ($object in $list)
    {
        Write-Host $object
    }
    Write-Host " la boucle while powershell"
    while ($value -ne 100)
    {
        $value++
        Write-Host $value
    }
}

function if_condition()
{
    $test = "tatatoto"
    if ($test -eq "tata")
    {
        Write-Host " la condition est vraie"
    }
    else
    {
        Write-Host "la condition est fausse"
    }

}
export
count_el
if_condition