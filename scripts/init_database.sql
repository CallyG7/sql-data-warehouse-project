/* 
*******************************************************************
Create Database and Schemas
Date Created: 19 October 2026

*******************************************************************

Script Purpose:
         This script creates a new database named 'DataWarehouse' after checking if it already exists.
		 if the database exists, it is dropped and recreated. it also sets up three schemas within
		 the database: 'bronze', 'silver', and 'gold'.

*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;

END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
