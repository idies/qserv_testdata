-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\AvgForcedPhot.sql

IF OBJECT_ID('dbo.AvgForcedPhot', 'U') IS NOT NULL
 DROP TABLE dbo.AvgForcedPhot

CREATE TABLE [AvgForcedPhot] (
   [deepSourceId] BIGINT NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [magFaint_g] REAL DEFAULT NULL
,  [faint5perMag_g] REAL DEFAULT NULL
,  [q1Mag_g] REAL DEFAULT NULL
,  [medMag_g] REAL DEFAULT NULL
,  [q3Mag_g] REAL DEFAULT NULL
,  [bright5perMag_g] REAL DEFAULT NULL
,  [magBright_g] REAL DEFAULT NULL
,  [nMag_g] INTEGER DEFAULT NULL
,  [magFaint_r] REAL DEFAULT NULL
,  [faint5perMag_r] REAL DEFAULT NULL
,  [q1Mag_r] REAL DEFAULT NULL
,  [medMag_r] REAL DEFAULT NULL
,  [q3Mag_r] REAL DEFAULT NULL
,  [bright5perMag_r] REAL DEFAULT NULL
,  [magBright_r] REAL DEFAULT NULL
,  [nMag_r] INTEGER DEFAULT NULL
,  [magFaint_i] REAL DEFAULT NULL
,  [faint5perMag_i] REAL DEFAULT NULL
,  [q1Mag_i] REAL DEFAULT NULL
,  [medMag_i] REAL DEFAULT NULL
,  [q3Mag_i] REAL DEFAULT NULL
,  [bright5perMag_i] REAL DEFAULT NULL
,  [magBright_i] REAL DEFAULT NULL
,  [nMag_i] INTEGER DEFAULT NULL
)

ALTER TABLE [AvgForcedPhot] ADD CONSTRAINT pk_AvgForcedPhot PRIMARY KEY ([deepSourceId])



 CREATE INDEX ix_AvgForcedPhot_IDX_htmId20 ON [AvgForcedPhot]([htmId20])

