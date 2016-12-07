-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\SimRefObject.schema

IF OBJECT_ID('dbo.SimRefObject', 'U') IS NOT NULL
 DROP TABLE dbo.SimRefObject

CREATE TABLE [SimRefObject] (
   [refObjectId] BIGINT NOT NULL
,  [isStar] TINYINT NOT NULL
,  [varClass] TINYINT NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
,  [htmId20] BIGINT NOT NULL
,  [gLat] FLOAT DEFAULT NULL
,  [gLon] FLOAT DEFAULT NULL
,  [sedName] VARCHAR(255) DEFAULT NULL
,  [uMag] FLOAT NOT NULL
,  [gMag] FLOAT NOT NULL
,  [rMag] FLOAT NOT NULL
,  [iMag] FLOAT NOT NULL
,  [zMag] FLOAT NOT NULL
,  [yMag] FLOAT NOT NULL
,  [muRa] FLOAT DEFAULT NULL
,  [muDecl] FLOAT DEFAULT NULL
,  [parallax] FLOAT DEFAULT NULL
,  [vRad] FLOAT DEFAULT NULL
,  [redshift] FLOAT DEFAULT NULL
,  [semiMajorBulge] FLOAT DEFAULT NULL
,  [semiMinorBulge] FLOAT DEFAULT NULL
,  [semiMajorDisk] FLOAT DEFAULT NULL
,  [semiMinorDisk] FLOAT DEFAULT NULL
,  [uCov] SMALLINT NOT NULL
,  [gCov] SMALLINT NOT NULL
,  [rCov] SMALLINT NOT NULL
,  [iCov] SMALLINT NOT NULL
,  [zCov] SMALLINT NOT NULL
,  [yCov] SMALLINT NOT NULL
)



