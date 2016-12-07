-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case04\data\DeepSource.schema

IF OBJECT_ID('dbo.DeepSource', 'U') IS NOT NULL
 DROP TABLE dbo.DeepSource

CREATE TABLE [DeepSource] (
   [deepSourceId] BIGINT NOT NULL
,  [parentDeepSourceId] BIGINT DEFAULT NULL
,  [deepCoaddId] BIGINT NOT NULL
,  [filterId] INTEGER NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
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
)

ALTER TABLE [DeepSource] ADD CONSTRAINT pk_DeepSource PRIMARY KEY ([deepSourceId])



 CREATE INDEX ix_DeepSource_htmId20 ON [DeepSource]([htmId20])

 CREATE INDEX ix_DeepSource_deepCoaddId ON [DeepSource]([deepCoaddId])

 CREATE INDEX ix_DeepSource_parentDeepSourceId ON [DeepSource]([parentDeepSourceId])

