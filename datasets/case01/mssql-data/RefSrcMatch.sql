-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\RefSrcMatch.schema

IF OBJECT_ID('dbo.RefSrcMatch', 'U') IS NOT NULL
 DROP TABLE dbo.RefSrcMatch

CREATE TABLE [RefSrcMatch] (
   [refObjectId] BIGINT DEFAULT NULL
,  [sourceId] BIGINT DEFAULT NULL
,  [refRa] FLOAT DEFAULT NULL
,  [refDec] FLOAT DEFAULT NULL
,  [angSep] FLOAT DEFAULT NULL
,  [nRefMatches] INTEGER DEFAULT NULL
,  [nSrcMatches] INTEGER DEFAULT NULL
,  [closestToRef] TINYINT DEFAULT NULL
,  [closestToSrc] TINYINT DEFAULT NULL
,  [flags] INTEGER DEFAULT NULL
)



 CREATE INDEX ix_RefSrcMatch_sourceId ON [RefSrcMatch]([sourceId])

 CREATE INDEX ix_RefSrcMatch_refObjectId ON [RefSrcMatch]([refObjectId])

