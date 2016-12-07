-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\Source.schema

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
,  [raSigmaForDetection] REAL DEFAULT NULL
,  [raSigmaForWcs] REAL NOT NULL
,  [decl] FLOAT NOT NULL
,  [declSigmaForDetection] REAL DEFAULT NULL
,  [declSigmaForWcs] REAL NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [xFlux] FLOAT DEFAULT NULL
,  [xFluxSigma] REAL DEFAULT NULL
,  [yFlux] FLOAT DEFAULT NULL
,  [yFluxSigma] REAL DEFAULT NULL
,  [raFlux] FLOAT DEFAULT NULL
,  [raFluxSigma] REAL DEFAULT NULL
,  [declFlux] FLOAT DEFAULT NULL
,  [declFluxSigma] REAL DEFAULT NULL
,  [xPeak] FLOAT DEFAULT NULL
,  [yPeak] FLOAT DEFAULT NULL
,  [raPeak] FLOAT DEFAULT NULL
,  [declPeak] FLOAT DEFAULT NULL
,  [xAstrom] FLOAT DEFAULT NULL
,  [xAstromSigma] REAL DEFAULT NULL
,  [yAstrom] FLOAT DEFAULT NULL
,  [yAstromSigma] REAL DEFAULT NULL
,  [raAstrom] FLOAT DEFAULT NULL
,  [raAstromSigma] REAL DEFAULT NULL
,  [declAstrom] FLOAT DEFAULT NULL
,  [declAstromSigma] REAL DEFAULT NULL
,  [raObject] FLOAT DEFAULT NULL
,  [declObject] FLOAT DEFAULT NULL
,  [taiMidPoint] FLOAT NOT NULL
,  [taiRange] REAL DEFAULT NULL
,  [psfFlux] FLOAT DEFAULT NULL
,  [psfFluxSigma] REAL DEFAULT NULL
,  [apFlux] FLOAT DEFAULT NULL
,  [apFluxSigma] REAL DEFAULT NULL
,  [modelFlux] FLOAT DEFAULT NULL
,  [modelFluxSigma] REAL DEFAULT NULL
,  [petroFlux] FLOAT DEFAULT NULL
,  [petroFluxSigma] REAL DEFAULT NULL
,  [instFlux] FLOAT DEFAULT NULL
,  [instFluxSigma] REAL DEFAULT NULL
,  [nonGrayCorrFlux] FLOAT DEFAULT NULL
,  [nonGrayCorrFluxSigma] REAL DEFAULT NULL
,  [atmCorrFlux] FLOAT DEFAULT NULL
,  [atmCorrFluxSigma] REAL DEFAULT NULL
,  [apDia] REAL DEFAULT NULL
,  [Ixx] REAL DEFAULT NULL
,  [IxxSigma] REAL DEFAULT NULL
,  [Iyy] REAL DEFAULT NULL
,  [IyySigma] REAL DEFAULT NULL
,  [Ixy] REAL DEFAULT NULL
,  [IxySigma] REAL DEFAULT NULL
,  [psfIxx] REAL DEFAULT NULL
,  [psfIxxSigma] REAL DEFAULT NULL
,  [psfIyy] REAL DEFAULT NULL
,  [psfIyySigma] REAL DEFAULT NULL
,  [psfIxy] REAL DEFAULT NULL
,  [psfIxySigma] REAL DEFAULT NULL
,  [e1_SG] REAL DEFAULT NULL
,  [e1_SG_Sigma] REAL DEFAULT NULL
,  [e2_SG] REAL DEFAULT NULL
,  [e2_SG_Sigma] REAL DEFAULT NULL
,  [resolution_SG] REAL DEFAULT NULL
,  [shear1_SG] REAL DEFAULT NULL
,  [shear1_SG_Sigma] REAL DEFAULT NULL
,  [shear2_SG] REAL DEFAULT NULL
,  [shear2_SG_Sigma] REAL DEFAULT NULL
,  [sourceWidth_SG] REAL DEFAULT NULL
,  [sourceWidth_SG_Sigma] REAL DEFAULT NULL
,  [shapeFlag_SG] SMALLINT DEFAULT NULL
,  [snr] REAL NOT NULL
,  [chi2] REAL NOT NULL
,  [sky] REAL DEFAULT NULL
,  [skySigma] REAL DEFAULT NULL
,  [extendedness] SMALLINT DEFAULT NULL
,  [flux_Gaussian] FLOAT DEFAULT NULL
,  [flux_Gaussian_Sigma] REAL DEFAULT NULL
,  [flux_ESG] FLOAT DEFAULT NULL
,  [flux_ESG_Sigma] REAL DEFAULT NULL
,  [sersicN_SG] REAL DEFAULT NULL
,  [sersicN_SG_Sigma] REAL DEFAULT NULL
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
,  [flagForDetection] BIGINT DEFAULT NULL
,  [flagForWcs] SMALLINT DEFAULT NULL
,  [blobField] BLOB DEFAULT NULL
)



