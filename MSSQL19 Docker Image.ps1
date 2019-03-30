#Docker Pull
docker pull mcr.microsoft.com/mssql/server

#Set-up the Container:
docker run `
--name MSSQL19 `
-p 1433:1433 `
-e "ACCEPT_EULA=Y" `
-e "SA_PASSWORD=F00B4rB4z!" `
-v C:\Docker\SQL:/sql `
-d mcr.microsoft.com/mssql/server:2019-CTP2.3-ubuntu

#Automate Deployment of .SQL Files 
Install-Module -Name dbatools 

#Manually connect
$cred = Get-Credential SA
New-DbaCmConnection -ComputerName localhost -Credential $cred

#Create a new connection object for remote computer management(Cm)
New-DbaCmConnection -ComputerName localhost -UseWindowsCredentials

#Look at connection cache and run a test
Get-DbaCmConnection
Test-DbaCmConnection -ComputerName localhost -Force

#Get Logs
Get-DbatoolsLog

New-DbaConnectionString -SqlInstance localhost -TrustServerCertificate 'TRUE'

help Get-DbaCredential -Examples

param( 
    
    $SqlServer = "localhost", 
    $SqlServerPort = 1433, 
    $SqlQueryTimeout = 30, 
    $Database = "admin", 
    $SqlCredentialAsset = "SA",
    $SqlQuery = "SELECT TOP [1] * FROM Example"
)

$conparams = @{ 
    SqlServer = 'localhost' 
    SqlServerPort = 1433
    SqlQueryTimeout = 30 
    Database = 'admin'
    SqlCredentialAsset = 'SA'
    SqlQuery = 'SELECT TOP [1] * FROM Example'
}