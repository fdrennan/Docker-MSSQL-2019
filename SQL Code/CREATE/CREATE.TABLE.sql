/****************************** Prologue *******************************************
*****
*****	Purpose:				Creates the employeeinfo table.
*****	Object type:			Table
*****	dbname:					[HumanResources]
*****	Hardcoded:				schema, tablename
***********************************************************************************/
USE [HumanResources];
GO  

IF (EXISTS (SELECT * 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_SCHEMA = 'dbo' 
	AND  TABLE_NAME = 'deskhistory'))
BEGIN
    DROP TABLE [dbo].[deskhistory]
END

IF (EXISTS (SELECT * 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_SCHEMA = 'dbo' 
	AND  TABLE_NAME = 'employeeinfo'))
BEGIN
    DROP TABLE [dbo].[employeeinfo]
END

CREATE TABLE [dbo].[employeeinfo]
(
	employee_num INT NOT NULL
	CONSTRAINT PK_employee_num PRIMARY KEY (employee_num),
	first_name VARCHAR(255) NOT NULL, 
	last_name VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	state VARCHAR(4) NOT NULL,
	LastUpdate DATETIME2 NOT NULL
	CONSTRAINT DF_Login_LastUpdate DEFAULT (CURRENT_TIMESTAMP), 
	CONSTRAINT CK_first_name CHECK ([first_name] IN ('Foo', 'Ian'))
)


CREATE TABLE [dbo].[deskhistory]
(
	employee_num INT NOT NULL
	CONSTRAINT FK_employee_num FOREIGN KEY (employee_num) REFERENCES dbo.employeeinfo (employee_num)	
)

INSERT INTO [dbo].employeeinfo (employee_num, [first_name],[last_name], [city], [state])
VALUES ('1', 'Foo', 'Bar', 'PDX', 'OR')