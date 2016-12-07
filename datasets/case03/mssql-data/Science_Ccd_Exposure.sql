-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\Science_Ccd_Exposure.sql

IF OBJECT_ID('dbo.Science_Ccd_Exposure', 'U') IS NOT NULL
 DROP TABLE dbo.Science_Ccd_Exposure

CREATE TABLE [Science_Ccd_Exposure] (
   [scienceCcdExposureId] BIGINT NOT NULL
,  [run] INTEGER NOT NULL
,  [camcol] TINYINT NOT NULL
,  [filterId] TINYINT NOT NULL
,  [field] INTEGER NOT NULL
,  [filterName] CHAR(3) NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [equinox] REAL NOT NULL
,  [raDeSys] VARCHAR(20) NOT NULL
,  [ctype1] VARCHAR(20) NOT NULL
,  [ctype2] VARCHAR(20) NOT NULL
,  [crpix1] REAL NOT NULL
,  [crpix2] REAL NOT NULL
,  [crval1] FLOAT NOT NULL
,  [crval2] FLOAT NOT NULL
,  [cd1_1] FLOAT NOT NULL
,  [cd1_2] FLOAT NOT NULL
,  [cd2_1] FLOAT NOT NULL
,  [cd2_2] FLOAT NOT NULL
,  [corner1Ra] FLOAT NOT NULL
,  [corner1Decl] FLOAT NOT NULL
,  [corner2Ra] FLOAT NOT NULL
,  [corner2Decl] FLOAT NOT NULL
,  [corner3Ra] FLOAT NOT NULL
,  [corner3Decl] FLOAT NOT NULL
,  [corner4Ra] FLOAT NOT NULL
,  [corner4Decl] FLOAT NOT NULL
,  [poly] BINARY(120) NOT NULL
,  [taiMjd] FLOAT NOT NULL
,  [obsStart] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,  [expMidpt] VARCHAR(30) NOT NULL
,  [expTime] REAL NOT NULL
,  [nCombine] INTEGER NOT NULL
,  [binX] INTEGER NOT NULL
,  [binY] INTEGER NOT NULL
,  [fluxMag0] REAL NOT NULL
,  [fluxMag0Sigma] REAL NOT NULL
,  [fwhm] FLOAT NOT NULL
,  [path] VARCHAR(255) NOT NULL
)

ALTER TABLE [Science_Ccd_Exposure] ADD CONSTRAINT pk_Science_Ccd_Exposure PRIMARY KEY ([scienceCcdExposureId])



 CREATE INDEX ix_Science_Ccd_Exposure_IDX_htmId20 ON [Science_Ccd_Exposure]([htmId20])

 CREATE INDEX ix_Science_Ccd_Exposure_FK_Science_Ccd_Exposure_filterId ON [Science_Ccd_Exposure]([filterId])

