# Filter disable accounts in Active Directory and filter by Full name given name  and  username

Get-ADUser -filter { enabled -eq $false} -properties Name,Givenname,Samaccountname | Select-Object Name,Givenname,Samaccountname
