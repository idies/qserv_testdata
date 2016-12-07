-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\RefObject.sql

IF OBJECT_ID('dbo.RefObject', 'U') IS NOT NULL
 DROP TABLE dbo.RefObject

CREATE TABLE [RefObject] (
   [refObjectId] BIGINT NOT NULL
,  [run] SMALLINT DEFAULT NULL
,  [rerun] SMALLINT DEFAULT NULL
,  [camcol] TINYINT DEFAULT NULL
,  [field] SMALLINT DEFAULT NULL
,  [obj] SMALLINT DEFAULT NULL
,  [mode] SMALLINT DEFAULT NULL
,  [type] SMALLINT DEFAULT NULL
,  [flags] BIGINT DEFAULT NULL
,  [nChild] SMALLINT DEFAULT NULL
,  [parentId] BIGINT DEFAULT NULL
,  [isStar] TINYINT NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [uMag] FLOAT NOT NULL
,  [gMag] FLOAT NOT NULL
,  [rMag] FLOAT NOT NULL
,  [iMag] FLOAT NOT NULL
,  [zMag] FLOAT NOT NULL
,  [uMagSigma] FLOAT NOT NULL
,  [gMagSigma] FLOAT NOT NULL
,  [rMagSigma] FLOAT NOT NULL
,  [iMagSigma] FLOAT NOT NULL
,  [zMagSigma] FLOAT NOT NULL
,  [uExposureCount] SMALLINT NOT NULL
,  [gExposureCount] SMALLINT NOT NULL
,  [rExposureCount] SMALLINT NOT NULL
,  [iExposureCount] SMALLINT NOT NULL
,  [zExposureCount] SMALLINT NOT NULL
)

ALTER TABLE [RefObject] ADD CONSTRAINT pk_RefObject PRIMARY KEY ([refObjectId])



 CREATE INDEX ix_RefObject_IDX_decl ON [RefObject]([decl])

 CREATE INDEX ix_RefObject_IDX_htmId20 ON [RefObject]([htmId20])

