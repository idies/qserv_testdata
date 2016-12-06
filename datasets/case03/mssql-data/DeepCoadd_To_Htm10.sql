-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\DeepCoadd_To_Htm10.sql

IF OBJECT_ID('dbo.DeepCoadd_To_Htm10', 'U') IS NOT NULL
 DROP TABLE dbo.DeepCoadd_To_Htm10

CREATE TABLE [DeepCoadd_To_Htm10] (
   [deepCoaddId] BIGINT NOT NULL
,  [htmId10] INTEGER NOT NULL
)



 CREATE INDEX ix_DeepCoadd_To_Htm10_IDX_htmId10 ON [DeepCoadd_To_Htm10]([htmId10])

 CREATE INDEX ix_DeepCoadd_To_Htm10_IDX_deepCoaddId ON [DeepCoadd_To_Htm10]([deepCoaddId])

