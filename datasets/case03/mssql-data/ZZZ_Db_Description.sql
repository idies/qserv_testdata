-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\ZZZ_Db_Description.sql

IF OBJECT_ID('dbo.ZZZ_Db_Description', 'U') IS NOT NULL
 DROP TABLE dbo.ZZZ_Db_Description

CREATE TABLE [ZZZ_Db_Description] (
   [f] VARCHAR(255) DEFAULT NULL
,  [r] VARCHAR(255) DEFAULT NULL
)



