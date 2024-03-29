/****************************** Prologue *******************************************
*****
*****	Purpose:				Creates a database from a flatfile
*****	Object type:			Database
*****	dbname:					[<dbname, Database name, NULL>]
*****	logname:				[<logname, Log Name, NULL>]
*****	Hardcoded:				sp_changedbowner 'sa'
***********************************************************************************/

BEGIN
	BEGIN TRY
	CREATE DATABASE HumanResources;
	END TRY

	BEGIN CATCH
	DROP DATABASE IF EXISTS HumanResources;
	END CATCH
END
GO


USE [master];
GO  

BEGIN
	BEGIN TRY
	CREATE DATABASE Sales  
	ON   
	(NAME = [<dbname, Database name, NULL>],  
		FILENAME = '.\saledat.mdf',  
		SIZE = 10,  
		MAXSIZE = 50,  
		FILEGROWTH = 5 )  
LOG ON  
	(NAME = [<logname, Log Name, NULL>],  
		FILENAME = '.\salelog.ldf',  
		SIZE = 5MB,  
		MAXSIZE = 25MB,  
		FILEGROWTH = 5MB ) ;  
	GO  
	END TRY
END

USE [<dbname, Database name, NULL>];
EXEC sp_changedbowner 'sa'
GO 