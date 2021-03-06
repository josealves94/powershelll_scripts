function check_connectivity()
{
    $srv = "vm-paris-ic21","vm-paris-ic22"
    
    foreach ($s in $srv)
    {
       if ( Test-Connection -Cn $s -BufferSize 16 -Count 1 -ea 0 -quiet)
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
            New-PSSession $s
       }
        
    }
}

check_connectivity