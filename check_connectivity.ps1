function host_isalive()
{
    
    $serv = Import-Csv C:\hosts.csv -Delimiter ","
    $serv | Get-Member
        
   foreach ($srv in $serv)
    {
       $status = @{"Nom du serveur" = $srv.HostName; "la date : " = (Get-Date -f s)}
       if ($srv.$_ -eq 'NULL')
       {
       
         if (Test-Connection -IPAddress $srv.s -Count 1 -ea 0 -quiet)
          {
            Write-Host "La machine $srv est DOWN" -ForegroundColor "red" 
            # $status["resultats"] = "active"
          }
          else
          {
            #   $status["resultats"] = "inactive"
            Write-Host "La machine $srv est UP" -ForegroundColor "green" 
          }
       }
       else
       {
           Write-host "fichier vide - Veuillez mettre un fichier" -ForegroundColor "red"
       }
    }
}

function check_connectivity()
{
    $srv = @("vm-paris-ic21","vm-paris-ic22")
    foreach ($s in $srv)
    {
       if ( Test-Connection -IpAddress $s -BufferSize 16 -Count 1 -ea 0 -quiet)
       {
             Write-Host "Probleme pour se connecter à $s" -foregroundcolor “red”
             Write-Host "Flushing DNS"
           
            
              ipconfig /flushdns | out-null
              Write-Host "Registering DNS"
              ipconfig /registerdns | out-null
              nslookup $s
            
       }
       else
       {
            Write-Host "Probleme résolu pour se connecter à $s " -foregroundcolor “green”
            #New-PSSession $s
       }
        
    }
}

host_isalive
check_connectivity
