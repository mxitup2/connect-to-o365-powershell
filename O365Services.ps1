#Name: Connect To O365 Services via Powershell
#Author: Dakota G
#Date Created: 4/6/2017
#Date Modified: 4/6/2017

#Menu
write-host 
write-host ------------------------------------------------------------
write-host       Connect to Office 365 Online Services via Powershell   -foregroundcolor green
Write-Host       Author: Dakota G - Network Engineer -ForegroundColor Green
write-host       Created: 4/6/2017 -ForegroundColor Green
write-host ------------------------------------------------------------
write-host 
Write-Host 'This Script Needs To Be Re-Opened In NOEXIT Mode' -ForegroundColor Green
write-host
Write-Host '1) Launch Script In NOEXIT Mode' -ForegroundColor Green
Write-Host '2) Launch The Script' -ForegroundColor Green
write-host
Write-Host 'You should hit 1 and then 2 at the second prompt to get this to properly work!' -ForegroundColor Red
$input = Read-Host 'Enter Your Selection'

switch ($input){
    #Open In No Exit Window
1{powershell.exe -noexit '.\O365Services.ps1' -no profile}
#
2 {
write-host '    Choose The Service You Would Like To Connect To' -ForegroundColor green
write-host '    ---------------------------------------------------------------' -ForegroundColor green
write-host '1)  Exchange Online' -ForegroundColor Yellow
write-host '2)  Skype For Business' -ForegroundColor Yellow
write-host '3)  Sharepoint Online' -ForegroundColor Yellow
write-host '4)  Compliance Center' -ForegroundColor Yellow
write-host

#Option Selection
$opt = Read-Host "Select an option [1-4]"
write-host $opt
switch ($opt)

#Begin Script Things
{

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Option #1: Connect PowerShell session to Office 365 and Exchange Online
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



1{

# Display authentication pop out windows

$cred = Get-Credential

#——– Import office 365 Cmdlets  ———–

Import-Module MSOnline

#———— Establish an Remote PowerShell Session to office 365 ———————

Connect-MsolService -Credential $cred

#———— Establish an Remote PowerShell Session to Exchange Online ———————

$msoExchangeURL = “https://outlook.office365.com/powershell-liveid/”


$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $msoExchangeURL -Credential $cred -Authentication Basic -AllowRedirection 

#———— This command that we use for implicit remoting feature of PowerShell 2.0 ———————


Import-PSSession $session

#———— Indication ———————
write-host 
if ($lastexitcode -eq 1)
{
	
	
	
	write-host "The command Failed :-(" -ForegroundColor red
	write-host "Try to connect again and check your credentials" -ForegroundColor red
	
	
}
else

{
	
	clear-host

	write-host
    write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                        
                                                     
    write-host  -ForegroundColor white  	"The command complete successfully !" 
	write-host  -ForegroundColor white  	"You are now connected to office 365 and Exchange online"
	write-host  -ForegroundColor white	    --------------------------------------------------------------------   
	write-host  -ForegroundColor white  	"Test the connection to Exchange online by using the command  Get-mailbox"
	write-host  -ForegroundColor white  	"Test the connection to Office 365 by using the command  Get-Msoluser".
	
	write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                         
	write-host
    write-host
	
	
	
	write-host  -ForegroundColor Yellow
	write-host  -ForegroundColor Yellow
}

#———— End of Indication ———————

}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Option #2: Connect PowerShell session to Office 365 and Skype For Business
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



2{

# Display authentication pop out windows

$cred = Get-Credential

#——– Import office 365 Cmdlets  ———–

Import-Module MSOnline

#———— Establish an Remote PowerShell Session to office 365 ———————

Connect-MsolService -Credential $cred

#———— Establish an Remote PowerShell Session to Skype For Business ———————

Import-Module SkypeOnlineConnector

$sfboSession = New-CsOnlineSession -Credential $cred

#———— This command that we use for implicit remoting feature of PowerShell 2.0 ———————


Import-PSSession $sfboSession

#———— Indication ———————
write-host 
if ($lastexitcode -eq 1)
{
	
	
	
	write-host "The command Failed :-(" -ForegroundColor red
	write-host "Try to connect again and check your credentials" -ForegroundColor red
	
	
}
else

{
	
	clear-host

	write-host
    write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                        
                                                     
    write-host  -ForegroundColor white  	"The command complete successfully !" 
	write-host  -ForegroundColor white  	"You are now connected to Office 365 and Skype For Business"
	write-host  -ForegroundColor white	    --------------------------------------------------------------------   
	write-host  -ForegroundColor white  	"Test the connection to Skype For Business by using the command  Get-CsUCPhoneConfiguration"
	write-host  -ForegroundColor white  	"Test the connection to Office 365 by using the command  Get-Msoluser".
	
	write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                         
	write-host
    write-host
	
	
	
	write-host  -ForegroundColor Yellow
	write-host  -ForegroundColor Yellow
}

#———— End of Indication ———————

}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Option #3: Connect PowerShell session to Office 365 and Sharepoint Online
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



3{

# Display authentication pop out windows

$cred = Get-Credential

# Ask For O365 Default Domain

$domain = read-host -prompt "Please Enter The Default DomainHost for Office 365 (ex. DOMAINHOST.onmicrosoft.com w/o onmicrosoft.com)"

#——– Import office 365 Cmdlets  ———–

Import-Module MSOnline

#———— Establish an Remote PowerShell Session to office 365 ———————

Connect-MsolService -Credential $cred

#———— Establish an Remote PowerShell Session to Skype For Business ———————

Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking

Connect-SPOService -Url https://$domain-admin.sharepoint.com -credential $cred

#———— Indication ———————
write-host 
if ($lastexitcode -eq 1)
{
	
	
	
	write-host "The command Failed :-(" -ForegroundColor red
	write-host "Try to connect again and check your credentials" -ForegroundColor red
	
	
}
else

{
	
	clear-host

	write-host
    write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                        
                                                     
    write-host  -ForegroundColor white  	"The command complete successfully !" 
	write-host  -ForegroundColor white  	"You are now connected to Office 365 and Sharepoint Online"
	write-host  -ForegroundColor white	    --------------------------------------------------------------------   
	write-host  -ForegroundColor white  	"Test the connection to Sharepoint Online by using the command  Get-SPOSite"
	write-host  -ForegroundColor white  	"Test the connection to Office 365 by using the command  Get-Msoluser".
	
	write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                         
	write-host
    write-host
	
	
	
	write-host  -ForegroundColor Yellow
	write-host  -ForegroundColor Yellow
}

#———— End of Indication ———————

}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Option #4: Connect Powershell Session to Office 365 and Compliance Center
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



4{

# Display authentication pop out windows

$cred = Get-Credential

#——– Import office 365 Cmdlets  ———–

Import-Module MSOnline

#———— Establish an Remote PowerShell Session to office 365 ———————

Connect-MsolService -Credential $cred

#———— Establish an Remote PowerShell Session to Compliance Center ------

$msoExchangeURL = “https://ps.compliance.protection.outlook.com/powershell-liveid/”


$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $msoExchangeURL -Credential $cred -Authentication Basic -AllowRedirection 

#———— This command that we use for implicit remoting feature of PowerShell 2.0 ———————

Import-PSSession $session

#———— Indication ———————
write-host 
if ($lastexitcode -eq 1)
{
	
	
	
	write-host "The command Failed :-(" -ForegroundColor red
	write-host "Try to connect again and check your credentials" -ForegroundColor red
	
	
}
else

{
	
	clear-host

	write-host
    write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                        
                                                     
    write-host  -ForegroundColor white  	"The command complete successfully !" 
	write-host  -ForegroundColor white  	"You are now connected to Office 365 and Compliance Center"
	write-host  -ForegroundColor white	    --------------------------------------------------------------------   
	write-host  -ForegroundColor white  	"Test the connection to Skype For Business by using the command  Get-RoleGroup"
	write-host  -ForegroundColor white  	"Test the connection to Office 365 by using the command  Get-Msoluser".
	
	write-host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                         
	write-host
    write-host
	
	
	
	write-host  -ForegroundColor Yellow
	write-host  -ForegroundColor Yellow
}

#———— End of Indication ———————

}

 
#+++++++++++++++++++
#  Finish  
##++++++++++++++++++
}

}

}