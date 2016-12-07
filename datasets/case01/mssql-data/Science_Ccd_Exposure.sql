-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\Science_Ccd_Exposure.schema

IF OBJECT_ID('dbo.Science_Ccd_Exposure', 'U') IS NOT NULL
 DROP TABLE dbo.Science_Ccd_Exposure

CREATE TABLE [Science_Ccd_Exposure] (
   [scienceCcdExposureId] BIGINT NOT NULL
,  [visit] INTEGER NOT NULL
,  [raft] TINYINT NOT NULL
,  [raftName] CHAR(3) NOT NULL
,  [ccd] TINYINT NOT NULL
,  [ccdName] CHAR(3) NOT NULL
,  [filterId] TINYINT NOT NULL
,  [filterName] CHAR(3) NOT NULL
,  [ra] FLOAT NOT NULL
,  [decl] FLOAT NOT NULL
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
,  [llcRa] FLOAT NOT NULL
,  [llcDecl] FLOAT NOT NULL
,  [ulcRa] FLOAT NOT NULL
,  [ulcDecl] FLOAT NOT NULL
,  [urcRa] FLOAT NOT NULL
,  [urcDecl] FLOAT NOT NULL
,  [lrcRa] FLOAT NOT NULL
,  [lrcDecl] FLOAT NOT NULL
,  [taiMjd] FLOAT NOT NULL
,  [obsStart] DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00'
,  [expMidpt] VARCHAR(30) NOT NULL
,  [expTime] REAL NOT NULL
,  [nCombine] INTEGER NOT NULL
,  [binX] INTEGER NOT NULL
,  [binY] INTEGER NOT NULL
,  [readNoise] REAL NOT NULL
,  [saturationLimit] INTEGER NOT NULL
,  [gainEff] FLOAT NOT NULL
,  [fluxMag0] REAL NOT NULL
,  [fluxMag0Sigma] REAL NOT NULL
,  [fwhm] FLOAT NOT NULL
,  [poly] BINARY(120) NOT NULL
,  [flags] INTEGER NOT NULL DEFAULT '0'
)



