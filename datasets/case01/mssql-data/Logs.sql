-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\Logs.schema

IF OBJECT_ID('dbo.Logs', 'U') IS NOT NULL
 DROP TABLE dbo.Logs

CREATE TABLE [Logs] (
   [id] INTEGER NOT NULL AUTO_INCREMENT
,  [HOSTID] VARCHAR(80) DEFAULT NULL
,  [RUNID] VARCHAR(80) DEFAULT NULL
,  [LOG] VARCHAR(80) DEFAULT NULL
,  [workerid] VARCHAR(80) DEFAULT NULL
,  [stagename] VARCHAR(80) DEFAULT NULL
,  [SLICEID] INTEGER DEFAULT NULL
,  [STAGEID] INTEGER DEFAULT NULL
,  [LOOPNUM] INTEGER DEFAULT NULL
,  [STATUS] VARCHAR(80) DEFAULT NULL
,  [LEVEL] INTEGER DEFAULT '9999'
,  [DATE] VARCHAR(30) DEFAULT NULL
,  [TIMESTAMP] BIGINT DEFAULT NULL
,  [node] INTEGER DEFAULT NULL
,  [custom] VARCHAR(4096) DEFAULT NULL
,  [timereceived] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,  [visitid] INTEGER DEFAULT NULL
,  [COMMENT] TEXT
,  [PIPELINE] VARCHAR(80) DEFAULT NULL
,  [TYPE] VARCHAR(5) DEFAULT NULL
,  [EVENTTIME] BIGINT DEFAULT NULL
,  [PUBTIME] BIGINT DEFAULT NULL
,  [usertime] REAL DEFAULT NULL
,  [systemtime] REAL DEFAULT NULL
)

ALTER TABLE [Logs] ADD CONSTRAINT pk_Logs PRIMARY KEY ([id])



 CREATE INDEX ix_Logs_a ON [Logs]([RUNID])

