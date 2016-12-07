-- MS SQL version of test query infile with same name in https://github.com/lss


t/qserv_testdata.git/trunk/datasets/case02/queries
-- joins, but for limited number of visits
-- sort by is here purely so that we can compare results from mysql and qserv

SELECT TOP 10 objectId
FROM   Source s
       JOIN   Science_Ccd_Exposure sce ON sce.scienceCcdExposureId = s.scienceCcdExposureId
WHERE  sce.visit IN (885449631,886257441,886472151) 
ORDER BY objectId
