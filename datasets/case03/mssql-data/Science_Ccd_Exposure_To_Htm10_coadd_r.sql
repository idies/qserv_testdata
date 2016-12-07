-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\Science_Ccd_Exposure_To_Htm10_coadd_r.sql

IF OBJECT_ID('dbo.Science_Ccd_Exposure_To_Htm10_coadd_r', 'U') IS NOT NULL
 DROP TABLE dbo.Science_Ccd_Exposure_To_Htm10_coadd_r

CREATE TABLE [Science_Ccd_Exposure_To_Htm10_coadd_r] (
   [scienceCcdExposureId] BIGINT NOT NULL
,  [htmId10] INTEGER NOT NULL
)



 CREATE INDEX ix_Science_Ccd_Exposure_To_Htm10_coadd_r_IDX_htmId10 ON [Science_Ccd_Exposure_To_Htm10_coadd_r]([htmId10])

 CREATE INDEX ix_Science_Ccd_Exposure_To_Htm10_coadd_r_IDX_scienceCcdExposureId ON [Science_Ccd_Exposure_To_Htm10_coadd_r]([scienceCcdExposureId])

