-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\DeepCoadd_Metadata.sql

IF OBJECT_ID('dbo.DeepCoadd_Metadata', 'U') IS NOT NULL
 DROP TABLE dbo.DeepCoadd_Metadata

CREATE TABLE [DeepCoadd_Metadata] (
   [deepCoaddId] BIGINT NOT NULL
,  [metadataKey] VARCHAR(255) NOT NULL
,  [exposureType] TINYINT NOT NULL
,  [intValue] INTEGER DEFAULT NULL
,  [doubleValue] FLOAT DEFAULT NULL
,  [stringValue] VARCHAR(255) DEFAULT NULL
)

ALTER TABLE [DeepCoadd_Metadata] ADD CONSTRAINT pk_DeepCoadd_Metadata PRIMARY KEY ([deepCoaddId],[metadataKey])



 CREATE INDEX ix_DeepCoadd_Metadata_IDX_metadataKey ON [DeepCoadd_Metadata]([metadataKey])

