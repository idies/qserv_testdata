-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\DeepCoadd.sql

IF OBJECT_ID('dbo.DeepCoadd', 'U') IS NOT NULL
 DROP TABLE dbo.DeepCoadd

CREATE TABLE [DeepCoadd] (
   [deepCoaddId] BIGINT NOT NULL
,  [tract] INTEGER NOT NULL
,  [patch] CHAR(16) NOT NULL
,  [filterId] TINYINT NOT NULL
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
,  [fluxMag0] REAL NOT NULL
,  [fluxMag0Sigma] REAL NOT NULL
,  [matchedFwhm] FLOAT DEFAULT NULL
,  [measuredFwhm] FLOAT DEFAULT NULL
,  [path] VARCHAR(255) NOT NULL
)

ALTER TABLE [DeepCoadd] ADD CONSTRAINT pk_DeepCoadd PRIMARY KEY ([deepCoaddId])



 CREATE INDEX ix_DeepCoadd_IDX_htmId20 ON [DeepCoadd]([htmId20])

 CREATE INDEX ix_DeepCoadd_IDX_tract_patch_filterName ON [DeepCoadd]([tract],[patch],[filterName])

 CREATE INDEX ix_DeepCoadd_FK_DeepCoadd_filterId ON [DeepCoadd]([filterId])

