-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\LeapSeconds.schema

IF OBJECT_ID('dbo.LeapSeconds', 'U') IS NOT NULL
 DROP TABLE dbo.LeapSeconds

CREATE TABLE [LeapSeconds] (
   [whenJd] REAL NOT NULL
,  [offset] REAL NOT NULL
,  [mjdRef] REAL NOT NULL
,  [drift] REAL NOT NULL
,  [whenMjdUtc] REAL DEFAULT NULL
,  [whenUtc] BIGINT DEFAULT NULL
,  [whenTai] BIGINT DEFAULT NULL
)



