-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case02\data\Source.sql

IF OBJECT_ID('dbo.Source', 'U') IS NOT NULL
 DROP TABLE dbo.Source

CREATE TABLE [Source] (
   [sourceId] BIGINT NOT NULL
,  [scienceCcdExposureId] BIGINT DEFAULT NULL
,  [filterId] TINYINT NOT NULL
,  [objectId] BIGINT DEFAULT NULL
,  [movingObjectId] BIGINT DEFAULT NULL
,  [procHistoryId] INTEGER NOT NULL
,  [ra] FLOAT NOT NULL
,  [raErrForDetection] REAL DEFAULT NULL
,  [raErrForWcs] REAL NOT NULL
,  [decl] FLOAT NOT NULL
,  [declErrForDetection] REAL DEFAULT NULL
,  [declErrForWcs] REAL NOT NULL
,  [xFlux] FLOAT DEFAULT NULL
,  [xFluxErr] REAL DEFAULT NULL
,  [yFlux] FLOAT DEFAULT NULL
,  [yFluxErr] REAL DEFAULT NULL
,  [raFlux] FLOAT DEFAULT NULL
,  [raFluxErr] REAL DEFAULT NULL
,  [declFlux] FLOAT DEFAULT NULL
,  [declFluxErr] REAL DEFAULT NULL
,  [xPeak] FLOAT DEFAULT NULL
,  [yPeak] FLOAT DEFAULT NULL
,  [raPeak] FLOAT DEFAULT NULL
,  [declPeak] FLOAT DEFAULT NULL
,  [xAstrom] FLOAT DEFAULT NULL
,  [xAstromErr] REAL DEFAULT NULL
,  [yAstrom] FLOAT DEFAULT NULL
,  [yAstromErr] REAL DEFAULT NULL
,  [raAstrom] FLOAT DEFAULT NULL
,  [raAstromErr] REAL DEFAULT NULL
,  [declAstrom] FLOAT DEFAULT NULL
,  [declAstromErr] REAL DEFAULT NULL
,  [raObject] FLOAT DEFAULT NULL
,  [declObject] FLOAT DEFAULT NULL
,  [taiMidPoint] FLOAT NOT NULL
,  [taiRange] REAL DEFAULT NULL
,  [psfFlux] FLOAT NOT NULL
,  [psfFluxErr] REAL NOT NULL
,  [apFlux] FLOAT NOT NULL
,  [apFluxErr] REAL NOT NULL
,  [modelFlux] FLOAT NOT NULL
,  [modelFluxErr] REAL NOT NULL
,  [petroFlux] FLOAT DEFAULT NULL
,  [petroFluxErr] REAL DEFAULT NULL
,  [instFlux] FLOAT NOT NULL
,  [instFluxErr] REAL NOT NULL
,  [nonGrayCorrFlux] FLOAT DEFAULT NULL
,  [nonGrayCorrFluxErr] REAL DEFAULT NULL
,  [atmCorrFlux] FLOAT DEFAULT NULL
,  [atmCorrFluxErr] REAL DEFAULT NULL
,  [apDia] REAL DEFAULT NULL
,  [Ixx] REAL DEFAULT NULL
,  [IxxErr] REAL DEFAULT NULL
,  [Iyy] REAL DEFAULT NULL
,  [IyyErr] REAL DEFAULT NULL
,  [Ixy] REAL DEFAULT NULL
,  [IxyErr] REAL DEFAULT NULL
,  [snr] REAL NOT NULL
,  [chi2] REAL NOT NULL
,  [sky] REAL DEFAULT NULL
,  [skyErr] REAL DEFAULT NULL
,  [extendedness] REAL DEFAULT NULL
,  [flux_PS] REAL DEFAULT NULL
,  [flux_PS_Sigma] REAL DEFAULT NULL
,  [flux_SG] REAL DEFAULT NULL
,  [flux_SG_Sigma] REAL DEFAULT NULL
,  [sersicN_SG] REAL DEFAULT NULL
,  [sersicN_SG_Sigma] REAL DEFAULT NULL
,  [e1_SG] REAL DEFAULT NULL
,  [e1_SG_Sigma] REAL DEFAULT NULL
,  [e2_SG] REAL DEFAULT NULL
,  [e2_SG_Sigma] REAL DEFAULT NULL
,  [radius_SG] REAL DEFAULT NULL
,  [radius_SG_Sigma] REAL DEFAULT NULL
,  [flux_flux_SG_Cov] REAL DEFAULT NULL
,  [flux_e1_SG_Cov] REAL DEFAULT NULL
,  [flux_e2_SG_Cov] REAL DEFAULT NULL
,  [flux_radius_SG_Cov] REAL DEFAULT NULL
,  [flux_sersicN_SG_Cov] REAL DEFAULT NULL
,  [e1_e1_SG_Cov] REAL DEFAULT NULL
,  [e1_e2_SG_Cov] REAL DEFAULT NULL
,  [e1_radius_SG_Cov] REAL DEFAULT NULL
,  [e1_sersicN_SG_Cov] REAL DEFAULT NULL
,  [e2_e2_SG_Cov] REAL DEFAULT NULL
,  [e2_radius_SG_Cov] REAL DEFAULT NULL
,  [e2_sersicN_SG_Cov] REAL DEFAULT NULL
,  [radius_radius_SG_Cov] REAL DEFAULT NULL
,  [radius_sersicN_SG_Cov] REAL DEFAULT NULL
,  [sersicN_sersicN_SG_Cov] REAL DEFAULT NULL
,  [flagForAssociation] SMALLINT DEFAULT NULL
,  [flagForDetection] SMALLINT DEFAULT NULL
,  [flagForWcs] SMALLINT DEFAULT NULL
)

ALTER TABLE [Source] ADD CONSTRAINT pk_Source PRIMARY KEY ([sourceId])



 CREATE INDEX ix_Source_IDX_scienceCcdExposureId ON [Source]([scienceCcdExposureId])

 CREATE INDEX ix_Source_IDX_filterId ON [Source]([filterId])

 CREATE INDEX ix_Source_IDX_movingObjectId ON [Source]([movingObjectId])

 CREATE INDEX ix_Source_IDX_objectId ON [Source]([objectId])

 CREATE INDEX ix_Source_IDX_procHistoryId ON [Source]([procHistoryId])

 CREATE INDEX ix_Source_IDX_Source_decl ON [Source]([decl])

