-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case01\data\sdqa_Metric.schema

IF OBJECT_ID('dbo.sdqa_Metric', 'U') IS NOT NULL
 DROP TABLE dbo.sdqa_Metric

CREATE TABLE [sdqa_Metric] (
   [sdqa_metricId] SMALLINT NOT NULL IDENTITY
,  [metricName] VARCHAR(30) NOT NULL
,  [physicalUnits] VARCHAR(30) NOT NULL
,  [dataType] CHAR(1) NOT NULL
,  [definition] VARCHAR(255) NOT NULL
)

ALTER TABLE [sdqa_Metric] ADD CONSTRAINT pk_sdqa_Metric PRIMARY KEY ([sdqa_metricId])



 CREATE INDEX ix_sdqa_Metric_UQ_sdqaMetric_metricName ON [sdqa_Metric]([metricName])

