-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case04\data\DeepForcedSource.schema

IF OBJECT_ID('dbo.DeepForcedSource', 'U') IS NOT NULL
 DROP TABLE dbo.DeepForcedSource

CREATE TABLE [DeepForcedSource] (
   [deepForcedSourceId] BIGINT NOT NULL
,  [scienceCcdExposureId] BIGINT NOT NULL
,  [filterId] INTEGER NOT NULL
,  [timeMid] FLOAT DEFAULT NULL
,  [expTime] REAL DEFAULT NULL
,  [deepSourceId] BIGINT NOT NULL
,  [ra] FLOAT DEFAULT NULL
,  [decl] FLOAT DEFAULT NULL
,  [raVar] FLOAT DEFAULT NULL
,  [declVar] FLOAT DEFAULT NULL
,  [radeclCov] FLOAT DEFAULT NULL
,  [htmId20] BIGINT DEFAULT NULL
,  [x] FLOAT DEFAULT NULL
,  [y] FLOAT DEFAULT NULL
,  [xVar] FLOAT DEFAULT NULL
,  [yVar] FLOAT DEFAULT NULL
,  [xyCov] FLOAT DEFAULT NULL
,  [psfFlux] FLOAT DEFAULT NULL
,  [psfFluxSigma] FLOAT DEFAULT NULL
,  [apFlux] FLOAT DEFAULT NULL
,  [apFluxSigma] FLOAT DEFAULT NULL
,  [modelFlux] FLOAT DEFAULT NULL
,  [modelFluxSigma] FLOAT DEFAULT NULL
,  [instFlux] FLOAT DEFAULT NULL
,  [instFluxSigma] FLOAT DEFAULT NULL
,  [apCorrection] FLOAT DEFAULT NULL
,  [apCorrectionSigma] FLOAT DEFAULT NULL
,  [shapeIx] FLOAT DEFAULT NULL
,  [shapeIy] FLOAT DEFAULT NULL
,  [shapeIxVar] FLOAT DEFAULT NULL
,  [shapeIyVar] FLOAT DEFAULT NULL
,  [shapeIxIyCov] FLOAT DEFAULT NULL
,  [shapeIxx] FLOAT DEFAULT NULL
,  [shapeIyy] FLOAT DEFAULT NULL
,  [shapeIxy] FLOAT DEFAULT NULL
,  [shapeIxxVar] FLOAT DEFAULT NULL
,  [shapeIyyVar] FLOAT DEFAULT NULL
,  [shapeIxyVar] FLOAT DEFAULT NULL
,  [shapeIxxIyyCov] FLOAT DEFAULT NULL
,  [shapeIxxIxyCov] FLOAT DEFAULT NULL
,  [shapeIyyIxyCov] FLOAT DEFAULT NULL
,  [extendedness] FLOAT DEFAULT NULL
,  [flagNegative] TINYINT NOT NULL
,  [flagBadMeasCentroid] TINYINT NOT NULL
,  [flagPixEdge] TINYINT NOT NULL
,  [flagPixInterpAny] TINYINT NOT NULL
,  [flagPixInterpCen] TINYINT NOT NULL
,  [flagPixSaturAny] TINYINT NOT NULL
,  [flagPixSaturCen] TINYINT NOT NULL
,  [flagBadPsfFlux] TINYINT NOT NULL
,  [flagBadApFlux] TINYINT NOT NULL
,  [flagBadModelFlux] TINYINT NOT NULL
,  [flagBadInstFlux] TINYINT NOT NULL
,  [flagBadCentroid] TINYINT NOT NULL
,  [flagBadShape] TINYINT NOT NULL
,  [raDeepSource] FLOAT DEFAULT NULL
,  [declDeepSource] FLOAT DEFAULT NULL
)

ALTER TABLE [DeepForcedSource] ADD CONSTRAINT pk_DeepForcedSource PRIMARY KEY ([deepForcedSourceId])



 CREATE INDEX ix_DeepForcedSource_deepSourceId ON [DeepForcedSource]([deepSourceId])

