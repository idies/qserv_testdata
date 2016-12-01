
-------------------------------------------
-- MS SQL Server version of MySQL version in https://github.com/lsst/qserv_testdata.git/trunk/datasets/case02/data/Object.sql
-- ported by hand by Gerard Lemson
--
-- next will work in MS SQL 2016 and later
-- DROP TABLE IF EXISTS [Source]
-- until then ...
IF OBJECT_ID('dbo.Source', 'U') IS NOT NULL
 DROP TABLE dbo.Source;
GO 

CREATE TABLE [Source] (
  [sourceId] bigint NOT NULL,
  [scienceCcdExposureId] bigint DEFAULT NULL,
  [filterId] tinyint NOT NULL,
  [objectId] bigint DEFAULT NULL,
  [movingObjectId] bigint DEFAULT NULL,
  [procHistoryId] int NOT NULL,
  [ra] float NOT NULL,
  [raErrForDetection] real DEFAULT NULL,
  [raErrForWcs] real NOT NULL,
  [decl] float NOT NULL,
  [declErrForDetection] real DEFAULT NULL,
  [declErrForWcs] real NOT NULL,
  [xFlux] float DEFAULT NULL,
  [xFluxErr] real DEFAULT NULL,
  [yFlux] float DEFAULT NULL,
  [yFluxErr] real DEFAULT NULL,
  [raFlux] float DEFAULT NULL,
  [raFluxErr] real DEFAULT NULL,
  [declFlux] float DEFAULT NULL,
  [declFluxErr] real DEFAULT NULL,
  [xPeak] float DEFAULT NULL,
  [yPeak] float DEFAULT NULL,
  [raPeak] float DEFAULT NULL,
  [declPeak] float DEFAULT NULL,
  [xAstrom] float DEFAULT NULL,
  [xAstromErr] real DEFAULT NULL,
  [yAstrom] float DEFAULT NULL,
  [yAstromErr] real DEFAULT NULL,
  [raAstrom] float DEFAULT NULL,
  [raAstromErr] real DEFAULT NULL,
  [declAstrom] float DEFAULT NULL,
  [declAstromErr] real DEFAULT NULL,
  [raObject] float DEFAULT NULL,
  [declObject] float DEFAULT NULL,
  [taiMidPoint] float NOT NULL,
  [taiRange] real DEFAULT NULL,
  [psfFlux] float NOT NULL,
  [psfFluxErr] real NOT NULL,
  [apFlux] float NOT NULL,
  [apFluxErr] real NOT NULL,
  [modelFlux] float NOT NULL,
  [modelFluxErr] real NOT NULL,
  [petroFlux] float DEFAULT NULL,
  [petroFluxErr] real DEFAULT NULL,
  [instFlux] float NOT NULL,
  [instFluxErr] real NOT NULL,
  [nonGrayCorrFlux] float DEFAULT NULL,
  [nonGrayCorrFluxErr] real DEFAULT NULL,
  [atmCorrFlux] float DEFAULT NULL,
  [atmCorrFluxErr] real DEFAULT NULL,
  [apDia] real DEFAULT NULL,
  [Ixx] real DEFAULT NULL,
  [IxxErr] real DEFAULT NULL,
  [Iyy] real DEFAULT NULL,
  [IyyErr] real DEFAULT NULL,
  [Ixy] real DEFAULT NULL,
  [IxyErr] real DEFAULT NULL,
  [snr] real NOT NULL,
  [chi2] real NOT NULL,
  [sky] real DEFAULT NULL,
  [skyErr] real DEFAULT NULL,
  [extendedness] real DEFAULT NULL,
  [flux_PS] real DEFAULT NULL,
  [flux_PS_Sigma] real DEFAULT NULL,
  [flux_SG] real DEFAULT NULL,
  [flux_SG_Sigma] real DEFAULT NULL,
  [sersicN_SG] real DEFAULT NULL,
  [sersicN_SG_Sigma] real DEFAULT NULL,
  [e1_SG] real DEFAULT NULL,
  [e1_SG_Sigma] real DEFAULT NULL,
  [e2_SG] real DEFAULT NULL,
  [e2_SG_Sigma] real DEFAULT NULL,
  [radius_SG] real DEFAULT NULL,
  [radius_SG_Sigma] real DEFAULT NULL,
  [flux_flux_SG_Cov] real DEFAULT NULL,
  [flux_e1_SG_Cov] real DEFAULT NULL,
  [flux_e2_SG_Cov] real DEFAULT NULL,
  [flux_radius_SG_Cov] real DEFAULT NULL,
  [flux_sersicN_SG_Cov] real DEFAULT NULL,
  [e1_e1_SG_Cov] real DEFAULT NULL,
  [e1_e2_SG_Cov] real DEFAULT NULL,
  [e1_radius_SG_Cov] real DEFAULT NULL,
  [e1_sersicN_SG_Cov] real DEFAULT NULL,
  [e2_e2_SG_Cov] real DEFAULT NULL,
  [e2_radius_SG_Cov] real DEFAULT NULL,
  [e2_sersicN_SG_Cov] real DEFAULT NULL,
  [radius_radius_SG_Cov] real DEFAULT NULL,
  [radius_sersicN_SG_Cov] real DEFAULT NULL,
  [sersicN_sersicN_SG_Cov] real DEFAULT NULL,
  [flagForAssociation] smallint DEFAULT NULL,
  [flagForDetection] smallint DEFAULT NULL,
  [flagForWcs] smallint DEFAULT NULL,
  PRIMARY KEY ([sourceId])
)

GO

create index IDX_scienceCcdExposureId on [Source]([scienceCcdExposureId])
create index IDX_filterId  on [Source]([filterId])
create index IDX_movingObjectId  on [Source]([movingObjectId])
create index IDX_objectId  on [Source]([objectId])
create index IDX_procHistoryId  on [Source]([procHistoryId])
create index IDX_Source_decl  on [Source]([decl])

GO
