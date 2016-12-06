-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\Science_Ccd_Exposure_Metadata.sql

IF OBJECT_ID('dbo.Science_Ccd_Exposure_Metadata', 'U') IS NOT NULL
 DROP TABLE dbo.Science_Ccd_Exposure_Metadata

CREATE TABLE [Science_Ccd_Exposure_Metadata] (
   [scienceCcdExposureId] BIGINT NOT NULL
,  [metadataKey] VARCHAR(255) NOT NULL
,  [exposureType] TINYINT NOT NULL
,  [intValue] INTEGER DEFAULT NULL
,  [doubleValue] FLOAT DEFAULT NULL
,  [stringValue] VARCHAR(255) DEFAULT NULL
)

ALTER TABLE [Science_Ccd_Exposure_Metadata] ADD CONSTRAINT pk_Science_Ccd_Exposure_Metadata PRIMARY KEY ([scienceCcdExposureId],[metadataKey])



 CREATE INDEX ix_Science_Ccd_Exposure_Metadata_IDX_metadataKey ON [Science_Ccd_Exposure_Metadata]([metadataKey])

