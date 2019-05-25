/****************************** Prologue *******************************************
*****
*****	Purpose:				Creates the employeeinfo table. 
*****	Object type:			Table
*****	dbname:					[<dbname, Database name, NULL>]
*****	logname:				[<logname, Log Name, NULL>]
*****	Hardcoded:				sp_changedbowner 'sa'
***********************************************************************************/
USE [HumanResources];
GO  

IF EXISTS(SELECT 

CREATE TABLE dbo.[employeeinfo]
(
	employee_num INT NOT NULL
	CONSTRAINT PK_foo PRIMARY KEY (employee_num),
	first_name VARCHAR(255) NOT NULL
)


ALTER TABLE dbo.[employeeinfo]
