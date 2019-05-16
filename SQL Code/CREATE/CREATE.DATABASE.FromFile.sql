/****************************** Prologue *******************************************
***
***    Purpose:					Creates a database from a flatfile
***    Object type:				Database
***    Name:					CTRL+ALT+M - Replaces: <Database_Name, sysname, Database_Name>
***    Hardcoded:				sp_changedbowner 'sa'
***********************************************************************************/

USE [master];
GO

CREATE DATABASE [<Database_Name, sysname, Database_Name>] ON  PRIMARY 
( NAME = N'<Database_Name, sysname, Database_Name>', FILENAME = N'C:\Path' , SIZE = 500MB , FILEGROWTH = 250MB), 
 FILEGROUP [<Database_Name, sysname, Database_Name>DataFG] 
( NAME = N'<Database_Name, sysname, Database_Name>_Data', FILENAME = N'C:\Path' , SIZE = 500MB , FILEGROWTH = 250MB ), 
 FILEGROUP [<Database_Name, sysname, Database_Name>IndexFG] 
( NAME = N'<Database_Name, sysname, Database_Name>_Index', FILENAME = N'C:\Path' , SIZE = 500MB , FILEGROWTH = 250MB )
 LOG ON 
( NAME = N'<Database_Name, sysname, Database_Name>_Log', FILENAME = N'C:\Path' , SIZE = 500MB , FILEGROWTH = 250MB)
GO


EXEC dbo.sp_dbcmptlevel @dbname=N'<Database_Name, sysname, Database_Name>', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	BEGIN
	EXEC [<Database_Name, sysname, Database_Name>].[dbo].[sp_fulltext_database] @action = 'disable'
	END
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ARITHABORT OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET  DISABLE_BROKER 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET TRUSTWORTHY ON 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET  READ_WRITE 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET  MULTI_USER 
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [<Database_Name, sysname, Database_Name>] SET DB_CHAINING OFF 
GO

ALTER DATABASE [<Database_Name, sysname, Database_Name>] MODIFY FILEGROUP [<Database_Name, sysname, Database_Name>DataFG] DEFAULT;
GO

USE [<Database_Name, sysname, Database_Name>];
EXEC sp_changedbowner 'sa'
GO 
