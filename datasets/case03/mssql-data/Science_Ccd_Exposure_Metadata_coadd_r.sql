-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\Science_Ccd_Exposure_Metadata_coadd_r.sql

IF OBJECT_ID('dbo.Science_Ccd_Exposure_Metadata_coadd_r', 'U') IS NOT NULL
 DROP TABLE dbo.Science_Ccd_Exposure_Metadata_coadd_r

CREATE TABLE [Science_Ccd_Exposure_Metadata_coadd_r] (
   [scienceCcdExposureId] BIGINT NOT NULL
,  [metadataKey] VARCHAR(255) NOT NULL
,  [exposureType] TINYINT NOT NULL
,  [intValue] INTEGER DEFAULT NULL
,  [doubleValue] FLOAT DEFAULT NULL
,  [stringValue] VARCHAR(255) DEFAULT NULL
)

ALTER TABLE [Science_Ccd_Exposure_Metadata_coadd_r] ADD CONSTRAINT pk_Science_Ccd_Exposure_Metadata_coadd_r PRIMARY KEY ([scienceCcdExposureId],[metadataKey])



 CREATE INDEX ix_Science_Ccd_Exposure_Metadata_coadd_r_IDX_metadataKey ON [Science_Ccd_Exposure_Metadata_coadd_r]([metadataKey])

