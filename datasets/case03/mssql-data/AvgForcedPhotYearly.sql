-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\AvgForcedPhotYearly.sql

IF OBJECT_ID('dbo.AvgForcedPhotYearly', 'U') IS NOT NULL
 DROP TABLE dbo.AvgForcedPhotYearly

CREATE TABLE [AvgForcedPhotYearly] (
   [deepSourceId] BIGINT NOT NULL
,  [year] TINYINT NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [magFaint_g] REAL DEFAULT NULL
,  [q1Mag_g] REAL DEFAULT NULL
,  [medMag_g] REAL DEFAULT NULL
,  [q3Mag_g] REAL DEFAULT NULL
,  [magBright_g] REAL DEFAULT NULL
,  [nMag_g] REAL DEFAULT NULL
,  [magFaint_r] REAL DEFAULT NULL
,  [q1Mag_r] REAL DEFAULT NULL
,  [medMag_r] REAL DEFAULT NULL
,  [q3Mag_r] REAL DEFAULT NULL
,  [magBright_r] REAL DEFAULT NULL
,  [nMag_r] REAL DEFAULT NULL
,  [magFaint_i] REAL DEFAULT NULL
,  [q1Mag_i] REAL DEFAULT NULL
,  [medMag_i] REAL DEFAULT NULL
,  [q3Mag_i] REAL DEFAULT NULL
,  [magBright_i] REAL DEFAULT NULL
,  [nMag_i] REAL DEFAULT NULL
)

ALTER TABLE [AvgForcedPhotYearly] ADD CONSTRAINT pk_AvgForcedPhotYearly PRIMARY KEY ([deepSourceId],[year])



 CREATE INDEX ix_AvgForcedPhotYearly_IDX_htmId20 ON [AvgForcedPhotYearly]([htmId20])

