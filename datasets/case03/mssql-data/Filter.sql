-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\Filter.sql

IF OBJECT_ID('dbo.Filter', 'U') IS NOT NULL
 DROP TABLE dbo.Filter

CREATE TABLE [Filter] (
   [filterId] TINYINT NOT NULL
,  [filterName] CHAR(3) NOT NULL
,  [photClam] REAL NOT NULL
,  [photBW] REAL NOT NULL
)

ALTER TABLE [Filter] ADD CONSTRAINT pk_Filter PRIMARY KEY ([filterId])



