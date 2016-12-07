-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\RefDeepSrcMatch.sql

IF OBJECT_ID('dbo.RefDeepSrcMatch', 'U') IS NOT NULL
 DROP TABLE dbo.RefDeepSrcMatch

CREATE TABLE [RefDeepSrcMatch] (
   [refObjectId] BIGINT DEFAULT NULL
,  [deepSourceId] BIGINT DEFAULT NULL
,  [angSep] FLOAT DEFAULT NULL
,  [nRefMatches] INTEGER DEFAULT NULL
,  [nSrcMatches] INTEGER DEFAULT NULL
,  [closestToRef] TINYINT DEFAULT NULL
,  [closestToSrc] TINYINT DEFAULT NULL
)



 CREATE INDEX ix_RefDeepSrcMatch_deepSourceId ON [RefDeepSrcMatch]([deepSourceId])

 CREATE INDEX ix_RefDeepSrcMatch_refObjectId ON [RefDeepSrcMatch]([refObjectId])

 CREATE INDEX ix_RefDeepSrcMatch_refObjectId_2 ON [RefDeepSrcMatch]([refObjectId],[deepSourceId])

 CREATE INDEX ix_RefDeepSrcMatch_deepSourceId_2 ON [RefDeepSrcMatch]([deepSourceId],[refObjectId])

