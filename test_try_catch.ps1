$array = @(0,1,2,3,4,5,7,9,10)
$nb = Read-Host "indiquer un nombre"

foreach ($item in $array)
{
    try # toujours vrai
    {
        $nb/$item | Out-Null
        Write-Host -ForegroundColor 'green' "le chiffre $nb est divisible par $item"
    }
    catch # correspond à une exception sort de la boucle
    {
        Write-Host -ForegroundColor 'red' "Erreur impossible de diviser $nb par $item"
    }
   # finally
    #{
    #    Write-Host -ForegroundColor 'green' "information le chiffre traité est $nb"
    #}
}




foreach ($it in $array)
{
    try 
    {
        $nb-$it | Out-Null
        Write-Host -ForegroundColor 'green' "Le chiffre $nb est soustrait par $it"
    }
    catch
    {
        Write-Host -ForegroundColor 'Red' "Le chiffre $nb ne peut pas être soustrait par $it"
    
    }
 }
   Write-Host "========================================================"
  $nbr = Read-Host "Veuillez indiquer un nombre à calculer"
  $max = Read-Host "Veuillez indiquer un chiffre maximum"
  $sign = Read-Host "Veuilllez indiquez un opérateur arithmétique soit ( * , / , + ou - ) : "
  if ($sign -eq "*")
  {
  
    $i = 1
    while ($i -lt $max)
    {
       $i++
       $op = $i*$nbr


     Write-Host "$op"
 
  
  }
  
}
elseif ( $sign -eq "/")
{
     $i = 1
    while ($i -lt $max)
  {
    $i++
    $op = $i/$nbr


    Write-Host "$op"

  
  }
    
}
elseif ($sign -eq "-")
{
        $i = 1
    while ($i -lt $max)
  {
    $i++
    $op = $i-$nbr
   # $div = $i/$nbr
   # $ad = $i+$nbr

    Write-Host "$op"
    #Write-Host "$div"
    #Write-Host "$ad"
  
  }


}
elseif ($sign -eq "+")
{
        $i = 1
    while ($i -lt $max)
  {
    $i++
    $op = $i+$nbr
  

    Write-Host "$op"
   
  }


}
  