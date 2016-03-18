# works on Windows server 2012
# Gather member of all security group from Active Directory and extract all the data to several csv
# Each file is the name of the security group
# Import-module Active-Directory

Get-ADGroup -filter "Groupcategory -eq 'Security' -AND GroupScope -ne 'DomainLocal' -AND Member -like '*'" |
foreach { 
 Write-Host "Exporting $($_.name)" -ForegroundColor Cyan
 $name = $_.name -replace " ","-"
 $file = Join-Path -path "C:\work" -ChildPath "$name.csv"
 Get-ADGroupMember -Identity $_.distinguishedname -Recursive |  
 Get-ADObject -Properties SamAccountname,Title,Department |
 Select Name,SamAccountName,Title,Department,DistinguishedName,ObjectClass |
 Export-Csv -Path $file -NoTypeInformation
}
