# Create new active directory user in Windows Server 2012
# import user information from a csv file
#  Date : 09/03/2016
#############################################
$csvcontent = Import-CSV -Path C:\users.csv

foreach ($user in $csvcontent)
{

New-ADUser
# have to provide a secure string here, simple text won't be enough.
-AccountPassword (ConvertTo-SecureString "MyPassword1!" -AsPlainText -Force)
# user have to change their password set the value to true
-ChangePasswordAtLogon $false
-Company "Coyote"
-DisplayName ($user.Firstname+" "+$user.Lastname)
-EmailAddress ($user.mail)
# enable the user account
-Enabled $true
# Phone Number
-OfficePhone ($user.Phone)
-Name ($user.Firstname+" "+$user.Lastname)
-SamAccountName ($user.Firstname.Substring(0,1)+$user.Lastname)
# Define the OU where the user will be created
-Path "OU=France,OU=LDLC,DC=toto,DC=local,DC=com"
# Firstname
-givenname $user.Firstname
# Lastname
-surname $user.Lastname
-userprincipalname ($user.Firstname.Substring(0,1)+$user.Lastname + "@toto.local.com")
# Description
-description "Utilisateur genere automatiquement"
-Office "24QG"
# Add user to several AD groups 

Add-ADGroupMember -Identity $user.Groupe -Members $user.username;

}

##########################################################################################
#
# Fichiers users.csv à mettre à part
#############################################################################################
Firstname,Lastname,Phone,mail,Groupe,username
Napoleon,Bonaparte,0659245444,nbonaparte@toto.com,Infrastructures,nbonaparte
