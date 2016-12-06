-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\Object.schema

IF OBJECT_ID('dbo.Object', 'U') IS NOT NULL
 DROP TABLE dbo.Object

CREATE TABLE [Object] (
   [objectId] BIGINT NOT NULL
,  [iauId] CHAR(34) DEFAULT NULL
,  [ra_PS] FLOAT NOT NULL
,  [ra_PS_Sigma] REAL DEFAULT NULL
,  [decl_PS] FLOAT NOT NULL
,  [decl_PS_Sigma] REAL DEFAULT NULL
,  [radecl_PS_Cov] REAL DEFAULT NULL
,  [htmId20] BIGINT NOT NULL
,  [ra_SG] FLOAT DEFAULT NULL
,  [ra_SG_Sigma] REAL DEFAULT NULL
,  [decl_SG] FLOAT DEFAULT NULL
,  [decl_SG_Sigma] REAL DEFAULT NULL
,  [radecl_SG_Cov] REAL DEFAULT NULL
,  [raRange] REAL DEFAULT NULL
,  [declRange] REAL DEFAULT NULL
,  [muRa_PS] FLOAT DEFAULT NULL
,  [muRa_PS_Sigma] REAL DEFAULT NULL
,  [muDecl_PS] FLOAT DEFAULT NULL
,  [muDecl_PS_Sigma] REAL DEFAULT NULL
,  [muRaDecl_PS_Cov] REAL DEFAULT NULL
,  [parallax_PS] FLOAT DEFAULT NULL
,  [parallax_PS_Sigma] REAL DEFAULT NULL
,  [canonicalFilterId] TINYINT DEFAULT NULL
,  [extendedness] SMALLINT DEFAULT NULL
,  [varProb] REAL DEFAULT NULL
,  [earliestObsTime] FLOAT DEFAULT NULL
,  [latestObsTime] FLOAT DEFAULT NULL
,  [meanObsTime] FLOAT DEFAULT NULL
,  [flags] INTEGER DEFAULT NULL
,  [uNumObs] INTEGER DEFAULT NULL
,  [uExtendedness] SMALLINT DEFAULT NULL
,  [uVarProb] REAL DEFAULT NULL
,  [uRaOffset_PS] REAL DEFAULT NULL
,  [uRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [uDeclOffset_PS] REAL DEFAULT NULL
,  [uDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [uRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [uRaOffset_SG] REAL DEFAULT NULL
,  [uRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [uDeclOffset_SG] REAL DEFAULT NULL
,  [uDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [uRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [uLnL_PS] REAL DEFAULT NULL
,  [uLnL_SG] REAL DEFAULT NULL
,  [uFlux_PS] REAL DEFAULT NULL
,  [uFlux_PS_Sigma] REAL DEFAULT NULL
,  [uFlux_ESG] REAL DEFAULT NULL
,  [uFlux_ESG_Sigma] REAL DEFAULT NULL
,  [uFlux_Gaussian] REAL DEFAULT NULL
,  [uFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [uTimescale] REAL DEFAULT NULL
,  [uEarliestObsTime] FLOAT DEFAULT NULL
,  [uLatestObsTime] FLOAT DEFAULT NULL
,  [uSersicN_SG] REAL DEFAULT NULL
,  [uSersicN_SG_Sigma] REAL DEFAULT NULL
,  [uE1_SG] REAL DEFAULT NULL
,  [uE1_SG_Sigma] REAL DEFAULT NULL
,  [uE2_SG] REAL DEFAULT NULL
,  [uE2_SG_Sigma] REAL DEFAULT NULL
,  [uRadius_SG] REAL DEFAULT NULL
,  [uRadius_SG_Sigma] REAL DEFAULT NULL
,  [uFlags] INTEGER DEFAULT NULL
,  [gNumObs] INTEGER DEFAULT NULL
,  [gExtendedness] SMALLINT DEFAULT NULL
,  [gVarProb] REAL DEFAULT NULL
,  [gRaOffset_PS] REAL DEFAULT NULL
,  [gRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [gDeclOffset_PS] REAL DEFAULT NULL
,  [gDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [gRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [gRaOffset_SG] REAL DEFAULT NULL
,  [gRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [gDeclOffset_SG] REAL DEFAULT NULL
,  [gDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [gRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [gLnL_PS] REAL DEFAULT NULL
,  [gLnL_SG] REAL DEFAULT NULL
,  [gFlux_PS] REAL DEFAULT NULL
,  [gFlux_PS_Sigma] REAL DEFAULT NULL
,  [gFlux_ESG] REAL DEFAULT NULL
,  [gFlux_ESG_Sigma] REAL DEFAULT NULL
,  [gFlux_Gaussian] REAL DEFAULT NULL
,  [gFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [gTimescale] REAL DEFAULT NULL
,  [gEarliestObsTime] FLOAT DEFAULT NULL
,  [gLatestObsTime] FLOAT DEFAULT NULL
,  [gSersicN_SG] REAL DEFAULT NULL
,  [gSersicN_SG_Sigma] REAL DEFAULT NULL
,  [gE1_SG] REAL DEFAULT NULL
,  [gE1_SG_Sigma] REAL DEFAULT NULL
,  [gE2_SG] REAL DEFAULT NULL
,  [gE2_SG_Sigma] REAL DEFAULT NULL
,  [gRadius_SG] REAL DEFAULT NULL
,  [gRadius_SG_Sigma] REAL DEFAULT NULL
,  [gFlags] INTEGER DEFAULT NULL
,  [rNumObs] INTEGER DEFAULT NULL
,  [rExtendedness] SMALLINT DEFAULT NULL
,  [rVarProb] REAL DEFAULT NULL
,  [rRaOffset_PS] REAL DEFAULT NULL
,  [rRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [rDeclOffset_PS] REAL DEFAULT NULL
,  [rDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [rRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [rRaOffset_SG] REAL DEFAULT NULL
,  [rRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [rDeclOffset_SG] REAL DEFAULT NULL
,  [rDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [rRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [rLnL_PS] REAL DEFAULT NULL
,  [rLnL_SG] REAL DEFAULT NULL
,  [rFlux_PS] REAL DEFAULT NULL
,  [rFlux_PS_Sigma] REAL DEFAULT NULL
,  [rFlux_ESG] REAL DEFAULT NULL
,  [rFlux_ESG_Sigma] REAL DEFAULT NULL
,  [rFlux_Gaussian] REAL DEFAULT NULL
,  [rFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [rTimescale] REAL DEFAULT NULL
,  [rEarliestObsTime] FLOAT DEFAULT NULL
,  [rLatestObsTime] FLOAT DEFAULT NULL
,  [rSersicN_SG] REAL DEFAULT NULL
,  [rSersicN_SG_Sigma] REAL DEFAULT NULL
,  [rE1_SG] REAL DEFAULT NULL
,  [rE1_SG_Sigma] REAL DEFAULT NULL
,  [rE2_SG] REAL DEFAULT NULL
,  [rE2_SG_Sigma] REAL DEFAULT NULL
,  [rRadius_SG] REAL DEFAULT NULL
,  [rRadius_SG_Sigma] REAL DEFAULT NULL
,  [rFlags] INTEGER DEFAULT NULL
,  [iNumObs] INTEGER DEFAULT NULL
,  [iExtendedness] SMALLINT DEFAULT NULL
,  [iVarProb] REAL DEFAULT NULL
,  [iRaOffset_PS] REAL DEFAULT NULL
,  [iRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [iDeclOffset_PS] REAL DEFAULT NULL
,  [iDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [iRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [iRaOffset_SG] REAL DEFAULT NULL
,  [iRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [iDeclOffset_SG] REAL DEFAULT NULL
,  [iDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [iRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [iLnL_PS] REAL DEFAULT NULL
,  [iLnL_SG] REAL DEFAULT NULL
,  [iFlux_PS] REAL DEFAULT NULL
,  [iFlux_PS_Sigma] REAL DEFAULT NULL
,  [iFlux_ESG] REAL DEFAULT NULL
,  [iFlux_ESG_Sigma] REAL DEFAULT NULL
,  [iFlux_Gaussian] REAL DEFAULT NULL
,  [iFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [iTimescale] REAL DEFAULT NULL
,  [iEarliestObsTime] FLOAT DEFAULT NULL
,  [iLatestObsTime] FLOAT DEFAULT NULL
,  [iSersicN_SG] REAL DEFAULT NULL
,  [iSersicN_SG_Sigma] REAL DEFAULT NULL
,  [iE1_SG] REAL DEFAULT NULL
,  [iE1_SG_Sigma] REAL DEFAULT NULL
,  [iE2_SG] REAL DEFAULT NULL
,  [iE2_SG_Sigma] REAL DEFAULT NULL
,  [iRadius_SG] REAL DEFAULT NULL
,  [iRadius_SG_Sigma] REAL DEFAULT NULL
,  [iFlags] INTEGER DEFAULT NULL
,  [zNumObs] INTEGER DEFAULT NULL
,  [zExtendedness] SMALLINT DEFAULT NULL
,  [zVarProb] REAL DEFAULT NULL
,  [zRaOffset_PS] REAL DEFAULT NULL
,  [zRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [zDeclOffset_PS] REAL DEFAULT NULL
,  [zDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [zRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [zRaOffset_SG] REAL DEFAULT NULL
,  [zRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [zDeclOffset_SG] REAL DEFAULT NULL
,  [zDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [zRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [zLnL_PS] REAL DEFAULT NULL
,  [zLnL_SG] REAL DEFAULT NULL
,  [zFlux_PS] REAL DEFAULT NULL
,  [zFlux_PS_Sigma] REAL DEFAULT NULL
,  [zFlux_ESG] REAL DEFAULT NULL
,  [zFlux_ESG_Sigma] REAL DEFAULT NULL
,  [zFlux_Gaussian] REAL DEFAULT NULL
,  [zFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [zTimescale] REAL DEFAULT NULL
,  [zEarliestObsTime] FLOAT DEFAULT NULL
,  [zLatestObsTime] FLOAT DEFAULT NULL
,  [zSersicN_SG] REAL DEFAULT NULL
,  [zSersicN_SG_Sigma] REAL DEFAULT NULL
,  [zE1_SG] REAL DEFAULT NULL
,  [zE1_SG_Sigma] REAL DEFAULT NULL
,  [zE2_SG] REAL DEFAULT NULL
,  [zE2_SG_Sigma] REAL DEFAULT NULL
,  [zRadius_SG] REAL DEFAULT NULL
,  [zRadius_SG_Sigma] REAL DEFAULT NULL
,  [zFlags] INTEGER DEFAULT NULL
,  [yNumObs] INTEGER DEFAULT NULL
,  [yExtendedness] SMALLINT DEFAULT NULL
,  [yVarProb] REAL DEFAULT NULL
,  [yRaOffset_PS] REAL DEFAULT NULL
,  [yRaOffset_PS_Sigma] REAL DEFAULT NULL
,  [yDeclOffset_PS] REAL DEFAULT NULL
,  [yDeclOffset_PS_Sigma] REAL DEFAULT NULL
,  [yRaDeclOffset_PS_Cov] REAL DEFAULT NULL
,  [yRaOffset_SG] REAL DEFAULT NULL
,  [yRaOffset_SG_Sigma] REAL DEFAULT NULL
,  [yDeclOffset_SG] REAL DEFAULT NULL
,  [yDeclOffset_SG_Sigma] REAL DEFAULT NULL
,  [yRaDeclOffset_SG_Cov] REAL DEFAULT NULL
,  [yLnL_PS] REAL DEFAULT NULL
,  [yLnL_SG] REAL DEFAULT NULL
,  [yFlux_PS] REAL DEFAULT NULL
,  [yFlux_PS_Sigma] REAL DEFAULT NULL
,  [yFlux_ESG] REAL DEFAULT NULL
,  [yFlux_ESG_Sigma] REAL DEFAULT NULL
,  [yFlux_Gaussian] REAL DEFAULT NULL
,  [yFlux_Gaussian_Sigma] REAL DEFAULT NULL
,  [yTimescale] REAL DEFAULT NULL
,  [yEarliestObsTime] FLOAT DEFAULT NULL
,  [yLatestObsTime] FLOAT DEFAULT NULL
,  [ySersicN_SG] REAL DEFAULT NULL
,  [ySersicN_SG_Sigma] REAL DEFAULT NULL
,  [yE1_SG] REAL DEFAULT NULL
,  [yE1_SG_Sigma] REAL DEFAULT NULL
,  [yE2_SG] REAL DEFAULT NULL
,  [yE2_SG_Sigma] REAL DEFAULT NULL
,  [yRadius_SG] REAL DEFAULT NULL
,  [yRadius_SG_Sigma] REAL DEFAULT NULL
,  [yFlags] INTEGER DEFAULT NULL
,  [varBinaryField] VARBINARY(100) DEFAULT NULL
,  [chunkId] INTEGER DEFAULT NULL
,  [subChunkId] INTEGER DEFAULT NULL
)


